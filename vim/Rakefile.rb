# vim: set makeprg=rake

conf="_vimrc"
home = ENV['HOME']
target = home+"/"+conf
dot_target = home + "/.vimrc"
bundles = "bundle.vim"
local_dir = "local"
HOST_NAME = `hostname`.strip
local_conf = "#{local_dir}/#{HOST_NAME}.vim"
local_bundle = "#{local_dir}/#{HOST_NAME}-bundle.vim"
backups = home + "/.backups/vim"
basic_list = "basic.txt"
local_list = "local/#{HOST_NAME}.txt"

def gather(file)
  open(file,"rb").readlines.map{|x| x.strip.sub(/#.*/,'')}.reject{|x| x.empty?} rescue []
end

config_files = gather(basic_list)
local_files = gather(local_list)
bundle = home+"/.vim/bundle"
neobundle = bundle+'/neobundle.vim/README.md'
vim_backup = "#{home}/.vimbackup"


task :default => conf


desc "Create #{conf} file [default]"
file conf => [bundles, __FILE__, local_bundle, local_conf, *config_files] do |t|
  open(conf, "wb"){|out|
    def out.source(path)
      self.puts "source #{Dir.pwd}/#{path}"
    end
    out.puts <<-NNN
" Vim initialization file
" Updated on #{Time.now.strftime('%Y-%m-%d %H:%M')}

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Make improved
set nocompatible

" use gf to open file under the carret.

" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" Bundles

" use https: protocol instead of git:
let g:neobundle_default_git_protocol='https'

" Required
filetype off

if has('vim_starting')
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif


" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
    NNN
    out.source bundles
    if File.file?(local_bundle)
      out.source local_bundle
    end
    out.puts <<-EEE
" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

" General Configs
    EEE
    config_files.each do |filename|
      out.source filename
    end
    out.puts '"Local Config'
    out.source local_conf if File.file?(local_conf)
    bundle_conf_dir = "bundle_confs"
    if false
    out.puts <<-NNN
    set runtimepath^=#{Dir.pwd}
    runtime! '#{bundle_conf_dir}/*.vim'
    set runtimepath-=#{Dir.pwd}
    NNN
    else
      out.puts
      out.puts '"Configs for Bundles. each bundle may check it was installed or not'
      Dir[bundle_conf_dir+'/*.vim'].each do |filename|
        out.source filename
      end
    end
  }
end

desc "Install vimrc files with backing up into #{backups}."
task :install => [target, dot_target, neobundle, vim_backup]


file target => [conf, backups] do
  backupfile = backups + Time.now.strftime("/%Y-%m-%d_%H-%M") + conf
  sh "mv #{target} #{backupfile}" if File.file?(target)
  sh "cp #{conf} #{target}"
end

file dot_target => [conf, backups] do
  backupfile = backups + Time.now.strftime("/%Y-%m-%d_%H-%M.vimrc")
  sh "mv #{dot_target} #{backupfile}" if File.file?(dot_target)
  sh "cp #{conf} #{dot_target}"
end

directory backups
directory bundle
directory local_dir
directory vim_backup

file neobundle => bundle do
  sh "git clone https://github.com/Shougo/neobundle.vim #{bundle}/neobundle.vim"
end

desc "Create the local config file of this host."
task :locals => [local_bundle, local_conf]

file local_bundle => [local_dir] do
  open(local_bundle, "wb") do |out|
    out.puts "\"List local bundles here."
  end
  puts "Local bundle file: #{local_bundle} (created)"
end

file local_conf => [local_dir] do
  open(local_conf, "wb") do |out|
    out.puts "\" Local config file for #{HOST_NAME}"
  end
  puts "Local config file : #{local_conf} (created)"
end



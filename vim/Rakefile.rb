
conf="_vimrc"
home = ENV['HOME']
target = home+"/"+conf
dot_target = home + "/.vimrc"
user_conf = "bundle.vim"
locals = "local"
HOST_NAME = `hostname`.strip
local_conf = "#{locals}/#{HOST_NAME}.vim"
local_bundle = "#{locals}/#{HOST_NAME}-bundle.vim"
backups = home + "/.backups/vim"
config_files = FileList['config/*.vim']
bundle = home+"/.vim/bundle"
neobundle = bundle+'/neobundle.vim/README.md'
vim_backup = "#{home}/.vimbackup"


task :default => conf


desc "Create #{conf} file [default]"
file conf => [user_conf, *config_files, vim_backup] do |t|
  open(conf, "wb"){|out|
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
    out.puts "source #{Dir.pwd}/#{user_conf}"
    if File.file?(local_bundle)
      out.puts "source #{Dir.pwd}/#{local_bundle}"
    end
    out.puts <<-EEE
" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Read settings for global bundles.
source #{Dir.pwd}/bundle-config.vim

" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

    EEE
    if File.file?(local_conf)
      out.puts '"Local Config'
      out.puts "source #{Dir.pwd}/#{local_conf}"
    end
    config_files.each do |filename|
      #sh "cat #{filename} >> #{conf}"
      out.puts
      out.puts "source #{Dir.pwd}/#{filename}"
    end
  }
end

desc "Install vimrc files with backing up into #{backups}."
task :install => [target, dot_target, neobundle] do
end

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
directory locals
directory vim_backup

file neobundle => bundle do
  sh "git clone https://github.com/Shougo/neobundle.vim #{bundle}/neobundle.vim"
end

desc "Create the local config file of this host."
task :local_conf => [locals] do
  if File.file?(local_bundle)
    puts "Local bundle file: #{local_bundle}"
  else
    open(local_bundle, "wb") do |out|
      out.puts "\"List local bundles here."
    end
    puts "Local bundle file: #{local_bundle} (created)"
  end
  if File.file?(local_conf)
    puts "Local config file: #{local_conf}"
  else
    open(local_conf, "wb") do |out|
      out.puts "\" Local config file for #{HOST_NAME}"
    end
    puts "Local config file : #{local_conf} (created)"
  end
end


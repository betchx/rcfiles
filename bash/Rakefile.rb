
conf=".bashrc"
home = ENV['HOME']
target = home+"/"+conf
backups = home + "/.backups/bash"
config_files = FileList['config/*.sh']
host_file = 'local/'+ `hostname`.strip + '.sh'
#$stderr.puts "host_flie = #{host_file}"
config_files << host_file if File.file?(host_file)

task :default => conf

desc "Create #{conf} file"
file conf => config_files do |t|
  open(conf, "wb"){|out|
    $stderr.puts "Updating #{conf}"
    out.puts <<-NNN
# .bashrc
# Updated on #{Time.now.strftime('%Y-%m-%d %H:%M')}
    NNN
    config_files.each do |filename|
      #sh "cat #{filename} >> #{conf}"
      cmd="# source from #{Dir.pwd}/#{filename}"
      out.puts
      out.puts '##########################'
      out.puts cmd
      $stderr.puts filename
      out.write open(filename).read
    end
  }
end

desc "Install #{conf} file into home with backup"
task :install => [target ] do 
end

file target => [conf, backups] do
  backupfile = backups + Time.now.strftime("/%Y-%m-%d_%H-%M") + conf
  sh "mv #{target} #{backupfile}" if File.file?(target)
  sh "cp #{conf} #{target}"
end


directory backups



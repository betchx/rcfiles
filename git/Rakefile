
conf=".gitconfig"
user_conf = "user.gitconfig"
backups = ENV['HOME']+"/.backups/git"
config_files = FileList['config/*.gitconfig']
target = ENV['HOME']+"/"+conf

task :default => conf


desc "Create .gitconfig file"
file conf => [user_conf, *config_files] do |t|
  sh "cp -f #{user_conf} #{conf}"
  
  config_files.each do |filename|
    if filename =~ /exclude.gitconfig/
      sh "sed 's!%YOU_MUST_REPLACE_HERE%!#{Dir.pwd}!' #{filename} >> #{conf}"
    else
      sh "cat #{filename} >> #{conf}"
    end
  end
end

file user_conf do
  puts "User information is needed"
  user_name = `git config user.name`.strip
  while user_name.empty?
    print "Enter Username: "
    user_name = $stdin.gets.strip
  end 
  email = `git config user.email`.strip
  while email.empty?
    print "Enter E-mail Address: "
    email = $stdin.gets.strip
  end 
  open(user_conf, "wb") do |out|
    out.puts <<-NNN
[user]\r
	name = #{user_name}\r
	email = #{email}\r
    NNN
  end
end


task :install => [conf, backups] do 
  backupfile = backups + Time.now.strftime("/%Y-%m-%d_%H-%M") + conf
  sh "mv #{target} #{backupfile}" if File.file?(target)
  sh "cp #{conf} #{target}"
end

directory backups




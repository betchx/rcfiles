
conf=".gitconfig"
user_conf = "user.gitconfig"
winmerge_conf = "winmerge.gitconfig"
WINMERGE_SEARCH_DIR = [
  "C:/Softs/WinMerge",
  "C:/Program Files/WinMerge",
  "D:/DATA/Softs/WinMerge",
  "D:/Softs/WinMerge",
  "C:/Softs/WinMergePortable/App/WinMerge",
  ]

backups = ENV['HOME']+"/.backups/git"
config_files = FileList['config/*.gitconfig']
target = ENV['HOME']+"/"+conf

task :default => conf


desc "Create .gitconfig file"
file conf => [user_conf, winmerge_conf, *config_files] do |t|
  sh "cat #{user_conf}  #{winmerge_conf} > #{conf}"
  
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

file winmerge_conf do
  # find exe
  exe = "WinMergeU.exe"  # for path
  WINMERGE_SEARCH_DIR.each do |path|
    if File.exist?( path + "/WinMergeU.exe")
      exe = path + "/WinMergeU.exe"
      $stderr.puts "WinMergeU.exe is found in #{path}"
      break
    end
  end
  
  open(winmerge_conf, "wb") do |out|
  out.puts <<-NNN

# Configuration for Winmerge
[diff]
    tool = winmerge

[difftool "winmerge"]
    cmd =  \"#{exe}\"  -r -ub -wl -wr  \"$LOCAL\" \"$REMOTE\"

  NNN
  end
end 


task :install => [conf, backups] do 
  backupfile = backups + Time.now.strftime("/%Y-%m-%d_%H-%M") + conf
  sh "mv #{target} #{backupfile}" if File.file?(target)
  sh "cp #{conf} #{target}"
end

directory backups




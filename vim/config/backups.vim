
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
  set backupdir=./backup,./.vimbackup,. "backup dir
endif




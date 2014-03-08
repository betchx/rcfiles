

if [ -d $HOME/.rbenv ]
then
  export PATH=$HOME/.rbenv/bin:$PATH
  alias rbenv_init='eval "$(rbenv init -)"'
fi

if [ -d $HOME/.rvm ]
then
  # Load RVM into a shell session *as a function*
  function load_rvm() { [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" ; }

fi



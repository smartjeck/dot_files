
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
SSH_ENV=$HOME/.ssh/environment

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# cd aliases
alias cdb='cd ..'

# start the ssh-agent
function start_agent {
  echo "Initializing new SSH agent..."
  #  spawn ssh-agent
  /usr/bin/ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
  echo succeeded
  chmod 600 ${SSH_ENV}
  . ${SSH_ENV} > /dev/null
  /usr/bin/ssh-add
}

if [ -f "${SSH_ENV}" ]; then
  . ${SSH_ENV} > /dev/null
  ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
    start_agent;
  }
else
  start_agent;
fi

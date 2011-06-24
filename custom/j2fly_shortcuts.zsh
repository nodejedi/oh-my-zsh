# alias proxyhome='ssh -D 2384 -C macpro@j2fly.redirectme.net'
# alias proxyhome='ssh -p2384 -C macpro@j2fly.redirectme.net'
# alias proxyhome='ssh -L 8000:j2fly.redirectme.net:80 theda-ec2'
# alias proxyhome='ssh -L 8080:localhost:80 mini@j2fly.redirectme.net -p'

alias tunnel_theda='ssh -L 3307:thedacareprod.cqgtmgitcxs6.us-east-1.rds.amazonaws.com:3306 theda-ec2'
alias jbatv='cd ~/Desktop/tethered; ./tetheredboot -i iBSS.k66ap.RELEASE.dfu -k kernelcache.release.k66'

alias uldb='sudo /usr/libexec/locate.updatedb' #update the location database

alias rvm_install_shortcut='bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)'

alias flush_dns='dscacheutil -flushcache'

# DB Stuff
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgtail='tail -f /usr/local/var/postgres/server.log'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

alias mysqlstart='mysql.server start'
alias mysqlstop='mysql.server stop'

alias startdbs='pgstart;mysqlstart' # now both at once!

alias goodbye='sudo shutdown -r now'

# you need to use bundle exec before each command you run in a app controled by bundler so this alias helps make that easier
alias b='bundle exec $*'

# cmd line music FTW
alias pandora='pianobar'

alias c='clear'

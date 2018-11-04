# Aliases
alias ls='ls -F'
alias l.='ls -d .* -F'
alias ll='ls -l -F'
alias la='ls -a -F'
alias rm='safe-rm'
alias beamer="evince /usr/share/doc/latex-beamer/beameruserguide.pdf &"
alias sloccount="LANG=C sloccount"
alias rm-twiddles="find . -name \*~ | xargs /bin/rm"
alias mc_staging2="ssh ubuntu@provisioner.staging2.memcachier.com"
alias mc_staging="ssh ubuntu@provisioner.staging.memcachier.com"
alias mc_prod="ssh ubuntu@provisioner.memcachier.com"

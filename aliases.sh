# This is will output the exact amount of packages installed on your system
alias countpkg="rpm -qa | sort -fu | wc -l"

# Prints the current Linux distribution full name
alias osname="echo "$(awk -F 'PRETTY_NAME=' '{ print $2 }' /etc/*-release | grep -vE '^$')""

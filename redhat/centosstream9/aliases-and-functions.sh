# This is will output the exact amount of packages installed on your system
alias countpkg="rpm -qa | sort -fu | wc -l"

# Checking if for package conflicts
pkgconflict() {
    # Printing conflicting package
    rpm -q --whatconflicts "$1"
    echo -e "\n"
    echo -e "Conflicting packages:\n"
    # Checking whether the conflicting package files are installed
    rpm -q --state $(rpm -q --whatconflicts "$1")
    
}

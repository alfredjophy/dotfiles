#!/bin/bash 

searchterm=$(wofi --height=10% --show dmenu)

[ -z "$searchterm" ] && exit

#check if url
#check if search query
if [[ ${searchterm:0:1} =~ "?" || ${searchterm:0:1} =~ "!" ]] ; then 
        if [[ ${searchterm:0:1} =~ "?" ]];then 
                searchterm="${searchterm/?}"
        fi
        echo $searchterm
        query=${searchterm// /+}
        echo $query
        xdg-open https://search.brave.com/search?q=$query
        exit
fi

query=${searchterm// /+}
results="Search with DuckDuckGo
Search with Brave
Search with Startpage
Search with SearX
"
#if not search local files
localFiles=$(plocate $searchterm)

if [ -z "$localFiles" ]
        then results="$results
                No Local Files Found"
else

OLDIFS=$IFS       
IFS='
'
        for i in "$localFiles"
        do
                results="$results$(exa --icons -d $i)
"
        done
fi
IFS=$OLDIFS
selected=$(echo "$results" | wofi -i --show dmenu)
case $selected in
        "Search with DuckDuckGo")
                xdg-open https://www.duckduckgo.com/?q=$query
                ;;
        "Search with Brave")
                xdg-open https://search.brave.com/search?q=$query
                ;;
        "Search with Startpage")
                xdg-open https://startpage.com/do/?q=$query
                ;;
        "Search with SearX")
                xdg-open https://searx.bar/search?q=$query
                ;;
        *)
                xdg-open ${selected:1}
                ;;
esac
exit

header=$(grep -E --max-count=1 '^\#[^#]*?$' $1.md)
bareheader=${header#\# }
contents=$(grep -Ev '^\#[^#]*?$' $1.md)
tagsraw=$(<tags.txt)
tags=${tagsraw//$'\n'/', '}
metadata=$(echo -e "Title: $bareheader\nDate: $(date '+%F %H:%M')\nPublished: True\nTags: $tags \n")
echo -e "$metadata" > metascrp.txt
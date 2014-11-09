header=$(grep -E --max-count=1 '^\#[^#]*?$' $1.md)
bareheader=${header#\# }
contents=$(grep -Ev '^\#[^#]*?$' $1.md)
metadata=$(echo -e "Title: $bareheader\nDate: $(date '+%F %H:%M')\nPublished: True\n")
echo -e "$metadata" > metascrp.txt
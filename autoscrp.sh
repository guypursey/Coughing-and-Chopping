
# Usage: ./autoscrp.sh [OPTION]... [FILE]
# Publish FILE to Scriptogr.am account (grabbing metadata as we go).
# FILE should have no extension.
#
# Expects tags.txt accompanying named file to pull metadata from.
# Expects there two text files in location of script,
# one containing app key for Scriptogram,
# the other containing the user ID.
#
# 	-d 		Delete file.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$1" == "-d" ]
then
	echo "Deleting..."
	URL="http://scriptogr.am/api/article/delete/"
	fileparam="-d filename=$2.md"
	filedata=""
	echo $2
else
	echo "Adding..."
	URL="http://scriptogr.am/api/article/post/"
	fileparam="-d name=$1"
	header=$(grep -E --max-count=1 '^\#[^#]*?$' "$DIR"/archives/$1/$1.md)
	bareheader=${header#\# }
	contents=$(grep -Ev '^\#[^#]*?$' "$DIR"/archives/$1/$1.md)
	datetime=$(date '+%F %H:%M')
	tags=$(awk -v OFS=', ' -v RS= '{$1=$1}1' "$DIR"/archives/$1/tags.txt)
	metadata=$(echo -e "Title: $bareheader\nDate: $datetime\nTags: $tags\nSlug: $1\n")
	filedata="$metadata"$'\n\n'"$contents"
	echo $1
fi

curl \
       --data-urlencode app_key@"$DIR/scrpakey.txt" \
       --data-urlencode user_id@"$DIR/scrpuser.txt" \
       "$fileparam" \
       --data-urlencode text="$filedata" \
       $URL
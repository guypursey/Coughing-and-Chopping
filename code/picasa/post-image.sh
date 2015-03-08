

## Find source folder where we are.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Get access token.

ACCTOK=$(<"$DIR"/../../userdata/picasa/_access_token.txt)
# What happens if we can't find access ID?

# Get XML album created by `test-post-with-access-token.sh`
NEWALB=$(<"$DIR"/../../userdata/picasa/_result_new_album.xml)
# What happens if we can't find album?

# Find album ID.
re="<gphoto:id>(.*)</gphoto:id>"
if [[ $NEWALB =~ $re ]]; then
	ALBMID=${BASH_REMATCH[1]}
fi
# What happens if we can't find access ID?

# Get file slug from argument.

	if [ "$1" == "-f" ]; then

		FILESLUG=$2

	else

# Check to see if slug is already mapped.
		
		FILESLUG=$1

		declare -A imagemap

		while read -r line || [[ -n $line ]]; do
			arr=(${line//,/ })
			imagemap[${arr[0]}]=${arr[1]}
		done < "$DIR"/../imagemap.csv

		if [ ${imagemap[$FILESLUG]+isset} ]; then
			echo "File already mapped!" 1>&2
			exit 1
		fi
		
	fi

# Check if file exists in right location.

if [ ! -f "$DIR"/../../content/images/$FILESLUG ]; then
    echo "File not found!" 1>&2
    exit 1
fi

FILESIZE=$(stat -c "%s" "$DIR/../../content/images/$FILESLUG")

# Try posting a photo with test xml.
NEWIMG=$(curl https://picasaweb.google.com/data/feed/api/user/default/albumid/$ALBMID -X POST -H "GData-Version: 2" -H "Authorization: Bearer $ACCTOK" -H "Content-Type: image/jpeg" -H "Content-Length: $FILESIZE" -H "Slug: $FILESLUG" --data-binary @"$DIR"/../../content/images/$FILESLUG)

# How can we ensure the photo has uploaded properly?
echo $NEWIMG > _result_new_photo.xml

re="<content type='.*' src='(.*/$FILESLUG)'/>"
if [[ $NEWIMG =~ $re ]]; then
	IMGURL=${BASH_REMATCH[1]}
	echo $IMGURL
	echo "$FILESLUG, $IMGURL" >> "$DIR"/../../userdata/picasa/imagemap.csv
	exit 0
else
	exit 1
fi
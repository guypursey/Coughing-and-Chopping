# Get access token.
ACCTOK=$(<_access_token.txt)
# What happens if we can't find access ID?

# Get XML album created by `test-post-with-access-token.sh`
NEWALB=$(<_result_new_album.xml)
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

		echo "Creating image map..."
		declare -A imagemap

		while read -r line || [[ -n $line ]]; do
			arr=(${line//,/ })
			imagemap[${arr[0]}]=${arr[1]}
		done < ../imagemap.csv

		if [ ${imagemap[$FILESLUG]+isset} ]; then
			echo "File already mapped!"
			exit 1
		fi
		
	fi

# Check if file exists in right location.

if [ ! -f ../$FILESLUG ]; then
    echo "File not found!"
    exit 1
fi

FILESIZE=$(stat -c "%s" "../$FILESLUG")
echo $FILESIZE

# Try posting a photo with test xml.
NEWIMG=$(curl https://picasaweb.google.com/data/feed/api/user/default/albumid/$ALBMID -X POST -H "GData-Version: 2" -H "Authorization: Bearer $ACCTOK" -H "Content-Type: image/jpeg" -H "Content-Length: $FILESIZE" -H "Slug: $FILESLUG" --data-binary @../$FILESLUG)

# How can we ensure the photo has uploaded properly?
echo $NEWIMG > _result_new_photo.xml

re="<content type='.*' src='(.*/$FILESLUG)'/>"
if [[ $NEWIMG =~ $re ]]; then
	IMGURL=${BASH_REMATCH[1]}
	echo $IMGURL
fi

echo "$FILESLUG, $IMGURL" >> ../imagemap.csv
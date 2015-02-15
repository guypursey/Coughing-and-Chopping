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
	echo $ALBMID
fi
# What happens if we can't find access ID?

FILESIZE=$(stat -c "%s" "../mongolian-flower.jpg")
echo $FILESIZE

FILESLUG="mongolian-flower-1.jpg"
# How can we add slugs and files programmatically?
# What if slug is already taken?

# Try posting a photo with test xml.
NEWIMG=$(curl https://picasaweb.google.com/data/feed/api/user/default/albumid/$ALBMID -X POST -H "GData-Version: 2" -H "Authorization: Bearer $ACCTOK" -H "Content-Type: image/jpeg" -H "Content-Length: $FILESIZE" -H "Slug: $FILESLUG" --data-binary @../mongolian-flower.jpg)

echo $NEWIMG > _result_new_photo.xml

re="<content type='.*' src='(.*/$FILESLUG)'/>"
if [[ $NEWIMG =~ $re ]]; then
	IMGURL=${BASH_REMATCH[1]}
	echo $IMGURL
fi

echo "$FILESLUG, $IMGURL" >> ../imagemap.csv
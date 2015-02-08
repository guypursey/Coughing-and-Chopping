ACCTOK=$(<_access_token.txt)

# Get XML album created by `test-post-with-access-token.sh`
NEWALB=$(<_result_new_album.xml)

re="<gphoto:id>(.*)</gphoto:id>"
if [[ $NEWALB =~ $re ]]; then
	ALBMID=${BASH_REMATCH[1]}
	echo $ALBMID
fi

FILESIZE=$(stat -c "%s" "../mongolian-flower.jpg")
echo $FILESIZE

# Try posting a photo with test xml.
NEWIMG=$(curl https://picasaweb.google.com/data/feed/api/user/default/albumid/$ALBMID -X POST -H "GData-Version: 2" -H "Authorization: Bearer $ACCTOK" -H "Content-Type: image/jpeg" -H "Content-Length: $FILESIZE" -H "Slug: test-photo.jpg" --data-binary @../mongolian-flower.jpg)

echo $NEWIMG > _result_new_photo.xml

ACCTOK=$(<_access_token.txt)

# Try posting with test xml.
NEWALB=$(curl https://picasaweb.google.com/data/feed/api/user/default -X POST -H "GData-Version: 2" -H "Authorization: Bearer $ACCTOK" -H "Content-Type: application/atom+xml" -d @test-post-album.xml)
echo $NEWALB > _result_new_album.xml

# Above does actually work but album was invisible!
# Find source directory.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Poll Google endpoint access and refresh tokens 

CLNTID=$(<"$DIR"/../../userdata/picasa/_client_id.txt)
CLNTSE=$(<"$DIR"/../../userdata/picasa/_client_secret.txt)
DEVCDE=$(<"$DIR"/../../userdata/picasa/_device_code.txt)
POLLRT=$(curl -s -d "client_id="$CLNTID"&client_secret="$CLNTSE"&code="$DEVCDE"&grant_type=http://oauth.net/grant_type/device/1.0" https://accounts.google.com/o/oauth2/token)
# Code adapted from: https://developers.google.com/accounts/docs/OAuth2ForDevices

re='\"access_token\" \: \"(.*)\"\,[[:space:]]+\"t'
if [[ $POLLRT =~ $re ]]; then
	ACCTOK=${BASH_REMATCH[1]}
fi

re='\"refresh_token\" \: \"(.*)\"'
if [[ $POLLRT =~ $re ]]; then
	REFTOK=${BASH_REMATCH[1]}
fi

echo "Access Token:" $ACCTOK
echo "Refresh Token:" $REFTOK

echo $ACCTOK > "$DIR"/../../userdata/picasa/_access_token.txt
echo $REFTOK > "$DIR"/../../userdata/picasa/_refresh_token.txt
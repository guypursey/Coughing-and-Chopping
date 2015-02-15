DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

CLNTID=$(<"$DIR"/_client_id.txt)
CLNTSE=$(<"$DIR"/_client_secret.txt)
REFTOK=$(<"$DIR"/_refresh_token.txt)

echo "Refresh token:" $REFTOK

# Get new access token with refresh
POLLRT=$(curl -d "client_id="$CLNTID"&client_secret="$CLNTSE"&refresh_token="$REFTOK"&grant_type=refresh_token" https://accounts.google.com/o/oauth2/token)

re='\"access_token\" \: \"(.*)\"\,[[:space:]]+\"t'
if [[ $POLLRT =~ $re ]]; then
	ACCTOK=${BASH_REMATCH[1]}
fi	

echo $ACCTOK > "$DIR"/_access_token.txt
echo "Action token:" $ACCTOK
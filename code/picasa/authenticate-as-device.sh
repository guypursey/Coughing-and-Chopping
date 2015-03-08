
# Request `user_code` and `verification_url`.

CLNTID=$(<_client_id.txt)
CSCOPE="https%3A%2F%2Fpicasaweb.google.com%2Fdata%2F"
VERREQ=$(curl -s -d "client_id=$CLNTID&scope=$CSCOPE" https://accounts.google.com/o/oauth2/device/code)
# Code adapted from https://developers.google.com/accounts/docs/OAuth2ForDevices

re='\"verification_url\" \: \"(.*)\"\,'
if [[ $VERREQ =~ $re ]]; then
	VERURL=${BASH_REMATCH[1]}
fi

re='\"user_code\" \: \"(.*)\"\,[[:space:]]+\"v'
if [[ $VERREQ =~ $re ]]; then
	USERID=${BASH_REMATCH[1]}
fi

re='\"device_code\" \: \"(.*)\"\,[[:space:]]+\"u'
if [[ $VERREQ =~ $re ]]; then
	DEVCDE=${BASH_REMATCH[1]}
fi

echo $DEVCDE > _device_code.txt
echo "Please visit " $VERURL "and enter this code: " $USERID

# Poll the device endpoint for user verification -- will provide access token if successful.


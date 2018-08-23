#!/bin/bash
echo getting token...

uri=https://config-22bfe4e7-e0e9-46f8-bcf0-67174566b6ba.cfapps.io
access_token_uri=https://p-spring-cloud-services.uaa.run.pivotal.io/oauth/token
client_id=p-config-server-44a19d71-9e1c-43cd-9205-f27e11095e7f
client_secret=0K982IsieTzk

token=$(curl $access_token_uri -u $client_id:$client_secret -d grant_type=client_credentials | jq -r .access_token);

#echo $token
echo curling the config server with said token
curl -H "Authorization: bearer $token" -H "Accept: application/json" $uri/app-name/profile | jq

echo Doing company specific request
curl -H "Authorization: bearer $token" -H "Accept: application/json" $uri/company/cloud | jq

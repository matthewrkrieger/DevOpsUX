if [ $# -eq 0 ]
  then
    TEXT="Welcome to DevOps Boulder!"
  else
    TEXT=$1
fi

curl -d '{ "auth_token": "YOUR_AUTH_TOKEN", "text": "'"${TEXT}"'"}' \http://localhost:3030/widgets/welcome

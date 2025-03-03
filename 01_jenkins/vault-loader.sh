curl \
    --header "X-Vault-Token: myroot" \
    --request POST \
    --data '{ "data": {"AWS_SECRET_ACCESS_KEY": "yyy", "AWS_ACCESS_KEY":"xxx"} }' \
    http://localhost:8200/v1/secret/data/aws_credentials

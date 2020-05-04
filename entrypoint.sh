#!/bin/sh -l

zip -r lambda-package.zip node_modules/ graphql/ index.js app.js
aws s3 cp lambda-package.zip s3://$1/
aws lambda update-function-code --function-name $2 --s3-bucket $1 --s3-key lambda-package.zip
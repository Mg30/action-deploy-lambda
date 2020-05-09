# /bin/sh

npm install
zip  -r lambda-package.zip $INPUT_FILES
aws s3 cp lambda-package.zip s3://$INPUT_BUCKET_NAME/
aws lambda update-function-code --function-name $INPUT_FUNCTION_NAME --s3-bucket $INPUT_BUCKET_NAME --s3-key lambda-package.zip
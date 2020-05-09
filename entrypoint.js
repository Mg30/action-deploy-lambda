const exec = require('child_process').execSync

const files = process.env.INPUT_FILES
const bucketName = process.env.INPUT_BUCKET_NAME
const functionName = process.env.INPUT_FUNCTION_NAME

exec('npm install')
exec(`zip  -r lambda-package.zip ${files}`)
exec(`aws s3 cp lambda-package.zip s3://${bucketName}/`)
exec(`aws lambda update-function-code --function-name ${functionName} --s3-bucket ${bucketName} --s3-key lambda-package.zip`)
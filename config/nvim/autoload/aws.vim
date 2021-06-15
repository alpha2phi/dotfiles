echo "Initializing AWS autoload plugin"

python3 << END

import vim
import boto3
from botocore.exceptions import ClientError

def upload(bucket):
    file_name = vim.eval("expand('%:p')")
    object_name = vim.eval("expand('%:t')")

    s3_client = boto3.client('s3')
    try:
        response = s3_client.upload_file(file_name, bucket, object_name)
    except ClientError as e:
        print(e)

END


function aws#UploadS3(bucket)
  :py3 upload(vim.eval("a:bucket"))
endfunction

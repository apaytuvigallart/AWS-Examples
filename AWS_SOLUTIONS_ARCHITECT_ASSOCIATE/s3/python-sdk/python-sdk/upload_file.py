import boto3
import os
from boto3.exceptions import Boto3Error


def upload_file(bucket_name: str) -> bool:
    """
    Uploads a file to a specified S3 bucket.
    Parameters:
        - bucket_name: Bucket to upload the file to
    Returns:
        - True if file uploaded, else False
    """

    file = os.path.join(os.path.dirname(__file__), "..", "example_files/hello.txt")

    try:
        s3 = boto3.client("s3")
        s3.upload_file(Filename=file, Bucket=bucket_name, Key="hello.txt")

        return True

    except Boto3Error as e:
        print(e)
        return False


upload_file("somebucketwhatdoyoumean")

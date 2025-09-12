import boto3
from boto3.exceptions import Boto3Error


def put_object(bucket_name: str) -> bool:
    """
    Puts an object into a specified S3 bucket.
    Parameters:
        - bucket_name: Bucket to put the object into
    Returns:
        - True if object put, else False
    """

    try:
        s3 = boto3.client("s3")
        s3.put_object(Bucket=bucket_name, Key="example.txt", Body="Hello, world!")

        return True

    except Boto3Error as e:
        print(e)
        return False


put_object("somebucketwhatdoyoumean")

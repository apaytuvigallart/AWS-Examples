import boto3
from boto3.exceptions import Boto3Error


def delete_bucket(bucket_name: str) -> bool:
    """
    Delete a S3 bucket in a specified region.

    If a region is not specified, the bucket is created in the S3 default
    region (eu-west-1).

    Parameters:
        - bucket_name: Bucket to create

    Returns:
        - True if bucket deleted, else False
    """

    s3 = boto3.client("s3")

    try:
        s3.delete_bucket(Bucket=bucket_name)
        print(f"Bucket {bucket_name} deleted")
        return True

    except Boto3Error as e:
        print(e)
        return False


delete_bucket("somebucketwhatdoyoumean")
delete_bucket("anotherbucketname-vamosvamosvamos")

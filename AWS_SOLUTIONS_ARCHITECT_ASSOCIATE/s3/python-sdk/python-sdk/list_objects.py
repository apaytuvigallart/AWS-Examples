import boto3
from boto3.exceptions import Boto3Error


def list_objects(bucket_name: str) -> list:
    """
    List objects in a S3 bucket.

    Parameters:
        - bucket_name: Bucket to list objects from
    Returns:
        - list of objects either empty or with content
    """

    s3 = boto3.client("s3")

    try:
        response = s3.list_objects(
            Bucket=bucket_name,
        )
        bucket_content = response["Contents"] if "Contents" in response else []
        return bucket_content

    except Boto3Error as e:
        print(e)
        return []


list_objects("somebucketwhatdoyoumean")

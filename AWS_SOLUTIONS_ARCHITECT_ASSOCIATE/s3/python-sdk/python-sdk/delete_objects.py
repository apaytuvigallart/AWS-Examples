import boto3
from boto3.exceptions import Boto3Error
from list_objects import list_objects


def delete_objects(bucket_name: str, bucket_objects: list) -> bool:
    """
    Delete objects in a S3 bucket.

    Parameters:
        - bucket_name: Bucket to delete objects from
        - bucket_objects: List of objects to delete
    Returns:
        - True if delete operation was successful, False otherwise
    """

    s3 = boto3.client("s3")

    try:
        for bucket_object in bucket_objects:
            s3.delete_object(Bucket=bucket_name, Key=bucket_object["Key"])
        print("Delete objects completed.")
        return True

    except Boto3Error as e:
        print(e)
        return False


delete_objects("somebucketwhatdoyoumean", list_objects("somebucketwhatdoyoumean"))

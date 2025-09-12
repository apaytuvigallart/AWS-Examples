import boto3
from boto3.exceptions import Boto3Error
from settings import AWS_REGION


def create_bucket(bucket_name: str, region: str = AWS_REGION) -> bool:
    """
    Create an S3 bucket in a specified region

    If a region is not specified, the bucket is created in the S3 default
    region (eu-west-1).

    Parameters:
        - bucket_name: Bucket to create
        - region: String region to create bucket in, e.g., 'eu-west-1

    Returns:
        - True if bucket created, else False
    """
    s3 = boto3.client("s3", region_name=region)
    try:
        s3.create_bucket(
            Bucket=bucket_name,
            CreateBucketConfiguration={
                "LocationConstraint": region
            },  # Only needed if not us-east-1
        )
        print(f"Bucket {bucket_name} created")
        return True

    except Boto3Error as e:
        print(e)
        return False


create_bucket("somebucketwhatdoyoumean")
create_bucket("anotherbucketname-vamosvamosvamos", "eu-central-1")

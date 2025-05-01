#!/usr/bin/env bash -e

# remove object
aws s3 rm s3://${BUCKET_NAME}/${OBJECT_NAME}

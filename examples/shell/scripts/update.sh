#!/usr/bin/env bash -e

# remove old object
aws s3 rm s3://${BUCKET_NAME}/${OBJECT_NAME}

# upload json object to s3
echo "$CONTENTS" | aws s3 cp - s3://${BUCKET_NAME}/${OBJECT_NAME}

# get object etag
ETAG=$(
  aws s3api head-object \
    --bucket ${BUCKET_NAME} \
    --key ${OBJECT_NAME} \
    --query ETag \
    --output text \
  | xargs
)

# using jq, include etag in contents output
echo "$CONTENTS" | jq --arg etag "$ETAG" '. + {etag: $etag}'

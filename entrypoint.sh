#!/bin/sh

export NEW_RELIC_API_KEY=${NEW_RELIC_USER_API_KEY}
export NEW_RELIC_REGION=${NEW_RELIC_REGION}
export NEW_RELIC_LICENSE_KEY=${NEW_RELIC_INGEST_LICENSE_KEY}

echo "IS THIS THING ON? $NEW_RELIC_LICENSE_KEY"

result=$(newrelic reporting junit \
  --accountId "${NEW_RELIC_ACCOUNT_ID}" \
  --path "${NEW_RELIC_TEST_OUTPUT_PATH}" \
  2>&1)

exitStatus=$?

if [ $exitStatus -ne 0 ]; then
  echo "::error:: $result"
fi

exit $exitStatus

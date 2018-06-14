#!/bin/bash

set -e

OLD_IFS="$IFS"
IFS=

TOTAL_ENTRIES=$(ruby env_var_helper_client.rb count_entries)
i="0"

while [ "$i" -lt $TOTAL_ENTRIES ]
do
  FILE_ENDPOINT=$(ruby env_var_helper_client.rb container_destination $i)
  FILE_CONTENTS=$(ruby env_var_helper_client.rb contents $i)
  echo -e $FILE_CONTENTS > $FILE_ENDPOINT
  i=$[$i+1]
done

IFS="$OLD_IFS"

"$@"

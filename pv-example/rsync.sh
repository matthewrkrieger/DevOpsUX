#
# Please note that none of the variables used are defined in the script.
# You will need to define them in your environment/script before using
#

echo "Syncing $remote_webroot/$dir from prod server to $local_webroot/$dir…"

num_lines=`rsync -avz \ 
-e "/usr/bin/ssh -i $my_keys_folder/$remote_key \
-l $remote_user" --stats --human-readable --exclude "*cache*" \
—dry-run $remote_host:$remote_webroot/$dir/ $local_webroot/$dir/ | wc -l`

rsync -avz \
-e "/usr/bin/ssh -i $my_keys_folder/$remote_key \
-l $remote_user" --stats --human-readable --exclude "*cache*" \
$remote_host:$remote_webroot/$dir/ $local_webroot/$dir/ \
2>/data/deploy/rsync-errors.txt \
| /data/deploy/pv -l -e -p -f -r -s $num_lines -w 80 > /dev/null

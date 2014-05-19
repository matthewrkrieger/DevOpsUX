for i in {1..10}
do
  echo "${i}. Doing stuff..."
  sleep 1
done
echo "ERROR: This build failed for an arbitrary reason"
exit 1

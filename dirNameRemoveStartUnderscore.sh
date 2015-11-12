# change dir names start with _ to without _

ls -1 | while read file
do
mv "$file" `echo "$file" | sed 's/^_//'`
done

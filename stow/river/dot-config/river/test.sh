for i in $(seq 1 9)
do
    tags=$((1 << ($i - 1)))
    echo $tags
done

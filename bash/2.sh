
#!/bin/bash

if [ ! -d "$1" ]; then
    exit 1
fi

for dir in "$1"/*/; do
    [ -d "$dir" ] || continue
    name=$(basename "$dir")
    count=$(ls -A "$dir" | wc -l)
    echo "$count" > "$name"
done

exit 0


find ./ -type f -name "*.go" | while read file; do
    sed -i -E "s/new_github.com/github.com/g" "$file"
    sed -i -E "s/new_OmarTariq612/OmarTariq612/g" "$file"
    sed -i -E "s/new_goech/goech/g" "$file"
done

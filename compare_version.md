```
function version_gt() {
        test "$(printf '%s\n' "$@" | sort -V | head -n 1)" != "$1";
}
```

Call example:
```
first_version=5.100.2
second_version=5.1.2
if version_gt $first_version $second_version; then
     echo "$first_version is greater than $second_version !"
fi
```

#!/bin/bash
set -e

PUBDIR="/home/tomc/Documents/Personal Projects/your-budget-app/"

# Find and increment the version number.
if [ $# -eq 0 ]
  then
    echo "Updating build number"
    perl -i -pe 's/^(version:\s+)(\d+)(\.)(\d+)(\.)(\d+)(\+)(\d+)$/$1.$2.$3.$4.$5.$6.$7.($8+1)/e' "$PUBDIR/pubspec.yaml"
elif [[ $# -eq 1  && "$1" == "major" ]]
    then
    echo "Updating major version number"
    perl -i -pe 's/^(version:\s+)(\d+)(\.)(\d+)(\.)(\d+)(\+)(\d+)$/$1.($2+1).$3.$4.$5.$6.$7.$8/e' "$PUBDIR/pubspec.yaml"
elif [[ $# -eq 1  && "$1" == "minor" ]]
    then
    echo "Updating minor version number"
    perl -i -pe 's/^(version:\s+)(\d+)(\.)(\d+)(\.)(\d+)(\+)(\d+)$/$1.$2.$3.($4+1).$5.$6.$7.$8/e' "$PUBDIR/pubspec.yaml"
elif [[ $# -eq 1  && "$1" == "patch" ]]
    then
    echo "Updating patch version number"
    perl -i -pe 's/^(version:\s+)(\d+)(\.)(\d+)(\.)(\d+)(\+)(\d+)$/$1.$2.$3.$4.$5.($6+1).$7.$8/e' "$PUBDIR/pubspec.yaml"
else
    exit 1
fi

# Commit and tag this change.
version=`grep 'version: '  "$PUBDIR/pubspec.yaml" | sed 's/version: //'`
git commit -m "Bump version to $version" "$PUBDIR/pubspec.yaml"
git tag "$version"

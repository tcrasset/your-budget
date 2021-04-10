#!/bin/bash

shopt -s globstar
for i in **/*.dart; do
    sed -i '/Project imports/d' "$i"
    sed -i '/Package imports/d' "$i"
    sed -i '/Flutter imports/d' "$i"
    sed -i '/Dart imports/d' "$i"
done

flutter pub run import_sorter:main

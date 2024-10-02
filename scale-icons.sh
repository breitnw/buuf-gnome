#!/usr/bin/env sh

# copies every icon in the ./128x128/ folder to all the other sizes,
# scaling accordingly

for SIZE in 16x16 22x22 24x24 32x32 48x48; do
    for IMAGE in $(find ./128x128 -name '*.png'); do
        filename=$(basename $IMAGE)
        magick $IMAGE -resize $SIZE "${SIZE}/${filename}"
    done
done

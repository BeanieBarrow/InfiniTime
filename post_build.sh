#!/bin/sh
export LC_ALL=C.UTF-8
export LANG=C.UTF-8
set -e
set +x

export PROJECT_VERSION="1.13.0"

mkdir -p "$OUTPUT_DIR"

cp "$SOURCES_DIR"/bootloader/bootloader-5.0.4.bin $OUTPUT_DIR/bootloader.bin
cp "$BUILD_DIR/src/pinetime-mcuboot-app-image-$PROJECT_VERSION.bin" "$OUTPUT_DIR/pinetime-mcuboot-app-image-$PROJECT_VERSION.bin"
cp "$BUILD_DIR/src/pinetime-mcuboot-app-dfu-$PROJECT_VERSION.zip" "$OUTPUT_DIR/pinetime-mcuboot-app-dfu-$PROJECT_VERSION.zip"

cp "$BUILD_DIR/src/pinetime-mcuboot-recovery-loader-image-$PROJECT_VERSION.bin" "$OUTPUT_DIR/pinetime-mcuboot-recovery-loader-image-$PROJECT_VERSION.bin"
cp "$BUILD_DIR/src/pinetime-mcuboot-recovery-loader-dfu-$PROJECT_VERSION.zip" "$OUTPUT_DIR/pinetime-mcuboot-recovery-loader-dfu-$PROJECT_VERSION.zip"

cp "$BUILD_DIR/src/resources/infinitime-resources-$PROJECT_VERSION.zip" "$OUTPUT_DIR/infinitime-resources-$PROJECT_VERSION.zip"

mkdir -p "$OUTPUT_DIR/src"
cp $BUILD_DIR/src/*.bin "$OUTPUT_DIR/src/"
cp $BUILD_DIR/src/*.hex "$OUTPUT_DIR/src/"
cp $BUILD_DIR/src/*.out "$OUTPUT_DIR/src/"
cp $BUILD_DIR/src/*.map "$OUTPUT_DIR/src/"

ls -RUv1 "$OUTPUT_DIR" | sed 's;^\([^/]\); \1;g'

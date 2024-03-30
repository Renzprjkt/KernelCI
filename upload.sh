#!/usr/bin/env bash

DATE=$(date +"%Y%m%d-%H%M")
export KBUILD_COMPILER_STRING
KBUILD_COMPILER_STRING="Proton clang 14.0"
KBUILD_BUILD_HOST="Shiinaeru"
export KBUILD_BUILD_HOST
KBUILD_BUILD_USER="Ubuntu"
export KBUILD_BUILD_USER
DEVICE="Redmi S2"
export DEVICE
CODENAME="ysl"
export CODENAME
REPO="https://github.com/Shiinaeru-Lab/android_kernel_4.19-msm8953"
export REPO
BRANCH="ysl-base"
export BRANCH
COMMIT="https://github.com/Shiinaeru-Lab/android_kernel_4.19-msm8953/commits/ysl-base/"
export COMMIT
STATUS=WIP
export STATUS
ID=-1002146262108
export ID
TOKEN=7145658525:AAGnqSF7XxiK8ciydvrzIV2nkCWVbG117Ko
export TOKEN

tgs() {
    MD5=$(md5sum "$1" | cut -d' ' -f1)
    curl -fsSL -X POST -F document=@"$1" https://api.telegram.org/bot"${TOKEN}"/sendDocument \
        -F "chat_id=${ID}" \
        -F "parse_mode=Markdown" \
        -F "caption=$2 | *MD5*: \`$MD5\`"
}

# Push kernel to channel
push() {
    cd AnyKernel3 || exit 1
    ZIP=$(echo *.zip)
    tgs "${ZIP}" "Build took $((DIFF / 60)) minute(s) and $((DIFF % 60)) second(s). | For *${DEVICE} (${CODENAME})* | ${KBUILD_COMPILER_STRING}"
}

push

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

tg() {
    curl -sX POST https://api.telegram.org/bot"${7145658525:AAGnqSF7XxiK8ciydvrzIV2nkCWVbG117Ko}"/sendMessage -d chat_id="${-1002146262108}" -d parse_mode=Markdown -d disable_web_page_preview=true -d text="$1" &>/dev/null
}

tgs() {
    MD5=$(md5sum "$1" | cut -d' ' -f1)
    curl -fsSL -X POST -F document=@"$1" https://api.telegram.org/bot"${token}"/sendDocument \
        -F "chat_id=${chat_id}" \
        -F "parse_mode=Markdown" \
        -F "caption=$2 | *MD5*: \`$MD5\`"
}

# Send Build Info
sendinfo() {
    tg "
• RenzBuild Action •
*Building on*: \`KernelCI actions\`
*Date*: \`${DATE}\`
*Device*: \`${DEVICE} (${CODENAME})\`
*Repository*: \`${REPO}\`
*Branch*: \`${BRANCH}\`
*Commit History*: \`${COMMIT}\`
*Compiler*: \`${KBUILD_COMPILER_STRING}\`
*Build Status*: \`${STATUS}\`"
}

sendinfo

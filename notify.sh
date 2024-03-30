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

tg() {
    curl -sX POST https://api.telegram.org/bot"${TOKEN}"/sendMessage -d chat_id="${ID}" -d parse_mode=Markdown -d disable_web_page_preview=true -d text="$1" &>/dev/null
}

# Send Build Info
sendinfo() {
    tg "
• RenzBuild Action •
*Building on*: \`KernelCI actions\`
*Date*: \`${DATE}\`
*Device*: \`${DEVICE} (${CODENAME})\`
*Repository*: [${REPO}]
*Branch*: \`${BRANCH}\`
*Commit History*: [${COMMIT}]
*Compiler*: \`${KBUILD_COMPILER_STRING}\`
*Build Status*: \`${STATUS}\`"
}

sendinfo

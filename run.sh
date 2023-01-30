#!/bin/bash

timestamp=$(date "+%Y.%m.%d-%H.%M.%S")

shot-scraper https://ramaworks.store/pages/updates \
    --wait 2000 \
    -o `echo $timestamp | awk -F\. '{print $1}'`/`echo $timestamp | awk -F\. '{print $2}'`/$timestamp.png \
    --width 1920 \
    --height 10000 \
    --javascript "
    document.querySelectorAll('div.zn-accordion-handle')
        .forEach((el) => el.click());
    document.querySelectorAll('button.zn-accordion-handle')
        .forEach((el) => el.click());
    "
echo "timestamp=$timestamp" >> $GITHUB_ENV
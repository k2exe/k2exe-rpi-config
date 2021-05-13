#!/usr/bin/env bash
if hash wsjtx 2>/dev/null
then
    wsjtx_app_varsion -v | cut -f 2 -d' '
else
    echo "NOT INSTALLED"
fi

#!/usr/bin/env bash

vol=`amixer get Master | grep -oE "[[:digit:]]{1,3}%" | head -1 | sed 's/%//'`
echo $vol

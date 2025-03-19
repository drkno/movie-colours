#!/bin/bash

printf "#%s\n" `convert "$1" -scale 1x1\! -format '%[hex:u]' info:-`

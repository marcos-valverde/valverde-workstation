#!/usr/bin/env bash

spinner(){

local pid=$!

local spin='-\|/'

while kill -0 "$pid" 2>/dev/null

do

for i in $(seq 0 3)

do

printf "\r[%c] " "${spin:$i:1}"

sleep .1

done

done

printf "\r"

}
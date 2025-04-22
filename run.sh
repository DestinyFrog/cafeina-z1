#!/usr/bin/bash

while true;
do
    clear;
    lua main.lua z13 example.z1 z13d/public/out.z13;
    lua main.lua standard example.z1 out.svg;
    sleep 1;
done
#!/usr/bin/bash

while true;
do
    clear;
    lua z1/Repl.lua z13 example.z1 z13d/public/out.z13;
    lua z1/Repl.lua standard example.z1 z13d/public/out.svg;
    sleep 0.5;
done
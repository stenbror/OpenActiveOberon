#!/bin/sh

fpc -Mobjfpc bootcompiler/aoc.pp -oaoc_bootstrap
mv ./bootcompiler/aoc_bootstrap ./bin

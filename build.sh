#!/bin/sh

rm bootcompiler/*.ppu
fpc -Mobjfpc bootcompiler/aoc.pas -oaoc_bootstrap
mv ./bootcompiler/aoc_bootstrap ./bin

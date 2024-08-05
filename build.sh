#!/bin/sh

echo " Building compiler binary! "
rm bootcompiler/*.ppu
fpc bootcompiler/aoc.pas -oaoc_bootstrap
mv ./bootcompiler/aoc_bootstrap ./bin

echo " Executing UnitTests! "
fpc -Fu"bootcompiler/unittests" -Fu"bootcompiler/fptest" bootcompiler/unittests/test_active_oberon_compiler.pas -obin/test_active_oberon_compiler
rm bin/*.ppu
rm bin/*.o
./bin/test_active_oberon_compiler


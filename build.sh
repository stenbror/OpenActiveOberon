#!/bin/sh

echo " Building compiler binary! "

rm bootcompiler/*.ppu
fpc -Fu"bootcompiler" bootcompiler/aoc.pas -obin/aoc_bootstrap -B

echo " Executing UnitTests! "

rm bin/*.ppu
rm bin/*.o
fpc -Fu"bootcompiler/unittests" -Fu"bootcompiler" -Fu"bootcompiler/fptest" bootcompiler/unittests/test_active_oberon_compiler.pas -obin/test_active_oberon_compiler
rm bin/*.ppu
rm bin/*.o
./bin/test_active_oberon_compiler


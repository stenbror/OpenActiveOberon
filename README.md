# Active Oberon Native Compiler (Version 2019)

This is the start of  a open active oberon compiler for Windows, Linux and Mac. First supporting *ARM aarch64* binary code and inline assembler. We have started on the bootstrap compiler written in object pascal that will be used to compile the final compiler written nativly in Active Oberon.

The transition from Pascal version to Active Oberon version will be mostly minor.

You need to install fpc (Free Pascal Compiler) for your system to build the bootstrap compiler. For now i use WSL for Windows with Ubuntu on an ARM based laptop and Visual Code for development.

To build:
- Install WSL under Windows with Ubuntu or directly on a Linux machine.
- Install fpc (Free Pascal Compiler) e.g. 'apt install fpc'
- Execute 'build.sh'
- Resulting bootstrap binary will be in bin/ folder.

## Unittesting

All UnitTests can be executed by executing **build.sh**

This will build the Compiler and the test harness. Both binaries ends up in *bin* folder.

- Execute *bin/test_active_oberon_compiler* to just do the UnitTests.

# Language details

## Reserved keywords

| | | | | | | | |
|----|-----|-----|-----|-----|-----|------|------|
| address | alias | array | await | begin | by | cell | cellnet | 
| case | code | definition | do | div | end | enum | else | 
| elsif | exit | extern | false | for | finally | if | imag |
| in | is | import | loop | module | mod | nil | object |
| of | or | out | operator | pointer | procedure  | port | repeat |
| record | return | result | self | then | true | to | type | 
| until | var | while | with |

## Operators or delimiters

||||||||||||
|-|-|-|-|-|-|-|-|-|-|-|
| < | <= | = | >= | > | # | := | : | ; | .. | . | , |
| + | +* | - | ^ | & | ? | ?? | ! | !! | << | >> | <<? |
| >>? | .< | .<= | .>= | .> | .+ | .* | .= | .# | ~ | 
| \ | ´ | ( | ) | [ | ] | { | } | ** | * | / | ./ | 

## Reserved procedures and data types

| | | | | | | |
|----|-----|-----|-----|-----|-----|------|
| abs | addressof | all | any | ash | assert | boolean | 
| cap | cas | char | chr | complex | complex32 | complex64 | 
| copy | dec | decmul | dim | entier | entierh | excl | 
| first | float32 | float64 | floor | halt | im | inc |
| incl | incmul | incr | integer | integerset | last | len | 
| long | longinteger | lsh | max | min | odd | 
| range | re | real | reshape | rol | ror | rot | 
| set | set8 | set16 | set32 | set64 | shl | short | 
| shr | signed8 | signed16 | signed32 | signed64 | size | sizeof |
| step | sum | unsigned8 | unsigned16 | unsigned32 | unsigned32 | unsigned64 |

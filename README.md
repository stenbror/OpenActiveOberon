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

| | | | | | | | |
|----|-----|-----|-----|-----|-----|------|------|
| address | alias | array | await | begin | by | cell | cellnet | 
| case | code | definition | do | div | end | enum | else | 
| elsif | exit | Eextern | false | for | finally | if | imag |
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
| ABS | ADDRESSOF | ALL | ANY | ASH | ASSERT | BOOLEAN | 
| CAP | CAS | CHAR | CHR | COMPLEX | COMPLEX32 | COMPLEX64 | 
| COPY | DEC | DECMUL | DIM | ENTIER | ENTIERH | EXCL | 
| FIRST | FLOAT32 | FLOAT64 | FLOOR | HALT | IM | INC |
| INCL | INCMUL | INCR | INTEGER | INTEGERSET | LAST | LEN | 
| LONG |LONGINTEGER | LSH | MAX | MIN | OBJECT | ODD | 
| RANGE | RE | REAL | RESHAPE | ROL | ROR | ROT | 
| SET | SET8 | SET16 |SET32 | SET64 | SHL | SHORT | 
| SHR | SIGNED8 | SIGNED16 | SIGNED32 | SIGNED64 | SIZE | SIZEOF |
| STEP | SUM | UNSIGNED8 | UNSIGNED16 | UNSIGNED32 | UNSIGNED32 | UNSIGNED64 |

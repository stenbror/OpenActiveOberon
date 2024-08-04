# Active Oberon Native Compiler (Version 2019)

This is the start of  a open active oberon compiler for Windows, Linux and Max. First supporting ARMN AA64ARCh binary code and inline assembler. We have started on the bootstrap compiler written in object pascal that will be used to compile the final compiler written nativly in Active Oberon.

The transition from Pascal version to Active Oberon version will be mostly minor.

You need to install fpc (Free Pascal Compiler) for your system to build the bootstrap compiler. For now i use WSL for Windows with Ubuntu on an ARM based laptop and Visual Code for development.

To build:
- Install WSL under Windows with Ubuntu or directly on a Linux machine.
- Install fpc (Free Pascal Compiler) e.g. 'apt install fpc'
- Execute 'build.sh'
- Resulting bootstrap binary will be in bin/ folder.

  

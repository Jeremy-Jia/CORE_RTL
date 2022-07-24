# 山东大学微电子学院RISC-V课题组

*计划：*

删除各个流水级**向量冗余代码**

取指级**4条**指令带宽

译码级**4条**指令带宽

**uOP级**增加

重命名**5uOP**

**ROB**128项

**Pre**File128个

**4条**指令退休

# IP Readme

  Welcome to C910! Some key directories are shown below.
```
|--C910_RTL_FACRORY/
  |--gen_rtl/     ##the source verilog code of C910 
  |--setup/       ##set the environment variables
|--smart_run/     ##the RTL simulation environment
  |--impl/        ##sdc file
  |--logical/     ##the SoC demo and test bench to run the simulation 
  |--setup/       ##GNU tool chain setting
  |--tests/       ##include the test suit, linker file, boot code and so on
  |--work/        ##the working directory
  |--Makefile     ##the simulation script
|--doc/           ##the user and integration manual of C910
```


## Usage

  Step1: Get Started

```
$ cd C910_RTL_FACTORY
$ source setup/setup.csh
$ cd ../
$ make help
To gain more information about how to use smart testbench.
```

  Step2: Download and install C/C++ Compiler

```
You can download the GNU tool chain compiled by T-HEAD from the url below:
https://occ.t-head.cn/community/download?id=3948120165480468480

$ cd ./smart_run
GNU tool chain (specific riscv version) must be installed and specified before
compiling *.c/*.v tests of the smart environment. Please refer to the following
setup file about how to specify it: 
    ./smart_run/setup/example_setup.csh
```


## Notes
    
```
The testbench supports iverilog, vcs and irun to run simulation and you can use Gtkwave or verdi 
to open the waveform under ./smart_run/work/ directory.

You can get the debugger, IDE and SDK from the url:https://occ.t-head.cn/community/download?id=575997419775328256
```



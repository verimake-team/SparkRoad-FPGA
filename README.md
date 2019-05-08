# SparkRoad-FPGA 
  The SparkRoad is a FPGA board with low cost per logic element and convenient USB bitstream programming capability.
  It is compatible with the micro:bit and is a perfect fit for breadboards.
  The heart of the SparkRoad board is a EG4S20NG88 FPGA from Anlogic.
  
## start with sparkroad
Ubuntu 16.4:

	git clone https://github.com/verimake-team/SparkRoad-FPGA.git
	cd SparkRoad-FPGA
	
For well-known reasons, we provide a mirror of toolchain for a pure `rv32i` here。

	链接：https://pan.baidu.com/s/160Iu03p4NvlcNUw18_msDQ 
	提取码：fv59 

If you have compiled a complete [toolchain for riscv](https://github.com/riscv/riscv-tools) 
Please skip the following commands.	
Make sure the mirror above is in the directory `/SparkRoad-FPGA`.Then the following commands will build the 
RISC-V GNU toolchain and libraries for a pure RV32I target, and install it in `/opt/riscv32i`:

	sudo mkdir /opt/riscv32i
	sudo chown $USER /opt/riscv32i
	make get-tools
	make build-tools
	
	

# SparkRoad-FPGA 
  The SparkRoad is a FPGA board with low cost per logic element and convenient USB bitstream programming capability.
  It is compatible with the micro:bit and is a perfect fit for breadboards.
  The heart of the SparkRoad board is a EG4S20NG88 FPGA from Anlogic.
  
# Quickstart

	git clone https://github.com/verimake-team/SparkRoad-FPGA.git
	cd SparkRoad-FPGA
	
If you have compiled a complete [toolchain for riscv](https://github.com/riscv/riscv-tools) 
Please skip the following commands.	
## build the toolchain on ubuntu 16.4:	
For well-known reasons, we provide a mirror of toolchain for a pure `rv32i` here。

	链接：https://pan.baidu.com/s/160Iu03p4NvlcNUw18_msDQ 
	提取码：fv59 

Make sure the mirror above is in the directory `/SparkRoad-FPGA`.Then the following commands will build the 
RISC-V GNU toolchain and libraries for a pure RV32I target, and install it in `/opt/riscv32i`:

	sudo mkdir /opt/riscv32i
	sudo chown $USER /opt/riscv32i
	make get-tools
	sudo tar -zxvf riscv-gnu-toolchain-rv32i.tar.gz
	sudo chown $USER riscv-gnu-toolchain-rv32i
	cd riscv-gnu-toolchain-rv32i; mkdir build; cd build
	../configure --with-arch=rv32i --prefix=/opt/riscv32i
	make -j$(nproc)
	cd ../../RISC-V/firmware
	gcc -Wall rom2mif.c -o rom2mif
	sudo mv rom2mif /opt/riscv32i/bin
	
## export PATH
You can input the following at the end of profile use `vi /etc/profile` .
	
	export PATH="$PATH:/opt/riscv32i/bin"
	
Then log out and reload your ubuntu.

## build the toolchain on windows10:
Just install `risc-v-toolchain.exe` which provide by Anlogic. Then export PATH. 
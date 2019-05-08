
get-tools:
	sudo apt-get install autoconf automake autotools-dev curl libmpc-dev \
        	libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo \
			gperf libtool patchutils bc zlib1g-dev git libexpat1-dev

config: 
	sudo tar -zxvf riscv-gnu-toolchain-riscv32i.tar.gz
	cd riscv-gnu-toolchain-riscv32i; mkdir build; cd build
	
build-tools:	
	make -j$(nproc)
	cd RISC-V/firmware
	gcc -Wall rom2mif -o rom2mif
	sudo mv rom2mif /opt/riscv32i/bin






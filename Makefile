
get-tools:
	sudo apt-get install autoconf automake autotools-dev curl libmpc-dev \
        	libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo \
			gperf libtool patchutils bc zlib1g-dev git libexpat1-dev

build-tools: 
	sudo mkdir /opt/riscv32i
	sudo chown $USER /opt/riscv32i
	sudo tar -zxvf riscv-gnu-toolchain-rv32i.tar.gz
	cd riscv-gnu-toolchain-rv32i
	mkdir build; cd build
	../configure --with-arch=rv32i --prefix=/opt/riscv32i
	make -j$(nproc)
	cd RISC-V/firmware
	gcc -Wall rom2mif -o rom2mif
	sudo mv rom2mif /opt/riscv32i/bin






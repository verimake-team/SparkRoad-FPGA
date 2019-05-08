
firmware.elf: firmware.S firmware.c firmware.lds
	riscv32-SparkRoad-elf-gcc -ffreestanding -nostdlib -o firmware.elf firmware.S firmware.c \
        -march=rv32i --std=gnu99 -Wl,-Bstatic,-T,firmware.lds,-Map,firmware.map,--strip-debug -lgcc


firmware.bin: firmware.elf
	riscv32-SparkRoad-elf-objcopy -O binary firmware.elf firmware.bin

lo.mif: firmware.bin
	rom2mif firmware.bin hi.mif mh.mif ml.mif lo.mif

disasm.S: firmware.elf
	riscv32-SparkRoad-elf-objdump -d firmware.elf > disasm.S

firmware.hex: firmware.elf
	riscv32-SparkRoad-elf-objcopy -O verilog firmware.elf firmware.hex

clean:
	rm -f firmware.elf firmware.hex firmware.bin  firmware.map *.mif





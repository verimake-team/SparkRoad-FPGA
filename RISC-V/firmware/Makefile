
VLOG = iverilog
TOOLCHAIN_PREFIX = riscv32-anlogic-elf-
ARCH = rv32ic

OS_NAME = $(shell uname -o)
ifeq ($(OS_NAME), GNU/Linux)
OS = "Linux"
else
OS = "Windows"
endif

all: detectsys disasm.S lo.mif

firmware.elf: firmware.S firmware.c firmware.lds
	$(TOOLCHAIN_PREFIX)gcc -Os -ffreestanding -nostdlib -o firmware.elf firmware.S firmware.c \
		-march=$(ARCH) --std=gnu99 -Wl,-Bstatic,-T,firmware.lds,-Map,firmware.map,--strip-debug -lgcc

firmware.bin: firmware.elf
	$(TOOLCHAIN_PREFIX)objcopy -O binary firmware.elf firmware.bin

ifeq ($(OS), Linux)
lo.mif: firmware.bin
	rom2mif firmware.bin hi.mif mh.mif ml.mif lo.mif
	cp *.mif ../al_ip
	cp zero ../al_ip/zero.mif
else
lo.mif: firmware.bin
	rom2mif firmware.bin hi.mif mh.mif ml.mif lo.mif
	copy zero ..\al_ip\zero.mif
	copy *.mif ..\al_ip
endif

disasm.S: firmware.elf
	$(TOOLCHAIN_PREFIX)objdump -d firmware.elf > disasm.S

firmware.hex: firmware.elf
	# rom2hex firmware.bin firmware.hex

detectsys:
	@echo "Your 're using $(OS)"

ifeq ($(OS), Linux)
clean:
	-rm -f firmware.elf
	-rm -f *.mif
else
clean:
	-del *.elf
	-del *.mif
	-del *.hex
endif

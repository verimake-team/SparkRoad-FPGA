
firmware.elf:     file format elf32-littleriscv


Disassembly of section .memory:

00000000 <putc-0x12>:
   0:	0000                	unimp
   2:	0000                	unimp
   4:	00001137          	lui	sp,0x1
   8:	80010113          	addi	sp,sp,-2048 # 800 <end+0x558>
   c:	18a000ef          	jal	ra,196 <main>
  10:	9002                	ebreak

00000012 <putc>:
  12:	100007b7          	lui	a5,0x10000
  16:	00a78823          	sb	a0,16(a5) # 10000010 <end+0xffffd68>
  1a:	10000737          	lui	a4,0x10000
  1e:	01c74783          	lbu	a5,28(a4) # 1000001c <end+0xffffd74>
  22:	8b85                	andi	a5,a5,1
  24:	ffed                	bnez	a5,1e <putc+0xc>
  26:	8082                	ret

00000028 <getc>:
  28:	100007b7          	lui	a5,0x10000
  2c:	01c7c703          	lbu	a4,28(a5) # 1000001c <end+0xffffd74>
  30:	8b09                	andi	a4,a4,2
  32:	df6d                	beqz	a4,2c <getc+0x4>
  34:	00078e23          	sb	zero,28(a5)
  38:	0147c503          	lbu	a0,20(a5)
  3c:	8082                	ret

0000003e <puts>:
  3e:	1141                	addi	sp,sp,-16
  40:	c422                	sw	s0,8(sp)
  42:	c606                	sw	ra,12(sp)
  44:	842a                	mv	s0,a0
  46:	00044503          	lbu	a0,0(s0)
  4a:	e509                	bnez	a0,54 <puts+0x16>
  4c:	40b2                	lw	ra,12(sp)
  4e:	4422                	lw	s0,8(sp)
  50:	0141                	addi	sp,sp,16
  52:	8082                	ret
  54:	0405                	addi	s0,s0,1
  56:	3f75                	jal	12 <putc>
  58:	b7fd                	j	46 <puts+0x8>

0000005a <memcpy>:
  5a:	e211                	bnez	a2,5e <memcpy+0x4>
  5c:	8082                	ret
  5e:	167d                	addi	a2,a2,-1
  60:	00c587b3          	add	a5,a1,a2
  64:	0007c703          	lbu	a4,0(a5)
  68:	00c507b3          	add	a5,a0,a2
  6c:	00e78023          	sb	a4,0(a5)
  70:	b7ed                	j	5a <memcpy>

00000072 <memcmp>:
  72:	87aa                	mv	a5,a0
  74:	40a78733          	sub	a4,a5,a0
  78:	00c74463          	blt	a4,a2,80 <memcmp+0xe>
  7c:	4505                	li	a0,1
  7e:	8082                	ret
  80:	0007c683          	lbu	a3,0(a5)
  84:	0005c703          	lbu	a4,0(a1)
  88:	0785                	addi	a5,a5,1
  8a:	0585                	addi	a1,a1,1
  8c:	fee684e3          	beq	a3,a4,74 <memcmp+0x2>
  90:	4501                	li	a0,0
  92:	8082                	ret

00000094 <print_version>:
  94:	00000537          	lui	a0,0x0
  98:	1141                	addi	sp,sp,-16
  9a:	1d050513          	addi	a0,a0,464 # 1d0 <main+0x3a>
  9e:	c606                	sw	ra,12(sp)
  a0:	3f79                	jal	3e <puts>
  a2:	00000537          	lui	a0,0x0
  a6:	1fc50513          	addi	a0,a0,508 # 1fc <main+0x66>
  aa:	3f51                	jal	3e <puts>
  ac:	40b2                	lw	ra,12(sp)
  ae:	00000537          	lui	a0,0x0
  b2:	22050513          	addi	a0,a0,544 # 220 <main+0x8a>
  b6:	0141                	addi	sp,sp,16
  b8:	b759                	j	3e <puts>

000000ba <printhex>:
  ba:	7179                	addi	sp,sp,-48
  bc:	000005b7          	lui	a1,0x0
  c0:	d422                	sw	s0,40(sp)
  c2:	4645                	li	a2,17
  c4:	842a                	mv	s0,a0
  c6:	24858593          	addi	a1,a1,584 # 248 <main+0xb2>
  ca:	0068                	addi	a0,sp,12
  cc:	d606                	sw	ra,44(sp)
  ce:	3771                	jal	5a <memcpy>
  d0:	1018                	addi	a4,sp,32
  d2:	00445793          	srli	a5,s0,0x4
  d6:	97ba                	add	a5,a5,a4
  d8:	fec7c503          	lbu	a0,-20(a5)
  dc:	883d                	andi	s0,s0,15
  de:	3f15                	jal	12 <putc>
  e0:	101c                	addi	a5,sp,32
  e2:	943e                	add	s0,s0,a5
  e4:	fec44503          	lbu	a0,-20(s0)
  e8:	5422                	lw	s0,40(sp)
  ea:	50b2                	lw	ra,44(sp)
  ec:	6145                	addi	sp,sp,48
  ee:	b715                	j	12 <putc>

000000f0 <printcrlf>:
  f0:	1141                	addi	sp,sp,-16
  f2:	4535                	li	a0,13
  f4:	c606                	sw	ra,12(sp)
  f6:	3f31                	jal	12 <putc>
  f8:	40b2                	lw	ra,12(sp)
  fa:	4529                	li	a0,10
  fc:	0141                	addi	sp,sp,16
  fe:	bf11                	j	12 <putc>

00000100 <dump_memory>:
 100:	1141                	addi	sp,sp,-16
 102:	c422                	sw	s0,8(sp)
 104:	842a                	mv	s0,a0
 106:	00000537          	lui	a0,0x0
 10a:	25c50513          	addi	a0,a0,604 # 25c <main+0xc6>
 10e:	c606                	sw	ra,12(sp)
 110:	c226                	sw	s1,4(sp)
 112:	c04a                	sw	s2,0(sp)
 114:	892e                	mv	s2,a1
 116:	3725                	jal	3e <puts>
 118:	4501                	li	a0,0
 11a:	3745                	jal	ba <printhex>
 11c:	4501                	li	a0,0
 11e:	3f71                	jal	ba <printhex>
 120:	4501                	li	a0,0
 122:	3f61                	jal	ba <printhex>
 124:	4501                	li	a0,0
 126:	3f51                	jal	ba <printhex>
 128:	00000537          	lui	a0,0x0
 12c:	27050513          	addi	a0,a0,624 # 270 <main+0xda>
 130:	3739                	jal	3e <puts>
 132:	40895513          	srai	a0,s2,0x8
 136:	0ff57513          	andi	a0,a0,255
 13a:	3741                	jal	ba <printhex>
 13c:	0ff97513          	andi	a0,s2,255
 140:	3fad                	jal	ba <printhex>
 142:	4481                	li	s1,0
 144:	3775                	jal	f0 <printcrlf>
 146:	0124c863          	blt	s1,s2,156 <dump_memory+0x56>
 14a:	40b2                	lw	ra,12(sp)
 14c:	4422                	lw	s0,8(sp)
 14e:	4492                	lw	s1,4(sp)
 150:	4902                	lw	s2,0(sp)
 152:	0141                	addi	sp,sp,16
 154:	8082                	ret
 156:	00f4f793          	andi	a5,s1,15
 15a:	e78d                	bnez	a5,184 <dump_memory+0x84>
 15c:	3f51                	jal	f0 <printcrlf>
 15e:	01845513          	srli	a0,s0,0x18
 162:	3fa1                	jal	ba <printhex>
 164:	41045513          	srai	a0,s0,0x10
 168:	0ff57513          	andi	a0,a0,255
 16c:	37b9                	jal	ba <printhex>
 16e:	40845513          	srai	a0,s0,0x8
 172:	0ff57513          	andi	a0,a0,255
 176:	3791                	jal	ba <printhex>
 178:	0ff47513          	andi	a0,s0,255
 17c:	3f3d                	jal	ba <printhex>
 17e:	02000513          	li	a0,32
 182:	3d41                	jal	12 <putc>
 184:	00044503          	lbu	a0,0(s0)
 188:	0485                	addi	s1,s1,1
 18a:	0405                	addi	s0,s0,1
 18c:	373d                	jal	ba <printhex>
 18e:	02000513          	li	a0,32
 192:	3541                	jal	12 <putc>
 194:	bf4d                	j	146 <dump_memory+0x46>

00000196 <main>:
 196:	1101                	addi	sp,sp,-32
 198:	100007b7          	lui	a5,0x10000
 19c:	02e00713          	li	a4,46
 1a0:	ce06                	sw	ra,28(sp)
 1a2:	c602                	sw	zero,12(sp)
 1a4:	cf98                	sw	a4,24(a5)
 1a6:	35fd                	jal	94 <print_version>
 1a8:	6761                	lui	a4,0x18
 1aa:	4781                	li	a5,0
 1ac:	10000637          	lui	a2,0x10000
 1b0:	69f70713          	addi	a4,a4,1695 # 1869f <end+0x183f7>
 1b4:	00f60023          	sb	a5,0(a2) # 10000000 <end+0xffffd58>
 1b8:	0785                	addi	a5,a5,1
 1ba:	0ff7f793          	andi	a5,a5,255
 1be:	c602                	sw	zero,12(sp)
 1c0:	46b2                	lw	a3,12(sp)
 1c2:	fed749e3          	blt	a4,a3,1b4 <main+0x1e>
 1c6:	46b2                	lw	a3,12(sp)
 1c8:	0685                	addi	a3,a3,1
 1ca:	c636                	sw	a3,12(sp)
 1cc:	bfd5                	j	1c0 <main+0x2a>
 1ce:	0000                	unimp
 1d0:	0a0d                	addi	s4,s4,3
 1d2:	6950                	flw	fa2,20(a0)
 1d4:	56526f63          	bltu	tp,t0,752 <end+0x4aa>
 1d8:	28203233          	0x28203233
 1dc:	5652                	lw	a2,52(sp)
 1de:	4d493233          	0x4d493233
 1e2:	53492043          	fmadd.d	ft0,fs2,fs4,fa0,rdn
 1e6:	2941                	jal	676 <end+0x3ce>
 1e8:	7220                	flw	fs0,96(a2)
 1ea:	6e75                	lui	t3,0x1d
 1ec:	696e                	flw	fs2,216(sp)
 1ee:	676e                	flw	fa4,216(sp)
 1f0:	6f20                	flw	fs0,88(a4)
 1f2:	206e                	fld	ft0,216(sp)
 1f4:	4745                	li	a4,17
 1f6:	0d34                	addi	a3,sp,664
 1f8:	000a                	0xa
 1fa:	0000                	unimp
 1fc:	2d2d                	jal	836 <end+0x58e>
 1fe:	202d                	jal	228 <main+0x92>
 200:	614a                	flw	ft2,144(sp)
 202:	2e6e                	fld	ft8,216(sp)
 204:	3032                	fld	ft0,296(sp)
 206:	3731                	jal	112 <dump_memory+0x12>
 208:	5320                	lw	s0,96(a4)
 20a:	7265                	lui	tp,0xffff9
 20c:	6169                	addi	sp,sp,208
 20e:	206c                	fld	fa1,192(s0)
 210:	6f70                	flw	fa2,92(a4)
 212:	7472                	flw	fs0,60(sp)
 214:	6420                	flw	fs0,72(s0)
 216:	6d65                	lui	s10,0x19
 218:	3176206f          	j	62d2e <end+0x62a86>
 21c:	0a0d                	addi	s4,s4,3
 21e:	0000                	unimp
 220:	2d2d                	jal	85a <end+0x5b2>
 222:	202d                	jal	24c <main+0xb6>
 224:	6e41                	lui	t3,0x10
 226:	6f6c                	flw	fa1,92(a4)
 228:	20636967          	0x20636967
 22c:	6e49                	lui	t3,0x12
 22e:	6f66                	flw	ft10,88(sp)
 230:	5420                	lw	s0,104(s0)
 232:	6365                	lui	t1,0x19
 234:	2e68                	fld	fa0,216(a2)
 236:	3228                	fld	fa0,96(a2)
 238:	3130                	fld	fa2,96(a0)
 23a:	2d31                	jal	856 <end+0x5ae>
 23c:	3032                	fld	ft0,296(sp)
 23e:	3731                	jal	14a <dump_memory+0x4a>
 240:	0d29                	addi	s10,s10,10
 242:	0d0a                	slli	s10,s10,0x2
 244:	000a                	0xa
 246:	0000                	unimp
 248:	3130                	fld	fa2,96(a0)
 24a:	3332                	fld	ft6,296(sp)
 24c:	3534                	fld	fa3,104(a0)
 24e:	3736                	fld	fa4,360(sp)
 250:	3938                	fld	fa4,112(a0)
 252:	4241                	li	tp,16
 254:	46454443          	fmadd.q	fs0,fa0,ft4,fs0,rmm
 258:	0000                	unimp
 25a:	0000                	unimp
 25c:	7544                	flw	fs1,44(a0)
 25e:	706d                	0x706d
 260:	6d20                	flw	fs0,88(a0)
 262:	6d65                	lui	s10,0x19
 264:	2079726f          	jal	tp,97c6a <end+0x979c2>
 268:	7266                	flw	ft4,120(sp)
 26a:	30206d6f          	jal	s10,656c <end+0x62c4>
 26e:	0078                	addi	a4,sp,12
 270:	7320                	flw	fs0,96(a4)
 272:	7a69                	lui	s4,0xffffa
 274:	3a65                	jal	fffffc2c <end+0xfffff984>
 276:	3020                	fld	fs0,96(s0)
 278:	0078                	addi	a4,sp,12
 27a:	0000                	unimp
 27c:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
 280:	2820                	fld	fs0,80(s0)
 282:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
 286:	3720                	fld	fs0,104(a4)
 288:	302e                	fld	ft0,232(sp)
 28a:	312e                	fld	ft2,232(sp)
 28c:	3220                	fld	fs0,96(a2)
 28e:	3130                	fld	fa2,96(a0)
 290:	30323037          	lui	zero,0x30323
 294:	2038                	fld	fa4,64(s0)
 296:	6528                	flw	fa0,72(a0)
 298:	7078                	flw	fa4,100(s0)
 29a:	7265                	lui	tp,0xffff9
 29c:	6d69                	lui	s10,0x1a
 29e:	6e65                	lui	t3,0x19
 2a0:	6174                	flw	fa3,68(a0)
 2a2:	296c                	fld	fa1,208(a0)
 2a4:	0000                	unimp
	...

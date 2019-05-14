
firmware.elf:     file format elf32-littleriscv


Disassembly of section .memory:

00000000 <putc-0x12>:
   0:	0000                	unimp
   2:	0000                	unimp
   4:	00001137          	lui	sp,0x1
   8:	80010113          	addi	sp,sp,-2048 # 800 <end+0x3ec>
   c:	312000ef          	jal	31e <main>
  10:	9002                	ebreak

00000012 <putc>:
  12:	1101                	addi	sp,sp,-32
  14:	ce22                	sw	s0,28(sp)
  16:	1000                	addi	s0,sp,32
  18:	87aa                	mv	a5,a0
  1a:	fef407a3          	sb	a5,-17(s0)
  1e:	100007b7          	lui	a5,0x10000
  22:	07c1                	addi	a5,a5,16
  24:	fef44703          	lbu	a4,-17(s0)
  28:	00e78023          	sb	a4,0(a5) # 10000000 <end+0xffffbec>
  2c:	0001                	nop
  2e:	100007b7          	lui	a5,0x10000
  32:	07f1                	addi	a5,a5,28
  34:	0007c783          	lbu	a5,0(a5) # 10000000 <end+0xffffbec>
  38:	0ff7f793          	andi	a5,a5,255
  3c:	8b85                	andi	a5,a5,1
  3e:	fbe5                	bnez	a5,2e <putc+0x1c>
  40:	0001                	nop
  42:	4472                	lw	s0,28(sp)
  44:	6105                	addi	sp,sp,32
  46:	8082                	ret

00000048 <getc>:
  48:	1141                	addi	sp,sp,-16
  4a:	c622                	sw	s0,12(sp)
  4c:	0800                	addi	s0,sp,16
  4e:	0001                	nop
  50:	100007b7          	lui	a5,0x10000
  54:	07f1                	addi	a5,a5,28
  56:	0007c783          	lbu	a5,0(a5) # 10000000 <end+0xffffbec>
  5a:	0ff7f793          	andi	a5,a5,255
  5e:	8b89                	andi	a5,a5,2
  60:	dbe5                	beqz	a5,50 <getc+0x8>
  62:	100007b7          	lui	a5,0x10000
  66:	07f1                	addi	a5,a5,28
  68:	00078023          	sb	zero,0(a5) # 10000000 <end+0xffffbec>
  6c:	100007b7          	lui	a5,0x10000
  70:	07d1                	addi	a5,a5,20
  72:	0007c783          	lbu	a5,0(a5) # 10000000 <end+0xffffbec>
  76:	0ff7f793          	andi	a5,a5,255
  7a:	853e                	mv	a0,a5
  7c:	4432                	lw	s0,12(sp)
  7e:	0141                	addi	sp,sp,16
  80:	8082                	ret

00000082 <puts>:
  82:	7179                	addi	sp,sp,-48
  84:	d606                	sw	ra,44(sp)
  86:	d422                	sw	s0,40(sp)
  88:	1800                	addi	s0,sp,48
  8a:	fca42e23          	sw	a0,-36(s0)
  8e:	a819                	j	a4 <puts+0x22>
  90:	fdc42783          	lw	a5,-36(s0)
  94:	00178713          	addi	a4,a5,1
  98:	fce42e23          	sw	a4,-36(s0)
  9c:	0007c783          	lbu	a5,0(a5)
  a0:	853e                	mv	a0,a5
  a2:	3f85                	jal	12 <putc>
  a4:	fdc42783          	lw	a5,-36(s0)
  a8:	0007c783          	lbu	a5,0(a5)
  ac:	f3f5                	bnez	a5,90 <puts+0xe>
  ae:	0001                	nop
  b0:	50b2                	lw	ra,44(sp)
  b2:	5422                	lw	s0,40(sp)
  b4:	6145                	addi	sp,sp,48
  b6:	8082                	ret

000000b8 <memcpy>:
  b8:	1101                	addi	sp,sp,-32
  ba:	ce22                	sw	s0,28(sp)
  bc:	1000                	addi	s0,sp,32
  be:	fea42623          	sw	a0,-20(s0)
  c2:	feb42423          	sw	a1,-24(s0)
  c6:	fec42223          	sw	a2,-28(s0)
  ca:	a025                	j	f2 <memcpy+0x3a>
  cc:	fe442783          	lw	a5,-28(s0)
  d0:	17fd                	addi	a5,a5,-1
  d2:	fef42223          	sw	a5,-28(s0)
  d6:	fe442783          	lw	a5,-28(s0)
  da:	fec42703          	lw	a4,-20(s0)
  de:	97ba                	add	a5,a5,a4
  e0:	fe442703          	lw	a4,-28(s0)
  e4:	fe842683          	lw	a3,-24(s0)
  e8:	9736                	add	a4,a4,a3
  ea:	00074703          	lbu	a4,0(a4)
  ee:	00e78023          	sb	a4,0(a5)
  f2:	fe442783          	lw	a5,-28(s0)
  f6:	fbf9                	bnez	a5,cc <memcpy+0x14>
  f8:	fec42783          	lw	a5,-20(s0)
  fc:	853e                	mv	a0,a5
  fe:	4472                	lw	s0,28(sp)
 100:	6105                	addi	sp,sp,32
 102:	8082                	ret

00000104 <memcmp>:
 104:	7179                	addi	sp,sp,-48
 106:	d622                	sw	s0,44(sp)
 108:	1800                	addi	s0,sp,48
 10a:	fca42e23          	sw	a0,-36(s0)
 10e:	fcb42c23          	sw	a1,-40(s0)
 112:	fcc42a23          	sw	a2,-44(s0)
 116:	fe042623          	sw	zero,-20(s0)
 11a:	a805                	j	14a <memcmp+0x46>
 11c:	fec42783          	lw	a5,-20(s0)
 120:	fdc42703          	lw	a4,-36(s0)
 124:	97ba                	add	a5,a5,a4
 126:	0007c703          	lbu	a4,0(a5)
 12a:	fec42783          	lw	a5,-20(s0)
 12e:	fd842683          	lw	a3,-40(s0)
 132:	97b6                	add	a5,a5,a3
 134:	0007c783          	lbu	a5,0(a5)
 138:	00f70463          	beq	a4,a5,140 <memcmp+0x3c>
 13c:	4781                	li	a5,0
 13e:	a829                	j	158 <memcmp+0x54>
 140:	fec42783          	lw	a5,-20(s0)
 144:	0785                	addi	a5,a5,1
 146:	fef42623          	sw	a5,-20(s0)
 14a:	fec42703          	lw	a4,-20(s0)
 14e:	fd442783          	lw	a5,-44(s0)
 152:	fcf745e3          	blt	a4,a5,11c <memcmp+0x18>
 156:	4785                	li	a5,1
 158:	853e                	mv	a0,a5
 15a:	5432                	lw	s0,44(sp)
 15c:	6145                	addi	sp,sp,48
 15e:	8082                	ret

00000160 <print_version>:
 160:	1141                	addi	sp,sp,-16
 162:	c606                	sw	ra,12(sp)
 164:	c422                	sw	s0,8(sp)
 166:	0800                	addi	s0,sp,16
 168:	37800513          	li	a0,888
 16c:	3f19                	jal	82 <puts>
 16e:	3b400513          	li	a0,948
 172:	3f01                	jal	82 <puts>
 174:	3cc00513          	li	a0,972
 178:	3729                	jal	82 <puts>
 17a:	0001                	nop
 17c:	40b2                	lw	ra,12(sp)
 17e:	4422                	lw	s0,8(sp)
 180:	0141                	addi	sp,sp,16
 182:	8082                	ret

00000184 <printhex>:
 184:	7139                	addi	sp,sp,-64
 186:	de06                	sw	ra,60(sp)
 188:	dc22                	sw	s0,56(sp)
 18a:	0080                	addi	s0,sp,64
 18c:	87aa                	mv	a5,a0
 18e:	fcf407a3          	sb	a5,-49(s0)
 192:	333237b7          	lui	a5,0x33323
 196:	13078793          	addi	a5,a5,304 # 33323130 <end+0x33322d1c>
 19a:	fcf42e23          	sw	a5,-36(s0)
 19e:	373637b7          	lui	a5,0x37363
 1a2:	53478793          	addi	a5,a5,1332 # 37363534 <end+0x37363120>
 1a6:	fef42023          	sw	a5,-32(s0)
 1aa:	424147b7          	lui	a5,0x42414
 1ae:	93878793          	addi	a5,a5,-1736 # 42413938 <end+0x42413524>
 1b2:	fef42223          	sw	a5,-28(s0)
 1b6:	464547b7          	lui	a5,0x46454
 1ba:	44378793          	addi	a5,a5,1091 # 46454443 <end+0x4645402f>
 1be:	fef42423          	sw	a5,-24(s0)
 1c2:	fe040623          	sb	zero,-20(s0)
 1c6:	fcf44783          	lbu	a5,-49(s0)
 1ca:	8391                	srli	a5,a5,0x4
 1cc:	0ff7f793          	andi	a5,a5,255
 1d0:	ff040713          	addi	a4,s0,-16
 1d4:	97ba                	add	a5,a5,a4
 1d6:	fec7c783          	lbu	a5,-20(a5)
 1da:	853e                	mv	a0,a5
 1dc:	3d1d                	jal	12 <putc>
 1de:	fcf44783          	lbu	a5,-49(s0)
 1e2:	8bbd                	andi	a5,a5,15
 1e4:	ff040713          	addi	a4,s0,-16
 1e8:	97ba                	add	a5,a5,a4
 1ea:	fec7c783          	lbu	a5,-20(a5)
 1ee:	853e                	mv	a0,a5
 1f0:	350d                	jal	12 <putc>
 1f2:	0001                	nop
 1f4:	50f2                	lw	ra,60(sp)
 1f6:	5462                	lw	s0,56(sp)
 1f8:	6121                	addi	sp,sp,64
 1fa:	8082                	ret

000001fc <printcrlf>:
 1fc:	1141                	addi	sp,sp,-16
 1fe:	c606                	sw	ra,12(sp)
 200:	c422                	sw	s0,8(sp)
 202:	0800                	addi	s0,sp,16
 204:	4535                	li	a0,13
 206:	3531                	jal	12 <putc>
 208:	4529                	li	a0,10
 20a:	3521                	jal	12 <putc>
 20c:	0001                	nop
 20e:	40b2                	lw	ra,12(sp)
 210:	4422                	lw	s0,8(sp)
 212:	0141                	addi	sp,sp,16
 214:	8082                	ret

00000216 <dump_memory>:
 216:	7179                	addi	sp,sp,-48
 218:	d606                	sw	ra,44(sp)
 21a:	d422                	sw	s0,40(sp)
 21c:	1800                	addi	s0,sp,48
 21e:	fca42e23          	sw	a0,-36(s0)
 222:	fcb42c23          	sw	a1,-40(s0)
 226:	fdc42783          	lw	a5,-36(s0)
 22a:	fef42423          	sw	a5,-24(s0)
 22e:	3e400513          	li	a0,996
 232:	3d81                	jal	82 <puts>
 234:	fe442783          	lw	a5,-28(s0)
 238:	87e1                	srai	a5,a5,0x18
 23a:	0ff7f793          	andi	a5,a5,255
 23e:	853e                	mv	a0,a5
 240:	3791                	jal	184 <printhex>
 242:	fe442783          	lw	a5,-28(s0)
 246:	87c1                	srai	a5,a5,0x10
 248:	0ff7f793          	andi	a5,a5,255
 24c:	853e                	mv	a0,a5
 24e:	3f1d                	jal	184 <printhex>
 250:	fe442783          	lw	a5,-28(s0)
 254:	87a1                	srai	a5,a5,0x8
 256:	0ff7f793          	andi	a5,a5,255
 25a:	853e                	mv	a0,a5
 25c:	3725                	jal	184 <printhex>
 25e:	fe442783          	lw	a5,-28(s0)
 262:	0ff7f793          	andi	a5,a5,255
 266:	853e                	mv	a0,a5
 268:	3f31                	jal	184 <printhex>
 26a:	3f800513          	li	a0,1016
 26e:	3d11                	jal	82 <puts>
 270:	fd842783          	lw	a5,-40(s0)
 274:	87a1                	srai	a5,a5,0x8
 276:	0ff7f793          	andi	a5,a5,255
 27a:	853e                	mv	a0,a5
 27c:	3721                	jal	184 <printhex>
 27e:	fd842783          	lw	a5,-40(s0)
 282:	0ff7f793          	andi	a5,a5,255
 286:	853e                	mv	a0,a5
 288:	3df5                	jal	184 <printhex>
 28a:	3f8d                	jal	1fc <printcrlf>
 28c:	fe042623          	sw	zero,-20(s0)
 290:	a8a5                	j	308 <dump_memory+0xf2>
 292:	fec42783          	lw	a5,-20(s0)
 296:	8bbd                	andi	a5,a5,15
 298:	e7b9                	bnez	a5,2e6 <dump_memory+0xd0>
 29a:	fdc42703          	lw	a4,-36(s0)
 29e:	fec42783          	lw	a5,-20(s0)
 2a2:	97ba                	add	a5,a5,a4
 2a4:	fef42223          	sw	a5,-28(s0)
 2a8:	3f91                	jal	1fc <printcrlf>
 2aa:	fe442783          	lw	a5,-28(s0)
 2ae:	87e1                	srai	a5,a5,0x18
 2b0:	0ff7f793          	andi	a5,a5,255
 2b4:	853e                	mv	a0,a5
 2b6:	35f9                	jal	184 <printhex>
 2b8:	fe442783          	lw	a5,-28(s0)
 2bc:	87c1                	srai	a5,a5,0x10
 2be:	0ff7f793          	andi	a5,a5,255
 2c2:	853e                	mv	a0,a5
 2c4:	35c1                	jal	184 <printhex>
 2c6:	fe442783          	lw	a5,-28(s0)
 2ca:	87a1                	srai	a5,a5,0x8
 2cc:	0ff7f793          	andi	a5,a5,255
 2d0:	853e                	mv	a0,a5
 2d2:	3d4d                	jal	184 <printhex>
 2d4:	fe442783          	lw	a5,-28(s0)
 2d8:	0ff7f793          	andi	a5,a5,255
 2dc:	853e                	mv	a0,a5
 2de:	355d                	jal	184 <printhex>
 2e0:	02000513          	li	a0,32
 2e4:	333d                	jal	12 <putc>
 2e6:	fec42783          	lw	a5,-20(s0)
 2ea:	fe842703          	lw	a4,-24(s0)
 2ee:	97ba                	add	a5,a5,a4
 2f0:	0007c783          	lbu	a5,0(a5)
 2f4:	853e                	mv	a0,a5
 2f6:	3579                	jal	184 <printhex>
 2f8:	02000513          	li	a0,32
 2fc:	3b19                	jal	12 <putc>
 2fe:	fec42783          	lw	a5,-20(s0)
 302:	0785                	addi	a5,a5,1
 304:	fef42623          	sw	a5,-20(s0)
 308:	fec42703          	lw	a4,-20(s0)
 30c:	fd842783          	lw	a5,-40(s0)
 310:	f8f741e3          	blt	a4,a5,292 <dump_memory+0x7c>
 314:	0001                	nop
 316:	50b2                	lw	ra,44(sp)
 318:	5422                	lw	s0,40(sp)
 31a:	6145                	addi	sp,sp,48
 31c:	8082                	ret

0000031e <main>:
 31e:	7139                	addi	sp,sp,-64
 320:	de06                	sw	ra,60(sp)
 322:	dc22                	sw	s0,56(sp)
 324:	0080                	addi	s0,sp,64
 326:	fc042423          	sw	zero,-56(s0)
 32a:	fe0407a3          	sb	zero,-17(s0)
 32e:	100007b7          	lui	a5,0x10000
 332:	07e1                	addi	a5,a5,24
 334:	04500713          	li	a4,69
 338:	c398                	sw	a4,0(a5)
 33a:	fc040623          	sb	zero,-52(s0)
 33e:	350d                	jal	160 <print_version>
 340:	100007b7          	lui	a5,0x10000
 344:	fef44703          	lbu	a4,-17(s0)
 348:	00e78023          	sb	a4,0(a5) # 10000000 <end+0xffffbec>
 34c:	fef44783          	lbu	a5,-17(s0)
 350:	0785                	addi	a5,a5,1
 352:	fef407a3          	sb	a5,-17(s0)
 356:	fc042423          	sw	zero,-56(s0)
 35a:	a031                	j	366 <main+0x48>
 35c:	fc842783          	lw	a5,-56(s0)
 360:	0785                	addi	a5,a5,1
 362:	fcf42423          	sw	a5,-56(s0)
 366:	fc842703          	lw	a4,-56(s0)
 36a:	67e1                	lui	a5,0x18
 36c:	69f78793          	addi	a5,a5,1695 # 1869f <end+0x1828b>
 370:	fee7d6e3          	ble	a4,a5,35c <main+0x3e>
 374:	b7f1                	j	340 <main+0x22>
 376:	0000                	unimp
 378:	0a0d                	addi	s4,s4,3
 37a:	6950                	flw	fa2,20(a0)
 37c:	56526f63          	bltu	tp,t0,8fa <end+0x4e6>
 380:	28203233          	0x28203233
 384:	5652                	lw	a2,52(sp)
 386:	4d493233          	0x4d493233
 38a:	53492043          	fmadd.d	ft0,fs2,fs4,fa0,rdn
 38e:	2941                	jal	81e <end+0x40a>
 390:	7220                	flw	fs0,96(a2)
 392:	6e75                	lui	t3,0x1d
 394:	696e                	flw	fs2,216(sp)
 396:	676e                	flw	fa4,216(sp)
 398:	6f20                	flw	fs0,88(a4)
 39a:	206e                	fld	ft0,216(sp)
 39c:	72617053          	0x72617053
 3a0:	616f526b          	0x616f526b
 3a4:	2864                	fld	fs1,208(s0)
 3a6:	4745                	li	a4,17
 3a8:	5334                	lw	a3,96(a4)
 3aa:	3032                	fld	ft0,296(sp)
 3ac:	474e                	lw	a4,208(sp)
 3ae:	3838                	fld	fa4,112(s0)
 3b0:	0d29                	addi	s10,s10,10
 3b2:	000a                	0xa
 3b4:	7041                	0x7041
 3b6:	2e72                	fld	ft8,280(sp)
 3b8:	3032                	fld	ft0,296(sp)
 3ba:	3931                	jal	ffffffd6 <end+0xfffffbc2>
 3bc:	5320                	lw	s0,96(a4)
 3be:	7265                	lui	tp,0xffff9
 3c0:	6169                	addi	sp,sp,208
 3c2:	206c                	fld	fa1,192(s0)
 3c4:	6f70                	flw	fa2,92(a4)
 3c6:	7472                	flw	fs0,60(sp)
 3c8:	0a0d                	addi	s4,s4,3
 3ca:	0000                	unimp
 3cc:	2e777777          	0x2e777777
 3d0:	63636f73          	csrrs	t5,0x636,6
 3d4:	6968                	flw	fa0,84(a0)
 3d6:	616e                	flw	ft2,216(sp)
 3d8:	6e2e                	flw	ft8,200(sp)
 3da:	7465                	lui	s0,0xffff9
 3dc:	0a0d                	addi	s4,s4,3
 3de:	0a0d                	addi	s4,s4,3
 3e0:	0000                	unimp
 3e2:	0000                	unimp
 3e4:	7544                	flw	fs1,44(a0)
 3e6:	706d                	0x706d
 3e8:	6d20                	flw	fs0,88(a0)
 3ea:	6d65                	lui	s10,0x19
 3ec:	2079726f          	jal	tp,97df2 <end+0x979de>
 3f0:	7266                	flw	ft4,120(sp)
 3f2:	30206d6f          	jal	s10,66f4 <end+0x62e0>
 3f6:	0078                	addi	a4,sp,12
 3f8:	7320                	flw	fs0,96(a4)
 3fa:	7a69                	lui	s4,0xffffa
 3fc:	3a65                	jal	fffffdb4 <end+0xfffff9a0>
 3fe:	3020                	fld	fs0,96(s0)
 400:	0078                	addi	a4,sp,12
 402:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
 406:	2820                	fld	fs0,80(s0)
 408:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
 40c:	3620                	fld	fs0,104(a2)
 40e:	312e                	fld	ft2,232(sp)
 410:	302e                	fld	ft0,232(sp)
	...


firmware.elf:     file format elf32-littleriscv


Disassembly of section .memory:

00000000 <putc-0x14>:
   0:	0000                	unimp
   2:	0000                	unimp
   4:	00001137          	lui	sp,0x1
   8:	80010113          	addi	sp,sp,-2048 # 800 <end+0x274>
   c:	454000ef          	jal	ra,460 <main>
  10:	00100073          	ebreak

00000014 <putc>:
  14:	fe010113          	addi	sp,sp,-32
  18:	00812e23          	sw	s0,28(sp)
  1c:	02010413          	addi	s0,sp,32
  20:	00050793          	mv	a5,a0
  24:	fef407a3          	sb	a5,-17(s0)
  28:	100007b7          	lui	a5,0x10000
  2c:	01078793          	addi	a5,a5,16 # 10000010 <end+0xffffa84>
  30:	fef44703          	lbu	a4,-17(s0)
  34:	00e78023          	sb	a4,0(a5)
  38:	00000013          	nop
  3c:	100007b7          	lui	a5,0x10000
  40:	01c78793          	addi	a5,a5,28 # 1000001c <end+0xffffa90>
  44:	0007c783          	lbu	a5,0(a5)
  48:	0ff7f793          	andi	a5,a5,255
  4c:	0017f793          	andi	a5,a5,1
  50:	fe0796e3          	bnez	a5,3c <putc+0x28>
  54:	00000013          	nop
  58:	01c12403          	lw	s0,28(sp)
  5c:	02010113          	addi	sp,sp,32
  60:	00008067          	ret

00000064 <getc>:
  64:	ff010113          	addi	sp,sp,-16
  68:	00812623          	sw	s0,12(sp)
  6c:	01010413          	addi	s0,sp,16
  70:	00000013          	nop
  74:	100007b7          	lui	a5,0x10000
  78:	01c78793          	addi	a5,a5,28 # 1000001c <end+0xffffa90>
  7c:	0007c783          	lbu	a5,0(a5)
  80:	0ff7f793          	andi	a5,a5,255
  84:	0027f793          	andi	a5,a5,2
  88:	fe0786e3          	beqz	a5,74 <getc+0x10>
  8c:	100007b7          	lui	a5,0x10000
  90:	01c78793          	addi	a5,a5,28 # 1000001c <end+0xffffa90>
  94:	00078023          	sb	zero,0(a5)
  98:	100007b7          	lui	a5,0x10000
  9c:	01478793          	addi	a5,a5,20 # 10000014 <end+0xffffa88>
  a0:	0007c783          	lbu	a5,0(a5)
  a4:	0ff7f793          	andi	a5,a5,255
  a8:	00078513          	mv	a0,a5
  ac:	00c12403          	lw	s0,12(sp)
  b0:	01010113          	addi	sp,sp,16
  b4:	00008067          	ret

000000b8 <puts>:
  b8:	fd010113          	addi	sp,sp,-48
  bc:	02112623          	sw	ra,44(sp)
  c0:	02812423          	sw	s0,40(sp)
  c4:	03010413          	addi	s0,sp,48
  c8:	fca42e23          	sw	a0,-36(s0)
  cc:	01c0006f          	j	e8 <puts+0x30>
  d0:	fdc42783          	lw	a5,-36(s0)
  d4:	00178713          	addi	a4,a5,1
  d8:	fce42e23          	sw	a4,-36(s0)
  dc:	0007c783          	lbu	a5,0(a5)
  e0:	00078513          	mv	a0,a5
  e4:	f31ff0ef          	jal	ra,14 <putc>
  e8:	fdc42783          	lw	a5,-36(s0)
  ec:	0007c783          	lbu	a5,0(a5)
  f0:	fe0790e3          	bnez	a5,d0 <puts+0x18>
  f4:	00000013          	nop
  f8:	02c12083          	lw	ra,44(sp)
  fc:	02812403          	lw	s0,40(sp)
 100:	03010113          	addi	sp,sp,48
 104:	00008067          	ret

00000108 <memcpy>:
 108:	fe010113          	addi	sp,sp,-32
 10c:	00812e23          	sw	s0,28(sp)
 110:	02010413          	addi	s0,sp,32
 114:	fea42623          	sw	a0,-20(s0)
 118:	feb42423          	sw	a1,-24(s0)
 11c:	fec42223          	sw	a2,-28(s0)
 120:	0300006f          	j	150 <memcpy+0x48>
 124:	fe442783          	lw	a5,-28(s0)
 128:	fff78793          	addi	a5,a5,-1
 12c:	fef42223          	sw	a5,-28(s0)
 130:	fe442783          	lw	a5,-28(s0)
 134:	fe842703          	lw	a4,-24(s0)
 138:	00f70733          	add	a4,a4,a5
 13c:	fe442783          	lw	a5,-28(s0)
 140:	fec42683          	lw	a3,-20(s0)
 144:	00f687b3          	add	a5,a3,a5
 148:	00074703          	lbu	a4,0(a4)
 14c:	00e78023          	sb	a4,0(a5)
 150:	fe442783          	lw	a5,-28(s0)
 154:	fc0798e3          	bnez	a5,124 <memcpy+0x1c>
 158:	fec42783          	lw	a5,-20(s0)
 15c:	00078513          	mv	a0,a5
 160:	01c12403          	lw	s0,28(sp)
 164:	02010113          	addi	sp,sp,32
 168:	00008067          	ret

0000016c <memcmp>:
 16c:	fd010113          	addi	sp,sp,-48
 170:	02812623          	sw	s0,44(sp)
 174:	03010413          	addi	s0,sp,48
 178:	fca42e23          	sw	a0,-36(s0)
 17c:	fcb42c23          	sw	a1,-40(s0)
 180:	fcc42a23          	sw	a2,-44(s0)
 184:	fe042623          	sw	zero,-20(s0)
 188:	03c0006f          	j	1c4 <memcmp+0x58>
 18c:	fec42783          	lw	a5,-20(s0)
 190:	fdc42703          	lw	a4,-36(s0)
 194:	00f707b3          	add	a5,a4,a5
 198:	0007c703          	lbu	a4,0(a5)
 19c:	fec42783          	lw	a5,-20(s0)
 1a0:	fd842683          	lw	a3,-40(s0)
 1a4:	00f687b3          	add	a5,a3,a5
 1a8:	0007c783          	lbu	a5,0(a5)
 1ac:	00f70663          	beq	a4,a5,1b8 <memcmp+0x4c>
 1b0:	00000793          	li	a5,0
 1b4:	0200006f          	j	1d4 <memcmp+0x68>
 1b8:	fec42783          	lw	a5,-20(s0)
 1bc:	00178793          	addi	a5,a5,1
 1c0:	fef42623          	sw	a5,-20(s0)
 1c4:	fec42703          	lw	a4,-20(s0)
 1c8:	fd442783          	lw	a5,-44(s0)
 1cc:	fcf740e3          	blt	a4,a5,18c <memcmp+0x20>
 1d0:	00100793          	li	a5,1
 1d4:	00078513          	mv	a0,a5
 1d8:	02c12403          	lw	s0,44(sp)
 1dc:	03010113          	addi	sp,sp,48
 1e0:	00008067          	ret

000001e4 <print_version>:
 1e4:	ff010113          	addi	sp,sp,-16
 1e8:	00112623          	sw	ra,12(sp)
 1ec:	00812423          	sw	s0,8(sp)
 1f0:	01010413          	addi	s0,sp,16
 1f4:	4d000513          	li	a0,1232
 1f8:	ec1ff0ef          	jal	ra,b8 <puts>
 1fc:	4fc00513          	li	a0,1276
 200:	eb9ff0ef          	jal	ra,b8 <puts>
 204:	52000513          	li	a0,1312
 208:	eb1ff0ef          	jal	ra,b8 <puts>
 20c:	00000013          	nop
 210:	00c12083          	lw	ra,12(sp)
 214:	00812403          	lw	s0,8(sp)
 218:	01010113          	addi	sp,sp,16
 21c:	00008067          	ret

00000220 <printhex>:
 220:	fc010113          	addi	sp,sp,-64
 224:	02112e23          	sw	ra,60(sp)
 228:	02812c23          	sw	s0,56(sp)
 22c:	04010413          	addi	s0,sp,64
 230:	00050793          	mv	a5,a0
 234:	fcf407a3          	sb	a5,-49(s0)
 238:	54802583          	lw	a1,1352(zero) # 548 <main+0xe8>
 23c:	54800713          	li	a4,1352
 240:	00472603          	lw	a2,4(a4)
 244:	54800713          	li	a4,1352
 248:	00872683          	lw	a3,8(a4)
 24c:	54800713          	li	a4,1352
 250:	00c72703          	lw	a4,12(a4)
 254:	fcb42e23          	sw	a1,-36(s0)
 258:	fec42023          	sw	a2,-32(s0)
 25c:	fed42223          	sw	a3,-28(s0)
 260:	fee42423          	sw	a4,-24(s0)
 264:	54800793          	li	a5,1352
 268:	0107c783          	lbu	a5,16(a5)
 26c:	fef40623          	sb	a5,-20(s0)
 270:	fcf44783          	lbu	a5,-49(s0)
 274:	0047d793          	srli	a5,a5,0x4
 278:	0ff7f793          	andi	a5,a5,255
 27c:	ff040713          	addi	a4,s0,-16
 280:	00f707b3          	add	a5,a4,a5
 284:	fec7c783          	lbu	a5,-20(a5)
 288:	00078513          	mv	a0,a5
 28c:	d89ff0ef          	jal	ra,14 <putc>
 290:	fcf44783          	lbu	a5,-49(s0)
 294:	00f7f793          	andi	a5,a5,15
 298:	ff040713          	addi	a4,s0,-16
 29c:	00f707b3          	add	a5,a4,a5
 2a0:	fec7c783          	lbu	a5,-20(a5)
 2a4:	00078513          	mv	a0,a5
 2a8:	d6dff0ef          	jal	ra,14 <putc>
 2ac:	00000013          	nop
 2b0:	03c12083          	lw	ra,60(sp)
 2b4:	03812403          	lw	s0,56(sp)
 2b8:	04010113          	addi	sp,sp,64
 2bc:	00008067          	ret

000002c0 <printcrlf>:
 2c0:	ff010113          	addi	sp,sp,-16
 2c4:	00112623          	sw	ra,12(sp)
 2c8:	00812423          	sw	s0,8(sp)
 2cc:	01010413          	addi	s0,sp,16
 2d0:	00d00513          	li	a0,13
 2d4:	d41ff0ef          	jal	ra,14 <putc>
 2d8:	00a00513          	li	a0,10
 2dc:	d39ff0ef          	jal	ra,14 <putc>
 2e0:	00000013          	nop
 2e4:	00c12083          	lw	ra,12(sp)
 2e8:	00812403          	lw	s0,8(sp)
 2ec:	01010113          	addi	sp,sp,16
 2f0:	00008067          	ret

000002f4 <dump_memory>:
 2f4:	fd010113          	addi	sp,sp,-48
 2f8:	02112623          	sw	ra,44(sp)
 2fc:	02812423          	sw	s0,40(sp)
 300:	03010413          	addi	s0,sp,48
 304:	fca42e23          	sw	a0,-36(s0)
 308:	fcb42c23          	sw	a1,-40(s0)
 30c:	fdc42783          	lw	a5,-36(s0)
 310:	fef42423          	sw	a5,-24(s0)
 314:	55c00513          	li	a0,1372
 318:	da1ff0ef          	jal	ra,b8 <puts>
 31c:	fe442783          	lw	a5,-28(s0)
 320:	4187d793          	srai	a5,a5,0x18
 324:	0ff7f793          	andi	a5,a5,255
 328:	00078513          	mv	a0,a5
 32c:	ef5ff0ef          	jal	ra,220 <printhex>
 330:	fe442783          	lw	a5,-28(s0)
 334:	4107d793          	srai	a5,a5,0x10
 338:	0ff7f793          	andi	a5,a5,255
 33c:	00078513          	mv	a0,a5
 340:	ee1ff0ef          	jal	ra,220 <printhex>
 344:	fe442783          	lw	a5,-28(s0)
 348:	4087d793          	srai	a5,a5,0x8
 34c:	0ff7f793          	andi	a5,a5,255
 350:	00078513          	mv	a0,a5
 354:	ecdff0ef          	jal	ra,220 <printhex>
 358:	fe442783          	lw	a5,-28(s0)
 35c:	0ff7f793          	andi	a5,a5,255
 360:	00078513          	mv	a0,a5
 364:	ebdff0ef          	jal	ra,220 <printhex>
 368:	57000513          	li	a0,1392
 36c:	d4dff0ef          	jal	ra,b8 <puts>
 370:	fd842783          	lw	a5,-40(s0)
 374:	4087d793          	srai	a5,a5,0x8
 378:	0ff7f793          	andi	a5,a5,255
 37c:	00078513          	mv	a0,a5
 380:	ea1ff0ef          	jal	ra,220 <printhex>
 384:	fd842783          	lw	a5,-40(s0)
 388:	0ff7f793          	andi	a5,a5,255
 38c:	00078513          	mv	a0,a5
 390:	e91ff0ef          	jal	ra,220 <printhex>
 394:	f2dff0ef          	jal	ra,2c0 <printcrlf>
 398:	fe042623          	sw	zero,-20(s0)
 39c:	0a40006f          	j	440 <dump_memory+0x14c>
 3a0:	fec42783          	lw	a5,-20(s0)
 3a4:	00f7f793          	andi	a5,a5,15
 3a8:	06079663          	bnez	a5,414 <dump_memory+0x120>
 3ac:	fdc42703          	lw	a4,-36(s0)
 3b0:	fec42783          	lw	a5,-20(s0)
 3b4:	00f707b3          	add	a5,a4,a5
 3b8:	fef42223          	sw	a5,-28(s0)
 3bc:	f05ff0ef          	jal	ra,2c0 <printcrlf>
 3c0:	fe442783          	lw	a5,-28(s0)
 3c4:	4187d793          	srai	a5,a5,0x18
 3c8:	0ff7f793          	andi	a5,a5,255
 3cc:	00078513          	mv	a0,a5
 3d0:	e51ff0ef          	jal	ra,220 <printhex>
 3d4:	fe442783          	lw	a5,-28(s0)
 3d8:	4107d793          	srai	a5,a5,0x10
 3dc:	0ff7f793          	andi	a5,a5,255
 3e0:	00078513          	mv	a0,a5
 3e4:	e3dff0ef          	jal	ra,220 <printhex>
 3e8:	fe442783          	lw	a5,-28(s0)
 3ec:	4087d793          	srai	a5,a5,0x8
 3f0:	0ff7f793          	andi	a5,a5,255
 3f4:	00078513          	mv	a0,a5
 3f8:	e29ff0ef          	jal	ra,220 <printhex>
 3fc:	fe442783          	lw	a5,-28(s0)
 400:	0ff7f793          	andi	a5,a5,255
 404:	00078513          	mv	a0,a5
 408:	e19ff0ef          	jal	ra,220 <printhex>
 40c:	02000513          	li	a0,32
 410:	c05ff0ef          	jal	ra,14 <putc>
 414:	fec42783          	lw	a5,-20(s0)
 418:	fe842703          	lw	a4,-24(s0)
 41c:	00f707b3          	add	a5,a4,a5
 420:	0007c783          	lbu	a5,0(a5)
 424:	00078513          	mv	a0,a5
 428:	df9ff0ef          	jal	ra,220 <printhex>
 42c:	02000513          	li	a0,32
 430:	be5ff0ef          	jal	ra,14 <putc>
 434:	fec42783          	lw	a5,-20(s0)
 438:	00178793          	addi	a5,a5,1
 43c:	fef42623          	sw	a5,-20(s0)
 440:	fec42703          	lw	a4,-20(s0)
 444:	fd842783          	lw	a5,-40(s0)
 448:	f4f74ce3          	blt	a4,a5,3a0 <dump_memory+0xac>
 44c:	00000013          	nop
 450:	02c12083          	lw	ra,44(sp)
 454:	02812403          	lw	s0,40(sp)
 458:	03010113          	addi	sp,sp,48
 45c:	00008067          	ret

00000460 <main>:
 460:	fc010113          	addi	sp,sp,-64
 464:	02112e23          	sw	ra,60(sp)
 468:	02812c23          	sw	s0,56(sp)
 46c:	04010413          	addi	s0,sp,64
 470:	fc042423          	sw	zero,-56(s0)
 474:	fe0407a3          	sb	zero,-17(s0)
 478:	100007b7          	lui	a5,0x10000
 47c:	01878793          	addi	a5,a5,24 # 10000018 <end+0xffffa8c>
 480:	02e00713          	li	a4,46
 484:	00e7a023          	sw	a4,0(a5)
 488:	fc040623          	sb	zero,-52(s0)
 48c:	d59ff0ef          	jal	ra,1e4 <print_version>
 490:	100007b7          	lui	a5,0x10000
 494:	fef44703          	lbu	a4,-17(s0)
 498:	00e78023          	sb	a4,0(a5) # 10000000 <end+0xffffa74>
 49c:	fef44783          	lbu	a5,-17(s0)
 4a0:	00178793          	addi	a5,a5,1
 4a4:	fef407a3          	sb	a5,-17(s0)
 4a8:	fc042423          	sw	zero,-56(s0)
 4ac:	0100006f          	j	4bc <main+0x5c>
 4b0:	fc842783          	lw	a5,-56(s0)
 4b4:	00178793          	addi	a5,a5,1
 4b8:	fcf42423          	sw	a5,-56(s0)
 4bc:	fc842703          	lw	a4,-56(s0)
 4c0:	000187b7          	lui	a5,0x18
 4c4:	69f78793          	addi	a5,a5,1695 # 1869f <end+0x18113>
 4c8:	fee7d4e3          	bge	a5,a4,4b0 <main+0x50>
 4cc:	fc5ff06f          	j	490 <main+0x30>
 4d0:	0a0d                	addi	s4,s4,3
 4d2:	6950                	flw	fa2,20(a0)
 4d4:	56526f63          	bltu	tp,t0,a52 <end+0x4c6>
 4d8:	28203233          	0x28203233
 4dc:	5652                	lw	a2,52(sp)
 4de:	4d493233          	0x4d493233
 4e2:	53492043          	fmadd.d	ft0,fs2,fs4,fa0,rdn
 4e6:	2941                	jal	976 <end+0x3ea>
 4e8:	7220                	flw	fs0,96(a2)
 4ea:	6e75                	lui	t3,0x1d
 4ec:	696e                	flw	fs2,216(sp)
 4ee:	676e                	flw	fa4,216(sp)
 4f0:	6f20                	flw	fs0,88(a4)
 4f2:	206e                	fld	ft0,216(sp)
 4f4:	4745                	li	a4,17
 4f6:	0d34                	addi	a3,sp,664
 4f8:	000a                	c.slli	zero,0x2
 4fa:	0000                	unimp
 4fc:	2d2d                	jal	b36 <end+0x5aa>
 4fe:	202d                	jal	528 <main+0xc8>
 500:	614a                	flw	ft2,144(sp)
 502:	2e6e                	fld	ft8,216(sp)
 504:	3032                	fld	ft0,296(sp)
 506:	3731                	jal	412 <dump_memory+0x11e>
 508:	5320                	lw	s0,96(a4)
 50a:	7265                	lui	tp,0xffff9
 50c:	6169                	addi	sp,sp,208
 50e:	206c                	fld	fa1,192(s0)
 510:	6f70                	flw	fa2,92(a4)
 512:	7472                	flw	fs0,60(sp)
 514:	6420                	flw	fs0,72(s0)
 516:	6d65                	lui	s10,0x19
 518:	3176206f          	j	6302e <end+0x62aa2>
 51c:	0a0d                	addi	s4,s4,3
 51e:	0000                	unimp
 520:	2d2d                	jal	b5a <end+0x5ce>
 522:	202d                	jal	54c <main+0xec>
 524:	6e41                	lui	t3,0x10
 526:	6f6c                	flw	fa1,92(a4)
 528:	20636967          	0x20636967
 52c:	6e49                	lui	t3,0x12
 52e:	6f66                	flw	ft10,88(sp)
 530:	5420                	lw	s0,104(s0)
 532:	6365                	lui	t1,0x19
 534:	2e68                	fld	fa0,216(a2)
 536:	3228                	fld	fa0,96(a2)
 538:	3130                	fld	fa2,96(a0)
 53a:	2d31                	jal	b56 <end+0x5ca>
 53c:	3032                	fld	ft0,296(sp)
 53e:	3731                	jal	44a <dump_memory+0x156>
 540:	0d29                	addi	s10,s10,10
 542:	0d0a                	slli	s10,s10,0x2
 544:	000a                	c.slli	zero,0x2
 546:	0000                	unimp
 548:	3130                	fld	fa2,96(a0)
 54a:	3332                	fld	ft6,296(sp)
 54c:	3534                	fld	fa3,104(a0)
 54e:	3736                	fld	fa4,360(sp)
 550:	3938                	fld	fa4,112(a0)
 552:	4241                	li	tp,16
 554:	46454443          	fmadd.q	fs0,fa0,ft4,fs0,rmm
 558:	0000                	unimp
 55a:	0000                	unimp
 55c:	7544                	flw	fs1,44(a0)
 55e:	706d                	c.lui	zero,0xffffb
 560:	6d20                	flw	fs0,88(a0)
 562:	6d65                	lui	s10,0x19
 564:	2079726f          	jal	tp,97f6a <end+0x979de>
 568:	7266                	flw	ft4,120(sp)
 56a:	30206d6f          	jal	s10,686c <end+0x62e0>
 56e:	0078                	addi	a4,sp,12
 570:	7320                	flw	fs0,96(a4)
 572:	7a69                	lui	s4,0xffffa
 574:	3a65                	jal	ffffff2c <end+0xfffff9a0>
 576:	3020                	fld	fs0,96(s0)
 578:	0078                	addi	a4,sp,12
 57a:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
 57e:	2820                	fld	fs0,80(s0)
 580:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
 584:	3820                	fld	fs0,112(s0)
 586:	322e                	fld	ft4,232(sp)
 588:	302e                	fld	ft0,232(sp)
	...

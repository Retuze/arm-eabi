
build_sf32lb52-nano_n16r16_hcpu\bootloader\bootloader.elf:     file format elf32-littlearm


Disassembly of section .text:

20020208 <deregister_tm_clones>:
20020208:	4803      	ldr	r0, [pc, #12]	@ (20020218 <deregister_tm_clones+0x10>)
2002020a:	4b04      	ldr	r3, [pc, #16]	@ (2002021c <deregister_tm_clones+0x14>)
2002020c:	4283      	cmp	r3, r0
2002020e:	d002      	beq.n	20020216 <deregister_tm_clones+0xe>
20020210:	4b03      	ldr	r3, [pc, #12]	@ (20020220 <deregister_tm_clones+0x18>)
20020212:	b103      	cbz	r3, 20020216 <deregister_tm_clones+0xe>
20020214:	4718      	bx	r3
20020216:	4770      	bx	lr
20020218:	200449b8 	.word	0x200449b8
2002021c:	200449b8 	.word	0x200449b8
20020220:	00000000 	.word	0x00000000

20020224 <register_tm_clones>:
20020224:	4b06      	ldr	r3, [pc, #24]	@ (20020240 <register_tm_clones+0x1c>)
20020226:	4907      	ldr	r1, [pc, #28]	@ (20020244 <register_tm_clones+0x20>)
20020228:	1ac9      	subs	r1, r1, r3
2002022a:	1089      	asrs	r1, r1, #2
2002022c:	bf48      	it	mi
2002022e:	3101      	addmi	r1, #1
20020230:	1049      	asrs	r1, r1, #1
20020232:	d003      	beq.n	2002023c <register_tm_clones+0x18>
20020234:	4b04      	ldr	r3, [pc, #16]	@ (20020248 <register_tm_clones+0x24>)
20020236:	b10b      	cbz	r3, 2002023c <register_tm_clones+0x18>
20020238:	4801      	ldr	r0, [pc, #4]	@ (20020240 <register_tm_clones+0x1c>)
2002023a:	4718      	bx	r3
2002023c:	4770      	bx	lr
2002023e:	bf00      	nop
20020240:	200449b8 	.word	0x200449b8
20020244:	200449b8 	.word	0x200449b8
20020248:	00000000 	.word	0x00000000

2002024c <__do_global_dtors_aux>:
2002024c:	b510      	push	{r4, lr}
2002024e:	4c06      	ldr	r4, [pc, #24]	@ (20020268 <__do_global_dtors_aux+0x1c>)
20020250:	7823      	ldrb	r3, [r4, #0]
20020252:	b943      	cbnz	r3, 20020266 <__do_global_dtors_aux+0x1a>
20020254:	f7ff ffd8 	bl	20020208 <deregister_tm_clones>
20020258:	4b04      	ldr	r3, [pc, #16]	@ (2002026c <__do_global_dtors_aux+0x20>)
2002025a:	b113      	cbz	r3, 20020262 <__do_global_dtors_aux+0x16>
2002025c:	4804      	ldr	r0, [pc, #16]	@ (20020270 <__do_global_dtors_aux+0x24>)
2002025e:	f3af 8000 	nop.w
20020262:	2301      	movs	r3, #1
20020264:	7023      	strb	r3, [r4, #0]
20020266:	bd10      	pop	{r4, pc}
20020268:	200449b8 	.word	0x200449b8
2002026c:	00000000 	.word	0x00000000
20020270:	2002c274 	.word	0x2002c274

20020274 <frame_dummy>:
20020274:	b508      	push	{r3, lr}
20020276:	4b05      	ldr	r3, [pc, #20]	@ (2002028c <frame_dummy+0x18>)
20020278:	b11b      	cbz	r3, 20020282 <frame_dummy+0xe>
2002027a:	4905      	ldr	r1, [pc, #20]	@ (20020290 <frame_dummy+0x1c>)
2002027c:	4805      	ldr	r0, [pc, #20]	@ (20020294 <frame_dummy+0x20>)
2002027e:	f3af 8000 	nop.w
20020282:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
20020286:	f7ff bfcd 	b.w	20020224 <register_tm_clones>
2002028a:	bf00      	nop
2002028c:	00000000 	.word	0x00000000
20020290:	200449bc 	.word	0x200449bc
20020294:	2002c274 	.word	0x2002c274

20020298 <boot_uart_tx>:
20020298:	2300      	movs	r3, #0
2002029a:	b510      	push	{r4, lr}
2002029c:	4293      	cmp	r3, r2
2002029e:	db00      	blt.n	200202a2 <boot_uart_tx+0xa>
200202a0:	bd10      	pop	{r4, pc}
200202a2:	69c4      	ldr	r4, [r0, #28]
200202a4:	0624      	lsls	r4, r4, #24
200202a6:	d5fc      	bpl.n	200202a2 <boot_uart_tx+0xa>
200202a8:	5ccc      	ldrb	r4, [r1, r3]
200202aa:	3301      	adds	r3, #1
200202ac:	6284      	str	r4, [r0, #40]	@ 0x28
200202ae:	e7f5      	b.n	2002029c <boot_uart_tx+0x4>

200202b0 <boot_error>:
200202b0:	b507      	push	{r0, r1, r2, lr}
200202b2:	2201      	movs	r2, #1
200202b4:	f88d 0007 	strb.w	r0, [sp, #7]
200202b8:	f10d 0107 	add.w	r1, sp, #7
200202bc:	480e      	ldr	r0, [pc, #56]	@ (200202f8 <boot_error+0x48>)
200202be:	f7ff ffeb 	bl	20020298 <boot_uart_tx>
200202c2:	4b0e      	ldr	r3, [pc, #56]	@ (200202fc <boot_error+0x4c>)
200202c4:	f8d3 2088 	ldr.w	r2, [r3, #136]	@ 0x88
200202c8:	f002 0203 	and.w	r2, r2, #3
200202cc:	2a03      	cmp	r2, #3
200202ce:	f102 0101 	add.w	r1, r2, #1
200202d2:	d00f      	beq.n	200202f4 <boot_error+0x44>
200202d4:	f8d3 2088 	ldr.w	r2, [r3, #136]	@ 0x88
200202d8:	f022 0203 	bic.w	r2, r2, #3
200202dc:	f8c3 2088 	str.w	r2, [r3, #136]	@ 0x88
200202e0:	f8d3 2088 	ldr.w	r2, [r3, #136]	@ 0x88
200202e4:	430a      	orrs	r2, r1
200202e6:	f8c3 2088 	str.w	r2, [r3, #136]	@ 0x88
200202ea:	f00b fffb 	bl	2002c2e4 <HAL_PMU_Reboot>
200202ee:	b003      	add	sp, #12
200202f0:	f85d fb04 	ldr.w	pc, [sp], #4
200202f4:	e7fe      	b.n	200202f4 <boot_error+0x44>
200202f6:	bf00      	nop
200202f8:	50084000 	.word	0x50084000
200202fc:	500ca000 	.word	0x500ca000

20020300 <HAL_MspInit>:
20020300:	2234      	movs	r2, #52	@ 0x34
20020302:	4b01      	ldr	r3, [pc, #4]	@ (20020308 <HAL_MspInit+0x8>)
20020304:	60da      	str	r2, [r3, #12]
20020306:	4770      	bx	lr
20020308:	50094000 	.word	0x50094000

2002030c <mpu_config>:
2002030c:	4770      	bx	lr

2002030e <cache_enable>:
2002030e:	4770      	bx	lr

20020310 <board_pinmux_mpi1_puya_base>:
20020310:	b510      	push	{r4, lr}
20020312:	2301      	movs	r3, #1
20020314:	2200      	movs	r2, #0
20020316:	2103      	movs	r1, #3
20020318:	2002      	movs	r0, #2
2002031a:	f004 fb7d 	bl	20024a18 <HAL_PIN_Set>
2002031e:	2301      	movs	r3, #1
20020320:	2200      	movs	r2, #0
20020322:	4619      	mov	r1, r3
20020324:	200a      	movs	r0, #10
20020326:	f004 fb77 	bl	20024a18 <HAL_PIN_Set>
2002032a:	2301      	movs	r3, #1
2002032c:	2210      	movs	r2, #16
2002032e:	2109      	movs	r1, #9
20020330:	2008      	movs	r0, #8
20020332:	f004 fb71 	bl	20024a18 <HAL_PIN_Set>
20020336:	2301      	movs	r3, #1
20020338:	2210      	movs	r2, #16
2002033a:	210a      	movs	r1, #10
2002033c:	2003      	movs	r0, #3
2002033e:	f004 fb6b 	bl	20024a18 <HAL_PIN_Set>
20020342:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
20020346:	2301      	movs	r3, #1
20020348:	2200      	movs	r2, #0
2002034a:	210c      	movs	r1, #12
2002034c:	200b      	movs	r0, #11
2002034e:	f004 bb63 	b.w	20024a18 <HAL_PIN_Set>

20020352 <board_pinmux_mpi1_puya_ext>:
20020352:	b510      	push	{r4, lr}
20020354:	4604      	mov	r4, r0
20020356:	2101      	movs	r1, #1
20020358:	2005      	movs	r0, #5
2002035a:	f004 fd05 	bl	20024d68 <HAL_PIN_Set_Analog>
2002035e:	2101      	movs	r1, #1
20020360:	2006      	movs	r0, #6
20020362:	f004 fd01 	bl	20024d68 <HAL_PIN_Set_Analog>
20020366:	2101      	movs	r1, #1
20020368:	2007      	movs	r0, #7
2002036a:	f004 fcfd 	bl	20024d68 <HAL_PIN_Set_Analog>
2002036e:	2101      	movs	r1, #1
20020370:	2009      	movs	r0, #9
20020372:	f004 fcf9 	bl	20024d68 <HAL_PIN_Set_Analog>
20020376:	2101      	movs	r1, #1
20020378:	200c      	movs	r0, #12
2002037a:	f004 fcf5 	bl	20024d68 <HAL_PIN_Set_Analog>
2002037e:	2101      	movs	r1, #1
20020380:	200d      	movs	r0, #13
20020382:	f004 fcf1 	bl	20024d68 <HAL_PIN_Set_Analog>
20020386:	2101      	movs	r1, #1
20020388:	b154      	cbz	r4, 200203a0 <board_pinmux_mpi1_puya_ext+0x4e>
2002038a:	4608      	mov	r0, r1
2002038c:	f004 fcec 	bl	20024d68 <HAL_PIN_Set_Analog>
20020390:	2301      	movs	r3, #1
20020392:	2230      	movs	r2, #48	@ 0x30
20020394:	210b      	movs	r1, #11
20020396:	2004      	movs	r0, #4
20020398:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
2002039c:	f004 bb3c 	b.w	20024a18 <HAL_PIN_Set>
200203a0:	2004      	movs	r0, #4
200203a2:	f004 fce1 	bl	20024d68 <HAL_PIN_Set_Analog>
200203a6:	2301      	movs	r3, #1
200203a8:	2230      	movs	r2, #48	@ 0x30
200203aa:	210b      	movs	r1, #11
200203ac:	4618      	mov	r0, r3
200203ae:	e7f3      	b.n	20020398 <board_pinmux_mpi1_puya_ext+0x46>

200203b0 <board_pinmux_mpi1_gd>:
200203b0:	b508      	push	{r3, lr}
200203b2:	2200      	movs	r2, #0
200203b4:	2301      	movs	r3, #1
200203b6:	2103      	movs	r1, #3
200203b8:	2005      	movs	r0, #5
200203ba:	f004 fb2d 	bl	20024a18 <HAL_PIN_Set>
200203be:	2301      	movs	r3, #1
200203c0:	2200      	movs	r2, #0
200203c2:	4619      	mov	r1, r3
200203c4:	200a      	movs	r0, #10
200203c6:	f004 fb27 	bl	20024a18 <HAL_PIN_Set>
200203ca:	2301      	movs	r3, #1
200203cc:	2210      	movs	r2, #16
200203ce:	2109      	movs	r1, #9
200203d0:	200c      	movs	r0, #12
200203d2:	f004 fb21 	bl	20024a18 <HAL_PIN_Set>
200203d6:	2301      	movs	r3, #1
200203d8:	2210      	movs	r2, #16
200203da:	210a      	movs	r1, #10
200203dc:	2003      	movs	r0, #3
200203de:	f004 fb1b 	bl	20024a18 <HAL_PIN_Set>
200203e2:	2301      	movs	r3, #1
200203e4:	2230      	movs	r2, #48	@ 0x30
200203e6:	210b      	movs	r1, #11
200203e8:	4618      	mov	r0, r3
200203ea:	f004 fb15 	bl	20024a18 <HAL_PIN_Set>
200203ee:	2301      	movs	r3, #1
200203f0:	2230      	movs	r2, #48	@ 0x30
200203f2:	210c      	movs	r1, #12
200203f4:	2009      	movs	r0, #9
200203f6:	f004 fb0f 	bl	20024a18 <HAL_PIN_Set>
200203fa:	2101      	movs	r1, #1
200203fc:	2002      	movs	r0, #2
200203fe:	f004 fcb3 	bl	20024d68 <HAL_PIN_Set_Analog>
20020402:	2101      	movs	r1, #1
20020404:	2004      	movs	r0, #4
20020406:	f004 fcaf 	bl	20024d68 <HAL_PIN_Set_Analog>
2002040a:	2101      	movs	r1, #1
2002040c:	2006      	movs	r0, #6
2002040e:	f004 fcab 	bl	20024d68 <HAL_PIN_Set_Analog>
20020412:	2101      	movs	r1, #1
20020414:	2007      	movs	r0, #7
20020416:	f004 fca7 	bl	20024d68 <HAL_PIN_Set_Analog>
2002041a:	2101      	movs	r1, #1
2002041c:	2008      	movs	r0, #8
2002041e:	f004 fca3 	bl	20024d68 <HAL_PIN_Set_Analog>
20020422:	2101      	movs	r1, #1
20020424:	200b      	movs	r0, #11
20020426:	f004 fc9f 	bl	20024d68 <HAL_PIN_Set_Analog>
2002042a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
2002042e:	2101      	movs	r1, #1
20020430:	200d      	movs	r0, #13
20020432:	f004 bc99 	b.w	20024d68 <HAL_PIN_Set_Analog>

20020436 <board_pinmux_mpi2>:
20020436:	b510      	push	{r4, lr}
20020438:	2301      	movs	r3, #1
2002043a:	2200      	movs	r2, #0
2002043c:	2119      	movs	r1, #25
2002043e:	201e      	movs	r0, #30
20020440:	f004 faea 	bl	20024a18 <HAL_PIN_Set>
20020444:	2301      	movs	r3, #1
20020446:	2200      	movs	r2, #0
20020448:	211b      	movs	r1, #27
2002044a:	201a      	movs	r0, #26
2002044c:	f004 fae4 	bl	20024a18 <HAL_PIN_Set>
20020450:	2301      	movs	r3, #1
20020452:	2210      	movs	r2, #16
20020454:	2121      	movs	r1, #33	@ 0x21
20020456:	201d      	movs	r0, #29
20020458:	f004 fade 	bl	20024a18 <HAL_PIN_Set>
2002045c:	2301      	movs	r3, #1
2002045e:	2210      	movs	r2, #16
20020460:	2122      	movs	r1, #34	@ 0x22
20020462:	201b      	movs	r0, #27
20020464:	f004 fad8 	bl	20024a18 <HAL_PIN_Set>
20020468:	2301      	movs	r3, #1
2002046a:	2230      	movs	r2, #48	@ 0x30
2002046c:	2123      	movs	r1, #35	@ 0x23
2002046e:	201c      	movs	r0, #28
20020470:	f004 fad2 	bl	20024a18 <HAL_PIN_Set>
20020474:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
20020478:	2301      	movs	r3, #1
2002047a:	2230      	movs	r2, #48	@ 0x30
2002047c:	2124      	movs	r1, #36	@ 0x24
2002047e:	201f      	movs	r0, #31
20020480:	f004 baca 	b.w	20024a18 <HAL_PIN_Set>

20020484 <board_pinmux_sd>:
20020484:	b510      	push	{r4, lr}
20020486:	2301      	movs	r3, #1
20020488:	2230      	movs	r2, #48	@ 0x30
2002048a:	f44f 71da 	mov.w	r1, #436	@ 0x1b4
2002048e:	201d      	movs	r0, #29
20020490:	f004 fac2 	bl	20024a18 <HAL_PIN_Set>
20020494:	2014      	movs	r0, #20
20020496:	f001 fdb0 	bl	20021ffa <HAL_Delay_us>
2002049a:	2301      	movs	r3, #1
2002049c:	2200      	movs	r2, #0
2002049e:	f44f 71d9 	mov.w	r1, #434	@ 0x1b2
200204a2:	201c      	movs	r0, #28
200204a4:	f004 fab8 	bl	20024a18 <HAL_PIN_Set>
200204a8:	2301      	movs	r3, #1
200204aa:	2230      	movs	r2, #48	@ 0x30
200204ac:	f240 11b5 	movw	r1, #437	@ 0x1b5
200204b0:	201e      	movs	r0, #30
200204b2:	f004 fab1 	bl	20024a18 <HAL_PIN_Set>
200204b6:	2301      	movs	r3, #1
200204b8:	2230      	movs	r2, #48	@ 0x30
200204ba:	f44f 71db 	mov.w	r1, #438	@ 0x1b6
200204be:	201f      	movs	r0, #31
200204c0:	f004 faaa 	bl	20024a18 <HAL_PIN_Set>
200204c4:	2301      	movs	r3, #1
200204c6:	2230      	movs	r2, #48	@ 0x30
200204c8:	f240 11b7 	movw	r1, #439	@ 0x1b7
200204cc:	201a      	movs	r0, #26
200204ce:	f004 faa3 	bl	20024a18 <HAL_PIN_Set>
200204d2:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
200204d6:	2301      	movs	r3, #1
200204d8:	2230      	movs	r2, #48	@ 0x30
200204da:	f44f 71dc 	mov.w	r1, #440	@ 0x1b8
200204de:	201b      	movs	r0, #27
200204e0:	f004 ba9a 	b.w	20024a18 <HAL_PIN_Set>

200204e4 <board_boot_from>:
200204e4:	b510      	push	{r4, lr}
200204e6:	4b0d      	ldr	r3, [pc, #52]	@ (2002051c <board_boot_from+0x38>)
200204e8:	685b      	ldr	r3, [r3, #4]
200204ea:	f3c3 2302 	ubfx	r3, r3, #8, #3
200204ee:	2b07      	cmp	r3, #7
200204f0:	d10c      	bne.n	2002050c <board_boot_from+0x28>
200204f2:	2400      	movs	r4, #0
200204f4:	3401      	adds	r4, #1
200204f6:	2101      	movs	r1, #1
200204f8:	4620      	mov	r0, r4
200204fa:	f004 fc35 	bl	20024d68 <HAL_PIN_Set_Analog>
200204fe:	2c0d      	cmp	r4, #13
20020500:	d1f8      	bne.n	200204f4 <board_boot_from+0x10>
20020502:	2000      	movs	r0, #0
20020504:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
20020508:	f00b bebc 	b.w	2002c284 <HAL_Get_backup>
2002050c:	b11b      	cbz	r3, 20020516 <board_boot_from+0x32>
2002050e:	2b01      	cmp	r3, #1
20020510:	d1f7      	bne.n	20020502 <board_boot_from+0x1e>
20020512:	2002      	movs	r0, #2
20020514:	bd10      	pop	{r4, pc}
20020516:	2001      	movs	r0, #1
20020518:	e7fc      	b.n	20020514 <board_boot_from+0x30>
2002051a:	bf00      	nop
2002051c:	5000b000 	.word	0x5000b000

20020520 <board_flash_power_on>:
20020520:	4770      	bx	lr

20020522 <board_pinmux_psram_func0>:
20020522:	b508      	push	{r3, lr}
20020524:	2210      	movs	r2, #16
20020526:	2301      	movs	r3, #1
20020528:	2109      	movs	r1, #9
2002052a:	2002      	movs	r0, #2
2002052c:	f004 fa74 	bl	20024a18 <HAL_PIN_Set>
20020530:	2301      	movs	r3, #1
20020532:	2210      	movs	r2, #16
20020534:	210a      	movs	r1, #10
20020536:	2003      	movs	r0, #3
20020538:	f004 fa6e 	bl	20024a18 <HAL_PIN_Set>
2002053c:	2301      	movs	r3, #1
2002053e:	2210      	movs	r2, #16
20020540:	210b      	movs	r1, #11
20020542:	2004      	movs	r0, #4
20020544:	f004 fa68 	bl	20024a18 <HAL_PIN_Set>
20020548:	2301      	movs	r3, #1
2002054a:	2210      	movs	r2, #16
2002054c:	210c      	movs	r1, #12
2002054e:	2005      	movs	r0, #5
20020550:	f004 fa62 	bl	20024a18 <HAL_PIN_Set>
20020554:	2301      	movs	r3, #1
20020556:	2210      	movs	r2, #16
20020558:	210d      	movs	r1, #13
2002055a:	2006      	movs	r0, #6
2002055c:	f004 fa5c 	bl	20024a18 <HAL_PIN_Set>
20020560:	2301      	movs	r3, #1
20020562:	2210      	movs	r2, #16
20020564:	210e      	movs	r1, #14
20020566:	2007      	movs	r0, #7
20020568:	f004 fa56 	bl	20024a18 <HAL_PIN_Set>
2002056c:	2301      	movs	r3, #1
2002056e:	2210      	movs	r2, #16
20020570:	210f      	movs	r1, #15
20020572:	2008      	movs	r0, #8
20020574:	f004 fa50 	bl	20024a18 <HAL_PIN_Set>
20020578:	2210      	movs	r2, #16
2002057a:	2301      	movs	r3, #1
2002057c:	4611      	mov	r1, r2
2002057e:	2009      	movs	r0, #9
20020580:	f004 fa4a 	bl	20024a18 <HAL_PIN_Set>
20020584:	2301      	movs	r3, #1
20020586:	2210      	movs	r2, #16
20020588:	2106      	movs	r1, #6
2002058a:	200a      	movs	r0, #10
2002058c:	f004 fa44 	bl	20024a18 <HAL_PIN_Set>
20020590:	2301      	movs	r3, #1
20020592:	2200      	movs	r2, #0
20020594:	4619      	mov	r1, r3
20020596:	200b      	movs	r0, #11
20020598:	f004 fa3e 	bl	20024a18 <HAL_PIN_Set>
2002059c:	2301      	movs	r3, #1
2002059e:	2200      	movs	r2, #0
200205a0:	2103      	movs	r1, #3
200205a2:	200c      	movs	r0, #12
200205a4:	f004 fa38 	bl	20024a18 <HAL_PIN_Set>
200205a8:	2101      	movs	r1, #1
200205aa:	4608      	mov	r0, r1
200205ac:	f004 fbdc 	bl	20024d68 <HAL_PIN_Set_Analog>
200205b0:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
200205b4:	2101      	movs	r1, #1
200205b6:	200d      	movs	r0, #13
200205b8:	f004 bbd6 	b.w	20024d68 <HAL_PIN_Set_Analog>

200205bc <board_pinmux_psram_func1_2_4>:
200205bc:	b510      	push	{r4, lr}
200205be:	2301      	movs	r3, #1
200205c0:	4604      	mov	r4, r0
200205c2:	2210      	movs	r2, #16
200205c4:	2109      	movs	r1, #9
200205c6:	2002      	movs	r0, #2
200205c8:	f004 fa26 	bl	20024a18 <HAL_PIN_Set>
200205cc:	2301      	movs	r3, #1
200205ce:	2210      	movs	r2, #16
200205d0:	210a      	movs	r1, #10
200205d2:	2003      	movs	r0, #3
200205d4:	f004 fa20 	bl	20024a18 <HAL_PIN_Set>
200205d8:	2301      	movs	r3, #1
200205da:	2210      	movs	r2, #16
200205dc:	210b      	movs	r1, #11
200205de:	2004      	movs	r0, #4
200205e0:	f004 fa1a 	bl	20024a18 <HAL_PIN_Set>
200205e4:	2301      	movs	r3, #1
200205e6:	2210      	movs	r2, #16
200205e8:	210c      	movs	r1, #12
200205ea:	2005      	movs	r0, #5
200205ec:	f004 fa14 	bl	20024a18 <HAL_PIN_Set>
200205f0:	2301      	movs	r3, #1
200205f2:	2210      	movs	r2, #16
200205f4:	210d      	movs	r1, #13
200205f6:	2009      	movs	r0, #9
200205f8:	f004 fa0e 	bl	20024a18 <HAL_PIN_Set>
200205fc:	2301      	movs	r3, #1
200205fe:	2210      	movs	r2, #16
20020600:	210e      	movs	r1, #14
20020602:	200a      	movs	r0, #10
20020604:	f004 fa08 	bl	20024a18 <HAL_PIN_Set>
20020608:	2301      	movs	r3, #1
2002060a:	2210      	movs	r2, #16
2002060c:	210f      	movs	r1, #15
2002060e:	200b      	movs	r0, #11
20020610:	f004 fa02 	bl	20024a18 <HAL_PIN_Set>
20020614:	2210      	movs	r2, #16
20020616:	2301      	movs	r3, #1
20020618:	4611      	mov	r1, r2
2002061a:	200c      	movs	r0, #12
2002061c:	f004 f9fc 	bl	20024a18 <HAL_PIN_Set>
20020620:	2301      	movs	r3, #1
20020622:	2200      	movs	r2, #0
20020624:	4619      	mov	r1, r3
20020626:	2008      	movs	r0, #8
20020628:	f004 f9f6 	bl	20024a18 <HAL_PIN_Set>
2002062c:	2301      	movs	r3, #1
2002062e:	2200      	movs	r2, #0
20020630:	2103      	movs	r1, #3
20020632:	2006      	movs	r0, #6
20020634:	f004 f9f0 	bl	20024a18 <HAL_PIN_Set>
20020638:	2c02      	cmp	r4, #2
2002063a:	d013      	beq.n	20020664 <board_pinmux_psram_func1_2_4+0xa8>
2002063c:	2c04      	cmp	r4, #4
2002063e:	d025      	beq.n	2002068c <board_pinmux_psram_func1_2_4+0xd0>
20020640:	2c01      	cmp	r4, #1
20020642:	d12c      	bne.n	2002069e <board_pinmux_psram_func1_2_4+0xe2>
20020644:	2106      	movs	r1, #6
20020646:	4623      	mov	r3, r4
20020648:	2210      	movs	r2, #16
2002064a:	200d      	movs	r0, #13
2002064c:	f004 f9e4 	bl	20024a18 <HAL_PIN_Set>
20020650:	4621      	mov	r1, r4
20020652:	4620      	mov	r0, r4
20020654:	f004 fb88 	bl	20024d68 <HAL_PIN_Set_Analog>
20020658:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
2002065c:	2101      	movs	r1, #1
2002065e:	2007      	movs	r0, #7
20020660:	f004 bb82 	b.w	20024d68 <HAL_PIN_Set_Analog>
20020664:	2301      	movs	r3, #1
20020666:	2210      	movs	r2, #16
20020668:	2104      	movs	r1, #4
2002066a:	4618      	mov	r0, r3
2002066c:	f004 f9d4 	bl	20024a18 <HAL_PIN_Set>
20020670:	2301      	movs	r3, #1
20020672:	2210      	movs	r2, #16
20020674:	2105      	movs	r1, #5
20020676:	200d      	movs	r0, #13
20020678:	f004 f9ce 	bl	20024a18 <HAL_PIN_Set>
2002067c:	4621      	mov	r1, r4
2002067e:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
20020682:	2301      	movs	r3, #1
20020684:	2200      	movs	r2, #0
20020686:	2007      	movs	r0, #7
20020688:	f004 b9c6 	b.w	20024a18 <HAL_PIN_Set>
2002068c:	2106      	movs	r1, #6
2002068e:	2301      	movs	r3, #1
20020690:	2200      	movs	r2, #0
20020692:	200d      	movs	r0, #13
20020694:	f004 f9c0 	bl	20024a18 <HAL_PIN_Set>
20020698:	2101      	movs	r1, #1
2002069a:	4608      	mov	r0, r1
2002069c:	e7da      	b.n	20020654 <board_pinmux_psram_func1_2_4+0x98>
2002069e:	bd10      	pop	{r4, pc}

200206a0 <board_pinmux_psram_func3>:
200206a0:	b508      	push	{r3, lr}
200206a2:	2301      	movs	r3, #1
200206a4:	2200      	movs	r2, #0
200206a6:	4619      	mov	r1, r3
200206a8:	200a      	movs	r0, #10
200206aa:	f004 f9b5 	bl	20024a18 <HAL_PIN_Set>
200206ae:	2301      	movs	r3, #1
200206b0:	2200      	movs	r2, #0
200206b2:	2103      	movs	r1, #3
200206b4:	2009      	movs	r0, #9
200206b6:	f004 f9af 	bl	20024a18 <HAL_PIN_Set>
200206ba:	2301      	movs	r3, #1
200206bc:	2210      	movs	r2, #16
200206be:	2109      	movs	r1, #9
200206c0:	2006      	movs	r0, #6
200206c2:	f004 f9a9 	bl	20024a18 <HAL_PIN_Set>
200206c6:	2301      	movs	r3, #1
200206c8:	2210      	movs	r2, #16
200206ca:	210a      	movs	r1, #10
200206cc:	2008      	movs	r0, #8
200206ce:	f004 f9a3 	bl	20024a18 <HAL_PIN_Set>
200206d2:	2301      	movs	r3, #1
200206d4:	2230      	movs	r2, #48	@ 0x30
200206d6:	210b      	movs	r1, #11
200206d8:	2007      	movs	r0, #7
200206da:	f004 f99d 	bl	20024a18 <HAL_PIN_Set>
200206de:	2301      	movs	r3, #1
200206e0:	2230      	movs	r2, #48	@ 0x30
200206e2:	210c      	movs	r1, #12
200206e4:	200b      	movs	r0, #11
200206e6:	f004 f997 	bl	20024a18 <HAL_PIN_Set>
200206ea:	2101      	movs	r1, #1
200206ec:	4608      	mov	r0, r1
200206ee:	f004 fb3b 	bl	20024d68 <HAL_PIN_Set_Analog>
200206f2:	2101      	movs	r1, #1
200206f4:	2002      	movs	r0, #2
200206f6:	f004 fb37 	bl	20024d68 <HAL_PIN_Set_Analog>
200206fa:	2101      	movs	r1, #1
200206fc:	2003      	movs	r0, #3
200206fe:	f004 fb33 	bl	20024d68 <HAL_PIN_Set_Analog>
20020702:	2101      	movs	r1, #1
20020704:	2004      	movs	r0, #4
20020706:	f004 fb2f 	bl	20024d68 <HAL_PIN_Set_Analog>
2002070a:	2101      	movs	r1, #1
2002070c:	2005      	movs	r0, #5
2002070e:	f004 fb2b 	bl	20024d68 <HAL_PIN_Set_Analog>
20020712:	2101      	movs	r1, #1
20020714:	200c      	movs	r0, #12
20020716:	f004 fb27 	bl	20024d68 <HAL_PIN_Set_Analog>
2002071a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
2002071e:	2101      	movs	r1, #1
20020720:	200d      	movs	r0, #13
20020722:	f004 bb21 	b.w	20024d68 <HAL_PIN_Set_Analog>

20020726 <bootloader_switch_clock>:
20020726:	2102      	movs	r1, #2
20020728:	2004      	movs	r0, #4
2002072a:	f004 bc4f 	b.w	20024fcc <HAL_RCC_HCPU_ClockSelect>
	...

20020730 <boot_psram_init>:
20020730:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
20020734:	2400      	movs	r4, #0
20020736:	b08a      	sub	sp, #40	@ 0x28
20020738:	4605      	mov	r5, r0
2002073a:	2230      	movs	r2, #48	@ 0x30
2002073c:	4621      	mov	r1, r4
2002073e:	4863      	ldr	r0, [pc, #396]	@ (200208cc <boot_psram_init+0x19c>)
20020740:	f00a f854 	bl	2002a7ec <memset>
20020744:	4b62      	ldr	r3, [pc, #392]	@ (200208d0 <boot_psram_init+0x1a0>)
20020746:	1ea8      	subs	r0, r5, #2
20020748:	9305      	str	r3, [sp, #20]
2002074a:	f04f 5380 	mov.w	r3, #268435456	@ 0x10000000
2002074e:	9307      	str	r3, [sp, #28]
20020750:	2303      	movs	r3, #3
20020752:	9406      	str	r4, [sp, #24]
20020754:	9309      	str	r3, [sp, #36]	@ 0x24
20020756:	2804      	cmp	r0, #4
20020758:	d804      	bhi.n	20020764 <boot_psram_init+0x34>
2002075a:	e8df f000 	tbb	[pc, r0]
2002075e:	6264      	.short	0x6264
20020760:	5d04      	.short	0x5d04
20020762:	60          	.byte	0x60
20020763:	00          	.byte	0x00
20020764:	e7fe      	b.n	20020764 <boot_psram_init+0x34>
20020766:	2305      	movs	r3, #5
20020768:	9309      	str	r3, [sp, #36]	@ 0x24
2002076a:	2304      	movs	r3, #4
2002076c:	9d09      	ldr	r5, [sp, #36]	@ 0x24
2002076e:	9308      	str	r3, [sp, #32]
20020770:	2d03      	cmp	r5, #3
20020772:	d162      	bne.n	2002083a <boot_psram_init+0x10a>
20020774:	f001 fb62 	bl	20021e3c <BSP_GetFlash1DIV>
20020778:	a905      	add	r1, sp, #20
2002077a:	4602      	mov	r2, r0
2002077c:	4853      	ldr	r0, [pc, #332]	@ (200208cc <boot_psram_init+0x19c>)
2002077e:	f003 fee7 	bl	20024550 <HAL_OPI_PSRAM_Init>
20020782:	462a      	mov	r2, r5
20020784:	2108      	movs	r1, #8
20020786:	4851      	ldr	r0, [pc, #324]	@ (200208cc <boot_psram_init+0x19c>)
20020788:	f003 fdd4 	bl	20024334 <HAL_MPI_MR_WRITE>
2002078c:	484f      	ldr	r0, [pc, #316]	@ (200208cc <boot_psram_init+0x19c>)
2002078e:	f003 fadf 	bl	20023d50 <HAL_QSPI_GET_CLK>
20020792:	4b50      	ldr	r3, [pc, #320]	@ (200208d4 <boot_psram_init+0x1a4>)
20020794:	4298      	cmp	r0, r3
20020796:	d948      	bls.n	2002082a <boot_psram_init+0xfa>
20020798:	f103 63a4 	add.w	r3, r3, #85983232	@ 0x5200000
2002079c:	f503 4383 	add.w	r3, r3, #16768	@ 0x4180
200207a0:	4298      	cmp	r0, r3
200207a2:	d944      	bls.n	2002082e <boot_psram_init+0xfe>
200207a4:	f103 7337 	add.w	r3, r3, #47972352	@ 0x2dc0000
200207a8:	f503 43d8 	add.w	r3, r3, #27648	@ 0x6c00
200207ac:	4298      	cmp	r0, r3
200207ae:	d940      	bls.n	20020832 <boot_psram_init+0x102>
200207b0:	4b49      	ldr	r3, [pc, #292]	@ (200208d8 <boot_psram_init+0x1a8>)
200207b2:	4298      	cmp	r0, r3
200207b4:	d93f      	bls.n	20020836 <boot_psram_init+0x106>
200207b6:	4b49      	ldr	r3, [pc, #292]	@ (200208dc <boot_psram_init+0x1ac>)
200207b8:	4298      	cmp	r0, r3
200207ba:	bf98      	it	ls
200207bc:	2407      	movls	r4, #7
200207be:	2600      	movs	r6, #0
200207c0:	2507      	movs	r5, #7
200207c2:	f04f 0803 	mov.w	r8, #3
200207c6:	0067      	lsls	r7, r4, #1
200207c8:	b2ff      	uxtb	r7, r7
200207ca:	1e7a      	subs	r2, r7, #1
200207cc:	4633      	mov	r3, r6
200207ce:	b252      	sxtb	r2, r2
200207d0:	4629      	mov	r1, r5
200207d2:	483e      	ldr	r0, [pc, #248]	@ (200208cc <boot_psram_init+0x19c>)
200207d4:	e9cd 5502 	strd	r5, r5, [sp, #8]
200207d8:	e9cd 6800 	strd	r6, r8, [sp]
200207dc:	f002 f988 	bl	20022af0 <HAL_FLASH_CFG_AHB_RCMD>
200207e0:	4631      	mov	r1, r6
200207e2:	483a      	ldr	r0, [pc, #232]	@ (200208cc <boot_psram_init+0x19c>)
200207e4:	f002 f979 	bl	20022ada <HAL_FLASH_SET_AHB_RCMD>
200207e8:	1e62      	subs	r2, r4, #1
200207ea:	4633      	mov	r3, r6
200207ec:	b252      	sxtb	r2, r2
200207ee:	4629      	mov	r1, r5
200207f0:	4836      	ldr	r0, [pc, #216]	@ (200208cc <boot_psram_init+0x19c>)
200207f2:	e9cd 5502 	strd	r5, r5, [sp, #8]
200207f6:	e9cd 6800 	strd	r6, r8, [sp]
200207fa:	f002 f9a2 	bl	20022b42 <HAL_FLASH_CFG_AHB_WCMD>
200207fe:	2180      	movs	r1, #128	@ 0x80
20020800:	4832      	ldr	r0, [pc, #200]	@ (200208cc <boot_psram_init+0x19c>)
20020802:	f002 f992 	bl	20022b2a <HAL_FLASH_SET_AHB_WCMD>
20020806:	4623      	mov	r3, r4
20020808:	463a      	mov	r2, r7
2002080a:	2101      	movs	r1, #1
2002080c:	482f      	ldr	r0, [pc, #188]	@ (200208cc <boot_psram_init+0x19c>)
2002080e:	f003 fdb5 	bl	2002437c <HAL_MPI_SET_FIXLAT>
20020812:	b00a      	add	sp, #40	@ 0x28
20020814:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
20020818:	2302      	movs	r3, #2
2002081a:	9309      	str	r3, [sp, #36]	@ 0x24
2002081c:	e7a6      	b.n	2002076c <boot_psram_init+0x3c>
2002081e:	2306      	movs	r3, #6
20020820:	9309      	str	r3, [sp, #36]	@ 0x24
20020822:	2308      	movs	r3, #8
20020824:	e7a2      	b.n	2002076c <boot_psram_init+0x3c>
20020826:	2310      	movs	r3, #16
20020828:	e7a0      	b.n	2002076c <boot_psram_init+0x3c>
2002082a:	462c      	mov	r4, r5
2002082c:	e7c7      	b.n	200207be <boot_psram_init+0x8e>
2002082e:	2404      	movs	r4, #4
20020830:	e7c5      	b.n	200207be <boot_psram_init+0x8e>
20020832:	2405      	movs	r4, #5
20020834:	e7c3      	b.n	200207be <boot_psram_init+0x8e>
20020836:	2406      	movs	r4, #6
20020838:	e7c1      	b.n	200207be <boot_psram_init+0x8e>
2002083a:	2d05      	cmp	r5, #5
2002083c:	d10d      	bne.n	2002085a <boot_psram_init+0x12a>
2002083e:	f001 fafd 	bl	20021e3c <BSP_GetFlash1DIV>
20020842:	a905      	add	r1, sp, #20
20020844:	4602      	mov	r2, r0
20020846:	4821      	ldr	r0, [pc, #132]	@ (200208cc <boot_psram_init+0x19c>)
20020848:	f003 fefe 	bl	20024648 <HAL_LEGACY_PSRAM_Init>
2002084c:	481f      	ldr	r0, [pc, #124]	@ (200208cc <boot_psram_init+0x19c>)
2002084e:	f003 fe07 	bl	20024460 <HAL_LEGACY_CFG_READ>
20020852:	481e      	ldr	r0, [pc, #120]	@ (200208cc <boot_psram_init+0x19c>)
20020854:	f003 fe1f 	bl	20024496 <HAL_LEGACY_CFG_WRITE>
20020858:	e7db      	b.n	20020812 <boot_psram_init+0xe2>
2002085a:	2d06      	cmp	r5, #6
2002085c:	d10d      	bne.n	2002087a <boot_psram_init+0x14a>
2002085e:	f001 faed 	bl	20021e3c <BSP_GetFlash1DIV>
20020862:	a905      	add	r1, sp, #20
20020864:	4602      	mov	r2, r0
20020866:	4819      	ldr	r0, [pc, #100]	@ (200208cc <boot_psram_init+0x19c>)
20020868:	f003 ffba 	bl	200247e0 <HAL_HYPER_PSRAM_Init>
2002086c:	4817      	ldr	r0, [pc, #92]	@ (200208cc <boot_psram_init+0x19c>)
2002086e:	f003 fff1 	bl	20024854 <HAL_HYPER_CFG_READ>
20020872:	4816      	ldr	r0, [pc, #88]	@ (200208cc <boot_psram_init+0x19c>)
20020874:	f004 f800 	bl	20024878 <HAL_HYPER_CFG_WRITE>
20020878:	e7cb      	b.n	20020812 <boot_psram_init+0xe2>
2002087a:	f001 fadf 	bl	20021e3c <BSP_GetFlash1DIV>
2002087e:	2500      	movs	r5, #0
20020880:	2403      	movs	r4, #3
20020882:	2701      	movs	r7, #1
20020884:	2602      	movs	r6, #2
20020886:	4602      	mov	r2, r0
20020888:	a905      	add	r1, sp, #20
2002088a:	4810      	ldr	r0, [pc, #64]	@ (200208cc <boot_psram_init+0x19c>)
2002088c:	f003 fcfc 	bl	20024288 <HAL_SPI_PSRAM_Init>
20020890:	462b      	mov	r3, r5
20020892:	2206      	movs	r2, #6
20020894:	4621      	mov	r1, r4
20020896:	e9cd 4702 	strd	r4, r7, [sp, #8]
2002089a:	e9cd 5600 	strd	r5, r6, [sp]
2002089e:	480b      	ldr	r0, [pc, #44]	@ (200208cc <boot_psram_init+0x19c>)
200208a0:	f002 f926 	bl	20022af0 <HAL_FLASH_CFG_AHB_RCMD>
200208a4:	21eb      	movs	r1, #235	@ 0xeb
200208a6:	4809      	ldr	r0, [pc, #36]	@ (200208cc <boot_psram_init+0x19c>)
200208a8:	f002 f917 	bl	20022ada <HAL_FLASH_SET_AHB_RCMD>
200208ac:	4621      	mov	r1, r4
200208ae:	462b      	mov	r3, r5
200208b0:	462a      	mov	r2, r5
200208b2:	e9cd 4702 	strd	r4, r7, [sp, #8]
200208b6:	e9cd 5600 	strd	r5, r6, [sp]
200208ba:	4804      	ldr	r0, [pc, #16]	@ (200208cc <boot_psram_init+0x19c>)
200208bc:	f002 f941 	bl	20022b42 <HAL_FLASH_CFG_AHB_WCMD>
200208c0:	2138      	movs	r1, #56	@ 0x38
200208c2:	4802      	ldr	r0, [pc, #8]	@ (200208cc <boot_psram_init+0x19c>)
200208c4:	f002 f931 	bl	20022b2a <HAL_FLASH_SET_AHB_WCMD>
200208c8:	e7a3      	b.n	20020812 <boot_psram_init+0xe2>
200208ca:	bf00      	nop
200208cc:	200449d4 	.word	0x200449d4
200208d0:	50041000 	.word	0x50041000
200208d4:	07de2901 	.word	0x07de2901
200208d8:	13c9eb01 	.word	0x13c9eb01
200208dc:	17d78401 	.word	0x17d78401

200208e0 <board_init_psram>:
200208e0:	b510      	push	{r4, lr}
200208e2:	4b15      	ldr	r3, [pc, #84]	@ (20020938 <board_init_psram+0x58>)
200208e4:	685c      	ldr	r4, [r3, #4]
200208e6:	f3c4 2402 	ubfx	r4, r4, #8, #3
200208ea:	1ea3      	subs	r3, r4, #2
200208ec:	2b04      	cmp	r3, #4
200208ee:	d821      	bhi.n	20020934 <board_init_psram+0x54>
200208f0:	e8df f003 	tbb	[pc, r3]
200208f4:	03151b1d 	.word	0x03151b1d
200208f8:	19          	.byte	0x19
200208f9:	00          	.byte	0x00
200208fa:	f7ff fed1 	bl	200206a0 <board_pinmux_psram_func3>
200208fe:	2201      	movs	r2, #1
20020900:	2000      	movs	r0, #0
20020902:	4611      	mov	r1, r2
20020904:	f00b fcc4 	bl	2002c290 <HAL_PMU_ConfigPeriLdo>
20020908:	2001      	movs	r0, #1
2002090a:	f7ff ff0c 	bl	20020726 <bootloader_switch_clock>
2002090e:	2002      	movs	r0, #2
20020910:	f001 faa0 	bl	20021e54 <BSP_SetFlash1DIV>
20020914:	4620      	mov	r0, r4
20020916:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
2002091a:	f7ff bf09 	b.w	20020730 <boot_psram_init>
2002091e:	2002      	movs	r0, #2
20020920:	f7ff fe4c 	bl	200205bc <board_pinmux_psram_func1_2_4>
20020924:	e7eb      	b.n	200208fe <board_init_psram+0x1e>
20020926:	2004      	movs	r0, #4
20020928:	e7fa      	b.n	20020920 <board_init_psram+0x40>
2002092a:	2001      	movs	r0, #1
2002092c:	e7f8      	b.n	20020920 <board_init_psram+0x40>
2002092e:	f7ff fdf8 	bl	20020522 <board_pinmux_psram_func0>
20020932:	e7e4      	b.n	200208fe <board_init_psram+0x1e>
20020934:	bd10      	pop	{r4, pc}
20020936:	bf00      	nop
20020938:	5000b000 	.word	0x5000b000

2002093c <erase_nor>:
2002093c:	4b15      	ldr	r3, [pc, #84]	@ (20020994 <erase_nor+0x58>)
2002093e:	b570      	push	{r4, r5, r6, lr}
20020940:	f103 0644 	add.w	r6, r3, #68	@ 0x44
20020944:	f1b0 5f90 	cmp.w	r0, #301989888	@ 0x12000000
20020948:	bf38      	it	cc
2002094a:	461e      	movcc	r6, r3
2002094c:	6933      	ldr	r3, [r6, #16]
2002094e:	460c      	mov	r4, r1
20020950:	4283      	cmp	r3, r0
20020952:	d901      	bls.n	20020958 <erase_nor+0x1c>
20020954:	2001      	movs	r0, #1
20020956:	bd70      	pop	{r4, r5, r6, pc}
20020958:	6972      	ldr	r2, [r6, #20]
2002095a:	441a      	add	r2, r3
2002095c:	4282      	cmp	r2, r0
2002095e:	d3f9      	bcc.n	20020954 <erase_nor+0x18>
20020960:	1ac0      	subs	r0, r0, r3
20020962:	f3c0 030b 	ubfx	r3, r0, #0, #12
20020966:	b97b      	cbnz	r3, 20020988 <erase_nor+0x4c>
20020968:	f3c1 030b 	ubfx	r3, r1, #0, #12
2002096c:	b97b      	cbnz	r3, 2002098e <erase_nor+0x52>
2002096e:	1845      	adds	r5, r0, r1
20020970:	1b29      	subs	r1, r5, r4
20020972:	b90c      	cbnz	r4, 20020978 <erase_nor+0x3c>
20020974:	4620      	mov	r0, r4
20020976:	e7ee      	b.n	20020956 <erase_nor+0x1a>
20020978:	4630      	mov	r0, r6
2002097a:	f003 f99d 	bl	20023cb8 <HAL_QSPIEX_SECT_ERASE>
2002097e:	2800      	cmp	r0, #0
20020980:	d1e8      	bne.n	20020954 <erase_nor+0x18>
20020982:	f5a4 5480 	sub.w	r4, r4, #4096	@ 0x1000
20020986:	e7f3      	b.n	20020970 <erase_nor+0x34>
20020988:	f04f 30ff 	mov.w	r0, #4294967295
2002098c:	e7e3      	b.n	20020956 <erase_nor+0x1a>
2002098e:	f06f 0001 	mvn.w	r0, #1
20020992:	e7e0      	b.n	20020956 <erase_nor+0x1a>
20020994:	20046f24 	.word	0x20046f24

20020998 <write_nor>:
20020998:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
2002099c:	4b20      	ldr	r3, [pc, #128]	@ (20020a20 <write_nor+0x88>)
2002099e:	460f      	mov	r7, r1
200209a0:	f103 0844 	add.w	r8, r3, #68	@ 0x44
200209a4:	f1b0 5f90 	cmp.w	r0, #301989888	@ 0x12000000
200209a8:	bf38      	it	cc
200209aa:	4698      	movcc	r8, r3
200209ac:	f8d8 5010 	ldr.w	r5, [r8, #16]
200209b0:	4616      	mov	r6, r2
200209b2:	4285      	cmp	r5, r0
200209b4:	d902      	bls.n	200209bc <write_nor+0x24>
200209b6:	2000      	movs	r0, #0
200209b8:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
200209bc:	f8d8 2014 	ldr.w	r2, [r8, #20]
200209c0:	442a      	add	r2, r5
200209c2:	4282      	cmp	r2, r0
200209c4:	d3f7      	bcc.n	200209b6 <write_nor+0x1e>
200209c6:	1b45      	subs	r5, r0, r5
200209c8:	f015 04ff 	ands.w	r4, r5, #255	@ 0xff
200209cc:	d012      	beq.n	200209f4 <write_nor+0x5c>
200209ce:	f5c4 7480 	rsb	r4, r4, #256	@ 0x100
200209d2:	42b4      	cmp	r4, r6
200209d4:	bf28      	it	cs
200209d6:	4634      	movcs	r4, r6
200209d8:	460a      	mov	r2, r1
200209da:	4623      	mov	r3, r4
200209dc:	4629      	mov	r1, r5
200209de:	4640      	mov	r0, r8
200209e0:	f003 f885 	bl	20023aee <HAL_QSPIEX_WRITE_PAGE>
200209e4:	4284      	cmp	r4, r0
200209e6:	d1e6      	bne.n	200209b6 <write_nor+0x1e>
200209e8:	4425      	add	r5, r4
200209ea:	4427      	add	r7, r4
200209ec:	1b34      	subs	r4, r6, r4
200209ee:	b91c      	cbnz	r4, 200209f8 <write_nor+0x60>
200209f0:	4630      	mov	r0, r6
200209f2:	e7e1      	b.n	200209b8 <write_nor+0x20>
200209f4:	4634      	mov	r4, r6
200209f6:	e7fa      	b.n	200209ee <write_nor+0x56>
200209f8:	f5b4 7f80 	cmp.w	r4, #256	@ 0x100
200209fc:	46a1      	mov	r9, r4
200209fe:	bf28      	it	cs
20020a00:	f44f 7980 	movcs.w	r9, #256	@ 0x100
20020a04:	463a      	mov	r2, r7
20020a06:	464b      	mov	r3, r9
20020a08:	4629      	mov	r1, r5
20020a0a:	4640      	mov	r0, r8
20020a0c:	f003 f86f 	bl	20023aee <HAL_QSPIEX_WRITE_PAGE>
20020a10:	4581      	cmp	r9, r0
20020a12:	d1d0      	bne.n	200209b6 <write_nor+0x1e>
20020a14:	444d      	add	r5, r9
20020a16:	444f      	add	r7, r9
20020a18:	eba4 0409 	sub.w	r4, r4, r9
20020a1c:	e7e7      	b.n	200209ee <write_nor+0x56>
20020a1e:	bf00      	nop
20020a20:	20046f24 	.word	0x20046f24

20020a24 <read_nor>:
20020a24:	460b      	mov	r3, r1
20020a26:	b510      	push	{r4, lr}
20020a28:	4614      	mov	r4, r2
20020a2a:	4601      	mov	r1, r0
20020a2c:	4618      	mov	r0, r3
20020a2e:	f009 fef7 	bl	2002a820 <memcpy>
20020a32:	4620      	mov	r0, r4
20020a34:	bd10      	pop	{r4, pc}
	...

20020a38 <read_nand>:
20020a38:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20020a3c:	2600      	movs	r6, #0
20020a3e:	460f      	mov	r7, r1
20020a40:	4615      	mov	r5, r2
20020a42:	46b0      	mov	r8, r6
20020a44:	4b19      	ldr	r3, [pc, #100]	@ (20020aac <read_nand+0x74>)
20020a46:	f8df a068 	ldr.w	sl, [pc, #104]	@ 20020ab0 <read_nand+0x78>
20020a4a:	681b      	ldr	r3, [r3, #0]
20020a4c:	f8df b064 	ldr.w	fp, [pc, #100]	@ 20020ab4 <read_nand+0x7c>
20020a50:	691b      	ldr	r3, [r3, #16]
20020a52:	4604      	mov	r4, r0
20020a54:	4283      	cmp	r3, r0
20020a56:	b085      	sub	sp, #20
20020a58:	bf98      	it	ls
20020a5a:	1ac4      	subls	r4, r0, r3
20020a5c:	b91d      	cbnz	r5, 20020a66 <read_nand+0x2e>
20020a5e:	4630      	mov	r0, r6
20020a60:	b005      	add	sp, #20
20020a62:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
20020a66:	f8da 1000 	ldr.w	r1, [sl]
20020a6a:	f8db 0000 	ldr.w	r0, [fp]
20020a6e:	42a9      	cmp	r1, r5
20020a70:	fbb0 fcf1 	udiv	ip, r0, r1
20020a74:	4689      	mov	r9, r1
20020a76:	f101 32ff 	add.w	r2, r1, #4294967295
20020a7a:	bf28      	it	cs
20020a7c:	46a9      	movcs	r9, r5
20020a7e:	fbb4 f1f1 	udiv	r1, r4, r1
20020a82:	f10c 3cff 	add.w	ip, ip, #4294967295
20020a86:	fbb4 f0f0 	udiv	r0, r4, r0
20020a8a:	e9cd 8801 	strd	r8, r8, [sp, #4]
20020a8e:	f8cd 9000 	str.w	r9, [sp]
20020a92:	19bb      	adds	r3, r7, r6
20020a94:	4022      	ands	r2, r4
20020a96:	ea0c 0101 	and.w	r1, ip, r1
20020a9a:	f004 fead 	bl	200257f8 <bbm_read_page>
20020a9e:	4548      	cmp	r0, r9
20020aa0:	d1dd      	bne.n	20020a5e <read_nand+0x26>
20020aa2:	4406      	add	r6, r0
20020aa4:	1a2d      	subs	r5, r5, r0
20020aa6:	4404      	add	r4, r0
20020aa8:	e7d8      	b.n	20020a5c <read_nand+0x24>
20020aaa:	bf00      	nop
20020aac:	20046d0c 	.word	0x20046d0c
20020ab0:	20042c04 	.word	0x20042c04
20020ab4:	20042c00 	.word	0x20042c00

20020ab8 <read_sdnand>:
20020ab8:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
20020abc:	f100 461e 	add.w	r6, r0, #2650800128	@ 0x9e000000
20020ac0:	460d      	mov	r5, r1
20020ac2:	4614      	mov	r4, r2
20020ac4:	4617      	mov	r7, r2
20020ac6:	46b0      	mov	r8, r6
20020ac8:	eb02 0901 	add.w	r9, r2, r1
20020acc:	f5b7 7f00 	cmp.w	r7, #512	@ 0x200
20020ad0:	eba9 0107 	sub.w	r1, r9, r7
20020ad4:	d218      	bcs.n	20020b08 <read_sdnand+0x50>
20020ad6:	f3c4 0708 	ubfx	r7, r4, #0, #9
20020ada:	b197      	cbz	r7, 20020b02 <read_sdnand+0x4a>
20020adc:	f424 70ff 	bic.w	r0, r4, #510	@ 0x1fe
20020ae0:	f020 0001 	bic.w	r0, r0, #1
20020ae4:	f44f 7200 	mov.w	r2, #512	@ 0x200
20020ae8:	490c      	ldr	r1, [pc, #48]	@ (20020b1c <read_sdnand+0x64>)
20020aea:	4430      	add	r0, r6
20020aec:	f001 f88a 	bl	20021c04 <sd_read_data>
20020af0:	f424 70ff 	bic.w	r0, r4, #510	@ 0x1fe
20020af4:	f020 0001 	bic.w	r0, r0, #1
20020af8:	463a      	mov	r2, r7
20020afa:	4908      	ldr	r1, [pc, #32]	@ (20020b1c <read_sdnand+0x64>)
20020afc:	4428      	add	r0, r5
20020afe:	f009 fe8f 	bl	2002a820 <memcpy>
20020b02:	4620      	mov	r0, r4
20020b04:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
20020b08:	4640      	mov	r0, r8
20020b0a:	f44f 7200 	mov.w	r2, #512	@ 0x200
20020b0e:	f001 f879 	bl	20021c04 <sd_read_data>
20020b12:	f5a7 7700 	sub.w	r7, r7, #512	@ 0x200
20020b16:	f508 7800 	add.w	r8, r8, #512	@ 0x200
20020b1a:	e7d7      	b.n	20020acc <read_sdnand+0x14>
20020b1c:	20046b08 	.word	0x20046b08

20020b20 <read_sdemmc>:
20020b20:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
20020b24:	f100 461e 	add.w	r6, r0, #2650800128	@ 0x9e000000
20020b28:	460d      	mov	r5, r1
20020b2a:	4614      	mov	r4, r2
20020b2c:	4617      	mov	r7, r2
20020b2e:	46b0      	mov	r8, r6
20020b30:	eb02 0901 	add.w	r9, r2, r1
20020b34:	f5b7 7f00 	cmp.w	r7, #512	@ 0x200
20020b38:	eba9 0107 	sub.w	r1, r9, r7
20020b3c:	d218      	bcs.n	20020b70 <read_sdemmc+0x50>
20020b3e:	f3c4 0708 	ubfx	r7, r4, #0, #9
20020b42:	b197      	cbz	r7, 20020b6a <read_sdemmc+0x4a>
20020b44:	f424 70ff 	bic.w	r0, r4, #510	@ 0x1fe
20020b48:	f020 0001 	bic.w	r0, r0, #1
20020b4c:	f44f 7200 	mov.w	r2, #512	@ 0x200
20020b50:	490c      	ldr	r1, [pc, #48]	@ (20020b84 <read_sdemmc+0x64>)
20020b52:	4430      	add	r0, r6
20020b54:	f000 fe40 	bl	200217d8 <emmc_read_data>
20020b58:	f424 70ff 	bic.w	r0, r4, #510	@ 0x1fe
20020b5c:	f020 0001 	bic.w	r0, r0, #1
20020b60:	463a      	mov	r2, r7
20020b62:	4908      	ldr	r1, [pc, #32]	@ (20020b84 <read_sdemmc+0x64>)
20020b64:	4428      	add	r0, r5
20020b66:	f009 fe5b 	bl	2002a820 <memcpy>
20020b6a:	4620      	mov	r0, r4
20020b6c:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
20020b70:	4640      	mov	r0, r8
20020b72:	f44f 7200 	mov.w	r2, #512	@ 0x200
20020b76:	f000 fe2f 	bl	200217d8 <emmc_read_data>
20020b7a:	f5a7 7700 	sub.w	r7, r7, #512	@ 0x200
20020b7e:	f508 7800 	add.w	r8, r8, #512	@ 0x200
20020b82:	e7d7      	b.n	20020b34 <read_sdemmc+0x14>
20020b84:	20046b08 	.word	0x20046b08

20020b88 <port_read_page>:
20020b88:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
20020b8c:	4615      	mov	r5, r2
20020b8e:	460e      	mov	r6, r1
20020b90:	4928      	ldr	r1, [pc, #160]	@ (20020c34 <port_read_page+0xac>)
20020b92:	461a      	mov	r2, r3
20020b94:	e9dd 3c08 	ldrd	r3, ip, [sp, #32]
20020b98:	680f      	ldr	r7, [r1, #0]
20020b9a:	18e9      	adds	r1, r5, r3
20020b9c:	428f      	cmp	r7, r1
20020b9e:	f8dd e028 	ldr.w	lr, [sp, #40]	@ 0x28
20020ba2:	d200      	bcs.n	20020ba6 <port_read_page+0x1e>
20020ba4:	e7fe      	b.n	20020ba4 <port_read_page+0x1c>
20020ba6:	4924      	ldr	r1, [pc, #144]	@ (20020c38 <port_read_page+0xb0>)
20020ba8:	f107 0980 	add.w	r9, r7, #128	@ 0x80
20020bac:	f1b9 0f00 	cmp.w	r9, #0
20020bb0:	6809      	ldr	r1, [r1, #0]
20020bb2:	dd15      	ble.n	20020be0 <port_read_page+0x58>
20020bb4:	4c21      	ldr	r4, [pc, #132]	@ (20020c3c <port_read_page+0xb4>)
20020bb6:	6d64      	ldr	r4, [r4, #84]	@ 0x54
20020bb8:	f004 081f 	and.w	r8, r4, #31
20020bbc:	44c8      	add	r8, r9
20020bbe:	f3bf 8f4f 	dsb	sy
20020bc2:	f8df a080 	ldr.w	sl, [pc, #128]	@ 20020c44 <port_read_page+0xbc>
20020bc6:	44a0      	add	r8, r4
20020bc8:	f8ca 425c 	str.w	r4, [sl, #604]	@ 0x25c
20020bcc:	3420      	adds	r4, #32
20020bce:	eba8 0904 	sub.w	r9, r8, r4
20020bd2:	f1b9 0f00 	cmp.w	r9, #0
20020bd6:	dcf7      	bgt.n	20020bc8 <port_read_page+0x40>
20020bd8:	f3bf 8f4f 	dsb	sy
20020bdc:	f3bf 8f6f 	isb	sy
20020be0:	07c4      	lsls	r4, r0, #31
20020be2:	d51b      	bpl.n	20020c1c <port_read_page+0x94>
20020be4:	4c15      	ldr	r4, [pc, #84]	@ (20020c3c <port_read_page+0xb4>)
20020be6:	f894 806b 	ldrb.w	r8, [r4, #107]	@ 0x6b
20020bea:	f1b8 0f00 	cmp.w	r8, #0
20020bee:	d015      	beq.n	20020c1c <port_read_page+0x94>
20020bf0:	6d64      	ldr	r4, [r4, #84]	@ 0x54
20020bf2:	f504 5880 	add.w	r8, r4, #4096	@ 0x1000
20020bf6:	f004 041f 	and.w	r4, r4, #31
20020bfa:	f504 6408 	add.w	r4, r4, #2176	@ 0x880
20020bfe:	f3bf 8f4f 	dsb	sy
20020c02:	f8df 9040 	ldr.w	r9, [pc, #64]	@ 20020c44 <port_read_page+0xbc>
20020c06:	3c20      	subs	r4, #32
20020c08:	2c00      	cmp	r4, #0
20020c0a:	f8c9 825c 	str.w	r8, [r9, #604]	@ 0x25c
20020c0e:	f108 0820 	add.w	r8, r8, #32
20020c12:	dcf8      	bgt.n	20020c06 <port_read_page+0x7e>
20020c14:	f3bf 8f4f 	dsb	sy
20020c18:	f3bf 8f6f 	isb	sy
20020c1c:	fb07 5506 	mla	r5, r7, r6, r5
20020c20:	e9cd ce08 	strd	ip, lr, [sp, #32]
20020c24:	fb01 5100 	mla	r1, r1, r0, r5
20020c28:	e8bd 47f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
20020c2c:	4804      	ldr	r0, [pc, #16]	@ (20020c40 <port_read_page+0xb8>)
20020c2e:	f002 be7c 	b.w	2002392a <HAL_NAND_READ_WITHOOB>
20020c32:	bf00      	nop
20020c34:	20042c04 	.word	0x20042c04
20020c38:	20042c00 	.word	0x20042c00
20020c3c:	20046f24 	.word	0x20046f24
20020c40:	20046f68 	.word	0x20046f68
20020c44:	e000ed00 	.word	0xe000ed00

20020c48 <bbm_get_bb>:
20020c48:	b410      	push	{r4}
20020c4a:	4b1c      	ldr	r3, [pc, #112]	@ (20020cbc <bbm_get_bb+0x74>)
20020c4c:	4601      	mov	r1, r0
20020c4e:	6818      	ldr	r0, [r3, #0]
20020c50:	3080      	adds	r0, #128	@ 0x80
20020c52:	2800      	cmp	r0, #0
20020c54:	dd12      	ble.n	20020c7c <bbm_get_bb+0x34>
20020c56:	4b1a      	ldr	r3, [pc, #104]	@ (20020cc0 <bbm_get_bb+0x78>)
20020c58:	6d5b      	ldr	r3, [r3, #84]	@ 0x54
20020c5a:	f003 021f 	and.w	r2, r3, #31
20020c5e:	4402      	add	r2, r0
20020c60:	f3bf 8f4f 	dsb	sy
20020c64:	4c17      	ldr	r4, [pc, #92]	@ (20020cc4 <bbm_get_bb+0x7c>)
20020c66:	441a      	add	r2, r3
20020c68:	f8c4 325c 	str.w	r3, [r4, #604]	@ 0x25c
20020c6c:	3320      	adds	r3, #32
20020c6e:	1ad0      	subs	r0, r2, r3
20020c70:	2800      	cmp	r0, #0
20020c72:	dcf9      	bgt.n	20020c68 <bbm_get_bb+0x20>
20020c74:	f3bf 8f4f 	dsb	sy
20020c78:	f3bf 8f6f 	isb	sy
20020c7c:	07cb      	lsls	r3, r1, #31
20020c7e:	d518      	bpl.n	20020cb2 <bbm_get_bb+0x6a>
20020c80:	4b0f      	ldr	r3, [pc, #60]	@ (20020cc0 <bbm_get_bb+0x78>)
20020c82:	f893 206b 	ldrb.w	r2, [r3, #107]	@ 0x6b
20020c86:	b1a2      	cbz	r2, 20020cb2 <bbm_get_bb+0x6a>
20020c88:	6d5b      	ldr	r3, [r3, #84]	@ 0x54
20020c8a:	f503 5280 	add.w	r2, r3, #4096	@ 0x1000
20020c8e:	f003 031f 	and.w	r3, r3, #31
20020c92:	f503 6308 	add.w	r3, r3, #2176	@ 0x880
20020c96:	f3bf 8f4f 	dsb	sy
20020c9a:	480a      	ldr	r0, [pc, #40]	@ (20020cc4 <bbm_get_bb+0x7c>)
20020c9c:	3b20      	subs	r3, #32
20020c9e:	2b00      	cmp	r3, #0
20020ca0:	f8c0 225c 	str.w	r2, [r0, #604]	@ 0x25c
20020ca4:	f102 0220 	add.w	r2, r2, #32
20020ca8:	dcf8      	bgt.n	20020c9c <bbm_get_bb+0x54>
20020caa:	f3bf 8f4f 	dsb	sy
20020cae:	f3bf 8f6f 	isb	sy
20020cb2:	4805      	ldr	r0, [pc, #20]	@ (20020cc8 <bbm_get_bb+0x80>)
20020cb4:	f85d 4b04 	ldr.w	r4, [sp], #4
20020cb8:	f002 bef8 	b.w	20023aac <HAL_NAND_GET_BADBLK>
20020cbc:	20042c04 	.word	0x20042c04
20020cc0:	20046f24 	.word	0x20046f24
20020cc4:	e000ed00 	.word	0xe000ed00
20020cc8:	20046f68 	.word	0x20046f68

20020ccc <dfu_flash_init>:
20020ccc:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
20020cd0:	b08c      	sub	sp, #48	@ 0x30
20020cd2:	f001 fecd 	bl	20022a70 <HAL_HPAON_EnableXT48>
20020cd6:	2101      	movs	r1, #1
20020cd8:	2000      	movs	r0, #0
20020cda:	f004 f977 	bl	20024fcc <HAL_RCC_HCPU_ClockSelect>
20020cde:	2101      	movs	r1, #1
20020ce0:	200c      	movs	r0, #12
20020ce2:	f004 f973 	bl	20024fcc <HAL_RCC_HCPU_ClockSelect>
20020ce6:	2001      	movs	r0, #1
20020ce8:	f004 f86e 	bl	20024dc8 <HAL_PMU_EnableDLL>
20020cec:	4f9c      	ldr	r7, [pc, #624]	@ (20020f60 <dfu_flash_init+0x294>)
20020cee:	2090      	movs	r0, #144	@ 0x90
20020cf0:	f004 face 	bl	20025290 <HAL_RCC_HCPU_ConfigHCLK>
20020cf4:	2000      	movs	r0, #0
20020cf6:	f001 f980 	bl	20021ffa <HAL_Delay_us>
20020cfa:	683b      	ldr	r3, [r7, #0]
20020cfc:	4d99      	ldr	r5, [pc, #612]	@ (20020f64 <dfu_flash_init+0x298>)
20020cfe:	3b01      	subs	r3, #1
20020d00:	2b05      	cmp	r3, #5
20020d02:	f200 811d 	bhi.w	20020f40 <dfu_flash_init+0x274>
20020d06:	e8df f013 	tbh	[pc, r3, lsl #1]
20020d0a:	0006      	.short	0x0006
20020d0c:	00780006 	.word	0x00780006
20020d10:	00f80078 	.word	0x00f80078
20020d14:	010c      	.short	0x010c
20020d16:	4894      	ldr	r0, [pc, #592]	@ (20020f68 <dfu_flash_init+0x29c>)
20020d18:	f004 f920 	bl	20024f5c <HAL_RCC_HCPU_EnableDLL2>
20020d1c:	4c93      	ldr	r4, [pc, #588]	@ (20020f6c <dfu_flash_init+0x2a0>)
20020d1e:	2006      	movs	r0, #6
20020d20:	f001 f898 	bl	20021e54 <BSP_SetFlash1DIV>
20020d24:	ae07      	add	r6, sp, #28
20020d26:	2102      	movs	r1, #2
20020d28:	2004      	movs	r0, #4
20020d2a:	f004 f94f 	bl	20024fcc <HAL_RCC_HCPU_ClockSelect>
20020d2e:	cc0f      	ldmia	r4!, {r0, r1, r2, r3}
20020d30:	c60f      	stmia	r6!, {r0, r1, r2, r3}
20020d32:	f854 3b04 	ldr.w	r3, [r4], #4
20020d36:	6033      	str	r3, [r6, #0]
20020d38:	ae03      	add	r6, sp, #12
20020d3a:	e894 000f 	ldmia.w	r4, {r0, r1, r2, r3}
20020d3e:	e886 000f 	stmia.w	r6, {r0, r1, r2, r3}
20020d42:	2301      	movs	r3, #1
20020d44:	4c8a      	ldr	r4, [pc, #552]	@ (20020f70 <dfu_flash_init+0x2a4>)
20020d46:	f884 3035 	strb.w	r3, [r4, #53]	@ 0x35
20020d4a:	2300      	movs	r3, #0
20020d4c:	9308      	str	r3, [sp, #32]
20020d4e:	683b      	ldr	r3, [r7, #0]
20020d50:	2b01      	cmp	r3, #1
20020d52:	d14d      	bne.n	20020df0 <dfu_flash_init+0x124>
20020d54:	f7ff fadc 	bl	20020310 <board_pinmux_mpi1_puya_base>
20020d58:	f001 f870 	bl	20021e3c <BSP_GetFlash1DIV>
20020d5c:	4633      	mov	r3, r6
20020d5e:	9000      	str	r0, [sp, #0]
20020d60:	4a84      	ldr	r2, [pc, #528]	@ (20020f74 <dfu_flash_init+0x2a8>)
20020d62:	4883      	ldr	r0, [pc, #524]	@ (20020f70 <dfu_flash_init+0x2a4>)
20020d64:	a907      	add	r1, sp, #28
20020d66:	f003 f879 	bl	20023e5c <HAL_FLASH_Init>
20020d6a:	683e      	ldr	r6, [r7, #0]
20020d6c:	2e01      	cmp	r6, #1
20020d6e:	d10d      	bne.n	20020d8c <dfu_flash_init+0xc0>
20020d70:	6b20      	ldr	r0, [r4, #48]	@ 0x30
20020d72:	4b81      	ldr	r3, [pc, #516]	@ (20020f78 <dfu_flash_init+0x2ac>)
20020d74:	1ac3      	subs	r3, r0, r3
20020d76:	4258      	negs	r0, r3
20020d78:	4158      	adcs	r0, r3
20020d7a:	f7ff faea 	bl	20020352 <board_pinmux_mpi1_puya_ext>
20020d7e:	4631      	mov	r1, r6
20020d80:	487b      	ldr	r0, [pc, #492]	@ (20020f70 <dfu_flash_init+0x2a4>)
20020d82:	f002 fae0 	bl	20023346 <HAL_FLASH_SET_QUAL_SPI>
20020d86:	2302      	movs	r3, #2
20020d88:	f884 3020 	strb.w	r3, [r4, #32]
20020d8c:	4b7b      	ldr	r3, [pc, #492]	@ (20020f7c <dfu_flash_init+0x2b0>)
20020d8e:	4a7c      	ldr	r2, [pc, #496]	@ (20020f80 <dfu_flash_init+0x2b4>)
20020d90:	602b      	str	r3, [r5, #0]
20020d92:	4b7c      	ldr	r3, [pc, #496]	@ (20020f84 <dfu_flash_init+0x2b8>)
20020d94:	601a      	str	r2, [r3, #0]
20020d96:	4b7c      	ldr	r3, [pc, #496]	@ (20020f88 <dfu_flash_init+0x2bc>)
20020d98:	4a7c      	ldr	r2, [pc, #496]	@ (20020f8c <dfu_flash_init+0x2c0>)
20020d9a:	601a      	str	r2, [r3, #0]
20020d9c:	4b7c      	ldr	r3, [pc, #496]	@ (20020f90 <dfu_flash_init+0x2c4>)
20020d9e:	6ba2      	ldr	r2, [r4, #56]	@ 0x38
20020da0:	601a      	str	r2, [r3, #0]
20020da2:	4b7c      	ldr	r3, [pc, #496]	@ (20020f94 <dfu_flash_init+0x2c8>)
20020da4:	601c      	str	r4, [r3, #0]
20020da6:	2405      	movs	r4, #5
20020da8:	f8df 81ec 	ldr.w	r8, [pc, #492]	@ 20020f98 <dfu_flash_init+0x2cc>
20020dac:	4e78      	ldr	r6, [pc, #480]	@ (20020f90 <dfu_flash_init+0x2c4>)
20020dae:	f8df 921c 	ldr.w	r9, [pc, #540]	@ 20020fcc <dfu_flash_init+0x300>
20020db2:	682b      	ldr	r3, [r5, #0]
20020db4:	f642 4210 	movw	r2, #11280	@ 0x2c10
20020db8:	4977      	ldr	r1, [pc, #476]	@ (20020f98 <dfu_flash_init+0x2cc>)
20020dba:	6830      	ldr	r0, [r6, #0]
20020dbc:	4798      	blx	r3
20020dbe:	f8d8 3000 	ldr.w	r3, [r8]
20020dc2:	454b      	cmp	r3, r9
20020dc4:	f040 80c0 	bne.w	20020f48 <dfu_flash_init+0x27c>
20020dc8:	683b      	ldr	r3, [r7, #0]
20020dca:	2b04      	cmp	r3, #4
20020dcc:	f040 8085 	bne.w	20020eda <dfu_flash_init+0x20e>
20020dd0:	f8d8 30a4 	ldr.w	r3, [r8, #164]	@ 0xa4
20020dd4:	1e5a      	subs	r2, r3, #1
20020dd6:	3203      	adds	r2, #3
20020dd8:	d87f      	bhi.n	20020eda <dfu_flash_init+0x20e>
20020dda:	4a70      	ldr	r2, [pc, #448]	@ (20020f9c <dfu_flash_init+0x2d0>)
20020ddc:	496e      	ldr	r1, [pc, #440]	@ (20020f98 <dfu_flash_init+0x2cc>)
20020dde:	6013      	str	r3, [r2, #0]
20020de0:	f642 4210 	movw	r2, #11280	@ 0x2c10
20020de4:	682b      	ldr	r3, [r5, #0]
20020de6:	6830      	ldr	r0, [r6, #0]
20020de8:	b00c      	add	sp, #48	@ 0x30
20020dea:	e8bd 47f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
20020dee:	4718      	bx	r3
20020df0:	f7ff fade 	bl	200203b0 <board_pinmux_mpi1_gd>
20020df4:	2302      	movs	r3, #2
20020df6:	9308      	str	r3, [sp, #32]
20020df8:	e7ae      	b.n	20020d58 <dfu_flash_init+0x8c>
20020dfa:	485b      	ldr	r0, [pc, #364]	@ (20020f68 <dfu_flash_init+0x29c>)
20020dfc:	f004 f8ae 	bl	20024f5c <HAL_RCC_HCPU_EnableDLL2>
20020e00:	4c67      	ldr	r4, [pc, #412]	@ (20020fa0 <dfu_flash_init+0x2d4>)
20020e02:	2006      	movs	r0, #6
20020e04:	f001 f82c 	bl	20021e60 <BSP_SetFlash2DIV>
20020e08:	ae07      	add	r6, sp, #28
20020e0a:	2102      	movs	r1, #2
20020e0c:	2006      	movs	r0, #6
20020e0e:	f004 f8dd 	bl	20024fcc <HAL_RCC_HCPU_ClockSelect>
20020e12:	cc0f      	ldmia	r4!, {r0, r1, r2, r3}
20020e14:	c60f      	stmia	r6!, {r0, r1, r2, r3}
20020e16:	f854 3b04 	ldr.w	r3, [r4], #4
20020e1a:	f8d7 8000 	ldr.w	r8, [r7]
20020e1e:	6033      	str	r3, [r6, #0]
20020e20:	ae03      	add	r6, sp, #12
20020e22:	e894 000f 	ldmia.w	r4, {r0, r1, r2, r3}
20020e26:	f1b8 0903 	subs.w	r9, r8, #3
20020e2a:	e886 000f 	stmia.w	r6, {r0, r1, r2, r3}
20020e2e:	bf18      	it	ne
20020e30:	f04f 0901 	movne.w	r9, #1
20020e34:	f7ff faff 	bl	20020436 <board_pinmux_mpi2>
20020e38:	2302      	movs	r3, #2
20020e3a:	f1b8 0f03 	cmp.w	r8, #3
20020e3e:	4c4c      	ldr	r4, [pc, #304]	@ (20020f70 <dfu_flash_init+0x2a4>)
20020e40:	9308      	str	r3, [sp, #32]
20020e42:	d04d      	beq.n	20020ee0 <dfu_flash_init+0x214>
20020e44:	4b57      	ldr	r3, [pc, #348]	@ (20020fa4 <dfu_flash_init+0x2d8>)
20020e46:	602b      	str	r3, [r5, #0]
20020e48:	9b09      	ldr	r3, [sp, #36]	@ 0x24
20020e4a:	f103 43a0 	add.w	r3, r3, #1342177280	@ 0x50000000
20020e4e:	9309      	str	r3, [sp, #36]	@ 0x24
20020e50:	2301      	movs	r3, #1
20020e52:	930b      	str	r3, [sp, #44]	@ 0x2c
20020e54:	4b54      	ldr	r3, [pc, #336]	@ (20020fa8 <dfu_flash_init+0x2dc>)
20020e56:	6623      	str	r3, [r4, #96]	@ 0x60
20020e58:	f04f 0a01 	mov.w	sl, #1
20020e5c:	2000      	movs	r0, #0
20020e5e:	f001 f8cc 	bl	20021ffa <HAL_Delay_us>
20020e62:	f884 a079 	strb.w	sl, [r4, #121]	@ 0x79
20020e66:	f884 9078 	strb.w	r9, [r4, #120]	@ 0x78
20020e6a:	f000 ffed 	bl	20021e48 <BSP_GetFlash2DIV>
20020e6e:	4633      	mov	r3, r6
20020e70:	9000      	str	r0, [sp, #0]
20020e72:	4a4e      	ldr	r2, [pc, #312]	@ (20020fac <dfu_flash_init+0x2e0>)
20020e74:	484e      	ldr	r0, [pc, #312]	@ (20020fb0 <dfu_flash_init+0x2e4>)
20020e76:	a907      	add	r1, sp, #28
20020e78:	f002 fff0 	bl	20023e5c <HAL_FLASH_Init>
20020e7c:	4e4c      	ldr	r6, [pc, #304]	@ (20020fb0 <dfu_flash_init+0x2e4>)
20020e7e:	bb90      	cbnz	r0, 20020ee6 <dfu_flash_init+0x21a>
20020e80:	f1b8 0f03 	cmp.w	r8, #3
20020e84:	d032      	beq.n	20020eec <dfu_flash_init+0x220>
20020e86:	4630      	mov	r0, r6
20020e88:	f002 fd44 	bl	20023914 <HAL_NAND_PAGE_SIZE>
20020e8c:	f8df 910c 	ldr.w	r9, [pc, #268]	@ 20020f9c <dfu_flash_init+0x2d0>
20020e90:	f8df 813c 	ldr.w	r8, [pc, #316]	@ 20020fd0 <dfu_flash_init+0x304>
20020e94:	f8c9 0000 	str.w	r0, [r9]
20020e98:	4630      	mov	r0, r6
20020e9a:	f002 fdfb 	bl	20023a94 <HAL_NAND_BLOCK_SIZE>
20020e9e:	4651      	mov	r1, sl
20020ea0:	f8c8 0000 	str.w	r0, [r8]
20020ea4:	4630      	mov	r0, r6
20020ea6:	f884 a06a 	strb.w	sl, [r4, #106]	@ 0x6a
20020eaa:	f002 fc0c 	bl	200236c6 <HAL_NAND_CONF_ECC>
20020eae:	f8d9 0000 	ldr.w	r0, [r9]
20020eb2:	f004 ff89 	bl	20025dc8 <bbm_set_page_size>
20020eb6:	f8d8 0000 	ldr.w	r0, [r8]
20020eba:	f004 ff8b 	bl	20025dd4 <bbm_set_blk_size>
20020ebe:	493d      	ldr	r1, [pc, #244]	@ (20020fb4 <dfu_flash_init+0x2e8>)
20020ec0:	f8d4 0080 	ldr.w	r0, [r4, #128]	@ 0x80
20020ec4:	f004 fe22 	bl	20025b0c <sif_bbm_init>
20020ec8:	4b31      	ldr	r3, [pc, #196]	@ (20020f90 <dfu_flash_init+0x2c4>)
20020eca:	6fe2      	ldr	r2, [r4, #124]	@ 0x7c
20020ecc:	601a      	str	r2, [r3, #0]
20020ece:	4b31      	ldr	r3, [pc, #196]	@ (20020f94 <dfu_flash_init+0x2c8>)
20020ed0:	601e      	str	r6, [r3, #0]
20020ed2:	682b      	ldr	r3, [r5, #0]
20020ed4:	2b00      	cmp	r3, #0
20020ed6:	f47f af66 	bne.w	20020da6 <dfu_flash_init+0xda>
20020eda:	b00c      	add	sp, #48	@ 0x30
20020edc:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
20020ee0:	4b26      	ldr	r3, [pc, #152]	@ (20020f7c <dfu_flash_init+0x2b0>)
20020ee2:	602b      	str	r3, [r5, #0]
20020ee4:	e7b8      	b.n	20020e58 <dfu_flash_init+0x18c>
20020ee6:	f1b8 0f03 	cmp.w	r8, #3
20020eea:	d1ed      	bne.n	20020ec8 <dfu_flash_init+0x1fc>
20020eec:	4b25      	ldr	r3, [pc, #148]	@ (20020f84 <dfu_flash_init+0x2b8>)
20020eee:	4a24      	ldr	r2, [pc, #144]	@ (20020f80 <dfu_flash_init+0x2b4>)
20020ef0:	601a      	str	r2, [r3, #0]
20020ef2:	4b25      	ldr	r3, [pc, #148]	@ (20020f88 <dfu_flash_init+0x2bc>)
20020ef4:	4a25      	ldr	r2, [pc, #148]	@ (20020f8c <dfu_flash_init+0x2c0>)
20020ef6:	601a      	str	r2, [r3, #0]
20020ef8:	e7e6      	b.n	20020ec8 <dfu_flash_init+0x1fc>
20020efa:	481b      	ldr	r0, [pc, #108]	@ (20020f68 <dfu_flash_init+0x29c>)
20020efc:	f004 f82e 	bl	20024f5c <HAL_RCC_HCPU_EnableDLL2>
20020f00:	f7ff fac0 	bl	20020484 <board_pinmux_sd>
20020f04:	f000 fd52 	bl	200219ac <sdmmc1_sdnand>
20020f08:	2801      	cmp	r0, #1
20020f0a:	d001      	beq.n	20020f10 <dfu_flash_init+0x244>
20020f0c:	f7ff f9d0 	bl	200202b0 <boot_error>
20020f10:	4b29      	ldr	r3, [pc, #164]	@ (20020fb8 <dfu_flash_init+0x2ec>)
20020f12:	4a2a      	ldr	r2, [pc, #168]	@ (20020fbc <dfu_flash_init+0x2f0>)
20020f14:	602b      	str	r3, [r5, #0]
20020f16:	4b1e      	ldr	r3, [pc, #120]	@ (20020f90 <dfu_flash_init+0x2c4>)
20020f18:	601a      	str	r2, [r3, #0]
20020f1a:	2200      	movs	r2, #0
20020f1c:	4b1d      	ldr	r3, [pc, #116]	@ (20020f94 <dfu_flash_init+0x2c8>)
20020f1e:	601a      	str	r2, [r3, #0]
20020f20:	e741      	b.n	20020da6 <dfu_flash_init+0xda>
20020f22:	4811      	ldr	r0, [pc, #68]	@ (20020f68 <dfu_flash_init+0x29c>)
20020f24:	f004 f81a 	bl	20024f5c <HAL_RCC_HCPU_EnableDLL2>
20020f28:	f7ff faac 	bl	20020484 <board_pinmux_sd>
20020f2c:	f000 fb2e 	bl	2002158c <sdio_emmc_init>
20020f30:	4b23      	ldr	r3, [pc, #140]	@ (20020fc0 <dfu_flash_init+0x2f4>)
20020f32:	6018      	str	r0, [r3, #0]
20020f34:	b110      	cbz	r0, 20020f3c <dfu_flash_init+0x270>
20020f36:	b2c0      	uxtb	r0, r0
20020f38:	f7ff f9ba 	bl	200202b0 <boot_error>
20020f3c:	4b21      	ldr	r3, [pc, #132]	@ (20020fc4 <dfu_flash_init+0x2f8>)
20020f3e:	e7e8      	b.n	20020f12 <dfu_flash_init+0x246>
20020f40:	2053      	movs	r0, #83	@ 0x53
20020f42:	f7ff f9b5 	bl	200202b0 <boot_error>
20020f46:	e7c4      	b.n	20020ed2 <dfu_flash_init+0x206>
20020f48:	481f      	ldr	r0, [pc, #124]	@ (20020fc8 <dfu_flash_init+0x2fc>)
20020f4a:	f001 f856 	bl	20021ffa <HAL_Delay_us>
20020f4e:	3c01      	subs	r4, #1
20020f50:	f47f af2f 	bne.w	20020db2 <dfu_flash_init+0xe6>
20020f54:	2043      	movs	r0, #67	@ 0x43
20020f56:	b00c      	add	sp, #48	@ 0x30
20020f58:	e8bd 47f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
20020f5c:	f7ff b9a8 	b.w	200202b0 <boot_error>
20020f60:	20049f28 	.word	0x20049f28
20020f64:	20046d18 	.word	0x20046d18
20020f68:	112a8800 	.word	0x112a8800
20020f6c:	2002a8f0 	.word	0x2002a8f0
20020f70:	20046f24 	.word	0x20046f24
20020f74:	20046d1c 	.word	0x20046d1c
20020f78:	00176085 	.word	0x00176085
20020f7c:	20020a25 	.word	0x20020a25
20020f80:	20020999 	.word	0x20020999
20020f84:	20046d14 	.word	0x20046d14
20020f88:	20046d10 	.word	0x20046d10
20020f8c:	2002093d 	.word	0x2002093d
20020f90:	20046d08 	.word	0x20046d08
20020f94:	20046d0c 	.word	0x20046d0c
20020f98:	20047318 	.word	0x20047318
20020f9c:	20042c04 	.word	0x20042c04
20020fa0:	2002a914 	.word	0x2002a914
20020fa4:	20020a39 	.word	0x20020a39
20020fa8:	20045a88 	.word	0x20045a88
20020fac:	20046d84 	.word	0x20046d84
20020fb0:	20046f68 	.word	0x20046f68
20020fb4:	20044a08 	.word	0x20044a08
20020fb8:	20020ab9 	.word	0x20020ab9
20020fbc:	62001000 	.word	0x62001000
20020fc0:	20044a04 	.word	0x20044a04
20020fc4:	20020b21 	.word	0x20020b21
20020fc8:	000f4240 	.word	0x000f4240
20020fcc:	53454346 	.word	0x53454346
20020fd0:	20042c00 	.word	0x20042c00

20020fd4 <sifli_hw_efuse_read_bank>:
20020fd4:	2803      	cmp	r0, #3
20020fd6:	b508      	push	{r3, lr}
20020fd8:	d80c      	bhi.n	20020ff4 <sifli_hw_efuse_read_bank+0x20>
20020fda:	0200      	lsls	r0, r0, #8
20020fdc:	2220      	movs	r2, #32
20020fde:	4907      	ldr	r1, [pc, #28]	@ (20020ffc <sifli_hw_efuse_read_bank+0x28>)
20020fe0:	f400 407f 	and.w	r0, r0, #65280	@ 0xff00
20020fe4:	f001 fcb0 	bl	20022948 <HAL_EFUSE_Read>
20020fe8:	2800      	cmp	r0, #0
20020fea:	bf0c      	ite	eq
20020fec:	f06f 0001 	mvneq.w	r0, #1
20020ff0:	2000      	movne	r0, #0
20020ff2:	bd08      	pop	{r3, pc}
20020ff4:	f04f 30ff 	mov.w	r0, #4294967295
20020ff8:	e7fb      	b.n	20020ff2 <sifli_hw_efuse_read_bank+0x1e>
20020ffa:	bf00      	nop
20020ffc:	20047298 	.word	0x20047298

20021000 <sifli_hw_efuse_read>:
20021000:	b513      	push	{r0, r1, r4, lr}
20021002:	3801      	subs	r0, #1
20021004:	460c      	mov	r4, r1
20021006:	2803      	cmp	r0, #3
20021008:	d81e      	bhi.n	20021048 <sifli_hw_efuse_read+0x48>
2002100a:	e8df f000 	tbb	[pc, r0]
2002100e:	0c02      	.short	0x0c02
20021010:	1009      	.short	0x1009
20021012:	2210      	movs	r2, #16
20021014:	2000      	movs	r0, #0
20021016:	b002      	add	sp, #8
20021018:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
2002101c:	f001 bc94 	b.w	20022948 <HAL_EFUSE_Read>
20021020:	2208      	movs	r2, #8
20021022:	2080      	movs	r0, #128	@ 0x80
20021024:	e7f7      	b.n	20021016 <sifli_hw_efuse_read+0x16>
20021026:	2220      	movs	r2, #32
20021028:	f44f 7040 	mov.w	r0, #768	@ 0x300
2002102c:	e7f3      	b.n	20021016 <sifli_hw_efuse_read+0x16>
2002102e:	2204      	movs	r2, #4
20021030:	20c0      	movs	r0, #192	@ 0xc0
20021032:	eb0d 0102 	add.w	r1, sp, r2
20021036:	f001 fc87 	bl	20022948 <HAL_EFUSE_Read>
2002103a:	2804      	cmp	r0, #4
2002103c:	d104      	bne.n	20021048 <sifli_hw_efuse_read+0x48>
2002103e:	2001      	movs	r0, #1
20021040:	9b01      	ldr	r3, [sp, #4]
20021042:	7023      	strb	r3, [r4, #0]
20021044:	b002      	add	sp, #8
20021046:	bd10      	pop	{r4, pc}
20021048:	2000      	movs	r0, #0
2002104a:	e7fb      	b.n	20021044 <sifli_hw_efuse_read+0x44>

2002104c <sifli_hw_init_xip_key>:
2002104c:	b538      	push	{r3, r4, r5, lr}
2002104e:	4605      	mov	r5, r0
20021050:	4c0f      	ldr	r4, [pc, #60]	@ (20021090 <sifli_hw_init_xip_key+0x44>)
20021052:	2210      	movs	r2, #16
20021054:	68e3      	ldr	r3, [r4, #12]
20021056:	490f      	ldr	r1, [pc, #60]	@ (20021094 <sifli_hw_init_xip_key+0x48>)
20021058:	f043 0301 	orr.w	r3, r3, #1
2002105c:	60e3      	str	r3, [r4, #12]
2002105e:	2001      	movs	r0, #1
20021060:	f7ff ffce 	bl	20021000 <sifli_hw_efuse_read>
20021064:	2220      	movs	r2, #32
20021066:	2100      	movs	r1, #0
20021068:	480b      	ldr	r0, [pc, #44]	@ (20021098 <sifli_hw_init_xip_key+0x4c>)
2002106a:	f009 fbbf 	bl	2002a7ec <memset>
2002106e:	2302      	movs	r3, #2
20021070:	2120      	movs	r1, #32
20021072:	4a08      	ldr	r2, [pc, #32]	@ (20021094 <sifli_hw_init_xip_key+0x48>)
20021074:	2000      	movs	r0, #0
20021076:	f001 f839 	bl	200220ec <HAL_AES_init>
2002107a:	2320      	movs	r3, #32
2002107c:	4629      	mov	r1, r5
2002107e:	2000      	movs	r0, #0
20021080:	4a05      	ldr	r2, [pc, #20]	@ (20021098 <sifli_hw_init_xip_key+0x4c>)
20021082:	f001 f877 	bl	20022174 <HAL_AES_run>
20021086:	68e3      	ldr	r3, [r4, #12]
20021088:	f023 0301 	bic.w	r3, r3, #1
2002108c:	60e3      	str	r3, [r4, #12]
2002108e:	bd38      	pop	{r3, r4, r5, pc}
20021090:	5000b000 	.word	0x5000b000
20021094:	200472c8 	.word	0x200472c8
20021098:	20047278 	.word	0x20047278

2002109c <sifli_hw_dec_key>:
2002109c:	b538      	push	{r3, r4, r5, lr}
2002109e:	4604      	mov	r4, r0
200210a0:	460d      	mov	r5, r1
200210a2:	2210      	movs	r2, #16
200210a4:	4908      	ldr	r1, [pc, #32]	@ (200210c8 <sifli_hw_dec_key+0x2c>)
200210a6:	2001      	movs	r0, #1
200210a8:	f7ff ffaa 	bl	20021000 <sifli_hw_efuse_read>
200210ac:	2302      	movs	r3, #2
200210ae:	2120      	movs	r1, #32
200210b0:	4a05      	ldr	r2, [pc, #20]	@ (200210c8 <sifli_hw_dec_key+0x2c>)
200210b2:	2000      	movs	r0, #0
200210b4:	f001 f81a 	bl	200220ec <HAL_AES_init>
200210b8:	2320      	movs	r3, #32
200210ba:	462a      	mov	r2, r5
200210bc:	4621      	mov	r1, r4
200210be:	2000      	movs	r0, #0
200210c0:	f001 f858 	bl	20022174 <HAL_AES_run>
200210c4:	2000      	movs	r0, #0
200210c6:	bd38      	pop	{r3, r4, r5, pc}
200210c8:	200472c8 	.word	0x200472c8

200210cc <dfu_get_counter>:
200210cc:	b538      	push	{r3, r4, r5, lr}
200210ce:	4d0a      	ldr	r5, [pc, #40]	@ (200210f8 <dfu_get_counter+0x2c>)
200210d0:	4604      	mov	r4, r0
200210d2:	2208      	movs	r2, #8
200210d4:	4629      	mov	r1, r5
200210d6:	2003      	movs	r0, #3
200210d8:	f7ff ff92 	bl	20021000 <sifli_hw_efuse_read>
200210dc:	2300      	movs	r3, #0
200210de:	e9c5 3302 	strd	r3, r3, [r5, #8]
200210e2:	230f      	movs	r3, #15
200210e4:	0924      	lsrs	r4, r4, #4
200210e6:	b12c      	cbz	r4, 200210f4 <dfu_get_counter+0x28>
200210e8:	54ec      	strb	r4, [r5, r3]
200210ea:	3b01      	subs	r3, #1
200210ec:	2b0b      	cmp	r3, #11
200210ee:	ea4f 2414 	mov.w	r4, r4, lsr #8
200210f2:	d1f8      	bne.n	200210e6 <dfu_get_counter+0x1a>
200210f4:	4800      	ldr	r0, [pc, #0]	@ (200210f8 <dfu_get_counter+0x2c>)
200210f6:	bd38      	pop	{r3, r4, r5, pc}
200210f8:	200472b8 	.word	0x200472b8

200210fc <sifli_hw_dec>:
200210fc:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
20021100:	4680      	mov	r8, r0
20021102:	4689      	mov	r9, r1
20021104:	4692      	mov	sl, r2
20021106:	2100      	movs	r1, #0
20021108:	f44f 7200 	mov.w	r2, #512	@ 0x200
2002110c:	4814      	ldr	r0, [pc, #80]	@ (20021160 <sifli_hw_dec+0x64>)
2002110e:	461e      	mov	r6, r3
20021110:	9f08      	ldr	r7, [sp, #32]
20021112:	2400      	movs	r4, #0
20021114:	f009 fb6a 	bl	2002a7ec <memset>
20021118:	42a6      	cmp	r6, r4
2002111a:	d802      	bhi.n	20021122 <sifli_hw_dec+0x26>
2002111c:	4620      	mov	r0, r4
2002111e:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
20021122:	1b35      	subs	r5, r6, r4
20021124:	f5b5 7f00 	cmp.w	r5, #512	@ 0x200
20021128:	bf28      	it	cs
2002112a:	f44f 7500 	movcs.w	r5, #512	@ 0x200
2002112e:	eb09 0104 	add.w	r1, r9, r4
20021132:	462a      	mov	r2, r5
20021134:	480a      	ldr	r0, [pc, #40]	@ (20021160 <sifli_hw_dec+0x64>)
20021136:	f009 fb73 	bl	2002a820 <memcpy>
2002113a:	19e0      	adds	r0, r4, r7
2002113c:	f7ff ffc6 	bl	200210cc <dfu_get_counter>
20021140:	2301      	movs	r3, #1
20021142:	4602      	mov	r2, r0
20021144:	2120      	movs	r1, #32
20021146:	4640      	mov	r0, r8
20021148:	f000 ffd0 	bl	200220ec <HAL_AES_init>
2002114c:	eb0a 0204 	add.w	r2, sl, r4
20021150:	462b      	mov	r3, r5
20021152:	2000      	movs	r0, #0
20021154:	4902      	ldr	r1, [pc, #8]	@ (20021160 <sifli_hw_dec+0x64>)
20021156:	f001 f80d 	bl	20022174 <HAL_AES_run>
2002115a:	442c      	add	r4, r5
2002115c:	e7dc      	b.n	20021118 <sifli_hw_dec+0x1c>
2002115e:	bf00      	nop
20021160:	20047078 	.word	0x20047078

20021164 <update_sec_flash>:
20021164:	b510      	push	{r4, lr}
20021166:	4604      	mov	r4, r0
20021168:	4b08      	ldr	r3, [pc, #32]	@ (2002118c <update_sec_flash+0x28>)
2002116a:	f44f 5140 	mov.w	r1, #12288	@ 0x3000
2002116e:	681b      	ldr	r3, [r3, #0]
20021170:	f04f 5090 	mov.w	r0, #301989888	@ 0x12000000
20021174:	4798      	blx	r3
20021176:	4b06      	ldr	r3, [pc, #24]	@ (20021190 <update_sec_flash+0x2c>)
20021178:	4621      	mov	r1, r4
2002117a:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
2002117e:	f642 4210 	movw	r2, #11280	@ 0x2c10
20021182:	f04f 5090 	mov.w	r0, #301989888	@ 0x12000000
20021186:	681b      	ldr	r3, [r3, #0]
20021188:	4718      	bx	r3
2002118a:	bf00      	nop
2002118c:	20046d10 	.word	0x20046d10
20021190:	20046d18 	.word	0x20046d18

20021194 <boot_ram>:
20021194:	4b05      	ldr	r3, [pc, #20]	@ (200211ac <boot_ram+0x18>)
20021196:	b082      	sub	sp, #8
20021198:	6b9b      	ldr	r3, [r3, #56]	@ 0x38
2002119a:	9301      	str	r3, [sp, #4]
2002119c:	9b01      	ldr	r3, [sp, #4]
2002119e:	b113      	cbz	r3, 200211a6 <boot_ram+0x12>
200211a0:	9b01      	ldr	r3, [sp, #4]
200211a2:	b002      	add	sp, #8
200211a4:	4718      	bx	r3
200211a6:	b002      	add	sp, #8
200211a8:	4770      	bx	lr
200211aa:	bf00      	nop
200211ac:	500c0000 	.word	0x500c0000

200211b0 <is_addr_in_nor>:
200211b0:	4b09      	ldr	r3, [pc, #36]	@ (200211d8 <is_addr_in_nor+0x28>)
200211b2:	4602      	mov	r2, r0
200211b4:	681b      	ldr	r3, [r3, #0]
200211b6:	b163      	cbz	r3, 200211d2 <is_addr_in_nor+0x22>
200211b8:	f893 0023 	ldrb.w	r0, [r3, #35]	@ 0x23
200211bc:	b948      	cbnz	r0, 200211d2 <is_addr_in_nor+0x22>
200211be:	6919      	ldr	r1, [r3, #16]
200211c0:	4291      	cmp	r1, r2
200211c2:	d807      	bhi.n	200211d4 <is_addr_in_nor+0x24>
200211c4:	695b      	ldr	r3, [r3, #20]
200211c6:	4419      	add	r1, r3
200211c8:	4291      	cmp	r1, r2
200211ca:	bf94      	ite	ls
200211cc:	2000      	movls	r0, #0
200211ce:	2001      	movhi	r0, #1
200211d0:	4770      	bx	lr
200211d2:	2000      	movs	r0, #0
200211d4:	4770      	bx	lr
200211d6:	bf00      	nop
200211d8:	20046d0c 	.word	0x20046d0c

200211dc <dfu_boot_img_in_flash>:
200211dc:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
200211e0:	4f5e      	ldr	r7, [pc, #376]	@ (2002135c <dfu_boot_img_in_flash+0x180>)
200211e2:	1e84      	subs	r4, r0, #2
200211e4:	eb07 1300 	add.w	r3, r7, r0, lsl #4
200211e8:	eb07 2040 	add.w	r0, r7, r0, lsl #9
200211ec:	f8d3 8004 	ldr.w	r8, [r3, #4]
200211f0:	68dd      	ldr	r5, [r3, #12]
200211f2:	f8b0 3c06 	ldrh.w	r3, [r0, #3078]	@ 0xc06
200211f6:	b085      	sub	sp, #20
200211f8:	07db      	lsls	r3, r3, #31
200211fa:	f140 8095 	bpl.w	20021328 <dfu_boot_img_in_flash+0x14c>
200211fe:	f44f 7193 	mov.w	r1, #294	@ 0x126
20021202:	f507 7082 	add.w	r0, r7, #260	@ 0x104
20021206:	f000 fdb2 	bl	20021d6e <sifli_sigkey_pub_verify>
2002120a:	b110      	cbz	r0, 20021212 <dfu_boot_img_in_flash+0x36>
2002120c:	2001      	movs	r0, #1
2002120e:	f000 fdfb 	bl	20021e08 <sifli_secboot_exception>
20021212:	2c07      	cmp	r4, #7
20021214:	f300 8093 	bgt.w	2002133e <dfu_boot_img_in_flash+0x162>
20021218:	2003      	movs	r0, #3
2002121a:	f7ff fedb 	bl	20020fd4 <sifli_hw_efuse_read_bank>
2002121e:	4262      	negs	r2, r4
20021220:	f002 0203 	and.w	r2, r2, #3
20021224:	f004 0303 	and.w	r3, r4, #3
20021228:	bf58      	it	pl
2002122a:	4253      	negpl	r3, r2
2002122c:	2b02      	cmp	r3, #2
2002122e:	f200 8086 	bhi.w	2002133e <dfu_boot_img_in_flash+0x162>
20021232:	4628      	mov	r0, r5
20021234:	f7ff ffbc 	bl	200211b0 <is_addr_in_nor>
20021238:	f241 0308 	movw	r3, #4104	@ 0x1008
2002123c:	4682      	mov	sl, r0
2002123e:	ea4f 2944 	mov.w	r9, r4, lsl #9
20021242:	f8df c12c 	ldr.w	ip, [pc, #300]	@ 20021370 <dfu_boot_img_in_flash+0x194>
20021246:	eb07 0609 	add.w	r6, r7, r9
2002124a:	441e      	add	r6, r3
2002124c:	ce0f      	ldmia	r6!, {r0, r1, r2, r3}
2002124e:	e8ac 000f 	stmia.w	ip!, {r0, r1, r2, r3}
20021252:	e896 000f 	ldmia.w	r6, {r0, r1, r2, r3}
20021256:	e88c 000f 	stmia.w	ip, {r0, r1, r2, r3}
2002125a:	f1ba 0f00 	cmp.w	sl, #0
2002125e:	d04b      	beq.n	200212f8 <dfu_boot_img_in_flash+0x11c>
20021260:	f104 0608 	add.w	r6, r4, #8
20021264:	f1ac 0010 	sub.w	r0, ip, #16
20021268:	0276      	lsls	r6, r6, #9
2002126a:	f7ff feef 	bl	2002104c <sifli_hw_init_xip_key>
2002126e:	59ba      	ldr	r2, [r7, r6]
20021270:	f8df a0f0 	ldr.w	sl, [pc, #240]	@ 20021364 <dfu_boot_img_in_flash+0x188>
20021274:	442a      	add	r2, r5
20021276:	2000      	movs	r0, #0
20021278:	f8da b000 	ldr.w	fp, [sl]
2002127c:	9203      	str	r2, [sp, #12]
2002127e:	f7ff ff25 	bl	200210cc <dfu_get_counter>
20021282:	4629      	mov	r1, r5
20021284:	4603      	mov	r3, r0
20021286:	9a03      	ldr	r2, [sp, #12]
20021288:	4658      	mov	r0, fp
2002128a:	f002 f9ca 	bl	20023622 <HAL_FLASH_NONCE_CFG>
2002128e:	4629      	mov	r1, r5
20021290:	f8da 0000 	ldr.w	r0, [sl]
20021294:	59ba      	ldr	r2, [r7, r6]
20021296:	eba8 0305 	sub.w	r3, r8, r5
2002129a:	f002 f9b1 	bl	20023600 <HAL_FLASH_ALIAS_CFG>
2002129e:	2101      	movs	r1, #1
200212a0:	f8da 0000 	ldr.w	r0, [sl]
200212a4:	f002 f9d5 	bl	20023652 <HAL_FLASH_AES_CFG>
200212a8:	f104 0308 	add.w	r3, r4, #8
200212ac:	f509 5081 	add.w	r0, r9, #4128	@ 0x1020
200212b0:	025b      	lsls	r3, r3, #9
200212b2:	3008      	adds	r0, #8
200212b4:	462a      	mov	r2, r5
200212b6:	58fb      	ldr	r3, [r7, r3]
200212b8:	4929      	ldr	r1, [pc, #164]	@ (20021360 <dfu_boot_img_in_flash+0x184>)
200212ba:	4438      	add	r0, r7
200212bc:	f000 fd6f 	bl	20021d9e <sifli_img_sig_hash_verify>
200212c0:	b110      	cbz	r0, 200212c8 <dfu_boot_img_in_flash+0xec>
200212c2:	2002      	movs	r0, #2
200212c4:	f000 fda0 	bl	20021e08 <sifli_secboot_exception>
200212c8:	f8d5 d000 	ldr.w	sp, [r5]
200212cc:	f8d5 f004 	ldr.w	pc, [r5, #4]
200212d0:	4628      	mov	r0, r5
200212d2:	f7ff ff6d 	bl	200211b0 <is_addr_in_nor>
200212d6:	2800      	cmp	r0, #0
200212d8:	d034      	beq.n	20021344 <dfu_boot_img_in_flash+0x168>
200212da:	4822      	ldr	r0, [pc, #136]	@ (20021364 <dfu_boot_img_in_flash+0x188>)
200212dc:	3408      	adds	r4, #8
200212de:	0264      	lsls	r4, r4, #9
200212e0:	4629      	mov	r1, r5
200212e2:	593a      	ldr	r2, [r7, r4]
200212e4:	6800      	ldr	r0, [r0, #0]
200212e6:	eba8 0305 	sub.w	r3, r8, r5
200212ea:	f002 f989 	bl	20023600 <HAL_FLASH_ALIAS_CFG>
200212ee:	f8d5 d000 	ldr.w	sp, [r5]
200212f2:	f8d5 f004 	ldr.w	pc, [r5, #4]
200212f6:	e022      	b.n	2002133e <dfu_boot_img_in_flash+0x162>
200212f8:	f1ac 0010 	sub.w	r0, ip, #16
200212fc:	2220      	movs	r2, #32
200212fe:	491a      	ldr	r1, [pc, #104]	@ (20021368 <dfu_boot_img_in_flash+0x18c>)
20021300:	f7ff fecc 	bl	2002109c <sifli_hw_dec_key>
20021304:	f104 0608 	add.w	r6, r4, #8
20021308:	4b18      	ldr	r3, [pc, #96]	@ (2002136c <dfu_boot_img_in_flash+0x190>)
2002130a:	0276      	lsls	r6, r6, #9
2002130c:	4629      	mov	r1, r5
2002130e:	59ba      	ldr	r2, [r7, r6]
20021310:	4640      	mov	r0, r8
20021312:	681b      	ldr	r3, [r3, #0]
20021314:	4798      	blx	r3
20021316:	f8cd a000 	str.w	sl, [sp]
2002131a:	462a      	mov	r2, r5
2002131c:	4629      	mov	r1, r5
2002131e:	59bb      	ldr	r3, [r7, r6]
20021320:	4811      	ldr	r0, [pc, #68]	@ (20021368 <dfu_boot_img_in_flash+0x18c>)
20021322:	f7ff feeb 	bl	200210fc <sifli_hw_dec>
20021326:	e7bf      	b.n	200212a8 <dfu_boot_img_in_flash+0xcc>
20021328:	2c07      	cmp	r4, #7
2002132a:	dc08      	bgt.n	2002133e <dfu_boot_img_in_flash+0x162>
2002132c:	4262      	negs	r2, r4
2002132e:	f002 0203 	and.w	r2, r2, #3
20021332:	f004 0303 	and.w	r3, r4, #3
20021336:	bf58      	it	pl
20021338:	4253      	negpl	r3, r2
2002133a:	2b02      	cmp	r3, #2
2002133c:	d9c8      	bls.n	200212d0 <dfu_boot_img_in_flash+0xf4>
2002133e:	b005      	add	sp, #20
20021340:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
20021344:	45a8      	cmp	r8, r5
20021346:	d0d2      	beq.n	200212ee <dfu_boot_img_in_flash+0x112>
20021348:	4b08      	ldr	r3, [pc, #32]	@ (2002136c <dfu_boot_img_in_flash+0x190>)
2002134a:	3408      	adds	r4, #8
2002134c:	0264      	lsls	r4, r4, #9
2002134e:	4629      	mov	r1, r5
20021350:	4640      	mov	r0, r8
20021352:	681b      	ldr	r3, [r3, #0]
20021354:	593a      	ldr	r2, [r7, r4]
20021356:	4798      	blx	r3
20021358:	e7c9      	b.n	200212ee <dfu_boot_img_in_flash+0x112>
2002135a:	bf00      	nop
2002135c:	20047318 	.word	0x20047318
20021360:	2004741c 	.word	0x2004741c
20021364:	20046d0c 	.word	0x20046d0c
20021368:	200472d8 	.word	0x200472d8
2002136c:	20046d18 	.word	0x20046d18
20021370:	200472f8 	.word	0x200472f8

20021374 <boot_images_help>:
20021374:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20021378:	4e52      	ldr	r6, [pc, #328]	@ (200214c4 <boot_images_help+0x150>)
2002137a:	f8df a158 	ldr.w	sl, [pc, #344]	@ 200214d4 <boot_images_help+0x160>
2002137e:	6833      	ldr	r3, [r6, #0]
20021380:	b085      	sub	sp, #20
20021382:	4553      	cmp	r3, sl
20021384:	d150      	bne.n	20021428 <boot_images_help+0xb4>
20021386:	2208      	movs	r2, #8
20021388:	2300      	movs	r3, #0
2002138a:	f8df b14c 	ldr.w	fp, [pc, #332]	@ 200214d8 <boot_images_help+0x164>
2002138e:	eb0d 0102 	add.w	r1, sp, r2
20021392:	e9cd 3302 	strd	r3, r3, [sp, #8]
20021396:	484c      	ldr	r0, [pc, #304]	@ (200214c8 <boot_images_help+0x154>)
20021398:	f8db 3000 	ldr.w	r3, [fp]
2002139c:	4798      	blx	r3
2002139e:	2008      	movs	r0, #8
200213a0:	f00a ff70 	bl	2002c284 <HAL_Get_backup>
200213a4:	4605      	mov	r5, r0
200213a6:	2005      	movs	r0, #5
200213a8:	f00a ff6c 	bl	2002c284 <HAL_Get_backup>
200213ac:	f8df 912c 	ldr.w	r9, [pc, #300]	@ 200214dc <boot_images_help+0x168>
200213b0:	4946      	ldr	r1, [pc, #280]	@ (200214cc <boot_images_help+0x158>)
200213b2:	f8d9 4000 	ldr.w	r4, [r9]
200213b6:	f8df 8128 	ldr.w	r8, [pc, #296]	@ 200214e0 <boot_images_help+0x16c>
200213ba:	f642 4210 	movw	r2, #11280	@ 0x2c10
200213be:	f8db 3000 	ldr.w	r3, [fp]
200213c2:	4607      	mov	r7, r0
200213c4:	f8c8 1000 	str.w	r1, [r8]
200213c8:	4620      	mov	r0, r4
200213ca:	f506 5600 	add.w	r6, r6, #8192	@ 0x2000
200213ce:	4798      	blx	r3
200213d0:	f8d6 bc08 	ldr.w	fp, [r6, #3080]	@ 0xc08
200213d4:	f504 52a0 	add.w	r2, r4, #5120	@ 0x1400
200213d8:	4593      	cmp	fp, r2
200213da:	d14e      	bne.n	2002147a <boot_images_help+0x106>
200213dc:	b2eb      	uxtb	r3, r5
200213de:	2b04      	cmp	r3, #4
200213e0:	d025      	beq.n	2002142e <boot_images_help+0xba>
200213e2:	2b06      	cmp	r3, #6
200213e4:	d039      	beq.n	2002145a <boot_images_help+0xe6>
200213e6:	2b01      	cmp	r3, #1
200213e8:	d142      	bne.n	20021470 <boot_images_help+0xfc>
200213ea:	2005      	movs	r0, #5
200213ec:	f00a ff4a 	bl	2002c284 <HAL_Get_backup>
200213f0:	2802      	cmp	r0, #2
200213f2:	d006      	beq.n	20021402 <boot_images_help+0x8e>
200213f4:	9b02      	ldr	r3, [sp, #8]
200213f6:	4553      	cmp	r3, sl
200213f8:	d106      	bne.n	20021408 <boot_images_help+0x94>
200213fa:	f89d 300d 	ldrb.w	r3, [sp, #13]
200213fe:	2b7f      	cmp	r3, #127	@ 0x7f
20021400:	d102      	bne.n	20021408 <boot_images_help+0x94>
20021402:	4b33      	ldr	r3, [pc, #204]	@ (200214d0 <boot_images_help+0x15c>)
20021404:	f8c6 3c08 	str.w	r3, [r6, #3080]	@ 0xc08
20021408:	f8d6 3c08 	ldr.w	r3, [r6, #3080]	@ 0xc08
2002140c:	1c5a      	adds	r2, r3, #1
2002140e:	d00b      	beq.n	20021428 <boot_images_help+0xb4>
20021410:	f8d9 4000 	ldr.w	r4, [r9]
20021414:	1b1c      	subs	r4, r3, r4
20021416:	f5a4 5480 	sub.w	r4, r4, #4096	@ 0x1000
2002141a:	0a64      	lsrs	r4, r4, #9
2002141c:	3402      	adds	r4, #2
2002141e:	f7ff fa5f 	bl	200208e0 <board_init_psram>
20021422:	4620      	mov	r0, r4
20021424:	f7ff feda 	bl	200211dc <dfu_boot_img_in_flash>
20021428:	b005      	add	sp, #20
2002142a:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
2002142e:	2008      	movs	r0, #8
20021430:	f504 54e0 	add.w	r4, r4, #7168	@ 0x1c00
20021434:	2106      	movs	r1, #6
20021436:	f8c6 4c08 	str.w	r4, [r6, #3080]	@ 0xc08
2002143a:	f00a ff1d 	bl	2002c278 <HAL_Set_backup>
2002143e:	f8d8 0000 	ldr.w	r0, [r8]
20021442:	f500 5300 	add.w	r3, r0, #8192	@ 0x2000
20021446:	f8c3 4c08 	str.w	r4, [r3, #3080]	@ 0xc08
2002144a:	b11f      	cbz	r7, 20021454 <boot_images_help+0xe0>
2002144c:	f500 5380 	add.w	r3, r0, #4096	@ 0x1000
20021450:	f8c3 7c00 	str.w	r7, [r3, #3072]	@ 0xc00
20021454:	f7ff fe86 	bl	20021164 <update_sec_flash>
20021458:	e7c7      	b.n	200213ea <boot_images_help+0x76>
2002145a:	2101      	movs	r1, #1
2002145c:	2008      	movs	r0, #8
2002145e:	f00a ff0b 	bl	2002c278 <HAL_Set_backup>
20021462:	f8d8 0000 	ldr.w	r0, [r8]
20021466:	f500 5300 	add.w	r3, r0, #8192	@ 0x2000
2002146a:	f8c3 bc08 	str.w	fp, [r3, #3080]	@ 0xc08
2002146e:	e7f1      	b.n	20021454 <boot_images_help+0xe0>
20021470:	2101      	movs	r1, #1
20021472:	2008      	movs	r0, #8
20021474:	f00a ff00 	bl	2002c278 <HAL_Set_backup>
20021478:	e7b7      	b.n	200213ea <boot_images_help+0x76>
2002147a:	f504 54e0 	add.w	r4, r4, #7168	@ 0x1c00
2002147e:	45a3      	cmp	fp, r4
20021480:	d1b3      	bne.n	200213ea <boot_images_help+0x76>
20021482:	b2eb      	uxtb	r3, r5
20021484:	2b03      	cmp	r3, #3
20021486:	d005      	beq.n	20021494 <boot_images_help+0x120>
20021488:	2b05      	cmp	r3, #5
2002148a:	d018      	beq.n	200214be <boot_images_help+0x14a>
2002148c:	2b02      	cmp	r3, #2
2002148e:	d0ac      	beq.n	200213ea <boot_images_help+0x76>
20021490:	2102      	movs	r1, #2
20021492:	e7ee      	b.n	20021472 <boot_images_help+0xfe>
20021494:	2008      	movs	r0, #8
20021496:	2105      	movs	r1, #5
20021498:	f8c6 2c08 	str.w	r2, [r6, #3080]	@ 0xc08
2002149c:	9201      	str	r2, [sp, #4]
2002149e:	f00a feeb 	bl	2002c278 <HAL_Set_backup>
200214a2:	f8d8 0000 	ldr.w	r0, [r8]
200214a6:	9a01      	ldr	r2, [sp, #4]
200214a8:	f500 5300 	add.w	r3, r0, #8192	@ 0x2000
200214ac:	f8c3 2c08 	str.w	r2, [r3, #3080]	@ 0xc08
200214b0:	2f00      	cmp	r7, #0
200214b2:	d0cf      	beq.n	20021454 <boot_images_help+0xe0>
200214b4:	f500 5380 	add.w	r3, r0, #4096	@ 0x1000
200214b8:	f8c3 7400 	str.w	r7, [r3, #1024]	@ 0x400
200214bc:	e7ca      	b.n	20021454 <boot_images_help+0xe0>
200214be:	2102      	movs	r1, #2
200214c0:	e7cc      	b.n	2002145c <boot_images_help+0xe8>
200214c2:	bf00      	nop
200214c4:	20047318 	.word	0x20047318
200214c8:	12780000 	.word	0x12780000
200214cc:	20049f30 	.word	0x20049f30
200214d0:	12001000 	.word	0x12001000
200214d4:	53454346 	.word	0x53454346
200214d8:	20046d18 	.word	0x20046d18
200214dc:	20046d08 	.word	0x20046d08
200214e0:	20049f2c 	.word	0x20049f2c

200214e4 <hw_preinit0>:
200214e4:	b508      	push	{r3, lr}
200214e6:	4b0e      	ldr	r3, [pc, #56]	@ (20021520 <hw_preinit0+0x3c>)
200214e8:	685b      	ldr	r3, [r3, #4]
200214ea:	b2db      	uxtb	r3, r3
200214ec:	2b06      	cmp	r3, #6
200214ee:	d80a      	bhi.n	20021506 <hw_preinit0+0x22>
200214f0:	4a0c      	ldr	r2, [pc, #48]	@ (20021524 <hw_preinit0+0x40>)
200214f2:	6a93      	ldr	r3, [r2, #40]	@ 0x28
200214f4:	f023 037f 	bic.w	r3, r3, #127	@ 0x7f
200214f8:	f043 0306 	orr.w	r3, r3, #6
200214fc:	6293      	str	r3, [r2, #40]	@ 0x28
200214fe:	6853      	ldr	r3, [r2, #4]
20021500:	f043 0380 	orr.w	r3, r3, #128	@ 0x80
20021504:	6053      	str	r3, [r2, #4]
20021506:	2000      	movs	r0, #0
20021508:	f000 fd77 	bl	20021ffa <HAL_Delay_us>
2002150c:	4b06      	ldr	r3, [pc, #24]	@ (20021528 <hw_preinit0+0x44>)
2002150e:	4a07      	ldr	r2, [pc, #28]	@ (2002152c <hw_preinit0+0x48>)
20021510:	2000      	movs	r0, #0
20021512:	605a      	str	r2, [r3, #4]
20021514:	f7ff fd5e 	bl	20020fd4 <sifli_hw_efuse_read_bank>
20021518:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
2002151c:	f7ff be3a 	b.w	20021194 <boot_ram>
20021520:	5000b000 	.word	0x5000b000
20021524:	500ca000 	.word	0x500ca000
20021528:	5000c000 	.word	0x5000c000
2002152c:	0002d08f 	.word	0x0002d08f

20021530 <entry>:
20021530:	4c14      	ldr	r4, [pc, #80]	@ (20021584 <entry+0x54>)
20021532:	b508      	push	{r3, lr}
20021534:	2000      	movs	r0, #0
20021536:	f000 fd60 	bl	20021ffa <HAL_Delay_us>
2002153a:	6863      	ldr	r3, [r4, #4]
2002153c:	4d12      	ldr	r5, [pc, #72]	@ (20021588 <entry+0x58>)
2002153e:	b2db      	uxtb	r3, r3
20021540:	2b06      	cmp	r3, #6
20021542:	d90f      	bls.n	20021564 <entry+0x34>
20021544:	f7fe ffec 	bl	20020520 <board_flash_power_on>
20021548:	f7fe feda 	bl	20020300 <HAL_MspInit>
2002154c:	f7fe ffca 	bl	200204e4 <board_boot_from>
20021550:	6028      	str	r0, [r5, #0]
20021552:	68e3      	ldr	r3, [r4, #12]
20021554:	f023 0301 	bic.w	r3, r3, #1
20021558:	60e3      	str	r3, [r4, #12]
2002155a:	f7ff fbb7 	bl	20020ccc <dfu_flash_init>
2002155e:	f7ff ff09 	bl	20021374 <boot_images_help>
20021562:	e7fe      	b.n	20021562 <entry+0x32>
20021564:	f7fe ffbe 	bl	200204e4 <board_boot_from>
20021568:	6028      	str	r0, [r5, #0]
2002156a:	f7fe ffd9 	bl	20020520 <board_flash_power_on>
2002156e:	f7fe fec7 	bl	20020300 <HAL_MspInit>
20021572:	68e3      	ldr	r3, [r4, #12]
20021574:	f023 0301 	bic.w	r3, r3, #1
20021578:	60e3      	str	r3, [r4, #12]
2002157a:	f7ff fba7 	bl	20020ccc <dfu_flash_init>
2002157e:	f7ff fef9 	bl	20021374 <boot_images_help>
20021582:	e7ee      	b.n	20021562 <entry+0x32>
20021584:	5000b000 	.word	0x5000b000
20021588:	20049f28 	.word	0x20049f28

2002158c <sdio_emmc_init>:
2002158c:	b570      	push	{r4, r5, r6, lr}
2002158e:	b08c      	sub	sp, #48	@ 0x30
20021590:	f000 f968 	bl	20021864 <sd1_init>
20021594:	4c8d      	ldr	r4, [pc, #564]	@ (200217cc <sdio_emmc_init+0x240>)
20021596:	4b8e      	ldr	r3, [pc, #568]	@ (200217d0 <sdio_emmc_init+0x244>)
20021598:	2500      	movs	r5, #0
2002159a:	6323      	str	r3, [r4, #48]	@ 0x30
2002159c:	6b23      	ldr	r3, [r4, #48]	@ 0x30
2002159e:	f44f 70fa 	mov.w	r0, #500	@ 0x1f4
200215a2:	f043 0302 	orr.w	r3, r3, #2
200215a6:	6323      	str	r3, [r4, #48]	@ 0x30
200215a8:	f04f 7300 	mov.w	r3, #33554432	@ 0x2000000
200215ac:	62e5      	str	r5, [r4, #44]	@ 0x2c
200215ae:	6223      	str	r3, [r4, #32]
200215b0:	f000 fd23 	bl	20021ffa <HAL_Delay_us>
200215b4:	4629      	mov	r1, r5
200215b6:	4628      	mov	r0, r5
200215b8:	f000 f986 	bl	200218c8 <sd1_send_cmd>
200215bc:	2301      	movs	r3, #1
200215be:	65e3      	str	r3, [r4, #92]	@ 0x5c
200215c0:	6de3      	ldr	r3, [r4, #92]	@ 0x5c
200215c2:	079d      	lsls	r5, r3, #30
200215c4:	d5fc      	bpl.n	200215c0 <sdio_emmc_init+0x34>
200215c6:	6be3      	ldr	r3, [r4, #60]	@ 0x3c
200215c8:	f043 0320 	orr.w	r3, r3, #32
200215cc:	63e3      	str	r3, [r4, #60]	@ 0x3c
200215ce:	4981      	ldr	r1, [pc, #516]	@ (200217d4 <sdio_emmc_init+0x248>)
200215d0:	2001      	movs	r0, #1
200215d2:	ad07      	add	r5, sp, #28
200215d4:	f000 f978 	bl	200218c8 <sd1_send_cmd>
200215d8:	ab06      	add	r3, sp, #24
200215da:	aa05      	add	r2, sp, #20
200215dc:	a904      	add	r1, sp, #16
200215de:	f10d 000f 	add.w	r0, sp, #15
200215e2:	9500      	str	r5, [sp, #0]
200215e4:	f000 f9ae 	bl	20021944 <sd1_get_rsp>
200215e8:	2014      	movs	r0, #20
200215ea:	f000 fd06 	bl	20021ffa <HAL_Delay_us>
200215ee:	9b04      	ldr	r3, [sp, #16]
200215f0:	2b00      	cmp	r3, #0
200215f2:	daec      	bge.n	200215ce <sdio_emmc_init+0x42>
200215f4:	2014      	movs	r0, #20
200215f6:	f000 fd00 	bl	20021ffa <HAL_Delay_us>
200215fa:	2100      	movs	r1, #0
200215fc:	2002      	movs	r0, #2
200215fe:	f000 f963 	bl	200218c8 <sd1_send_cmd>
20021602:	2801      	cmp	r0, #1
20021604:	f000 8081 	beq.w	2002170a <sdio_emmc_init+0x17e>
20021608:	2802      	cmp	r0, #2
2002160a:	d07e      	beq.n	2002170a <sdio_emmc_init+0x17e>
2002160c:	ab08      	add	r3, sp, #32
2002160e:	aa0a      	add	r2, sp, #40	@ 0x28
20021610:	a90b      	add	r1, sp, #44	@ 0x2c
20021612:	9300      	str	r3, [sp, #0]
20021614:	f10d 000f 	add.w	r0, sp, #15
20021618:	ab09      	add	r3, sp, #36	@ 0x24
2002161a:	f000 f993 	bl	20021944 <sd1_get_rsp>
2002161e:	2014      	movs	r0, #20
20021620:	f000 fceb 	bl	20021ffa <HAL_Delay_us>
20021624:	f44f 3180 	mov.w	r1, #65536	@ 0x10000
20021628:	2003      	movs	r0, #3
2002162a:	f000 f94d 	bl	200218c8 <sd1_send_cmd>
2002162e:	2801      	cmp	r0, #1
20021630:	f000 80ab 	beq.w	2002178a <sdio_emmc_init+0x1fe>
20021634:	2802      	cmp	r0, #2
20021636:	f000 80aa 	beq.w	2002178e <sdio_emmc_init+0x202>
2002163a:	ab06      	add	r3, sp, #24
2002163c:	9500      	str	r5, [sp, #0]
2002163e:	aa05      	add	r2, sp, #20
20021640:	a904      	add	r1, sp, #16
20021642:	f10d 000f 	add.w	r0, sp, #15
20021646:	f000 f97d 	bl	20021944 <sd1_get_rsp>
2002164a:	f89d 300f 	ldrb.w	r3, [sp, #15]
2002164e:	2b03      	cmp	r3, #3
20021650:	f040 809f 	bne.w	20021792 <sdio_emmc_init+0x206>
20021654:	4c5d      	ldr	r4, [pc, #372]	@ (200217cc <sdio_emmc_init+0x240>)
20021656:	2014      	movs	r0, #20
20021658:	6be3      	ldr	r3, [r4, #60]	@ 0x3c
2002165a:	f023 0320 	bic.w	r3, r3, #32
2002165e:	63e3      	str	r3, [r4, #60]	@ 0x3c
20021660:	f000 fccb 	bl	20021ffa <HAL_Delay_us>
20021664:	f44f 3180 	mov.w	r1, #65536	@ 0x10000
20021668:	2009      	movs	r0, #9
2002166a:	f000 f92d 	bl	200218c8 <sd1_send_cmd>
2002166e:	2801      	cmp	r0, #1
20021670:	f000 8091 	beq.w	20021796 <sdio_emmc_init+0x20a>
20021674:	2802      	cmp	r0, #2
20021676:	f000 8090 	beq.w	2002179a <sdio_emmc_init+0x20e>
2002167a:	aa05      	add	r2, sp, #20
2002167c:	a904      	add	r1, sp, #16
2002167e:	ab06      	add	r3, sp, #24
20021680:	f10d 000f 	add.w	r0, sp, #15
20021684:	9500      	str	r5, [sp, #0]
20021686:	f000 f95d 	bl	20021944 <sd1_get_rsp>
2002168a:	f44f 53b8 	mov.w	r3, #5888	@ 0x1700
2002168e:	6323      	str	r3, [r4, #48]	@ 0x30
20021690:	6b23      	ldr	r3, [r4, #48]	@ 0x30
20021692:	2014      	movs	r0, #20
20021694:	f043 0302 	orr.w	r3, r3, #2
20021698:	6323      	str	r3, [r4, #48]	@ 0x30
2002169a:	f04f 7300 	mov.w	r3, #33554432	@ 0x2000000
2002169e:	6223      	str	r3, [r4, #32]
200216a0:	2302      	movs	r3, #2
200216a2:	63e3      	str	r3, [r4, #60]	@ 0x3c
200216a4:	f000 fca9 	bl	20021ffa <HAL_Delay_us>
200216a8:	f44f 3180 	mov.w	r1, #65536	@ 0x10000
200216ac:	2007      	movs	r0, #7
200216ae:	f000 f90b 	bl	200218c8 <sd1_send_cmd>
200216b2:	2801      	cmp	r0, #1
200216b4:	d073      	beq.n	2002179e <sdio_emmc_init+0x212>
200216b6:	2802      	cmp	r0, #2
200216b8:	d073      	beq.n	200217a2 <sdio_emmc_init+0x216>
200216ba:	ab06      	add	r3, sp, #24
200216bc:	9500      	str	r5, [sp, #0]
200216be:	aa05      	add	r2, sp, #20
200216c0:	a904      	add	r1, sp, #16
200216c2:	f10d 000f 	add.w	r0, sp, #15
200216c6:	f000 f93d 	bl	20021944 <sd1_get_rsp>
200216ca:	f89d 300f 	ldrb.w	r3, [sp, #15]
200216ce:	2b07      	cmp	r3, #7
200216d0:	d169      	bne.n	200217a6 <sdio_emmc_init+0x21a>
200216d2:	f04f 33ff 	mov.w	r3, #4294967295
200216d6:	2101      	movs	r1, #1
200216d8:	2000      	movs	r0, #0
200216da:	6023      	str	r3, [r4, #0]
200216dc:	f000 f942 	bl	20021964 <sd1_read>
200216e0:	2100      	movs	r1, #0
200216e2:	2008      	movs	r0, #8
200216e4:	f000 f8f0 	bl	200218c8 <sd1_send_cmd>
200216e8:	2801      	cmp	r0, #1
200216ea:	d05e      	beq.n	200217aa <sdio_emmc_init+0x21e>
200216ec:	2802      	cmp	r0, #2
200216ee:	d05e      	beq.n	200217ae <sdio_emmc_init+0x222>
200216f0:	ab06      	add	r3, sp, #24
200216f2:	9500      	str	r5, [sp, #0]
200216f4:	aa05      	add	r2, sp, #20
200216f6:	a904      	add	r1, sp, #16
200216f8:	f10d 000f 	add.w	r0, sp, #15
200216fc:	f000 f922 	bl	20021944 <sd1_get_rsp>
20021700:	f89d 300f 	ldrb.w	r3, [sp, #15]
20021704:	2b08      	cmp	r3, #8
20021706:	d002      	beq.n	2002170e <sdio_emmc_init+0x182>
20021708:	200d      	movs	r0, #13
2002170a:	b00c      	add	sp, #48	@ 0x30
2002170c:	bd70      	pop	{r4, r5, r6, pc}
2002170e:	2320      	movs	r3, #32
20021710:	62e3      	str	r3, [r4, #44]	@ 0x2c
20021712:	f000 f937 	bl	20021984 <sd1_wait_read>
20021716:	6823      	ldr	r3, [r4, #0]
20021718:	0618      	lsls	r0, r3, #24
2002171a:	d4f5      	bmi.n	20021708 <sdio_emmc_init+0x17c>
2002171c:	6823      	ldr	r3, [r4, #0]
2002171e:	0659      	lsls	r1, r3, #25
20021720:	d447      	bmi.n	200217b2 <sdio_emmc_init+0x226>
20021722:	2680      	movs	r6, #128	@ 0x80
20021724:	3e01      	subs	r6, #1
20021726:	f8d4 3200 	ldr.w	r3, [r4, #512]	@ 0x200
2002172a:	d1fb      	bne.n	20021724 <sdio_emmc_init+0x198>
2002172c:	2101      	movs	r1, #1
2002172e:	4630      	mov	r0, r6
20021730:	f000 f918 	bl	20021964 <sd1_read>
20021734:	2014      	movs	r0, #20
20021736:	f000 fc60 	bl	20021ffa <HAL_Delay_us>
2002173a:	f04f 33ff 	mov.w	r3, #4294967295
2002173e:	4631      	mov	r1, r6
20021740:	2011      	movs	r0, #17
20021742:	6023      	str	r3, [r4, #0]
20021744:	f000 f8c0 	bl	200218c8 <sd1_send_cmd>
20021748:	2801      	cmp	r0, #1
2002174a:	d034      	beq.n	200217b6 <sdio_emmc_init+0x22a>
2002174c:	2802      	cmp	r0, #2
2002174e:	d034      	beq.n	200217ba <sdio_emmc_init+0x22e>
20021750:	ab06      	add	r3, sp, #24
20021752:	9500      	str	r5, [sp, #0]
20021754:	aa05      	add	r2, sp, #20
20021756:	a904      	add	r1, sp, #16
20021758:	f10d 000f 	add.w	r0, sp, #15
2002175c:	f000 f8f2 	bl	20021944 <sd1_get_rsp>
20021760:	f89d 300f 	ldrb.w	r3, [sp, #15]
20021764:	2b11      	cmp	r3, #17
20021766:	d12a      	bne.n	200217be <sdio_emmc_init+0x232>
20021768:	2320      	movs	r3, #32
2002176a:	62e3      	str	r3, [r4, #44]	@ 0x2c
2002176c:	f000 f90a 	bl	20021984 <sd1_wait_read>
20021770:	6823      	ldr	r3, [r4, #0]
20021772:	061a      	lsls	r2, r3, #24
20021774:	d425      	bmi.n	200217c2 <sdio_emmc_init+0x236>
20021776:	6823      	ldr	r3, [r4, #0]
20021778:	065b      	lsls	r3, r3, #25
2002177a:	d424      	bmi.n	200217c6 <sdio_emmc_init+0x23a>
2002177c:	2080      	movs	r0, #128	@ 0x80
2002177e:	4b13      	ldr	r3, [pc, #76]	@ (200217cc <sdio_emmc_init+0x240>)
20021780:	3801      	subs	r0, #1
20021782:	f8d3 2200 	ldr.w	r2, [r3, #512]	@ 0x200
20021786:	d1fb      	bne.n	20021780 <sdio_emmc_init+0x1f4>
20021788:	e7bf      	b.n	2002170a <sdio_emmc_init+0x17e>
2002178a:	2003      	movs	r0, #3
2002178c:	e7bd      	b.n	2002170a <sdio_emmc_init+0x17e>
2002178e:	2004      	movs	r0, #4
20021790:	e7bb      	b.n	2002170a <sdio_emmc_init+0x17e>
20021792:	2005      	movs	r0, #5
20021794:	e7b9      	b.n	2002170a <sdio_emmc_init+0x17e>
20021796:	2006      	movs	r0, #6
20021798:	e7b7      	b.n	2002170a <sdio_emmc_init+0x17e>
2002179a:	2007      	movs	r0, #7
2002179c:	e7b5      	b.n	2002170a <sdio_emmc_init+0x17e>
2002179e:	2008      	movs	r0, #8
200217a0:	e7b3      	b.n	2002170a <sdio_emmc_init+0x17e>
200217a2:	2009      	movs	r0, #9
200217a4:	e7b1      	b.n	2002170a <sdio_emmc_init+0x17e>
200217a6:	200a      	movs	r0, #10
200217a8:	e7af      	b.n	2002170a <sdio_emmc_init+0x17e>
200217aa:	200b      	movs	r0, #11
200217ac:	e7ad      	b.n	2002170a <sdio_emmc_init+0x17e>
200217ae:	200c      	movs	r0, #12
200217b0:	e7ab      	b.n	2002170a <sdio_emmc_init+0x17e>
200217b2:	200e      	movs	r0, #14
200217b4:	e7a9      	b.n	2002170a <sdio_emmc_init+0x17e>
200217b6:	2011      	movs	r0, #17
200217b8:	e7a7      	b.n	2002170a <sdio_emmc_init+0x17e>
200217ba:	2012      	movs	r0, #18
200217bc:	e7a5      	b.n	2002170a <sdio_emmc_init+0x17e>
200217be:	2013      	movs	r0, #19
200217c0:	e7a3      	b.n	2002170a <sdio_emmc_init+0x17e>
200217c2:	2014      	movs	r0, #20
200217c4:	e7a1      	b.n	2002170a <sdio_emmc_init+0x17e>
200217c6:	2015      	movs	r0, #21
200217c8:	e79f      	b.n	2002170a <sdio_emmc_init+0x17e>
200217ca:	bf00      	nop
200217cc:	50045000 	.word	0x50045000
200217d0:	00016700 	.word	0x00016700
200217d4:	40000080 	.word	0x40000080

200217d8 <emmc_read_data>:
200217d8:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
200217dc:	4607      	mov	r7, r0
200217de:	f04f 38ff 	mov.w	r8, #4294967295
200217e2:	b088      	sub	sp, #32
200217e4:	2000      	movs	r0, #0
200217e6:	460d      	mov	r5, r1
200217e8:	4e1d      	ldr	r6, [pc, #116]	@ (20021860 <emmc_read_data+0x88>)
200217ea:	2101      	movs	r1, #1
200217ec:	4614      	mov	r4, r2
200217ee:	f000 f8b9 	bl	20021964 <sd1_read>
200217f2:	2014      	movs	r0, #20
200217f4:	f000 fc01 	bl	20021ffa <HAL_Delay_us>
200217f8:	2011      	movs	r0, #17
200217fa:	f8c6 8000 	str.w	r8, [r6]
200217fe:	0a79      	lsrs	r1, r7, #9
20021800:	f000 f862 	bl	200218c8 <sd1_send_cmd>
20021804:	4440      	add	r0, r8
20021806:	b2c0      	uxtb	r0, r0
20021808:	2801      	cmp	r0, #1
2002180a:	d803      	bhi.n	20021814 <emmc_read_data+0x3c>
2002180c:	2000      	movs	r0, #0
2002180e:	b008      	add	sp, #32
20021810:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
20021814:	ab07      	add	r3, sp, #28
20021816:	9300      	str	r3, [sp, #0]
20021818:	aa05      	add	r2, sp, #20
2002181a:	ab06      	add	r3, sp, #24
2002181c:	a904      	add	r1, sp, #16
2002181e:	f10d 000f 	add.w	r0, sp, #15
20021822:	f000 f88f 	bl	20021944 <sd1_get_rsp>
20021826:	f89d 300f 	ldrb.w	r3, [sp, #15]
2002182a:	2b11      	cmp	r3, #17
2002182c:	d1ee      	bne.n	2002180c <emmc_read_data+0x34>
2002182e:	2320      	movs	r3, #32
20021830:	f8c6 8000 	str.w	r8, [r6]
20021834:	62f3      	str	r3, [r6, #44]	@ 0x2c
20021836:	f000 f8a5 	bl	20021984 <sd1_wait_read>
2002183a:	6833      	ldr	r3, [r6, #0]
2002183c:	061a      	lsls	r2, r3, #24
2002183e:	d4e5      	bmi.n	2002180c <emmc_read_data+0x34>
20021840:	6833      	ldr	r3, [r6, #0]
20021842:	065b      	lsls	r3, r3, #25
20021844:	d4e2      	bmi.n	2002180c <emmc_read_data+0x34>
20021846:	f024 0303 	bic.w	r3, r4, #3
2002184a:	442b      	add	r3, r5
2002184c:	429d      	cmp	r5, r3
2002184e:	d101      	bne.n	20021854 <emmc_read_data+0x7c>
20021850:	4620      	mov	r0, r4
20021852:	e7dc      	b.n	2002180e <emmc_read_data+0x36>
20021854:	f8d6 2200 	ldr.w	r2, [r6, #512]	@ 0x200
20021858:	f845 2b04 	str.w	r2, [r5], #4
2002185c:	e7f6      	b.n	2002184c <emmc_read_data+0x74>
2002185e:	bf00      	nop
20021860:	50045000 	.word	0x50045000

20021864 <sd1_init>:
20021864:	b510      	push	{r4, lr}
20021866:	f04f 44a0 	mov.w	r4, #1342177280	@ 0x50000000
2002186a:	68e3      	ldr	r3, [r4, #12]
2002186c:	2064      	movs	r0, #100	@ 0x64
2002186e:	f023 0310 	bic.w	r3, r3, #16
20021872:	60e3      	str	r3, [r4, #12]
20021874:	f000 fbc1 	bl	20021ffa <HAL_Delay_us>
20021878:	68e3      	ldr	r3, [r4, #12]
2002187a:	4a07      	ldr	r2, [pc, #28]	@ (20021898 <sd1_init+0x34>)
2002187c:	f043 0310 	orr.w	r3, r3, #16
20021880:	60e3      	str	r3, [r4, #12]
20021882:	6913      	ldr	r3, [r2, #16]
20021884:	f043 0302 	orr.w	r3, r3, #2
20021888:	6113      	str	r3, [r2, #16]
2002188a:	f44f 7280 	mov.w	r2, #256	@ 0x100
2002188e:	4b03      	ldr	r3, [pc, #12]	@ (2002189c <sd1_init+0x38>)
20021890:	631a      	str	r2, [r3, #48]	@ 0x30
20021892:	2200      	movs	r2, #0
20021894:	63da      	str	r2, [r3, #60]	@ 0x3c
20021896:	bd10      	pop	{r4, pc}
20021898:	5000b000 	.word	0x5000b000
2002189c:	50045000 	.word	0x50045000

200218a0 <sd1_wait_cmd>:
200218a0:	4b08      	ldr	r3, [pc, #32]	@ (200218c4 <sd1_wait_cmd+0x24>)
200218a2:	681a      	ldr	r2, [r3, #0]
200218a4:	f012 0f0a 	tst.w	r2, #10
200218a8:	d0fb      	beq.n	200218a2 <sd1_wait_cmd+0x2>
200218aa:	2202      	movs	r2, #2
200218ac:	601a      	str	r2, [r3, #0]
200218ae:	681a      	ldr	r2, [r3, #0]
200218b0:	0712      	lsls	r2, r2, #28
200218b2:	bf5f      	itttt	pl
200218b4:	6818      	ldrpl	r0, [r3, #0]
200218b6:	f3c0 0080 	ubfxpl	r0, r0, #2, #1
200218ba:	0040      	lslpl	r0, r0, #1
200218bc:	b2c0      	uxtbpl	r0, r0
200218be:	bf48      	it	mi
200218c0:	2001      	movmi	r0, #1
200218c2:	4770      	bx	lr
200218c4:	50045000 	.word	0x50045000

200218c8 <sd1_send_cmd>:
200218c8:	4b0e      	ldr	r3, [pc, #56]	@ (20021904 <sd1_send_cmd+0x3c>)
200218ca:	280f      	cmp	r0, #15
200218cc:	6099      	str	r1, [r3, #8]
200218ce:	ea4f 4380 	mov.w	r3, r0, lsl #18
200218d2:	d813      	bhi.n	200218fc <sd1_send_cmd+0x34>
200218d4:	2201      	movs	r2, #1
200218d6:	f248 0111 	movw	r1, #32785	@ 0x8011
200218da:	4082      	lsls	r2, r0
200218dc:	420a      	tst	r2, r1
200218de:	d105      	bne.n	200218ec <sd1_send_cmd+0x24>
200218e0:	f240 6104 	movw	r1, #1540	@ 0x604
200218e4:	420a      	tst	r2, r1
200218e6:	d009      	beq.n	200218fc <sd1_send_cmd+0x34>
200218e8:	f443 3340 	orr.w	r3, r3, #196608	@ 0x30000
200218ec:	4a05      	ldr	r2, [pc, #20]	@ (20021904 <sd1_send_cmd+0x3c>)
200218ee:	f443 7380 	orr.w	r3, r3, #256	@ 0x100
200218f2:	f043 0301 	orr.w	r3, r3, #1
200218f6:	6053      	str	r3, [r2, #4]
200218f8:	f7ff bfd2 	b.w	200218a0 <sd1_wait_cmd>
200218fc:	f443 3380 	orr.w	r3, r3, #65536	@ 0x10000
20021900:	e7f4      	b.n	200218ec <sd1_send_cmd+0x24>
20021902:	bf00      	nop
20021904:	50045000 	.word	0x50045000

20021908 <sd1_send_acmd>:
20021908:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
2002190a:	4605      	mov	r5, r0
2002190c:	460f      	mov	r7, r1
2002190e:	2037      	movs	r0, #55	@ 0x37
20021910:	0411      	lsls	r1, r2, #16
20021912:	f7ff ffd9 	bl	200218c8 <sd1_send_cmd>
20021916:	4604      	mov	r4, r0
20021918:	b968      	cbnz	r0, 20021936 <sd1_send_acmd+0x2e>
2002191a:	4b08      	ldr	r3, [pc, #32]	@ (2002193c <sd1_send_acmd+0x34>)
2002191c:	4e08      	ldr	r6, [pc, #32]	@ (20021940 <sd1_send_acmd+0x38>)
2002191e:	ea43 4385 	orr.w	r3, r3, r5, lsl #18
20021922:	60b7      	str	r7, [r6, #8]
20021924:	6073      	str	r3, [r6, #4]
20021926:	f7ff ffbb 	bl	200218a0 <sd1_wait_cmd>
2002192a:	2802      	cmp	r0, #2
2002192c:	d104      	bne.n	20021938 <sd1_send_acmd+0x30>
2002192e:	2d29      	cmp	r5, #41	@ 0x29
20021930:	d102      	bne.n	20021938 <sd1_send_acmd+0x30>
20021932:	2304      	movs	r3, #4
20021934:	6033      	str	r3, [r6, #0]
20021936:	4620      	mov	r0, r4
20021938:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
2002193a:	bf00      	nop
2002193c:	00010101 	.word	0x00010101
20021940:	50045000 	.word	0x50045000

20021944 <sd1_get_rsp>:
20021944:	b530      	push	{r4, r5, lr}
20021946:	4c06      	ldr	r4, [pc, #24]	@ (20021960 <sd1_get_rsp+0x1c>)
20021948:	68e5      	ldr	r5, [r4, #12]
2002194a:	7005      	strb	r5, [r0, #0]
2002194c:	6920      	ldr	r0, [r4, #16]
2002194e:	6008      	str	r0, [r1, #0]
20021950:	6961      	ldr	r1, [r4, #20]
20021952:	6011      	str	r1, [r2, #0]
20021954:	69a2      	ldr	r2, [r4, #24]
20021956:	601a      	str	r2, [r3, #0]
20021958:	69e2      	ldr	r2, [r4, #28]
2002195a:	9b03      	ldr	r3, [sp, #12]
2002195c:	601a      	str	r2, [r3, #0]
2002195e:	bd30      	pop	{r4, r5, pc}
20021960:	50045000 	.word	0x50045000

20021964 <sd1_read>:
20021964:	f04f 33ff 	mov.w	r3, #4294967295
20021968:	4a04      	ldr	r2, [pc, #16]	@ (2002197c <sd1_read+0x18>)
2002196a:	eb03 2341 	add.w	r3, r3, r1, lsl #9
2002196e:	6293      	str	r3, [r2, #40]	@ 0x28
20021970:	4b03      	ldr	r3, [pc, #12]	@ (20021980 <sd1_read+0x1c>)
20021972:	ea43 23c0 	orr.w	r3, r3, r0, lsl #11
20021976:	6253      	str	r3, [r2, #36]	@ 0x24
20021978:	4770      	bx	lr
2002197a:	bf00      	nop
2002197c:	50045000 	.word	0x50045000
20021980:	01ff0301 	.word	0x01ff0301

20021984 <sd1_wait_read>:
20021984:	4b08      	ldr	r3, [pc, #32]	@ (200219a8 <sd1_wait_read+0x24>)
20021986:	681a      	ldr	r2, [r3, #0]
20021988:	f012 0fe0 	tst.w	r2, #224	@ 0xe0
2002198c:	d0fb      	beq.n	20021986 <sd1_wait_read+0x2>
2002198e:	2220      	movs	r2, #32
20021990:	601a      	str	r2, [r3, #0]
20021992:	681a      	ldr	r2, [r3, #0]
20021994:	0612      	lsls	r2, r2, #24
20021996:	bf5f      	itttt	pl
20021998:	6818      	ldrpl	r0, [r3, #0]
2002199a:	f3c0 1080 	ubfxpl	r0, r0, #6, #1
2002199e:	0040      	lslpl	r0, r0, #1
200219a0:	b2c0      	uxtbpl	r0, r0
200219a2:	bf48      	it	mi
200219a4:	2001      	movmi	r0, #1
200219a6:	4770      	bx	lr
200219a8:	50045000 	.word	0x50045000

200219ac <sdmmc1_sdnand>:
200219ac:	b5f0      	push	{r4, r5, r6, r7, lr}
200219ae:	b08d      	sub	sp, #52	@ 0x34
200219b0:	f7ff ff58 	bl	20021864 <sd1_init>
200219b4:	4c8f      	ldr	r4, [pc, #572]	@ (20021bf4 <sdmmc1_sdnand+0x248>)
200219b6:	4b90      	ldr	r3, [pc, #576]	@ (20021bf8 <sdmmc1_sdnand+0x24c>)
200219b8:	2500      	movs	r5, #0
200219ba:	6323      	str	r3, [r4, #48]	@ 0x30
200219bc:	6b23      	ldr	r3, [r4, #48]	@ 0x30
200219be:	f44f 70fa 	mov.w	r0, #500	@ 0x1f4
200219c2:	f043 0302 	orr.w	r3, r3, #2
200219c6:	6323      	str	r3, [r4, #48]	@ 0x30
200219c8:	f44f 1380 	mov.w	r3, #1048576	@ 0x100000
200219cc:	62e5      	str	r5, [r4, #44]	@ 0x2c
200219ce:	6223      	str	r3, [r4, #32]
200219d0:	f000 fb13 	bl	20021ffa <HAL_Delay_us>
200219d4:	4629      	mov	r1, r5
200219d6:	4628      	mov	r0, r5
200219d8:	f7ff ff76 	bl	200218c8 <sd1_send_cmd>
200219dc:	2301      	movs	r3, #1
200219de:	65e3      	str	r3, [r4, #92]	@ 0x5c
200219e0:	6de3      	ldr	r3, [r4, #92]	@ 0x5c
200219e2:	079a      	lsls	r2, r3, #30
200219e4:	d5fc      	bpl.n	200219e0 <sdmmc1_sdnand+0x34>
200219e6:	2014      	movs	r0, #20
200219e8:	f000 fb07 	bl	20021ffa <HAL_Delay_us>
200219ec:	f44f 71d5 	mov.w	r1, #426	@ 0x1aa
200219f0:	2008      	movs	r0, #8
200219f2:	f7ff ff69 	bl	200218c8 <sd1_send_cmd>
200219f6:	3801      	subs	r0, #1
200219f8:	b2c0      	uxtb	r0, r0
200219fa:	2801      	cmp	r0, #1
200219fc:	d802      	bhi.n	20021a04 <sdmmc1_sdnand+0x58>
200219fe:	2038      	movs	r0, #56	@ 0x38
20021a00:	b00d      	add	sp, #52	@ 0x34
20021a02:	bdf0      	pop	{r4, r5, r6, r7, pc}
20021a04:	ac07      	add	r4, sp, #28
20021a06:	ab06      	add	r3, sp, #24
20021a08:	9400      	str	r4, [sp, #0]
20021a0a:	aa05      	add	r2, sp, #20
20021a0c:	a904      	add	r1, sp, #16
20021a0e:	f10d 000f 	add.w	r0, sp, #15
20021a12:	f7ff ff97 	bl	20021944 <sd1_get_rsp>
20021a16:	f89d 300f 	ldrb.w	r3, [sp, #15]
20021a1a:	2b08      	cmp	r3, #8
20021a1c:	d1ef      	bne.n	200219fe <sdmmc1_sdnand+0x52>
20021a1e:	9b04      	ldr	r3, [sp, #16]
20021a20:	f5b3 7fd5 	cmp.w	r3, #426	@ 0x1aa
20021a24:	d1eb      	bne.n	200219fe <sdmmc1_sdnand+0x52>
20021a26:	2014      	movs	r0, #20
20021a28:	f000 fae7 	bl	20021ffa <HAL_Delay_us>
20021a2c:	2200      	movs	r2, #0
20021a2e:	2029      	movs	r0, #41	@ 0x29
20021a30:	4972      	ldr	r1, [pc, #456]	@ (20021bfc <sdmmc1_sdnand+0x250>)
20021a32:	f7ff ff69 	bl	20021908 <sd1_send_acmd>
20021a36:	2801      	cmp	r0, #1
20021a38:	f000 80d0 	beq.w	20021bdc <sdmmc1_sdnand+0x230>
20021a3c:	ab06      	add	r3, sp, #24
20021a3e:	9400      	str	r4, [sp, #0]
20021a40:	aa05      	add	r2, sp, #20
20021a42:	a904      	add	r1, sp, #16
20021a44:	f10d 000f 	add.w	r0, sp, #15
20021a48:	f7ff ff7c 	bl	20021944 <sd1_get_rsp>
20021a4c:	9b04      	ldr	r3, [sp, #16]
20021a4e:	2b00      	cmp	r3, #0
20021a50:	db03      	blt.n	20021a5a <sdmmc1_sdnand+0xae>
20021a52:	2002      	movs	r0, #2
20021a54:	f000 fad1 	bl	20021ffa <HAL_Delay_us>
20021a58:	e7e5      	b.n	20021a26 <sdmmc1_sdnand+0x7a>
20021a5a:	2014      	movs	r0, #20
20021a5c:	f000 facd 	bl	20021ffa <HAL_Delay_us>
20021a60:	2100      	movs	r1, #0
20021a62:	2002      	movs	r0, #2
20021a64:	f7ff ff30 	bl	200218c8 <sd1_send_cmd>
20021a68:	3801      	subs	r0, #1
20021a6a:	b2c0      	uxtb	r0, r0
20021a6c:	2801      	cmp	r0, #1
20021a6e:	f240 80b7 	bls.w	20021be0 <sdmmc1_sdnand+0x234>
20021a72:	ab08      	add	r3, sp, #32
20021a74:	aa0a      	add	r2, sp, #40	@ 0x28
20021a76:	a90b      	add	r1, sp, #44	@ 0x2c
20021a78:	9300      	str	r3, [sp, #0]
20021a7a:	f10d 000f 	add.w	r0, sp, #15
20021a7e:	ab09      	add	r3, sp, #36	@ 0x24
20021a80:	f7ff ff60 	bl	20021944 <sd1_get_rsp>
20021a84:	2014      	movs	r0, #20
20021a86:	f000 fab8 	bl	20021ffa <HAL_Delay_us>
20021a8a:	2100      	movs	r1, #0
20021a8c:	2003      	movs	r0, #3
20021a8e:	f7ff ff1b 	bl	200218c8 <sd1_send_cmd>
20021a92:	3801      	subs	r0, #1
20021a94:	b2c0      	uxtb	r0, r0
20021a96:	2801      	cmp	r0, #1
20021a98:	d801      	bhi.n	20021a9e <sdmmc1_sdnand+0xf2>
20021a9a:	2033      	movs	r0, #51	@ 0x33
20021a9c:	e7b0      	b.n	20021a00 <sdmmc1_sdnand+0x54>
20021a9e:	ab06      	add	r3, sp, #24
20021aa0:	9400      	str	r4, [sp, #0]
20021aa2:	aa05      	add	r2, sp, #20
20021aa4:	a904      	add	r1, sp, #16
20021aa6:	f10d 000f 	add.w	r0, sp, #15
20021aaa:	f7ff ff4b 	bl	20021944 <sd1_get_rsp>
20021aae:	f89d 300f 	ldrb.w	r3, [sp, #15]
20021ab2:	2b03      	cmp	r3, #3
20021ab4:	d1f1      	bne.n	20021a9a <sdmmc1_sdnand+0xee>
20021ab6:	9e04      	ldr	r6, [sp, #16]
20021ab8:	2014      	movs	r0, #20
20021aba:	0c35      	lsrs	r5, r6, #16
20021abc:	042d      	lsls	r5, r5, #16
20021abe:	f000 fa9c 	bl	20021ffa <HAL_Delay_us>
20021ac2:	4629      	mov	r1, r5
20021ac4:	2009      	movs	r0, #9
20021ac6:	f7ff feff 	bl	200218c8 <sd1_send_cmd>
20021aca:	3801      	subs	r0, #1
20021acc:	b2c0      	uxtb	r0, r0
20021ace:	2801      	cmp	r0, #1
20021ad0:	f240 8088 	bls.w	20021be4 <sdmmc1_sdnand+0x238>
20021ad4:	9400      	str	r4, [sp, #0]
20021ad6:	ab06      	add	r3, sp, #24
20021ad8:	aa05      	add	r2, sp, #20
20021ada:	a904      	add	r1, sp, #16
20021adc:	f10d 000f 	add.w	r0, sp, #15
20021ae0:	f7ff ff30 	bl	20021944 <sd1_get_rsp>
20021ae4:	e9dd 2004 	ldrd	r2, r0, [sp, #16]
20021ae8:	9c06      	ldr	r4, [sp, #24]
20021aea:	9907      	ldr	r1, [sp, #28]
20021aec:	0e23      	lsrs	r3, r4, #24
20021aee:	ea43 2301 	orr.w	r3, r3, r1, lsl #8
20021af2:	0e01      	lsrs	r1, r0, #24
20021af4:	ea41 2104 	orr.w	r1, r1, r4, lsl #8
20021af8:	9105      	str	r1, [sp, #20]
20021afa:	0e11      	lsrs	r1, r2, #24
20021afc:	9304      	str	r3, [sp, #16]
20021afe:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
20021b02:	0212      	lsls	r2, r2, #8
20021b04:	0f9b      	lsrs	r3, r3, #30
20021b06:	9106      	str	r1, [sp, #24]
20021b08:	9207      	str	r2, [sp, #28]
20021b0a:	d01e      	beq.n	20021b4a <sdmmc1_sdnand+0x19e>
20021b0c:	2b01      	cmp	r3, #1
20021b0e:	d16b      	bne.n	20021be8 <sdmmc1_sdnand+0x23c>
20021b10:	2300      	movs	r3, #0
20021b12:	4a3b      	ldr	r2, [pc, #236]	@ (20021c00 <sdmmc1_sdnand+0x254>)
20021b14:	4c37      	ldr	r4, [pc, #220]	@ (20021bf4 <sdmmc1_sdnand+0x248>)
20021b16:	7013      	strb	r3, [r2, #0]
20021b18:	f44f 63a0 	mov.w	r3, #1280	@ 0x500
20021b1c:	6323      	str	r3, [r4, #48]	@ 0x30
20021b1e:	6b23      	ldr	r3, [r4, #48]	@ 0x30
20021b20:	2702      	movs	r7, #2
20021b22:	f043 0302 	orr.w	r3, r3, #2
20021b26:	6323      	str	r3, [r4, #48]	@ 0x30
20021b28:	f04f 7300 	mov.w	r3, #33554432	@ 0x2000000
20021b2c:	2014      	movs	r0, #20
20021b2e:	6223      	str	r3, [r4, #32]
20021b30:	63e7      	str	r7, [r4, #60]	@ 0x3c
20021b32:	f000 fa62 	bl	20021ffa <HAL_Delay_us>
20021b36:	4629      	mov	r1, r5
20021b38:	2007      	movs	r0, #7
20021b3a:	f7ff fec5 	bl	200218c8 <sd1_send_cmd>
20021b3e:	3801      	subs	r0, #1
20021b40:	b2c0      	uxtb	r0, r0
20021b42:	2801      	cmp	r0, #1
20021b44:	d803      	bhi.n	20021b4e <sdmmc1_sdnand+0x1a2>
20021b46:	2037      	movs	r0, #55	@ 0x37
20021b48:	e75a      	b.n	20021a00 <sdmmc1_sdnand+0x54>
20021b4a:	2301      	movs	r3, #1
20021b4c:	e7e1      	b.n	20021b12 <sdmmc1_sdnand+0x166>
20021b4e:	ad07      	add	r5, sp, #28
20021b50:	ab06      	add	r3, sp, #24
20021b52:	9500      	str	r5, [sp, #0]
20021b54:	aa05      	add	r2, sp, #20
20021b56:	a904      	add	r1, sp, #16
20021b58:	f10d 000f 	add.w	r0, sp, #15
20021b5c:	f7ff fef2 	bl	20021944 <sd1_get_rsp>
20021b60:	f89d 300f 	ldrb.w	r3, [sp, #15]
20021b64:	2b07      	cmp	r3, #7
20021b66:	d1ee      	bne.n	20021b46 <sdmmc1_sdnand+0x19a>
20021b68:	2014      	movs	r0, #20
20021b6a:	f000 fa46 	bl	20021ffa <HAL_Delay_us>
20021b6e:	4639      	mov	r1, r7
20021b70:	2006      	movs	r0, #6
20021b72:	0c32      	lsrs	r2, r6, #16
20021b74:	f7ff fec8 	bl	20021908 <sd1_send_acmd>
20021b78:	3801      	subs	r0, #1
20021b7a:	b2c0      	uxtb	r0, r0
20021b7c:	2801      	cmp	r0, #1
20021b7e:	d935      	bls.n	20021bec <sdmmc1_sdnand+0x240>
20021b80:	2101      	movs	r1, #1
20021b82:	4608      	mov	r0, r1
20021b84:	f7ff feee 	bl	20021964 <sd1_read>
20021b88:	2014      	movs	r0, #20
20021b8a:	f000 fa36 	bl	20021ffa <HAL_Delay_us>
20021b8e:	2100      	movs	r1, #0
20021b90:	2011      	movs	r0, #17
20021b92:	f7ff fe99 	bl	200218c8 <sd1_send_cmd>
20021b96:	3801      	subs	r0, #1
20021b98:	b2c0      	uxtb	r0, r0
20021b9a:	2801      	cmp	r0, #1
20021b9c:	d801      	bhi.n	20021ba2 <sdmmc1_sdnand+0x1f6>
20021b9e:	2052      	movs	r0, #82	@ 0x52
20021ba0:	e72e      	b.n	20021a00 <sdmmc1_sdnand+0x54>
20021ba2:	ab06      	add	r3, sp, #24
20021ba4:	9500      	str	r5, [sp, #0]
20021ba6:	aa05      	add	r2, sp, #20
20021ba8:	a904      	add	r1, sp, #16
20021baa:	f10d 000f 	add.w	r0, sp, #15
20021bae:	f7ff fec9 	bl	20021944 <sd1_get_rsp>
20021bb2:	f89d 300f 	ldrb.w	r3, [sp, #15]
20021bb6:	2b11      	cmp	r3, #17
20021bb8:	d1f1      	bne.n	20021b9e <sdmmc1_sdnand+0x1f2>
20021bba:	f04f 33ff 	mov.w	r3, #4294967295
20021bbe:	6023      	str	r3, [r4, #0]
20021bc0:	2320      	movs	r3, #32
20021bc2:	62e3      	str	r3, [r4, #44]	@ 0x2c
20021bc4:	f7ff fede 	bl	20021984 <sd1_wait_read>
20021bc8:	6823      	ldr	r3, [r4, #0]
20021bca:	061b      	lsls	r3, r3, #24
20021bcc:	d410      	bmi.n	20021bf0 <sdmmc1_sdnand+0x244>
20021bce:	6823      	ldr	r3, [r4, #0]
20021bd0:	f013 0f40 	tst.w	r3, #64	@ 0x40
20021bd4:	bf14      	ite	ne
20021bd6:	2044      	movne	r0, #68	@ 0x44
20021bd8:	2001      	moveq	r0, #1
20021bda:	e711      	b.n	20021a00 <sdmmc1_sdnand+0x54>
20021bdc:	2034      	movs	r0, #52	@ 0x34
20021bde:	e70f      	b.n	20021a00 <sdmmc1_sdnand+0x54>
20021be0:	2032      	movs	r0, #50	@ 0x32
20021be2:	e70d      	b.n	20021a00 <sdmmc1_sdnand+0x54>
20021be4:	2039      	movs	r0, #57	@ 0x39
20021be6:	e70b      	b.n	20021a00 <sdmmc1_sdnand+0x54>
20021be8:	2054      	movs	r0, #84	@ 0x54
20021bea:	e709      	b.n	20021a00 <sdmmc1_sdnand+0x54>
20021bec:	2036      	movs	r0, #54	@ 0x36
20021bee:	e707      	b.n	20021a00 <sdmmc1_sdnand+0x54>
20021bf0:	204f      	movs	r0, #79	@ 0x4f
20021bf2:	e705      	b.n	20021a00 <sdmmc1_sdnand+0x54>
20021bf4:	50045000 	.word	0x50045000
20021bf8:	00016700 	.word	0x00016700
20021bfc:	40ff8000 	.word	0x40ff8000
20021c00:	20042c08 	.word	0x20042c08

20021c04 <sd_read_data>:
20021c04:	b570      	push	{r4, r5, r6, lr}
20021c06:	460d      	mov	r5, r1
20021c08:	2101      	movs	r1, #1
20021c0a:	b088      	sub	sp, #32
20021c0c:	4606      	mov	r6, r0
20021c0e:	4608      	mov	r0, r1
20021c10:	4614      	mov	r4, r2
20021c12:	f7ff fea7 	bl	20021964 <sd1_read>
20021c16:	2014      	movs	r0, #20
20021c18:	f000 f9ef 	bl	20021ffa <HAL_Delay_us>
20021c1c:	4b1a      	ldr	r3, [pc, #104]	@ (20021c88 <sd_read_data+0x84>)
20021c1e:	781b      	ldrb	r3, [r3, #0]
20021c20:	b903      	cbnz	r3, 20021c24 <sd_read_data+0x20>
20021c22:	0a76      	lsrs	r6, r6, #9
20021c24:	4631      	mov	r1, r6
20021c26:	2011      	movs	r0, #17
20021c28:	f7ff fe4e 	bl	200218c8 <sd1_send_cmd>
20021c2c:	3801      	subs	r0, #1
20021c2e:	b2c0      	uxtb	r0, r0
20021c30:	2801      	cmp	r0, #1
20021c32:	d802      	bhi.n	20021c3a <sd_read_data+0x36>
20021c34:	2000      	movs	r0, #0
20021c36:	b008      	add	sp, #32
20021c38:	bd70      	pop	{r4, r5, r6, pc}
20021c3a:	ab07      	add	r3, sp, #28
20021c3c:	9300      	str	r3, [sp, #0]
20021c3e:	aa05      	add	r2, sp, #20
20021c40:	ab06      	add	r3, sp, #24
20021c42:	a904      	add	r1, sp, #16
20021c44:	f10d 000f 	add.w	r0, sp, #15
20021c48:	f7ff fe7c 	bl	20021944 <sd1_get_rsp>
20021c4c:	f89d 300f 	ldrb.w	r3, [sp, #15]
20021c50:	2b11      	cmp	r3, #17
20021c52:	d1ef      	bne.n	20021c34 <sd_read_data+0x30>
20021c54:	f04f 33ff 	mov.w	r3, #4294967295
20021c58:	4e0c      	ldr	r6, [pc, #48]	@ (20021c8c <sd_read_data+0x88>)
20021c5a:	6033      	str	r3, [r6, #0]
20021c5c:	2320      	movs	r3, #32
20021c5e:	62f3      	str	r3, [r6, #44]	@ 0x2c
20021c60:	f7ff fe90 	bl	20021984 <sd1_wait_read>
20021c64:	6833      	ldr	r3, [r6, #0]
20021c66:	061a      	lsls	r2, r3, #24
20021c68:	d4e4      	bmi.n	20021c34 <sd_read_data+0x30>
20021c6a:	6833      	ldr	r3, [r6, #0]
20021c6c:	065b      	lsls	r3, r3, #25
20021c6e:	d4e1      	bmi.n	20021c34 <sd_read_data+0x30>
20021c70:	f024 0303 	bic.w	r3, r4, #3
20021c74:	442b      	add	r3, r5
20021c76:	429d      	cmp	r5, r3
20021c78:	d101      	bne.n	20021c7e <sd_read_data+0x7a>
20021c7a:	4620      	mov	r0, r4
20021c7c:	e7db      	b.n	20021c36 <sd_read_data+0x32>
20021c7e:	f8d6 2200 	ldr.w	r2, [r6, #512]	@ 0x200
20021c82:	f845 2b04 	str.w	r2, [r5], #4
20021c86:	e7f6      	b.n	20021c76 <sd_read_data+0x72>
20021c88:	20042c08 	.word	0x20042c08
20021c8c:	50045000 	.word	0x50045000

20021c90 <sifli_hash_calculate>:
20021c90:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
20021c94:	460c      	mov	r4, r1
20021c96:	4615      	mov	r5, r2
20021c98:	4699      	mov	r9, r3
20021c9a:	4680      	mov	r8, r0
20021c9c:	2800      	cmp	r0, #0
20021c9e:	d03f      	beq.n	20021d20 <sifli_hash_calculate+0x90>
20021ca0:	2900      	cmp	r1, #0
20021ca2:	d03d      	beq.n	20021d20 <sifli_hash_calculate+0x90>
20021ca4:	2a00      	cmp	r2, #0
20021ca6:	d03b      	beq.n	20021d20 <sifli_hash_calculate+0x90>
20021ca8:	2b03      	cmp	r3, #3
20021caa:	d839      	bhi.n	20021d20 <sifli_hash_calculate+0x90>
20021cac:	f000 fab8 	bl	20022220 <HAL_HASH_reset>
20021cb0:	2200      	movs	r2, #0
20021cb2:	4649      	mov	r1, r9
20021cb4:	4610      	mov	r0, r2
20021cb6:	f000 fabb 	bl	20022230 <HAL_HASH_init>
20021cba:	f5b4 7f80 	cmp.w	r4, #256	@ 0x100
20021cbe:	d929      	bls.n	20021d14 <sifli_hash_calculate+0x84>
20021cc0:	2600      	movs	r6, #0
20021cc2:	4637      	mov	r7, r6
20021cc4:	f506 7680 	add.w	r6, r6, #256	@ 0x100
20021cc8:	42a6      	cmp	r6, r4
20021cca:	bf34      	ite	cc
20021ccc:	f04f 0a00 	movcc.w	sl, #0
20021cd0:	f04f 0a01 	movcs.w	sl, #1
20021cd4:	b14f      	cbz	r7, 20021cea <sifli_hash_calculate+0x5a>
20021cd6:	f000 faa3 	bl	20022220 <HAL_HASH_reset>
20021cda:	42a6      	cmp	r6, r4
20021cdc:	bf2c      	ite	cs
20021cde:	463a      	movcs	r2, r7
20021ce0:	2200      	movcc	r2, #0
20021ce2:	4649      	mov	r1, r9
20021ce4:	4628      	mov	r0, r5
20021ce6:	f000 faa3 	bl	20022230 <HAL_HASH_init>
20021cea:	42a6      	cmp	r6, r4
20021cec:	bf34      	ite	cc
20021cee:	f44f 7180 	movcc.w	r1, #256	@ 0x100
20021cf2:	1be1      	subcs	r1, r4, r7
20021cf4:	4652      	mov	r2, sl
20021cf6:	eb08 0007 	add.w	r0, r8, r7
20021cfa:	f000 fa73 	bl	200221e4 <HAL_HASH_run>
20021cfe:	4628      	mov	r0, r5
20021d00:	f000 fac4 	bl	2002228c <HAL_HASH_result>
20021d04:	42a6      	cmp	r6, r4
20021d06:	d3dc      	bcc.n	20021cc2 <sifli_hash_calculate+0x32>
20021d08:	4628      	mov	r0, r5
20021d0a:	f000 fabf 	bl	2002228c <HAL_HASH_result>
20021d0e:	2000      	movs	r0, #0
20021d10:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
20021d14:	2201      	movs	r2, #1
20021d16:	4621      	mov	r1, r4
20021d18:	4640      	mov	r0, r8
20021d1a:	f000 fa63 	bl	200221e4 <HAL_HASH_run>
20021d1e:	e7f3      	b.n	20021d08 <sifli_hash_calculate+0x78>
20021d20:	f04f 30ff 	mov.w	r0, #4294967295
20021d24:	e7f4      	b.n	20021d10 <sifli_hash_calculate+0x80>

20021d26 <sifli_hash_verify>:
20021d26:	b5f0      	push	{r4, r5, r6, r7, lr}
20021d28:	4605      	mov	r5, r0
20021d2a:	b089      	sub	sp, #36	@ 0x24
20021d2c:	460f      	mov	r7, r1
20021d2e:	4614      	mov	r4, r2
20021d30:	2100      	movs	r1, #0
20021d32:	2220      	movs	r2, #32
20021d34:	4668      	mov	r0, sp
20021d36:	461e      	mov	r6, r3
20021d38:	f008 fd58 	bl	2002a7ec <memset>
20021d3c:	b91d      	cbnz	r5, 20021d46 <sifli_hash_verify+0x20>
20021d3e:	f04f 30ff 	mov.w	r0, #4294967295
20021d42:	b009      	add	sp, #36	@ 0x24
20021d44:	bdf0      	pop	{r4, r5, r6, r7, pc}
20021d46:	2c00      	cmp	r4, #0
20021d48:	d0f9      	beq.n	20021d3e <sifli_hash_verify+0x18>
20021d4a:	2302      	movs	r3, #2
20021d4c:	466a      	mov	r2, sp
20021d4e:	4639      	mov	r1, r7
20021d50:	4628      	mov	r0, r5
20021d52:	f7ff ff9d 	bl	20021c90 <sifli_hash_calculate>
20021d56:	2800      	cmp	r0, #0
20021d58:	d1f1      	bne.n	20021d3e <sifli_hash_verify+0x18>
20021d5a:	4632      	mov	r2, r6
20021d5c:	4621      	mov	r1, r4
20021d5e:	4668      	mov	r0, sp
20021d60:	f008 fd34 	bl	2002a7cc <memcmp>
20021d64:	3800      	subs	r0, #0
20021d66:	bf18      	it	ne
20021d68:	2001      	movne	r0, #1
20021d6a:	4240      	negs	r0, r0
20021d6c:	e7e9      	b.n	20021d42 <sifli_hash_verify+0x1c>

20021d6e <sifli_sigkey_pub_verify>:
20021d6e:	2300      	movs	r3, #0
20021d70:	b537      	push	{r0, r1, r2, r4, r5, lr}
20021d72:	4604      	mov	r4, r0
20021d74:	460d      	mov	r5, r1
20021d76:	2208      	movs	r2, #8
20021d78:	4669      	mov	r1, sp
20021d7a:	2003      	movs	r0, #3
20021d7c:	e9cd 3300 	strd	r3, r3, [sp]
20021d80:	f7ff f93e 	bl	20021000 <sifli_hw_efuse_read>
20021d84:	2808      	cmp	r0, #8
20021d86:	4603      	mov	r3, r0
20021d88:	d106      	bne.n	20021d98 <sifli_sigkey_pub_verify+0x2a>
20021d8a:	466a      	mov	r2, sp
20021d8c:	4629      	mov	r1, r5
20021d8e:	4620      	mov	r0, r4
20021d90:	f7ff ffc9 	bl	20021d26 <sifli_hash_verify>
20021d94:	b003      	add	sp, #12
20021d96:	bd30      	pop	{r4, r5, pc}
20021d98:	f04f 30ff 	mov.w	r0, #4294967295
20021d9c:	e7fa      	b.n	20021d94 <sifli_sigkey_pub_verify+0x26>

20021d9e <sifli_img_sig_hash_verify>:
20021d9e:	b5f0      	push	{r4, r5, r6, r7, lr}
20021da0:	461f      	mov	r7, r3
20021da2:	4616      	mov	r6, r2
20021da4:	b08d      	sub	sp, #52	@ 0x34
20021da6:	2220      	movs	r2, #32
20021da8:	4604      	mov	r4, r0
20021daa:	460d      	mov	r5, r1
20021dac:	a804      	add	r0, sp, #16
20021dae:	2100      	movs	r1, #0
20021db0:	f008 fd1c 	bl	2002a7ec <memset>
20021db4:	2302      	movs	r3, #2
20021db6:	4639      	mov	r1, r7
20021db8:	4630      	mov	r0, r6
20021dba:	aa04      	add	r2, sp, #16
20021dbc:	f7ff ff68 	bl	20021c90 <sifli_hash_calculate>
20021dc0:	b118      	cbz	r0, 20021dca <sifli_img_sig_hash_verify+0x2c>
20021dc2:	f04f 30ff 	mov.w	r0, #4294967295
20021dc6:	b00d      	add	sp, #52	@ 0x34
20021dc8:	bdf0      	pop	{r4, r5, r6, r7, pc}
20021dca:	a802      	add	r0, sp, #8
20021dcc:	f007 fa82 	bl	200292d4 <mbedtls_pk_init>
20021dd0:	4629      	mov	r1, r5
20021dd2:	f44f 7293 	mov.w	r2, #294	@ 0x126
20021dd6:	a802      	add	r0, sp, #8
20021dd8:	f007 fb88 	bl	200294ec <mbedtls_pk_parse_public_key>
20021ddc:	4601      	mov	r1, r0
20021dde:	2800      	cmp	r0, #0
20021de0:	d1ef      	bne.n	20021dc2 <sifli_img_sig_hash_verify+0x24>
20021de2:	2206      	movs	r2, #6
20021de4:	9803      	ldr	r0, [sp, #12]
20021de6:	f007 fc28 	bl	2002963a <mbedtls_rsa_set_padding>
20021dea:	f44f 7380 	mov.w	r3, #256	@ 0x100
20021dee:	2106      	movs	r1, #6
20021df0:	e9cd 4300 	strd	r4, r3, [sp]
20021df4:	aa04      	add	r2, sp, #16
20021df6:	2320      	movs	r3, #32
20021df8:	a802      	add	r0, sp, #8
20021dfa:	f007 fa9f 	bl	2002933c <mbedtls_pk_verify>
20021dfe:	3800      	subs	r0, #0
20021e00:	bf18      	it	ne
20021e02:	2001      	movne	r0, #1
20021e04:	4240      	negs	r0, r0
20021e06:	e7de      	b.n	20021dc6 <sifli_img_sig_hash_verify+0x28>

20021e08 <sifli_secboot_exception>:
20021e08:	2801      	cmp	r0, #1
20021e0a:	b508      	push	{r3, lr}
20021e0c:	d004      	beq.n	20021e18 <sifli_secboot_exception+0x10>
20021e0e:	2802      	cmp	r0, #2
20021e10:	d009      	beq.n	20021e26 <sifli_secboot_exception+0x1e>
20021e12:	2213      	movs	r2, #19
20021e14:	4905      	ldr	r1, [pc, #20]	@ (20021e2c <sifli_secboot_exception+0x24>)
20021e16:	e001      	b.n	20021e1c <sifli_secboot_exception+0x14>
20021e18:	2217      	movs	r2, #23
20021e1a:	4905      	ldr	r1, [pc, #20]	@ (20021e30 <sifli_secboot_exception+0x28>)
20021e1c:	4805      	ldr	r0, [pc, #20]	@ (20021e34 <sifli_secboot_exception+0x2c>)
20021e1e:	f7fe fa3b 	bl	20020298 <boot_uart_tx>
20021e22:	e7fe      	b.n	20021e22 <sifli_secboot_exception+0x1a>
20021e24:	bd08      	pop	{r3, pc}
20021e26:	2219      	movs	r2, #25
20021e28:	4903      	ldr	r1, [pc, #12]	@ (20021e38 <sifli_secboot_exception+0x30>)
20021e2a:	e7f7      	b.n	20021e1c <sifli_secboot_exception+0x14>
20021e2c:	2002a96a 	.word	0x2002a96a
20021e30:	2002a938 	.word	0x2002a938
20021e34:	50084000 	.word	0x50084000
20021e38:	2002a950 	.word	0x2002a950

20021e3c <BSP_GetFlash1DIV>:
20021e3c:	4b01      	ldr	r3, [pc, #4]	@ (20021e44 <BSP_GetFlash1DIV+0x8>)
20021e3e:	8818      	ldrh	r0, [r3, #0]
20021e40:	4770      	bx	lr
20021e42:	bf00      	nop
20021e44:	20042c0c 	.word	0x20042c0c

20021e48 <BSP_GetFlash2DIV>:
20021e48:	4b01      	ldr	r3, [pc, #4]	@ (20021e50 <BSP_GetFlash2DIV+0x8>)
20021e4a:	8818      	ldrh	r0, [r3, #0]
20021e4c:	4770      	bx	lr
20021e4e:	bf00      	nop
20021e50:	20042c0a 	.word	0x20042c0a

20021e54 <BSP_SetFlash1DIV>:
20021e54:	4b01      	ldr	r3, [pc, #4]	@ (20021e5c <BSP_SetFlash1DIV+0x8>)
20021e56:	8018      	strh	r0, [r3, #0]
20021e58:	4770      	bx	lr
20021e5a:	bf00      	nop
20021e5c:	20042c0c 	.word	0x20042c0c

20021e60 <BSP_SetFlash2DIV>:
20021e60:	4b01      	ldr	r3, [pc, #4]	@ (20021e68 <BSP_SetFlash2DIV+0x8>)
20021e62:	8018      	strh	r0, [r3, #0]
20021e64:	4770      	bx	lr
20021e66:	bf00      	nop
20021e68:	20042c0a 	.word	0x20042c0a

20021e6c <boot_images>:
20021e6c:	4770      	bx	lr

20021e6e <SystemPowerOnModeInit>:
20021e6e:	4770      	bx	lr

20021e70 <SystemInit>:
20021e70:	b508      	push	{r3, lr}
20021e72:	4a10      	ldr	r2, [pc, #64]	@ (20021eb4 <SystemInit+0x44>)
20021e74:	4b10      	ldr	r3, [pc, #64]	@ (20021eb8 <SystemInit+0x48>)
20021e76:	609a      	str	r2, [r3, #8]
20021e78:	f8d3 2088 	ldr.w	r2, [r3, #136]	@ 0x88
20021e7c:	f042 023f 	orr.w	r2, r2, #63	@ 0x3f
20021e80:	f8c3 2088 	str.w	r2, [r3, #136]	@ 0x88
20021e84:	f8d3 2088 	ldr.w	r2, [r3, #136]	@ 0x88
20021e88:	f442 0270 	orr.w	r2, r2, #15728640	@ 0xf00000
20021e8c:	f8c3 2088 	str.w	r2, [r3, #136]	@ 0x88
20021e90:	f7ff fb28 	bl	200214e4 <hw_preinit0>
20021e94:	f7fe fa3a 	bl	2002030c <mpu_config>
20021e98:	4b08      	ldr	r3, [pc, #32]	@ (20021ebc <SystemInit+0x4c>)
20021e9a:	681b      	ldr	r3, [r3, #0]
20021e9c:	07db      	lsls	r3, r3, #31
20021e9e:	d401      	bmi.n	20021ea4 <SystemInit+0x34>
20021ea0:	f7ff ffe4 	bl	20021e6c <boot_images>
20021ea4:	f7fe fa33 	bl	2002030e <cache_enable>
20021ea8:	f7ff ffe1 	bl	20021e6e <SystemPowerOnModeInit>
20021eac:	4b04      	ldr	r3, [pc, #16]	@ (20021ec0 <SystemInit+0x50>)
20021eae:	4a05      	ldr	r2, [pc, #20]	@ (20021ec4 <SystemInit+0x54>)
20021eb0:	601a      	str	r2, [r3, #0]
20021eb2:	bd08      	pop	{r3, pc}
20021eb4:	20020000 	.word	0x20020000
20021eb8:	e000ed00 	.word	0xe000ed00
20021ebc:	5000b000 	.word	0x5000b000
20021ec0:	20042c10 	.word	0x20042c10
20021ec4:	017d7840 	.word	0x017d7840

20021ec8 <Reset_Handler>:
20021ec8:	f8df d048 	ldr.w	sp, [pc, #72]	@ 20021f14 <AES_IRQHandler+0x2>
20021ecc:	4812      	ldr	r0, [pc, #72]	@ (20021f18 <AES_IRQHandler+0x6>)
20021ece:	f380 880a 	msr	MSPLIM, r0
20021ed2:	f7ff ffcd 	bl	20021e70 <SystemInit>
20021ed6:	4c11      	ldr	r4, [pc, #68]	@ (20021f1c <AES_IRQHandler+0xa>)
20021ed8:	4d11      	ldr	r5, [pc, #68]	@ (20021f20 <AES_IRQHandler+0xe>)
20021eda:	42ac      	cmp	r4, r5
20021edc:	da09      	bge.n	20021ef2 <Reset_Handler+0x2a>
20021ede:	6821      	ldr	r1, [r4, #0]
20021ee0:	6862      	ldr	r2, [r4, #4]
20021ee2:	68a3      	ldr	r3, [r4, #8]
20021ee4:	3b04      	subs	r3, #4
20021ee6:	bfa2      	ittt	ge
20021ee8:	58c8      	ldrge	r0, [r1, r3]
20021eea:	50d0      	strge	r0, [r2, r3]
20021eec:	e7fa      	bge.n	20021ee4 <Reset_Handler+0x1c>
20021eee:	340c      	adds	r4, #12
20021ef0:	e7f3      	b.n	20021eda <Reset_Handler+0x12>
20021ef2:	4b0c      	ldr	r3, [pc, #48]	@ (20021f24 <AES_IRQHandler+0x12>)
20021ef4:	4c0c      	ldr	r4, [pc, #48]	@ (20021f28 <AES_IRQHandler+0x16>)
20021ef6:	42a3      	cmp	r3, r4
20021ef8:	da08      	bge.n	20021f0c <Reset_Handler+0x44>
20021efa:	6819      	ldr	r1, [r3, #0]
20021efc:	685a      	ldr	r2, [r3, #4]
20021efe:	2000      	movs	r0, #0
20021f00:	3a04      	subs	r2, #4
20021f02:	bfa4      	itt	ge
20021f04:	5088      	strge	r0, [r1, r2]
20021f06:	e7fb      	bge.n	20021f00 <Reset_Handler+0x38>
20021f08:	3308      	adds	r3, #8
20021f0a:	e7f4      	b.n	20021ef6 <Reset_Handler+0x2e>
20021f0c:	f7ff fb10 	bl	20021530 <entry>

20021f10 <HardFault_Handler>:
20021f10:	e7fe      	b.n	20021f10 <HardFault_Handler>

20021f12 <AES_IRQHandler>:
20021f12:	e7fe      	b.n	20021f12 <AES_IRQHandler>
20021f14:	20042000 	.word	0x20042000
20021f18:	20040000 	.word	0x20040000
20021f1c:	2002c3b4 	.word	0x2002c3b4
20021f20:	2002c3c0 	.word	0x2002c3c0
20021f24:	2002c3c0 	.word	0x2002c3c0
20021f28:	2002c3c8 	.word	0x2002c3c8

20021f2c <__aeabi_unwind_cpp_pr0>:
20021f2c:	2000      	movs	r0, #0
20021f2e:	4770      	bx	lr

20021f30 <HAL_GetTick>:
20021f30:	4b01      	ldr	r3, [pc, #4]	@ (20021f38 <HAL_GetTick+0x8>)
20021f32:	6818      	ldr	r0, [r3, #0]
20021f34:	4770      	bx	lr
20021f36:	bf00      	nop
20021f38:	2004cb44 	.word	0x2004cb44

20021f3c <HAL_Delay_us_>:
20021f3c:	b513      	push	{r0, r1, r4, lr}
20021f3e:	9001      	str	r0, [sp, #4]
20021f40:	9b01      	ldr	r3, [sp, #4]
20021f42:	4c1a      	ldr	r4, [pc, #104]	@ (20021fac <HAL_Delay_us_+0x70>)
20021f44:	b133      	cbz	r3, 20021f54 <HAL_Delay_us_+0x18>
20021f46:	6823      	ldr	r3, [r4, #0]
20021f48:	b123      	cbz	r3, 20021f54 <HAL_Delay_us_+0x18>
20021f4a:	9b01      	ldr	r3, [sp, #4]
20021f4c:	f1b3 7f80 	cmp.w	r3, #16777216	@ 0x1000000
20021f50:	d90c      	bls.n	20021f6c <HAL_Delay_us_+0x30>
20021f52:	e7fe      	b.n	20021f52 <HAL_Delay_us_+0x16>
20021f54:	2000      	movs	r0, #0
20021f56:	f003 f81d 	bl	20024f94 <HAL_RCC_GetHCLKFreq>
20021f5a:	4b15      	ldr	r3, [pc, #84]	@ (20021fb0 <HAL_Delay_us_+0x74>)
20021f5c:	fbb0 f0f3 	udiv	r0, r0, r3
20021f60:	9b01      	ldr	r3, [sp, #4]
20021f62:	6020      	str	r0, [r4, #0]
20021f64:	2b00      	cmp	r3, #0
20021f66:	d1f0      	bne.n	20021f4a <HAL_Delay_us_+0xe>
20021f68:	b002      	add	sp, #8
20021f6a:	bd10      	pop	{r4, pc}
20021f6c:	9b01      	ldr	r3, [sp, #4]
20021f6e:	2b00      	cmp	r3, #0
20021f70:	d0fa      	beq.n	20021f68 <HAL_Delay_us_+0x2c>
20021f72:	4a10      	ldr	r2, [pc, #64]	@ (20021fb4 <HAL_Delay_us_+0x78>)
20021f74:	6813      	ldr	r3, [r2, #0]
20021f76:	f013 0301 	ands.w	r3, r3, #1
20021f7a:	d10d      	bne.n	20021f98 <HAL_Delay_us_+0x5c>
20021f7c:	480e      	ldr	r0, [pc, #56]	@ (20021fb8 <HAL_Delay_us_+0x7c>)
20021f7e:	f8d0 10fc 	ldr.w	r1, [r0, #252]	@ 0xfc
20021f82:	f041 7180 	orr.w	r1, r1, #16777216	@ 0x1000000
20021f86:	f8c0 10fc 	str.w	r1, [r0, #252]	@ 0xfc
20021f8a:	6053      	str	r3, [r2, #4]
20021f8c:	6813      	ldr	r3, [r2, #0]
20021f8e:	f443 3300 	orr.w	r3, r3, #131072	@ 0x20000
20021f92:	f043 0301 	orr.w	r3, r3, #1
20021f96:	6013      	str	r3, [r2, #0]
20021f98:	9b01      	ldr	r3, [sp, #4]
20021f9a:	6822      	ldr	r2, [r4, #0]
20021f9c:	4905      	ldr	r1, [pc, #20]	@ (20021fb4 <HAL_Delay_us_+0x78>)
20021f9e:	4353      	muls	r3, r2
20021fa0:	6848      	ldr	r0, [r1, #4]
20021fa2:	684a      	ldr	r2, [r1, #4]
20021fa4:	1a12      	subs	r2, r2, r0
20021fa6:	429a      	cmp	r2, r3
20021fa8:	d3fb      	bcc.n	20021fa2 <HAL_Delay_us_+0x66>
20021faa:	e7dd      	b.n	20021f68 <HAL_Delay_us_+0x2c>
20021fac:	2004cb40 	.word	0x2004cb40
20021fb0:	000f4240 	.word	0x000f4240
20021fb4:	e0001000 	.word	0xe0001000
20021fb8:	e000ed00 	.word	0xe000ed00

20021fbc <HAL_Delay_us2_>:
20021fbc:	b537      	push	{r0, r1, r2, r4, r5, lr}
20021fbe:	9001      	str	r0, [sp, #4]
20021fc0:	f04f 20e0 	mov.w	r0, #3758153728	@ 0xe000e000
20021fc4:	f44f 727a 	mov.w	r2, #1000	@ 0x3e8
20021fc8:	6944      	ldr	r4, [r0, #20]
20021fca:	9b01      	ldr	r3, [sp, #4]
20021fcc:	4363      	muls	r3, r4
20021fce:	fbb3 f3f2 	udiv	r3, r3, r2
20021fd2:	9301      	str	r3, [sp, #4]
20021fd4:	2300      	movs	r3, #0
20021fd6:	6981      	ldr	r1, [r0, #24]
20021fd8:	6982      	ldr	r2, [r0, #24]
20021fda:	428a      	cmp	r2, r1
20021fdc:	d0fc      	beq.n	20021fd8 <HAL_Delay_us2_+0x1c>
20021fde:	bf25      	ittet	cs
20021fe0:	1aa5      	subcs	r5, r4, r2
20021fe2:	195b      	addcs	r3, r3, r5
20021fe4:	185b      	addcc	r3, r3, r1
20021fe6:	185b      	addcs	r3, r3, r1
20021fe8:	9901      	ldr	r1, [sp, #4]
20021fea:	bf38      	it	cc
20021fec:	1a9b      	subcc	r3, r3, r2
20021fee:	4299      	cmp	r1, r3
20021ff0:	d801      	bhi.n	20021ff6 <HAL_Delay_us2_+0x3a>
20021ff2:	b003      	add	sp, #12
20021ff4:	bd30      	pop	{r4, r5, pc}
20021ff6:	4611      	mov	r1, r2
20021ff8:	e7ee      	b.n	20021fd8 <HAL_Delay_us2_+0x1c>

20021ffa <HAL_Delay_us>:
20021ffa:	4603      	mov	r3, r0
20021ffc:	b570      	push	{r4, r5, r6, lr}
20021ffe:	b1b8      	cbz	r0, 20022030 <HAL_Delay_us+0x36>
20022000:	f242 7510 	movw	r5, #10000	@ 0x2710
20022004:	f04f 26e0 	mov.w	r6, #3758153728	@ 0xe000e000
20022008:	42ab      	cmp	r3, r5
2002200a:	bf84      	itt	hi
2002200c:	f5a3 541c 	subhi.w	r4, r3, #9984	@ 0x2700
20022010:	f242 7310 	movwhi	r3, #10000	@ 0x2710
20022014:	6932      	ldr	r2, [r6, #16]
20022016:	bf98      	it	ls
20022018:	2400      	movls	r4, #0
2002201a:	4618      	mov	r0, r3
2002201c:	bf88      	it	hi
2002201e:	3c10      	subhi	r4, #16
20022020:	07d3      	lsls	r3, r2, #31
20022022:	d408      	bmi.n	20022036 <HAL_Delay_us+0x3c>
20022024:	f7ff ff8a 	bl	20021f3c <HAL_Delay_us_>
20022028:	4623      	mov	r3, r4
2002202a:	2c00      	cmp	r4, #0
2002202c:	d1ec      	bne.n	20022008 <HAL_Delay_us+0xe>
2002202e:	e001      	b.n	20022034 <HAL_Delay_us+0x3a>
20022030:	f7ff ff84 	bl	20021f3c <HAL_Delay_us_>
20022034:	bd70      	pop	{r4, r5, r6, pc}
20022036:	f7ff ffc1 	bl	20021fbc <HAL_Delay_us2_>
2002203a:	e7f5      	b.n	20022028 <HAL_Delay_us+0x2e>

2002203c <WDT_IRQHandler>:
2002203c:	4770      	bx	lr

2002203e <DBG_Trigger_IRQHandler>:
2002203e:	4770      	bx	lr

20022040 <NMI_Handler>:
20022040:	b508      	push	{r3, lr}
20022042:	4b05      	ldr	r3, [pc, #20]	@ (20022058 <NMI_Handler+0x18>)
20022044:	6a1b      	ldr	r3, [r3, #32]
20022046:	005b      	lsls	r3, r3, #1
20022048:	d502      	bpl.n	20022050 <NMI_Handler+0x10>
2002204a:	f7ff fff8 	bl	2002203e <DBG_Trigger_IRQHandler>
2002204e:	bd08      	pop	{r3, pc}
20022050:	f7ff fff4 	bl	2002203c <WDT_IRQHandler>
20022054:	e7fb      	b.n	2002204e <NMI_Handler+0xe>
20022056:	bf00      	nop
20022058:	5000b000 	.word	0x5000b000

2002205c <HAL_AES_run_help>:
2002205c:	b510      	push	{r4, lr}
2002205e:	f101 4470 	add.w	r4, r1, #4026531840	@ 0xf0000000
20022062:	f1b4 5f80 	cmp.w	r4, #268435456	@ 0x10000000
20022066:	4c0e      	ldr	r4, [pc, #56]	@ (200220a0 <HAL_AES_run_help+0x44>)
20022068:	bf38      	it	cc
2002206a:	f101 41a0 	addcc.w	r1, r1, #1342177280	@ 0x50000000
2002206e:	6161      	str	r1, [r4, #20]
20022070:	f102 4170 	add.w	r1, r2, #4026531840	@ 0xf0000000
20022074:	f1b1 5f80 	cmp.w	r1, #268435456	@ 0x10000000
20022078:	f103 030f 	add.w	r3, r3, #15
2002207c:	ea4f 1323 	mov.w	r3, r3, asr #4
20022080:	bf38      	it	cc
20022082:	f102 42a0 	addcc.w	r2, r2, #1342177280	@ 0x50000000
20022086:	61a2      	str	r2, [r4, #24]
20022088:	61e3      	str	r3, [r4, #28]
2002208a:	6923      	ldr	r3, [r4, #16]
2002208c:	b108      	cbz	r0, 20022092 <HAL_AES_run_help+0x36>
2002208e:	ea43 13c0 	orr.w	r3, r3, r0, lsl #7
20022092:	4a03      	ldr	r2, [pc, #12]	@ (200220a0 <HAL_AES_run_help+0x44>)
20022094:	6123      	str	r3, [r4, #16]
20022096:	6813      	ldr	r3, [r2, #0]
20022098:	f043 0301 	orr.w	r3, r3, #1
2002209c:	6013      	str	r3, [r2, #0]
2002209e:	bd10      	pop	{r4, pc}
200220a0:	5000d000 	.word	0x5000d000

200220a4 <HAL_HASH_run_help.isra.0>:
200220a4:	f100 4370 	add.w	r3, r0, #4026531840	@ 0xf0000000
200220a8:	b510      	push	{r4, lr}
200220aa:	f1b3 5f80 	cmp.w	r3, #268435456	@ 0x10000000
200220ae:	4c09      	ldr	r4, [pc, #36]	@ (200220d4 <HAL_HASH_run_help.isra.0+0x30>)
200220b0:	bf38      	it	cc
200220b2:	f100 40a0 	addcc.w	r0, r0, #1342177280	@ 0x50000000
200220b6:	6560      	str	r0, [r4, #84]	@ 0x54
200220b8:	65a1      	str	r1, [r4, #88]	@ 0x58
200220ba:	b11a      	cbz	r2, 200220c4 <HAL_HASH_run_help.isra.0+0x20>
200220bc:	6d23      	ldr	r3, [r4, #80]	@ 0x50
200220be:	f043 0308 	orr.w	r3, r3, #8
200220c2:	6523      	str	r3, [r4, #80]	@ 0x50
200220c4:	6d21      	ldr	r1, [r4, #80]	@ 0x50
200220c6:	4804      	ldr	r0, [pc, #16]	@ (200220d8 <HAL_HASH_run_help.isra.0+0x34>)
200220c8:	f000 fca4 	bl	20022a14 <HAL_DBG_printf>
200220cc:	2304      	movs	r3, #4
200220ce:	6023      	str	r3, [r4, #0]
200220d0:	bd10      	pop	{r4, pc}
200220d2:	bf00      	nop
200220d4:	5000d000 	.word	0x5000d000
200220d8:	2002a97e 	.word	0x2002a97e

200220dc <HAL_AES_reset>:
200220dc:	2202      	movs	r2, #2
200220de:	2000      	movs	r0, #0
200220e0:	4b01      	ldr	r3, [pc, #4]	@ (200220e8 <HAL_AES_reset+0xc>)
200220e2:	601a      	str	r2, [r3, #0]
200220e4:	6018      	str	r0, [r3, #0]
200220e6:	4770      	bx	lr
200220e8:	5000d000 	.word	0x5000d000

200220ec <HAL_AES_init>:
200220ec:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
200220ee:	461f      	mov	r7, r3
200220f0:	4b1e      	ldr	r3, [pc, #120]	@ (2002216c <HAL_AES_init+0x80>)
200220f2:	4604      	mov	r4, r0
200220f4:	685b      	ldr	r3, [r3, #4]
200220f6:	4616      	mov	r6, r2
200220f8:	07db      	lsls	r3, r3, #31
200220fa:	d501      	bpl.n	20022100 <HAL_AES_init+0x14>
200220fc:	f7ff ffee 	bl	200220dc <HAL_AES_reset>
20022100:	fab4 f084 	clz	r0, r4
20022104:	2918      	cmp	r1, #24
20022106:	ea4f 1050 	mov.w	r0, r0, lsr #5
2002210a:	ea4f 1540 	mov.w	r5, r0, lsl #5
2002210e:	d01c      	beq.n	2002214a <HAL_AES_init+0x5e>
20022110:	2920      	cmp	r1, #32
20022112:	d01c      	beq.n	2002214e <HAL_AES_init+0x62>
20022114:	2910      	cmp	r1, #16
20022116:	d125      	bne.n	20022164 <HAL_AES_init+0x78>
20022118:	2300      	movs	r3, #0
2002211a:	b164      	cbz	r4, 20022136 <HAL_AES_init+0x4a>
2002211c:	4620      	mov	r0, r4
2002211e:	4a14      	ldr	r2, [pc, #80]	@ (20022170 <HAL_AES_init+0x84>)
20022120:	f021 0103 	bic.w	r1, r1, #3
20022124:	4421      	add	r1, r4
20022126:	1b12      	subs	r2, r2, r4
20022128:	1814      	adds	r4, r2, r0
2002212a:	f850 cb04 	ldr.w	ip, [r0], #4
2002212e:	4281      	cmp	r1, r0
20022130:	f8c4 c000 	str.w	ip, [r4]
20022134:	d1f8      	bne.n	20022128 <HAL_AES_init+0x3c>
20022136:	ea47 0005 	orr.w	r0, r7, r5
2002213a:	ea40 00c3 	orr.w	r0, r0, r3, lsl #3
2002213e:	4b0b      	ldr	r3, [pc, #44]	@ (2002216c <HAL_AES_init+0x80>)
20022140:	6118      	str	r0, [r3, #16]
20022142:	b107      	cbz	r7, 20022146 <HAL_AES_init+0x5a>
20022144:	b92e      	cbnz	r6, 20022152 <HAL_AES_init+0x66>
20022146:	2000      	movs	r0, #0
20022148:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
2002214a:	2301      	movs	r3, #1
2002214c:	e7e5      	b.n	2002211a <HAL_AES_init+0x2e>
2002214e:	2302      	movs	r3, #2
20022150:	e7e3      	b.n	2002211a <HAL_AES_init+0x2e>
20022152:	6832      	ldr	r2, [r6, #0]
20022154:	621a      	str	r2, [r3, #32]
20022156:	6872      	ldr	r2, [r6, #4]
20022158:	625a      	str	r2, [r3, #36]	@ 0x24
2002215a:	68b2      	ldr	r2, [r6, #8]
2002215c:	629a      	str	r2, [r3, #40]	@ 0x28
2002215e:	68f2      	ldr	r2, [r6, #12]
20022160:	62da      	str	r2, [r3, #44]	@ 0x2c
20022162:	e7f0      	b.n	20022146 <HAL_AES_init+0x5a>
20022164:	f04f 30ff 	mov.w	r0, #4294967295
20022168:	e7ee      	b.n	20022148 <HAL_AES_init+0x5c>
2002216a:	bf00      	nop
2002216c:	5000d000 	.word	0x5000d000
20022170:	5000d030 	.word	0x5000d030

20022174 <HAL_AES_run>:
20022174:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
20022176:	2708      	movs	r7, #8
20022178:	4e17      	ldr	r6, [pc, #92]	@ (200221d8 <HAL_AES_run+0x64>)
2002217a:	4614      	mov	r4, r2
2002217c:	461d      	mov	r5, r3
2002217e:	f8c6 7088 	str.w	r7, [r6, #136]	@ 0x88
20022182:	f3bf 8f4f 	dsb	sy
20022186:	f3bf 8f6f 	isb	sy
2002218a:	2700      	movs	r7, #0
2002218c:	4e13      	ldr	r6, [pc, #76]	@ (200221dc <HAL_AES_run+0x68>)
2002218e:	60f7      	str	r7, [r6, #12]
20022190:	f7ff ff64 	bl	2002205c <HAL_AES_run_help>
20022194:	6873      	ldr	r3, [r6, #4]
20022196:	07db      	lsls	r3, r3, #31
20022198:	d4fc      	bmi.n	20022194 <HAL_AES_run+0x20>
2002219a:	68b0      	ldr	r0, [r6, #8]
2002219c:	f000 0006 	and.w	r0, r0, #6
200221a0:	3800      	subs	r0, #0
200221a2:	bf18      	it	ne
200221a4:	2001      	movne	r0, #1
200221a6:	f1b4 4fc0 	cmp.w	r4, #1610612736	@ 0x60000000
200221aa:	d313      	bcc.n	200221d4 <HAL_AES_run+0x60>
200221ac:	2d00      	cmp	r5, #0
200221ae:	dd11      	ble.n	200221d4 <HAL_AES_run+0x60>
200221b0:	f004 031f 	and.w	r3, r4, #31
200221b4:	442b      	add	r3, r5
200221b6:	f3bf 8f4f 	dsb	sy
200221ba:	4622      	mov	r2, r4
200221bc:	4c08      	ldr	r4, [pc, #32]	@ (200221e0 <HAL_AES_run+0x6c>)
200221be:	4413      	add	r3, r2
200221c0:	f8c4 225c 	str.w	r2, [r4, #604]	@ 0x25c
200221c4:	3220      	adds	r2, #32
200221c6:	1a99      	subs	r1, r3, r2
200221c8:	2900      	cmp	r1, #0
200221ca:	dcf9      	bgt.n	200221c0 <HAL_AES_run+0x4c>
200221cc:	f3bf 8f4f 	dsb	sy
200221d0:	f3bf 8f6f 	isb	sy
200221d4:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
200221d6:	bf00      	nop
200221d8:	e000e100 	.word	0xe000e100
200221dc:	5000d000 	.word	0x5000d000
200221e0:	e000ed00 	.word	0xe000ed00

200221e4 <HAL_HASH_run>:
200221e4:	b510      	push	{r4, lr}
200221e6:	2408      	movs	r4, #8
200221e8:	4b0b      	ldr	r3, [pc, #44]	@ (20022218 <HAL_HASH_run+0x34>)
200221ea:	f8c3 4088 	str.w	r4, [r3, #136]	@ 0x88
200221ee:	f3bf 8f4f 	dsb	sy
200221f2:	f3bf 8f6f 	isb	sy
200221f6:	f7ff ff55 	bl	200220a4 <HAL_HASH_run_help.isra.0>
200221fa:	4b08      	ldr	r3, [pc, #32]	@ (2002221c <HAL_HASH_run+0x38>)
200221fc:	685a      	ldr	r2, [r3, #4]
200221fe:	0752      	lsls	r2, r2, #29
20022200:	d4fc      	bmi.n	200221fc <HAL_HASH_run+0x18>
20022202:	689a      	ldr	r2, [r3, #8]
20022204:	f002 0238 	and.w	r2, r2, #56	@ 0x38
20022208:	609a      	str	r2, [r3, #8]
2002220a:	6898      	ldr	r0, [r3, #8]
2002220c:	f000 0030 	and.w	r0, r0, #48	@ 0x30
20022210:	3800      	subs	r0, #0
20022212:	bf18      	it	ne
20022214:	2001      	movne	r0, #1
20022216:	bd10      	pop	{r4, pc}
20022218:	e000e100 	.word	0xe000e100
2002221c:	5000d000 	.word	0x5000d000

20022220 <HAL_HASH_reset>:
20022220:	2208      	movs	r2, #8
20022222:	2000      	movs	r0, #0
20022224:	4b01      	ldr	r3, [pc, #4]	@ (2002222c <HAL_HASH_reset+0xc>)
20022226:	601a      	str	r2, [r3, #0]
20022228:	6018      	str	r0, [r3, #0]
2002222a:	4770      	bx	lr
2002222c:	5000d000 	.word	0x5000d000

20022230 <HAL_HASH_init>:
20022230:	0693      	lsls	r3, r2, #26
20022232:	b570      	push	{r4, r5, r6, lr}
20022234:	4606      	mov	r6, r0
20022236:	460c      	mov	r4, r1
20022238:	4615      	mov	r5, r2
2002223a:	d11c      	bne.n	20022276 <HAL_HASH_init+0x46>
2002223c:	2903      	cmp	r1, #3
2002223e:	d81a      	bhi.n	20022276 <HAL_HASH_init+0x46>
20022240:	f7ff ffee 	bl	20022220 <HAL_HASH_reset>
20022244:	b13e      	cbz	r6, 20022256 <HAL_HASH_init+0x26>
20022246:	4b0d      	ldr	r3, [pc, #52]	@ (2002227c <HAL_HASH_init+0x4c>)
20022248:	480d      	ldr	r0, [pc, #52]	@ (20022280 <HAL_HASH_init+0x50>)
2002224a:	5c5a      	ldrb	r2, [r3, r1]
2002224c:	4631      	mov	r1, r6
2002224e:	f008 fae7 	bl	2002a820 <memcpy>
20022252:	f044 0420 	orr.w	r4, r4, #32
20022256:	4b0b      	ldr	r3, [pc, #44]	@ (20022284 <HAL_HASH_init+0x54>)
20022258:	f044 0180 	orr.w	r1, r4, #128	@ 0x80
2002225c:	6519      	str	r1, [r3, #80]	@ 0x50
2002225e:	b11d      	cbz	r5, 20022268 <HAL_HASH_init+0x38>
20022260:	f8c3 509c 	str.w	r5, [r3, #156]	@ 0x9c
20022264:	f444 71c0 	orr.w	r1, r4, #384	@ 0x180
20022268:	4807      	ldr	r0, [pc, #28]	@ (20022288 <HAL_HASH_init+0x58>)
2002226a:	462a      	mov	r2, r5
2002226c:	6519      	str	r1, [r3, #80]	@ 0x50
2002226e:	f000 fbd1 	bl	20022a14 <HAL_DBG_printf>
20022272:	2000      	movs	r0, #0
20022274:	bd70      	pop	{r4, r5, r6, pc}
20022276:	f04f 30ff 	mov.w	r0, #4294967295
2002227a:	e7fb      	b.n	20022274 <HAL_HASH_init+0x44>
2002227c:	2002b814 	.word	0x2002b814
20022280:	5000d05c 	.word	0x5000d05c
20022284:	5000d000 	.word	0x5000d000
20022288:	2002a991 	.word	0x2002a991

2002228c <HAL_HASH_result>:
2002228c:	b510      	push	{r4, lr}
2002228e:	4c08      	ldr	r4, [pc, #32]	@ (200222b0 <HAL_HASH_result+0x24>)
20022290:	4a08      	ldr	r2, [pc, #32]	@ (200222b4 <HAL_HASH_result+0x28>)
20022292:	6d23      	ldr	r3, [r4, #80]	@ 0x50
20022294:	f104 017c 	add.w	r1, r4, #124	@ 0x7c
20022298:	f003 0307 	and.w	r3, r3, #7
2002229c:	5cd2      	ldrb	r2, [r2, r3]
2002229e:	f008 fabf 	bl	2002a820 <memcpy>
200222a2:	f8d4 10a4 	ldr.w	r1, [r4, #164]	@ 0xa4
200222a6:	4804      	ldr	r0, [pc, #16]	@ (200222b8 <HAL_HASH_result+0x2c>)
200222a8:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
200222ac:	f000 bbb2 	b.w	20022a14 <HAL_DBG_printf>
200222b0:	5000d000 	.word	0x5000d000
200222b4:	2002b814 	.word	0x2002b814
200222b8:	2002a9c5 	.word	0x2002a9c5

200222bc <HAL_NVIC_EnableIRQ>:
200222bc:	2800      	cmp	r0, #0
200222be:	da00      	bge.n	200222c2 <HAL_NVIC_EnableIRQ+0x6>
200222c0:	e7fe      	b.n	200222c0 <HAL_NVIC_EnableIRQ+0x4>
200222c2:	2301      	movs	r3, #1
200222c4:	0941      	lsrs	r1, r0, #5
200222c6:	4a03      	ldr	r2, [pc, #12]	@ (200222d4 <HAL_NVIC_EnableIRQ+0x18>)
200222c8:	f000 001f 	and.w	r0, r0, #31
200222cc:	4083      	lsls	r3, r0
200222ce:	f842 3021 	str.w	r3, [r2, r1, lsl #2]
200222d2:	4770      	bx	lr
200222d4:	e000e100 	.word	0xe000e100

200222d8 <HAL_NVIC_DisableIRQ>:
200222d8:	2800      	cmp	r0, #0
200222da:	da00      	bge.n	200222de <HAL_NVIC_DisableIRQ+0x6>
200222dc:	e7fe      	b.n	200222dc <HAL_NVIC_DisableIRQ+0x4>
200222de:	2201      	movs	r2, #1
200222e0:	4906      	ldr	r1, [pc, #24]	@ (200222fc <HAL_NVIC_DisableIRQ+0x24>)
200222e2:	0943      	lsrs	r3, r0, #5
200222e4:	f000 001f 	and.w	r0, r0, #31
200222e8:	4082      	lsls	r2, r0
200222ea:	3320      	adds	r3, #32
200222ec:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
200222f0:	f3bf 8f4f 	dsb	sy
200222f4:	f3bf 8f6f 	isb	sy
200222f8:	4770      	bx	lr
200222fa:	bf00      	nop
200222fc:	e000e100 	.word	0xe000e100

20022300 <DMA_Init>:
20022300:	2302      	movs	r3, #2
20022302:	b530      	push	{r4, r5, lr}
20022304:	6a42      	ldr	r2, [r0, #36]	@ 0x24
20022306:	f880 302d 	strb.w	r3, [r0, #45]	@ 0x2d
2002230a:	6803      	ldr	r3, [r0, #0]
2002230c:	611a      	str	r2, [r3, #16]
2002230e:	e9d0 3402 	ldrd	r3, r4, [r0, #8]
20022312:	4323      	orrs	r3, r4
20022314:	6904      	ldr	r4, [r0, #16]
20022316:	6801      	ldr	r1, [r0, #0]
20022318:	4323      	orrs	r3, r4
2002231a:	6944      	ldr	r4, [r0, #20]
2002231c:	680a      	ldr	r2, [r1, #0]
2002231e:	4323      	orrs	r3, r4
20022320:	6984      	ldr	r4, [r0, #24]
20022322:	f36f 120e 	bfc	r2, #4, #11
20022326:	4323      	orrs	r3, r4
20022328:	69c4      	ldr	r4, [r0, #28]
2002232a:	4323      	orrs	r3, r4
2002232c:	6a04      	ldr	r4, [r0, #32]
2002232e:	4323      	orrs	r3, r4
20022330:	4313      	orrs	r3, r2
20022332:	600b      	str	r3, [r1, #0]
20022334:	6883      	ldr	r3, [r0, #8]
20022336:	f5b3 4f80 	cmp.w	r3, #16384	@ 0x4000
2002233a:	d018      	beq.n	2002236e <DMA_Init+0x6e>
2002233c:	6cc1      	ldr	r1, [r0, #76]	@ 0x4c
2002233e:	6c82      	ldr	r2, [r0, #72]	@ 0x48
20022340:	f3c1 0387 	ubfx	r3, r1, #2, #8
20022344:	06c9      	lsls	r1, r1, #27
20022346:	d41b      	bmi.n	20022380 <DMA_Init+0x80>
20022348:	243f      	movs	r4, #63	@ 0x3f
2002234a:	f003 0307 	and.w	r3, r3, #7
2002234e:	f8d2 10a8 	ldr.w	r1, [r2, #168]	@ 0xa8
20022352:	00db      	lsls	r3, r3, #3
20022354:	409c      	lsls	r4, r3
20022356:	ea21 0104 	bic.w	r1, r1, r4
2002235a:	f8c2 10a8 	str.w	r1, [r2, #168]	@ 0xa8
2002235e:	6c81      	ldr	r1, [r0, #72]	@ 0x48
20022360:	6842      	ldr	r2, [r0, #4]
20022362:	f8d1 40a8 	ldr.w	r4, [r1, #168]	@ 0xa8
20022366:	409a      	lsls	r2, r3
20022368:	4322      	orrs	r2, r4
2002236a:	f8c1 20a8 	str.w	r2, [r1, #168]	@ 0xa8
2002236e:	6982      	ldr	r2, [r0, #24]
20022370:	f5b2 6f80 	cmp.w	r2, #1024	@ 0x400
20022374:	d018      	beq.n	200223a8 <DMA_Init+0xa8>
20022376:	f5b2 6f00 	cmp.w	r2, #2048	@ 0x800
2002237a:	d01f      	beq.n	200223bc <DMA_Init+0xbc>
2002237c:	b1aa      	cbz	r2, 200223aa <DMA_Init+0xaa>
2002237e:	e7fe      	b.n	2002237e <DMA_Init+0x7e>
20022380:	243f      	movs	r4, #63	@ 0x3f
20022382:	f003 0303 	and.w	r3, r3, #3
20022386:	f8d2 10ac 	ldr.w	r1, [r2, #172]	@ 0xac
2002238a:	00db      	lsls	r3, r3, #3
2002238c:	409c      	lsls	r4, r3
2002238e:	ea21 0104 	bic.w	r1, r1, r4
20022392:	f8c2 10ac 	str.w	r1, [r2, #172]	@ 0xac
20022396:	6c81      	ldr	r1, [r0, #72]	@ 0x48
20022398:	6842      	ldr	r2, [r0, #4]
2002239a:	f8d1 40ac 	ldr.w	r4, [r1, #172]	@ 0xac
2002239e:	409a      	lsls	r2, r3
200223a0:	4322      	orrs	r2, r4
200223a2:	f8c1 20ac 	str.w	r2, [r1, #172]	@ 0xac
200223a6:	e7e2      	b.n	2002236e <DMA_Init+0x6e>
200223a8:	2201      	movs	r2, #1
200223aa:	6943      	ldr	r3, [r0, #20]
200223ac:	f5b3 7f80 	cmp.w	r3, #256	@ 0x100
200223b0:	d006      	beq.n	200223c0 <DMA_Init+0xc0>
200223b2:	f5b3 7f00 	cmp.w	r3, #512	@ 0x200
200223b6:	d02b      	beq.n	20022410 <DMA_Init+0x110>
200223b8:	b11b      	cbz	r3, 200223c2 <DMA_Init+0xc2>
200223ba:	e7fe      	b.n	200223ba <DMA_Init+0xba>
200223bc:	2202      	movs	r2, #2
200223be:	e7f4      	b.n	200223aa <DMA_Init+0xaa>
200223c0:	2301      	movs	r3, #1
200223c2:	6901      	ldr	r1, [r0, #16]
200223c4:	f1a1 0480 	sub.w	r4, r1, #128	@ 0x80
200223c8:	4261      	negs	r1, r4
200223ca:	4161      	adcs	r1, r4
200223cc:	68c4      	ldr	r4, [r0, #12]
200223ce:	f1a4 0540 	sub.w	r5, r4, #64	@ 0x40
200223d2:	426c      	negs	r4, r5
200223d4:	416c      	adcs	r4, r5
200223d6:	6885      	ldr	r5, [r0, #8]
200223d8:	2d10      	cmp	r5, #16
200223da:	bf1f      	itttt	ne
200223dc:	f880 1065 	strbne.w	r1, [r0, #101]	@ 0x65
200223e0:	4619      	movne	r1, r3
200223e2:	4613      	movne	r3, r2
200223e4:	460a      	movne	r2, r1
200223e6:	f880 3067 	strb.w	r3, [r0, #103]	@ 0x67
200223ea:	f880 2066 	strb.w	r2, [r0, #102]	@ 0x66
200223ee:	f04f 0300 	mov.w	r3, #0
200223f2:	f04f 0201 	mov.w	r2, #1
200223f6:	6443      	str	r3, [r0, #68]	@ 0x44
200223f8:	bf06      	itte	eq
200223fa:	f880 4065 	strbeq.w	r4, [r0, #101]	@ 0x65
200223fe:	f880 1064 	strbeq.w	r1, [r0, #100]	@ 0x64
20022402:	f880 4064 	strbne.w	r4, [r0, #100]	@ 0x64
20022406:	f880 202d 	strb.w	r2, [r0, #45]	@ 0x2d
2002240a:	f880 302c 	strb.w	r3, [r0, #44]	@ 0x2c
2002240e:	bd30      	pop	{r4, r5, pc}
20022410:	2302      	movs	r3, #2
20022412:	e7d6      	b.n	200223c2 <DMA_Init+0xc2>

20022414 <DMA_AllocChannel>:
20022414:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
20022416:	4b2e      	ldr	r3, [pc, #184]	@ (200224d0 <DMA_AllocChannel+0xbc>)
20022418:	6802      	ldr	r2, [r0, #0]
2002241a:	4413      	add	r3, r2
2002241c:	2ba0      	cmp	r3, #160	@ 0xa0
2002241e:	d904      	bls.n	2002242a <DMA_AllocChannel+0x16>
20022420:	4b2c      	ldr	r3, [pc, #176]	@ (200224d4 <DMA_AllocChannel+0xc0>)
20022422:	4413      	add	r3, r2
20022424:	2ba0      	cmp	r3, #160	@ 0xa0
20022426:	d90f      	bls.n	20022448 <DMA_AllocChannel+0x34>
20022428:	e7fe      	b.n	20022428 <DMA_AllocChannel+0x14>
2002242a:	2632      	movs	r6, #50	@ 0x32
2002242c:	f8df c0b0 	ldr.w	ip, [pc, #176]	@ 200224e0 <DMA_AllocChannel+0xcc>
20022430:	4b29      	ldr	r3, [pc, #164]	@ (200224d8 <DMA_AllocChannel+0xc4>)
20022432:	f3ef 8710 	mrs	r7, PRIMASK
20022436:	2201      	movs	r2, #1
20022438:	f382 8810 	msr	PRIMASK, r2
2002243c:	6cc5      	ldr	r5, [r0, #76]	@ 0x4c
2002243e:	2d1f      	cmp	r5, #31
20022440:	ea4f 0495 	mov.w	r4, r5, lsr #2
20022444:	d905      	bls.n	20022452 <DMA_AllocChannel+0x3e>
20022446:	e7fe      	b.n	20022446 <DMA_AllocChannel+0x32>
20022448:	2602      	movs	r6, #2
2002244a:	f8df c098 	ldr.w	ip, [pc, #152]	@ 200224e4 <DMA_AllocChannel+0xd0>
2002244e:	4b23      	ldr	r3, [pc, #140]	@ (200224dc <DMA_AllocChannel+0xc8>)
20022450:	e7ef      	b.n	20022432 <DMA_AllocChannel+0x1e>
20022452:	eb03 05c4 	add.w	r5, r3, r4, lsl #3
20022456:	f895 e004 	ldrb.w	lr, [r5, #4]
2002245a:	f1be 0f00 	cmp.w	lr, #0
2002245e:	d032      	beq.n	200224c6 <DMA_AllocChannel+0xb2>
20022460:	f853 2034 	ldr.w	r2, [r3, r4, lsl #3]
20022464:	4282      	cmp	r2, r0
20022466:	d103      	bne.n	20022470 <DMA_AllocChannel+0x5c>
20022468:	f387 8810 	msr	PRIMASK, r7
2002246c:	2002      	movs	r0, #2
2002246e:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
20022470:	2200      	movs	r2, #0
20022472:	791c      	ldrb	r4, [r3, #4]
20022474:	461d      	mov	r5, r3
20022476:	bb04      	cbnz	r4, 200224ba <DMA_AllocChannel+0xa6>
20022478:	2301      	movs	r3, #1
2002247a:	712b      	strb	r3, [r5, #4]
2002247c:	2314      	movs	r3, #20
2002247e:	fb03 c302 	mla	r3, r3, r2, ip
20022482:	4416      	add	r6, r2
20022484:	0092      	lsls	r2, r2, #2
20022486:	b274      	sxtb	r4, r6
20022488:	6003      	str	r3, [r0, #0]
2002248a:	64c2      	str	r2, [r0, #76]	@ 0x4c
2002248c:	f387 8810 	msr	PRIMASK, r7
20022490:	b121      	cbz	r1, 2002249c <DMA_AllocChannel+0x88>
20022492:	682b      	ldr	r3, [r5, #0]
20022494:	4283      	cmp	r3, r0
20022496:	d001      	beq.n	2002249c <DMA_AllocChannel+0x88>
20022498:	f7ff ff32 	bl	20022300 <DMA_Init>
2002249c:	6028      	str	r0, [r5, #0]
2002249e:	6a83      	ldr	r3, [r0, #40]	@ 0x28
200224a0:	f104 4260 	add.w	r2, r4, #3758096384	@ 0xe0000000
200224a4:	015b      	lsls	r3, r3, #5
200224a6:	b2db      	uxtb	r3, r3
200224a8:	f502 4261 	add.w	r2, r2, #57600	@ 0xe100
200224ac:	4620      	mov	r0, r4
200224ae:	f882 3300 	strb.w	r3, [r2, #768]	@ 0x300
200224b2:	f7ff ff03 	bl	200222bc <HAL_NVIC_EnableIRQ>
200224b6:	2000      	movs	r0, #0
200224b8:	e7d9      	b.n	2002246e <DMA_AllocChannel+0x5a>
200224ba:	3201      	adds	r2, #1
200224bc:	2a08      	cmp	r2, #8
200224be:	f103 0308 	add.w	r3, r3, #8
200224c2:	d1d6      	bne.n	20022472 <DMA_AllocChannel+0x5e>
200224c4:	e7d0      	b.n	20022468 <DMA_AllocChannel+0x54>
200224c6:	4434      	add	r4, r6
200224c8:	712a      	strb	r2, [r5, #4]
200224ca:	b264      	sxtb	r4, r4
200224cc:	e7de      	b.n	2002248c <DMA_AllocChannel+0x78>
200224ce:	bf00      	nop
200224d0:	aff7eff8 	.word	0xaff7eff8
200224d4:	bfffeff8 	.word	0xbfffeff8
200224d8:	2004cb88 	.word	0x2004cb88
200224dc:	2004cb48 	.word	0x2004cb48
200224e0:	50081008 	.word	0x50081008
200224e4:	40001008 	.word	0x40001008

200224e8 <DMA_FreeChannel.isra.0>:
200224e8:	b538      	push	{r3, r4, r5, lr}
200224ea:	4a13      	ldr	r2, [pc, #76]	@ (20022538 <DMA_FreeChannel.isra.0+0x50>)
200224ec:	6c83      	ldr	r3, [r0, #72]	@ 0x48
200224ee:	4293      	cmp	r3, r2
200224f0:	d003      	beq.n	200224fa <DMA_FreeChannel.isra.0+0x12>
200224f2:	4a12      	ldr	r2, [pc, #72]	@ (2002253c <DMA_FreeChannel.isra.0+0x54>)
200224f4:	4293      	cmp	r3, r2
200224f6:	d008      	beq.n	2002250a <DMA_FreeChannel.isra.0+0x22>
200224f8:	e7fe      	b.n	200224f8 <DMA_FreeChannel.isra.0+0x10>
200224fa:	2132      	movs	r1, #50	@ 0x32
200224fc:	4a10      	ldr	r2, [pc, #64]	@ (20022540 <DMA_FreeChannel.isra.0+0x58>)
200224fe:	6cc4      	ldr	r4, [r0, #76]	@ 0x4c
20022500:	2c1f      	cmp	r4, #31
20022502:	ea4f 0394 	mov.w	r3, r4, lsr #2
20022506:	d903      	bls.n	20022510 <DMA_FreeChannel.isra.0+0x28>
20022508:	e7fe      	b.n	20022508 <DMA_FreeChannel.isra.0+0x20>
2002250a:	2102      	movs	r1, #2
2002250c:	4a0d      	ldr	r2, [pc, #52]	@ (20022544 <DMA_FreeChannel.isra.0+0x5c>)
2002250e:	e7f6      	b.n	200224fe <DMA_FreeChannel.isra.0+0x16>
20022510:	f3ef 8410 	mrs	r4, PRIMASK
20022514:	2501      	movs	r5, #1
20022516:	f385 8810 	msr	PRIMASK, r5
2002251a:	eb02 05c3 	add.w	r5, r2, r3, lsl #3
2002251e:	f852 2033 	ldr.w	r2, [r2, r3, lsl #3]
20022522:	4290      	cmp	r0, r2
20022524:	d105      	bne.n	20022532 <DMA_FreeChannel.isra.0+0x4a>
20022526:	1858      	adds	r0, r3, r1
20022528:	b240      	sxtb	r0, r0
2002252a:	f7ff fed5 	bl	200222d8 <HAL_NVIC_DisableIRQ>
2002252e:	2300      	movs	r3, #0
20022530:	712b      	strb	r3, [r5, #4]
20022532:	f384 8810 	msr	PRIMASK, r4
20022536:	bd38      	pop	{r3, r4, r5, pc}
20022538:	50081000 	.word	0x50081000
2002253c:	40001000 	.word	0x40001000
20022540:	2004cb88 	.word	0x2004cb88
20022544:	2004cb48 	.word	0x2004cb48

20022548 <HAL_DMA_Init>:
20022548:	b538      	push	{r3, r4, r5, lr}
2002254a:	4604      	mov	r4, r0
2002254c:	2800      	cmp	r0, #0
2002254e:	d053      	beq.n	200225f8 <HAL_DMA_Init+0xb0>
20022550:	6883      	ldr	r3, [r0, #8]
20022552:	f033 0210 	bics.w	r2, r3, #16
20022556:	d003      	beq.n	20022560 <HAL_DMA_Init+0x18>
20022558:	f5b3 4f80 	cmp.w	r3, #16384	@ 0x4000
2002255c:	d000      	beq.n	20022560 <HAL_DMA_Init+0x18>
2002255e:	e7fe      	b.n	2002255e <HAL_DMA_Init+0x16>
20022560:	68e3      	ldr	r3, [r4, #12]
20022562:	f033 0340 	bics.w	r3, r3, #64	@ 0x40
20022566:	d000      	beq.n	2002256a <HAL_DMA_Init+0x22>
20022568:	e7fe      	b.n	20022568 <HAL_DMA_Init+0x20>
2002256a:	6923      	ldr	r3, [r4, #16]
2002256c:	f033 0380 	bics.w	r3, r3, #128	@ 0x80
20022570:	d000      	beq.n	20022574 <HAL_DMA_Init+0x2c>
20022572:	e7fe      	b.n	20022572 <HAL_DMA_Init+0x2a>
20022574:	6963      	ldr	r3, [r4, #20]
20022576:	f433 7280 	bics.w	r2, r3, #256	@ 0x100
2002257a:	d003      	beq.n	20022584 <HAL_DMA_Init+0x3c>
2002257c:	f5b3 7f00 	cmp.w	r3, #512	@ 0x200
20022580:	d000      	beq.n	20022584 <HAL_DMA_Init+0x3c>
20022582:	e7fe      	b.n	20022582 <HAL_DMA_Init+0x3a>
20022584:	69a3      	ldr	r3, [r4, #24]
20022586:	f433 6280 	bics.w	r2, r3, #1024	@ 0x400
2002258a:	d003      	beq.n	20022594 <HAL_DMA_Init+0x4c>
2002258c:	f5b3 6f00 	cmp.w	r3, #2048	@ 0x800
20022590:	d000      	beq.n	20022594 <HAL_DMA_Init+0x4c>
20022592:	e7fe      	b.n	20022592 <HAL_DMA_Init+0x4a>
20022594:	69e3      	ldr	r3, [r4, #28]
20022596:	f033 0320 	bics.w	r3, r3, #32
2002259a:	d000      	beq.n	2002259e <HAL_DMA_Init+0x56>
2002259c:	e7fe      	b.n	2002259c <HAL_DMA_Init+0x54>
2002259e:	6a23      	ldr	r3, [r4, #32]
200225a0:	f433 5340 	bics.w	r3, r3, #12288	@ 0x3000
200225a4:	d000      	beq.n	200225a8 <HAL_DMA_Init+0x60>
200225a6:	e7fe      	b.n	200225a6 <HAL_DMA_Init+0x5e>
200225a8:	6863      	ldr	r3, [r4, #4]
200225aa:	2b3f      	cmp	r3, #63	@ 0x3f
200225ac:	d900      	bls.n	200225b0 <HAL_DMA_Init+0x68>
200225ae:	e7fe      	b.n	200225ae <HAL_DMA_Init+0x66>
200225b0:	6822      	ldr	r2, [r4, #0]
200225b2:	4b13      	ldr	r3, [pc, #76]	@ (20022600 <HAL_DMA_Init+0xb8>)
200225b4:	4413      	add	r3, r2
200225b6:	2b8c      	cmp	r3, #140	@ 0x8c
200225b8:	d813      	bhi.n	200225e2 <HAL_DMA_Init+0x9a>
200225ba:	2214      	movs	r2, #20
200225bc:	fbb3 f3f2 	udiv	r3, r3, r2
200225c0:	009b      	lsls	r3, r3, #2
200225c2:	64e3      	str	r3, [r4, #76]	@ 0x4c
200225c4:	4b0f      	ldr	r3, [pc, #60]	@ (20022604 <HAL_DMA_Init+0xbc>)
200225c6:	64a3      	str	r3, [r4, #72]	@ 0x48
200225c8:	2100      	movs	r1, #0
200225ca:	4620      	mov	r0, r4
200225cc:	f7ff ff22 	bl	20022414 <DMA_AllocChannel>
200225d0:	4605      	mov	r5, r0
200225d2:	b998      	cbnz	r0, 200225fc <HAL_DMA_Init+0xb4>
200225d4:	4620      	mov	r0, r4
200225d6:	f7ff fe93 	bl	20022300 <DMA_Init>
200225da:	f7ff ff85 	bl	200224e8 <DMA_FreeChannel.isra.0>
200225de:	4628      	mov	r0, r5
200225e0:	bd38      	pop	{r3, r4, r5, pc}
200225e2:	4b09      	ldr	r3, [pc, #36]	@ (20022608 <HAL_DMA_Init+0xc0>)
200225e4:	4413      	add	r3, r2
200225e6:	2b8c      	cmp	r3, #140	@ 0x8c
200225e8:	d8ee      	bhi.n	200225c8 <HAL_DMA_Init+0x80>
200225ea:	2214      	movs	r2, #20
200225ec:	fbb3 f3f2 	udiv	r3, r3, r2
200225f0:	009b      	lsls	r3, r3, #2
200225f2:	64e3      	str	r3, [r4, #76]	@ 0x4c
200225f4:	4b05      	ldr	r3, [pc, #20]	@ (2002260c <HAL_DMA_Init+0xc4>)
200225f6:	e7e6      	b.n	200225c6 <HAL_DMA_Init+0x7e>
200225f8:	2501      	movs	r5, #1
200225fa:	e7f0      	b.n	200225de <HAL_DMA_Init+0x96>
200225fc:	2502      	movs	r5, #2
200225fe:	e7ee      	b.n	200225de <HAL_DMA_Init+0x96>
20022600:	aff7eff8 	.word	0xaff7eff8
20022604:	50081000 	.word	0x50081000
20022608:	bfffeff8 	.word	0xbfffeff8
2002260c:	40001000 	.word	0x40001000

20022610 <HAL_DMA_DeInit>:
20022610:	b510      	push	{r4, lr}
20022612:	4604      	mov	r4, r0
20022614:	2800      	cmp	r0, #0
20022616:	d051      	beq.n	200226bc <HAL_DMA_DeInit+0xac>
20022618:	6802      	ldr	r2, [r0, #0]
2002261a:	6813      	ldr	r3, [r2, #0]
2002261c:	f023 0301 	bic.w	r3, r3, #1
20022620:	6013      	str	r3, [r2, #0]
20022622:	6802      	ldr	r2, [r0, #0]
20022624:	4b26      	ldr	r3, [pc, #152]	@ (200226c0 <HAL_DMA_DeInit+0xb0>)
20022626:	4413      	add	r3, r2
20022628:	2b8c      	cmp	r3, #140	@ 0x8c
2002262a:	d82f      	bhi.n	2002268c <HAL_DMA_DeInit+0x7c>
2002262c:	2114      	movs	r1, #20
2002262e:	fbb3 f3f1 	udiv	r3, r3, r1
20022632:	009b      	lsls	r3, r3, #2
20022634:	64c3      	str	r3, [r0, #76]	@ 0x4c
20022636:	4b23      	ldr	r3, [pc, #140]	@ (200226c4 <HAL_DMA_DeInit+0xb4>)
20022638:	64a3      	str	r3, [r4, #72]	@ 0x48
2002263a:	2300      	movs	r3, #0
2002263c:	6013      	str	r3, [r2, #0]
2002263e:	e9d4 1312 	ldrd	r1, r3, [r4, #72]	@ 0x48
20022642:	f003 021c 	and.w	r2, r3, #28
20022646:	2301      	movs	r3, #1
20022648:	4093      	lsls	r3, r2
2002264a:	604b      	str	r3, [r1, #4]
2002264c:	6ce3      	ldr	r3, [r4, #76]	@ 0x4c
2002264e:	6ca1      	ldr	r1, [r4, #72]	@ 0x48
20022650:	2b0f      	cmp	r3, #15
20022652:	ea4f 0293 	mov.w	r2, r3, lsr #2
20022656:	d824      	bhi.n	200226a2 <HAL_DMA_DeInit+0x92>
20022658:	203f      	movs	r0, #63	@ 0x3f
2002265a:	005b      	lsls	r3, r3, #1
2002265c:	f8d1 20a8 	ldr.w	r2, [r1, #168]	@ 0xa8
20022660:	f003 0338 	and.w	r3, r3, #56	@ 0x38
20022664:	fa00 f303 	lsl.w	r3, r0, r3
20022668:	ea22 0303 	bic.w	r3, r2, r3
2002266c:	f8c1 30a8 	str.w	r3, [r1, #168]	@ 0xa8
20022670:	4620      	mov	r0, r4
20022672:	f7ff ff39 	bl	200224e8 <DMA_FreeChannel.isra.0>
20022676:	2000      	movs	r0, #0
20022678:	e9c4 000d 	strd	r0, r0, [r4, #52]	@ 0x34
2002267c:	e9c4 000f 	strd	r0, r0, [r4, #60]	@ 0x3c
20022680:	6460      	str	r0, [r4, #68]	@ 0x44
20022682:	f884 002c 	strb.w	r0, [r4, #44]	@ 0x2c
20022686:	f884 002d 	strb.w	r0, [r4, #45]	@ 0x2d
2002268a:	bd10      	pop	{r4, pc}
2002268c:	4b0e      	ldr	r3, [pc, #56]	@ (200226c8 <HAL_DMA_DeInit+0xb8>)
2002268e:	4413      	add	r3, r2
20022690:	2b8c      	cmp	r3, #140	@ 0x8c
20022692:	d8d2      	bhi.n	2002263a <HAL_DMA_DeInit+0x2a>
20022694:	2114      	movs	r1, #20
20022696:	fbb3 f3f1 	udiv	r3, r3, r1
2002269a:	009b      	lsls	r3, r3, #2
2002269c:	64c3      	str	r3, [r0, #76]	@ 0x4c
2002269e:	4b0b      	ldr	r3, [pc, #44]	@ (200226cc <HAL_DMA_DeInit+0xbc>)
200226a0:	e7ca      	b.n	20022638 <HAL_DMA_DeInit+0x28>
200226a2:	f002 0303 	and.w	r3, r2, #3
200226a6:	223f      	movs	r2, #63	@ 0x3f
200226a8:	f8d1 00ac 	ldr.w	r0, [r1, #172]	@ 0xac
200226ac:	00db      	lsls	r3, r3, #3
200226ae:	fa02 f303 	lsl.w	r3, r2, r3
200226b2:	ea20 0303 	bic.w	r3, r0, r3
200226b6:	f8c1 30ac 	str.w	r3, [r1, #172]	@ 0xac
200226ba:	e7d9      	b.n	20022670 <HAL_DMA_DeInit+0x60>
200226bc:	2001      	movs	r0, #1
200226be:	e7e4      	b.n	2002268a <HAL_DMA_DeInit+0x7a>
200226c0:	aff7eff8 	.word	0xaff7eff8
200226c4:	50081000 	.word	0x50081000
200226c8:	bfffeff8 	.word	0xbfffeff8
200226cc:	40001000 	.word	0x40001000

200226d0 <HAL_DMA_PollForTransfer>:
200226d0:	e92d 4ff8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
200226d4:	f890 302d 	ldrb.w	r3, [r0, #45]	@ 0x2d
200226d8:	4617      	mov	r7, r2
200226da:	2b02      	cmp	r3, #2
200226dc:	4604      	mov	r4, r0
200226de:	4688      	mov	r8, r1
200226e0:	b2da      	uxtb	r2, r3
200226e2:	d005      	beq.n	200226f0 <HAL_DMA_PollForTransfer+0x20>
200226e4:	2304      	movs	r3, #4
200226e6:	6443      	str	r3, [r0, #68]	@ 0x44
200226e8:	2300      	movs	r3, #0
200226ea:	f884 302c 	strb.w	r3, [r4, #44]	@ 0x2c
200226ee:	e006      	b.n	200226fe <HAL_DMA_PollForTransfer+0x2e>
200226f0:	6803      	ldr	r3, [r0, #0]
200226f2:	681b      	ldr	r3, [r3, #0]
200226f4:	0699      	lsls	r1, r3, #26
200226f6:	d505      	bpl.n	20022704 <HAL_DMA_PollForTransfer+0x34>
200226f8:	f44f 7380 	mov.w	r3, #256	@ 0x100
200226fc:	6443      	str	r3, [r0, #68]	@ 0x44
200226fe:	2001      	movs	r0, #1
20022700:	e8bd 8ff8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
20022704:	6cc5      	ldr	r5, [r0, #76]	@ 0x4c
20022706:	f005 051c 	and.w	r5, r5, #28
2002270a:	f1b8 0f00 	cmp.w	r8, #0
2002270e:	d123      	bne.n	20022758 <HAL_DMA_PollForTransfer+0x88>
20022710:	fa02 f505 	lsl.w	r5, r2, r5
20022714:	f7ff fc0c 	bl	20021f30 <HAL_GetTick>
20022718:	f04f 0a08 	mov.w	sl, #8
2002271c:	4681      	mov	r9, r0
2002271e:	e9d4 6312 	ldrd	r6, r3, [r4, #72]	@ 0x48
20022722:	f003 031c 	and.w	r3, r3, #28
20022726:	fa0a f103 	lsl.w	r1, sl, r3
2002272a:	6832      	ldr	r2, [r6, #0]
2002272c:	ea12 0b05 	ands.w	fp, r2, r5
20022730:	d016      	beq.n	20022760 <HAL_DMA_PollForTransfer+0x90>
20022732:	f1b8 0f00 	cmp.w	r8, #0
20022736:	d136      	bne.n	200227a6 <HAL_DMA_PollForTransfer+0xd6>
20022738:	2202      	movs	r2, #2
2002273a:	fa02 f303 	lsl.w	r3, r2, r3
2002273e:	6073      	str	r3, [r6, #4]
20022740:	6d23      	ldr	r3, [r4, #80]	@ 0x50
20022742:	b92b      	cbnz	r3, 20022750 <HAL_DMA_PollForTransfer+0x80>
20022744:	4620      	mov	r0, r4
20022746:	f7ff fecf 	bl	200224e8 <DMA_FreeChannel.isra.0>
2002274a:	2301      	movs	r3, #1
2002274c:	f884 302d 	strb.w	r3, [r4, #45]	@ 0x2d
20022750:	2000      	movs	r0, #0
20022752:	f884 002c 	strb.w	r0, [r4, #44]	@ 0x2c
20022756:	e7d3      	b.n	20022700 <HAL_DMA_PollForTransfer+0x30>
20022758:	2304      	movs	r3, #4
2002275a:	fa03 f505 	lsl.w	r5, r3, r5
2002275e:	e7d9      	b.n	20022714 <HAL_DMA_PollForTransfer+0x44>
20022760:	6832      	ldr	r2, [r6, #0]
20022762:	4211      	tst	r1, r2
20022764:	d00c      	beq.n	20022780 <HAL_DMA_PollForTransfer+0xb0>
20022766:	2501      	movs	r5, #1
20022768:	fa05 f303 	lsl.w	r3, r5, r3
2002276c:	6073      	str	r3, [r6, #4]
2002276e:	4620      	mov	r0, r4
20022770:	6465      	str	r5, [r4, #68]	@ 0x44
20022772:	f7ff feb9 	bl	200224e8 <DMA_FreeChannel.isra.0>
20022776:	f884 502d 	strb.w	r5, [r4, #45]	@ 0x2d
2002277a:	f884 b02c 	strb.w	fp, [r4, #44]	@ 0x2c
2002277e:	e7be      	b.n	200226fe <HAL_DMA_PollForTransfer+0x2e>
20022780:	1c7a      	adds	r2, r7, #1
20022782:	d0d2      	beq.n	2002272a <HAL_DMA_PollForTransfer+0x5a>
20022784:	f7ff fbd4 	bl	20021f30 <HAL_GetTick>
20022788:	eba0 0009 	sub.w	r0, r0, r9
2002278c:	42b8      	cmp	r0, r7
2002278e:	d801      	bhi.n	20022794 <HAL_DMA_PollForTransfer+0xc4>
20022790:	2f00      	cmp	r7, #0
20022792:	d1c4      	bne.n	2002271e <HAL_DMA_PollForTransfer+0x4e>
20022794:	2320      	movs	r3, #32
20022796:	4620      	mov	r0, r4
20022798:	6463      	str	r3, [r4, #68]	@ 0x44
2002279a:	f7ff fea5 	bl	200224e8 <DMA_FreeChannel.isra.0>
2002279e:	2301      	movs	r3, #1
200227a0:	f884 302d 	strb.w	r3, [r4, #45]	@ 0x2d
200227a4:	e7a0      	b.n	200226e8 <HAL_DMA_PollForTransfer+0x18>
200227a6:	2204      	movs	r2, #4
200227a8:	fa02 f303 	lsl.w	r3, r2, r3
200227ac:	6073      	str	r3, [r6, #4]
200227ae:	e7cf      	b.n	20022750 <HAL_DMA_PollForTransfer+0x80>

200227b0 <DMA_Remap>:
200227b0:	b530      	push	{r4, r5, lr}
200227b2:	4b15      	ldr	r3, [pc, #84]	@ (20022808 <DMA_Remap+0x58>)
200227b4:	6c84      	ldr	r4, [r0, #72]	@ 0x48
200227b6:	429c      	cmp	r4, r3
200227b8:	d11b      	bne.n	200227f2 <DMA_Remap+0x42>
200227ba:	6883      	ldr	r3, [r0, #8]
200227bc:	2b10      	cmp	r3, #16
200227be:	d002      	beq.n	200227c6 <DMA_Remap+0x16>
200227c0:	f5b3 4f80 	cmp.w	r3, #16384	@ 0x4000
200227c4:	d108      	bne.n	200227d8 <DMA_Remap+0x28>
200227c6:	680b      	ldr	r3, [r1, #0]
200227c8:	4c10      	ldr	r4, [pc, #64]	@ (2002280c <DMA_Remap+0x5c>)
200227ca:	f103 4560 	add.w	r5, r3, #3758096384	@ 0xe0000000
200227ce:	42a5      	cmp	r5, r4
200227d0:	bf98      	it	ls
200227d2:	f103 6320 	addls.w	r3, r3, #167772160	@ 0xa000000
200227d6:	600b      	str	r3, [r1, #0]
200227d8:	6883      	ldr	r3, [r0, #8]
200227da:	f433 4380 	bics.w	r3, r3, #16384	@ 0x4000
200227de:	d108      	bne.n	200227f2 <DMA_Remap+0x42>
200227e0:	6813      	ldr	r3, [r2, #0]
200227e2:	480a      	ldr	r0, [pc, #40]	@ (2002280c <DMA_Remap+0x5c>)
200227e4:	f103 4460 	add.w	r4, r3, #3758096384	@ 0xe0000000
200227e8:	4284      	cmp	r4, r0
200227ea:	bf98      	it	ls
200227ec:	f103 6320 	addls.w	r3, r3, #167772160	@ 0xa000000
200227f0:	6013      	str	r3, [r2, #0]
200227f2:	680b      	ldr	r3, [r1, #0]
200227f4:	f103 4270 	add.w	r2, r3, #4026531840	@ 0xf0000000
200227f8:	f1b2 5f80 	cmp.w	r2, #268435456	@ 0x10000000
200227fc:	bf3c      	itt	cc
200227fe:	f103 43a0 	addcc.w	r3, r3, #1342177280	@ 0x50000000
20022802:	600b      	strcc	r3, [r1, #0]
20022804:	bd30      	pop	{r4, r5, pc}
20022806:	bf00      	nop
20022808:	40001000 	.word	0x40001000
2002280c:	0007fffe 	.word	0x0007fffe

20022810 <DMA_Start>:
20022810:	e92d 41f3 	stmdb	sp!, {r0, r1, r4, r5, r6, r7, r8, lr}
20022814:	f64f 75ff 	movw	r5, #65535	@ 0xffff
20022818:	6d03      	ldr	r3, [r0, #80]	@ 0x50
2002281a:	6802      	ldr	r2, [r0, #0]
2002281c:	429d      	cmp	r5, r3
2002281e:	bf28      	it	cs
20022820:	461d      	movcs	r5, r3
20022822:	1b5b      	subs	r3, r3, r5
20022824:	6503      	str	r3, [r0, #80]	@ 0x50
20022826:	6585      	str	r5, [r0, #88]	@ 0x58
20022828:	6813      	ldr	r3, [r2, #0]
2002282a:	f890 7066 	ldrb.w	r7, [r0, #102]	@ 0x66
2002282e:	f023 0301 	bic.w	r3, r3, #1
20022832:	f890 8067 	ldrb.w	r8, [r0, #103]	@ 0x67
20022836:	6013      	str	r3, [r2, #0]
20022838:	e9d0 2317 	ldrd	r2, r3, [r0, #92]	@ 0x5c
2002283c:	460e      	mov	r6, r1
2002283e:	e9cd 2300 	strd	r2, r3, [sp]
20022842:	e9d0 2312 	ldrd	r2, r3, [r0, #72]	@ 0x48
20022846:	f003 011c 	and.w	r1, r3, #28
2002284a:	2301      	movs	r3, #1
2002284c:	4604      	mov	r4, r0
2002284e:	408b      	lsls	r3, r1
20022850:	6053      	str	r3, [r2, #4]
20022852:	6803      	ldr	r3, [r0, #0]
20022854:	4669      	mov	r1, sp
20022856:	605d      	str	r5, [r3, #4]
20022858:	aa01      	add	r2, sp, #4
2002285a:	f7ff ffa9 	bl	200227b0 <DMA_Remap>
2002285e:	e9dd 0300 	ldrd	r0, r3, [sp]
20022862:	68a1      	ldr	r1, [r4, #8]
20022864:	6822      	ldr	r2, [r4, #0]
20022866:	2910      	cmp	r1, #16
20022868:	bf0b      	itete	eq
2002286a:	6093      	streq	r3, [r2, #8]
2002286c:	6090      	strne	r0, [r2, #8]
2002286e:	6823      	ldreq	r3, [r4, #0]
20022870:	6822      	ldrne	r2, [r4, #0]
20022872:	bf0c      	ite	eq
20022874:	60d8      	streq	r0, [r3, #12]
20022876:	60d3      	strne	r3, [r2, #12]
20022878:	f894 3064 	ldrb.w	r3, [r4, #100]	@ 0x64
2002287c:	b123      	cbz	r3, 20022888 <DMA_Start+0x78>
2002287e:	6de3      	ldr	r3, [r4, #92]	@ 0x5c
20022880:	fa05 f707 	lsl.w	r7, r5, r7
20022884:	443b      	add	r3, r7
20022886:	65e3      	str	r3, [r4, #92]	@ 0x5c
20022888:	f894 3065 	ldrb.w	r3, [r4, #101]	@ 0x65
2002288c:	b123      	cbz	r3, 20022898 <DMA_Start+0x88>
2002288e:	6e23      	ldr	r3, [r4, #96]	@ 0x60
20022890:	fa05 f508 	lsl.w	r5, r5, r8
20022894:	442b      	add	r3, r5
20022896:	6623      	str	r3, [r4, #96]	@ 0x60
20022898:	b136      	cbz	r6, 200228a8 <DMA_Start+0x98>
2002289a:	6ba2      	ldr	r2, [r4, #56]	@ 0x38
2002289c:	6823      	ldr	r3, [r4, #0]
2002289e:	b15a      	cbz	r2, 200228b8 <DMA_Start+0xa8>
200228a0:	681a      	ldr	r2, [r3, #0]
200228a2:	f042 020e 	orr.w	r2, r2, #14
200228a6:	601a      	str	r2, [r3, #0]
200228a8:	6822      	ldr	r2, [r4, #0]
200228aa:	6813      	ldr	r3, [r2, #0]
200228ac:	f043 0301 	orr.w	r3, r3, #1
200228b0:	6013      	str	r3, [r2, #0]
200228b2:	b002      	add	sp, #8
200228b4:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
200228b8:	681a      	ldr	r2, [r3, #0]
200228ba:	f022 0204 	bic.w	r2, r2, #4
200228be:	601a      	str	r2, [r3, #0]
200228c0:	6822      	ldr	r2, [r4, #0]
200228c2:	6813      	ldr	r3, [r2, #0]
200228c4:	f043 030a 	orr.w	r3, r3, #10
200228c8:	6013      	str	r3, [r2, #0]
200228ca:	e7ed      	b.n	200228a8 <DMA_Start+0x98>

200228cc <HAL_DMA_Start>:
200228cc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
200228ce:	461d      	mov	r5, r3
200228d0:	69c3      	ldr	r3, [r0, #28]
200228d2:	4604      	mov	r4, r0
200228d4:	2b20      	cmp	r3, #32
200228d6:	460f      	mov	r7, r1
200228d8:	4616      	mov	r6, r2
200228da:	d105      	bne.n	200228e8 <HAL_DMA_Start+0x1c>
200228dc:	f64f 73fe 	movw	r3, #65534	@ 0xfffe
200228e0:	1e6a      	subs	r2, r5, #1
200228e2:	429a      	cmp	r2, r3
200228e4:	d900      	bls.n	200228e8 <HAL_DMA_Start+0x1c>
200228e6:	e7fe      	b.n	200228e6 <HAL_DMA_Start+0x1a>
200228e8:	f894 302c 	ldrb.w	r3, [r4, #44]	@ 0x2c
200228ec:	2b01      	cmp	r3, #1
200228ee:	d00e      	beq.n	2002290e <HAL_DMA_Start+0x42>
200228f0:	2301      	movs	r3, #1
200228f2:	f884 302c 	strb.w	r3, [r4, #44]	@ 0x2c
200228f6:	f894 302d 	ldrb.w	r3, [r4, #45]	@ 0x2d
200228fa:	2b01      	cmp	r3, #1
200228fc:	b2d9      	uxtb	r1, r3
200228fe:	d103      	bne.n	20022908 <HAL_DMA_Start+0x3c>
20022900:	4620      	mov	r0, r4
20022902:	f7ff fd87 	bl	20022414 <DMA_AllocChannel>
20022906:	b120      	cbz	r0, 20022912 <HAL_DMA_Start+0x46>
20022908:	2300      	movs	r3, #0
2002290a:	f884 302c 	strb.w	r3, [r4, #44]	@ 0x2c
2002290e:	2002      	movs	r0, #2
20022910:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
20022912:	2302      	movs	r3, #2
20022914:	e9c4 5514 	strd	r5, r5, [r4, #80]	@ 0x50
20022918:	e9c4 7617 	strd	r7, r6, [r4, #92]	@ 0x5c
2002291c:	f884 302d 	strb.w	r3, [r4, #45]	@ 0x2d
20022920:	6460      	str	r0, [r4, #68]	@ 0x44
20022922:	6d20      	ldr	r0, [r4, #80]	@ 0x50
20022924:	2800      	cmp	r0, #0
20022926:	d0f3      	beq.n	20022910 <HAL_DMA_Start+0x44>
20022928:	2100      	movs	r1, #0
2002292a:	4620      	mov	r0, r4
2002292c:	f7ff ff70 	bl	20022810 <DMA_Start>
20022930:	6d23      	ldr	r3, [r4, #80]	@ 0x50
20022932:	2b00      	cmp	r3, #0
20022934:	d0f5      	beq.n	20022922 <HAL_DMA_Start+0x56>
20022936:	f44f 727a 	mov.w	r2, #1000	@ 0x3e8
2002293a:	2100      	movs	r1, #0
2002293c:	4620      	mov	r0, r4
2002293e:	f7ff fec7 	bl	200226d0 <HAL_DMA_PollForTransfer>
20022942:	2800      	cmp	r0, #0
20022944:	d0ed      	beq.n	20022922 <HAL_DMA_Start+0x56>
20022946:	e7e3      	b.n	20022910 <HAL_DMA_Start+0x44>

20022948 <HAL_EFUSE_Read>:
20022948:	2a20      	cmp	r2, #32
2002294a:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
2002294e:	4606      	mov	r6, r0
20022950:	460c      	mov	r4, r1
20022952:	4615      	mov	r5, r2
20022954:	dc30      	bgt.n	200229b8 <HAL_EFUSE_Read+0x70>
20022956:	f3c0 08c4 	ubfx	r8, r0, #3, #5
2002295a:	eb08 0302 	add.w	r3, r8, r2
2002295e:	2b20      	cmp	r3, #32
20022960:	dc2a      	bgt.n	200229b8 <HAL_EFUSE_Read+0x70>
20022962:	0797      	lsls	r7, r2, #30
20022964:	d128      	bne.n	200229b8 <HAL_EFUSE_Read+0x70>
20022966:	f010 091f 	ands.w	r9, r0, #31
2002296a:	d125      	bne.n	200229b8 <HAL_EFUSE_Read+0x70>
2002296c:	4a25      	ldr	r2, [pc, #148]	@ (20022a04 <HAL_EFUSE_Read+0xbc>)
2002296e:	2014      	movs	r0, #20
20022970:	f8d2 7094 	ldr.w	r7, [r2, #148]	@ 0x94
20022974:	0a36      	lsrs	r6, r6, #8
20022976:	1cfb      	adds	r3, r7, #3
20022978:	2b0e      	cmp	r3, #14
2002297a:	bf38      	it	cc
2002297c:	230e      	movcc	r3, #14
2002297e:	2b0f      	cmp	r3, #15
20022980:	bf28      	it	cs
20022982:	230f      	movcs	r3, #15
20022984:	f8c2 3094 	str.w	r3, [r2, #148]	@ 0x94
20022988:	f7ff fb37 	bl	20021ffa <HAL_Delay_us>
2002298c:	4a1e      	ldr	r2, [pc, #120]	@ (20022a08 <HAL_EFUSE_Read+0xc0>)
2002298e:	00b3      	lsls	r3, r6, #2
20022990:	6013      	str	r3, [r2, #0]
20022992:	6813      	ldr	r3, [r2, #0]
20022994:	491d      	ldr	r1, [pc, #116]	@ (20022a0c <HAL_EFUSE_Read+0xc4>)
20022996:	f043 0301 	orr.w	r3, r3, #1
2002299a:	6013      	str	r3, [r2, #0]
2002299c:	464b      	mov	r3, r9
2002299e:	4369      	muls	r1, r5
200229a0:	6890      	ldr	r0, [r2, #8]
200229a2:	07c0      	lsls	r0, r0, #31
200229a4:	d50c      	bpl.n	200229c0 <HAL_EFUSE_Read+0x78>
200229a6:	6890      	ldr	r0, [r2, #8]
200229a8:	428b      	cmp	r3, r1
200229aa:	f040 0001 	orr.w	r0, r0, #1
200229ae:	6090      	str	r0, [r2, #8]
200229b0:	d30a      	bcc.n	200229c8 <HAL_EFUSE_Read+0x80>
200229b2:	4b14      	ldr	r3, [pc, #80]	@ (20022a04 <HAL_EFUSE_Read+0xbc>)
200229b4:	f8c3 7094 	str.w	r7, [r3, #148]	@ 0x94
200229b8:	2500      	movs	r5, #0
200229ba:	4628      	mov	r0, r5
200229bc:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
200229c0:	428b      	cmp	r3, r1
200229c2:	d2f0      	bcs.n	200229a6 <HAL_EFUSE_Read+0x5e>
200229c4:	3301      	adds	r3, #1
200229c6:	e7eb      	b.n	200229a0 <HAL_EFUSE_Read+0x58>
200229c8:	4a11      	ldr	r2, [pc, #68]	@ (20022a10 <HAL_EFUSE_Read+0xc8>)
200229ca:	f008 001c 	and.w	r0, r8, #28
200229ce:	eb00 1046 	add.w	r0, r0, r6, lsl #5
200229d2:	f025 0103 	bic.w	r1, r5, #3
200229d6:	4402      	add	r2, r0
200229d8:	4421      	add	r1, r4
200229da:	428c      	cmp	r4, r1
200229dc:	d103      	bne.n	200229e6 <HAL_EFUSE_Read+0x9e>
200229de:	4b09      	ldr	r3, [pc, #36]	@ (20022a04 <HAL_EFUSE_Read+0xbc>)
200229e0:	f8c3 7094 	str.w	r7, [r3, #148]	@ 0x94
200229e4:	e7e9      	b.n	200229ba <HAL_EFUSE_Read+0x72>
200229e6:	f852 3b04 	ldr.w	r3, [r2], #4
200229ea:	3404      	adds	r4, #4
200229ec:	0a18      	lsrs	r0, r3, #8
200229ee:	f804 3c04 	strb.w	r3, [r4, #-4]
200229f2:	f804 0c03 	strb.w	r0, [r4, #-3]
200229f6:	0c18      	lsrs	r0, r3, #16
200229f8:	0e1b      	lsrs	r3, r3, #24
200229fa:	f804 0c02 	strb.w	r0, [r4, #-2]
200229fe:	f804 3c01 	strb.w	r3, [r4, #-1]
20022a02:	e7ea      	b.n	200229da <HAL_EFUSE_Read+0x92>
20022a04:	500ca000 	.word	0x500ca000
20022a08:	5000c000 	.word	0x5000c000
20022a0c:	0005dc00 	.word	0x0005dc00
20022a10:	5000c030 	.word	0x5000c030

20022a14 <HAL_DBG_printf>:
20022a14:	b40f      	push	{r0, r1, r2, r3}
20022a16:	b004      	add	sp, #16
20022a18:	4770      	bx	lr
	...

20022a1c <HAL_HPAON_WakeCore>:
20022a1c:	2802      	cmp	r0, #2
20022a1e:	b510      	push	{r4, lr}
20022a20:	d120      	bne.n	20022a64 <HAL_HPAON_WakeCore+0x48>
20022a22:	4c11      	ldr	r4, [pc, #68]	@ (20022a68 <HAL_HPAON_WakeCore+0x4c>)
20022a24:	20e6      	movs	r0, #230	@ 0xe6
20022a26:	6ae3      	ldr	r3, [r4, #44]	@ 0x2c
20022a28:	f043 0301 	orr.w	r3, r3, #1
20022a2c:	62e3      	str	r3, [r4, #44]	@ 0x2c
20022a2e:	f7ff fae4 	bl	20021ffa <HAL_Delay_us>
20022a32:	6ae3      	ldr	r3, [r4, #44]	@ 0x2c
20022a34:	069a      	lsls	r2, r3, #26
20022a36:	d5fc      	bpl.n	20022a32 <HAL_HPAON_WakeCore+0x16>
20022a38:	201e      	movs	r0, #30
20022a3a:	f7ff fade 	bl	20021ffa <HAL_Delay_us>
20022a3e:	6ae3      	ldr	r3, [r4, #44]	@ 0x2c
20022a40:	069b      	lsls	r3, r3, #26
20022a42:	d5fc      	bpl.n	20022a3e <HAL_HPAON_WakeCore+0x22>
20022a44:	f3ef 8110 	mrs	r1, PRIMASK
20022a48:	2301      	movs	r3, #1
20022a4a:	f383 8810 	msr	PRIMASK, r3
20022a4e:	4a07      	ldr	r2, [pc, #28]	@ (20022a6c <HAL_HPAON_WakeCore+0x50>)
20022a50:	7813      	ldrb	r3, [r2, #0]
20022a52:	2b13      	cmp	r3, #19
20022a54:	d900      	bls.n	20022a58 <HAL_HPAON_WakeCore+0x3c>
20022a56:	e7fe      	b.n	20022a56 <HAL_HPAON_WakeCore+0x3a>
20022a58:	3301      	adds	r3, #1
20022a5a:	7013      	strb	r3, [r2, #0]
20022a5c:	f381 8810 	msr	PRIMASK, r1
20022a60:	2000      	movs	r0, #0
20022a62:	bd10      	pop	{r4, pc}
20022a64:	2001      	movs	r0, #1
20022a66:	e7fc      	b.n	20022a62 <HAL_HPAON_WakeCore+0x46>
20022a68:	500c0000 	.word	0x500c0000
20022a6c:	2004cbc8 	.word	0x2004cbc8

20022a70 <HAL_HPAON_EnableXT48>:
20022a70:	4b04      	ldr	r3, [pc, #16]	@ (20022a84 <HAL_HPAON_EnableXT48+0x14>)
20022a72:	691a      	ldr	r2, [r3, #16]
20022a74:	f042 0202 	orr.w	r2, r2, #2
20022a78:	611a      	str	r2, [r3, #16]
20022a7a:	691a      	ldr	r2, [r3, #16]
20022a7c:	2a00      	cmp	r2, #0
20022a7e:	dafc      	bge.n	20022a7a <HAL_HPAON_EnableXT48+0xa>
20022a80:	4770      	bx	lr
20022a82:	bf00      	nop
20022a84:	500c0000 	.word	0x500c0000

20022a88 <HAL_HPAON_DisableXT48>:
20022a88:	4a02      	ldr	r2, [pc, #8]	@ (20022a94 <HAL_HPAON_DisableXT48+0xc>)
20022a8a:	6913      	ldr	r3, [r2, #16]
20022a8c:	f023 0302 	bic.w	r3, r3, #2
20022a90:	6113      	str	r3, [r2, #16]
20022a92:	4770      	bx	lr
20022a94:	500c0000 	.word	0x500c0000

20022a98 <HAL_QSPI_Init>:
20022a98:	b510      	push	{r4, lr}
20022a9a:	b1e0      	cbz	r0, 20022ad6 <HAL_QSPI_Init+0x3e>
20022a9c:	b1d9      	cbz	r1, 20022ad6 <HAL_QSPI_Init+0x3e>
20022a9e:	2300      	movs	r3, #0
20022aa0:	2201      	movs	r2, #1
20022aa2:	6043      	str	r3, [r0, #4]
20022aa4:	f880 2022 	strb.w	r2, [r0, #34]	@ 0x22
20022aa8:	680c      	ldr	r4, [r1, #0]
20022aaa:	6004      	str	r4, [r0, #0]
20022aac:	684a      	ldr	r2, [r1, #4]
20022aae:	f880 2020 	strb.w	r2, [r0, #32]
20022ab2:	688a      	ldr	r2, [r1, #8]
20022ab4:	6102      	str	r2, [r0, #16]
20022ab6:	68ca      	ldr	r2, [r1, #12]
20022ab8:	0512      	lsls	r2, r2, #20
20022aba:	6142      	str	r2, [r0, #20]
20022abc:	22ff      	movs	r2, #255	@ 0xff
20022abe:	f8c4 2084 	str.w	r2, [r4, #132]	@ 0x84
20022ac2:	f04f 2450 	mov.w	r4, #1342197760	@ 0x50005000
20022ac6:	6801      	ldr	r1, [r0, #0]
20022ac8:	678c      	str	r4, [r1, #120]	@ 0x78
20022aca:	6801      	ldr	r1, [r0, #0]
20022acc:	620a      	str	r2, [r1, #32]
20022ace:	6801      	ldr	r1, [r0, #0]
20022ad0:	4618      	mov	r0, r3
20022ad2:	644a      	str	r2, [r1, #68]	@ 0x44
20022ad4:	bd10      	pop	{r4, pc}
20022ad6:	2001      	movs	r0, #1
20022ad8:	e7fc      	b.n	20022ad4 <HAL_QSPI_Init+0x3c>

20022ada <HAL_FLASH_SET_AHB_RCMD>:
20022ada:	b138      	cbz	r0, 20022aec <HAL_FLASH_SET_AHB_RCMD+0x12>
20022adc:	6802      	ldr	r2, [r0, #0]
20022ade:	2000      	movs	r0, #0
20022ae0:	6c13      	ldr	r3, [r2, #64]	@ 0x40
20022ae2:	f023 03ff 	bic.w	r3, r3, #255	@ 0xff
20022ae6:	4319      	orrs	r1, r3
20022ae8:	6411      	str	r1, [r2, #64]	@ 0x40
20022aea:	4770      	bx	lr
20022aec:	2001      	movs	r0, #1
20022aee:	4770      	bx	lr

20022af0 <HAL_FLASH_CFG_AHB_RCMD>:
20022af0:	b570      	push	{r4, r5, r6, lr}
20022af2:	b1c8      	cbz	r0, 20022b28 <HAL_FLASH_CFG_AHB_RCMD+0x38>
20022af4:	6805      	ldr	r5, [r0, #0]
20022af6:	f99d 6018 	ldrsb.w	r6, [sp, #24]
20022afa:	f99d 001c 	ldrsb.w	r0, [sp, #28]
20022afe:	6cac      	ldr	r4, [r5, #72]	@ 0x48
20022b00:	ea40 00c6 	orr.w	r0, r0, r6, lsl #3
20022b04:	ea40 23c3 	orr.w	r3, r0, r3, lsl #11
20022b08:	f99d 0010 	ldrsb.w	r0, [sp, #16]
20022b0c:	f36f 0414 	bfc	r4, #0, #21
20022b10:	ea43 2300 	orr.w	r3, r3, r0, lsl #8
20022b14:	f99d 0014 	ldrsb.w	r0, [sp, #20]
20022b18:	ea43 1380 	orr.w	r3, r3, r0, lsl #6
20022b1c:	ea43 3242 	orr.w	r2, r3, r2, lsl #13
20022b20:	ea42 4181 	orr.w	r1, r2, r1, lsl #18
20022b24:	4321      	orrs	r1, r4
20022b26:	64a9      	str	r1, [r5, #72]	@ 0x48
20022b28:	bd70      	pop	{r4, r5, r6, pc}

20022b2a <HAL_FLASH_SET_AHB_WCMD>:
20022b2a:	b140      	cbz	r0, 20022b3e <HAL_FLASH_SET_AHB_WCMD+0x14>
20022b2c:	6802      	ldr	r2, [r0, #0]
20022b2e:	2000      	movs	r0, #0
20022b30:	6c13      	ldr	r3, [r2, #64]	@ 0x40
20022b32:	f423 437f 	bic.w	r3, r3, #65280	@ 0xff00
20022b36:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
20022b3a:	6411      	str	r1, [r2, #64]	@ 0x40
20022b3c:	4770      	bx	lr
20022b3e:	2001      	movs	r0, #1
20022b40:	4770      	bx	lr

20022b42 <HAL_FLASH_CFG_AHB_WCMD>:
20022b42:	b570      	push	{r4, r5, r6, lr}
20022b44:	b1c8      	cbz	r0, 20022b7a <HAL_FLASH_CFG_AHB_WCMD+0x38>
20022b46:	6805      	ldr	r5, [r0, #0]
20022b48:	f99d 6018 	ldrsb.w	r6, [sp, #24]
20022b4c:	f99d 001c 	ldrsb.w	r0, [sp, #28]
20022b50:	6d2c      	ldr	r4, [r5, #80]	@ 0x50
20022b52:	ea40 00c6 	orr.w	r0, r0, r6, lsl #3
20022b56:	ea40 23c3 	orr.w	r3, r0, r3, lsl #11
20022b5a:	f99d 0010 	ldrsb.w	r0, [sp, #16]
20022b5e:	f36f 0414 	bfc	r4, #0, #21
20022b62:	ea43 2300 	orr.w	r3, r3, r0, lsl #8
20022b66:	f99d 0014 	ldrsb.w	r0, [sp, #20]
20022b6a:	ea43 1380 	orr.w	r3, r3, r0, lsl #6
20022b6e:	ea43 3242 	orr.w	r2, r3, r2, lsl #13
20022b72:	ea42 4181 	orr.w	r1, r2, r1, lsl #18
20022b76:	4321      	orrs	r1, r4
20022b78:	6529      	str	r1, [r5, #80]	@ 0x50
20022b7a:	bd70      	pop	{r4, r5, r6, pc}

20022b7c <HAL_FLASH_WRITE_WORD>:
20022b7c:	b118      	cbz	r0, 20022b86 <HAL_FLASH_WRITE_WORD+0xa>
20022b7e:	6803      	ldr	r3, [r0, #0]
20022b80:	2000      	movs	r0, #0
20022b82:	6059      	str	r1, [r3, #4]
20022b84:	4770      	bx	lr
20022b86:	2001      	movs	r0, #1
20022b88:	4770      	bx	lr

20022b8a <HAL_FLASH_WRITE_DLEN>:
20022b8a:	b130      	cbz	r0, 20022b9a <HAL_FLASH_WRITE_DLEN+0x10>
20022b8c:	6803      	ldr	r3, [r0, #0]
20022b8e:	3901      	subs	r1, #1
20022b90:	f3c1 0113 	ubfx	r1, r1, #0, #20
20022b94:	2000      	movs	r0, #0
20022b96:	6259      	str	r1, [r3, #36]	@ 0x24
20022b98:	4770      	bx	lr
20022b9a:	2001      	movs	r0, #1
20022b9c:	4770      	bx	lr

20022b9e <HAL_FLASH_WRITE_DLEN2>:
20022b9e:	b130      	cbz	r0, 20022bae <HAL_FLASH_WRITE_DLEN2+0x10>
20022ba0:	6803      	ldr	r3, [r0, #0]
20022ba2:	3901      	subs	r1, #1
20022ba4:	f3c1 0113 	ubfx	r1, r1, #0, #20
20022ba8:	2000      	movs	r0, #0
20022baa:	6399      	str	r1, [r3, #56]	@ 0x38
20022bac:	4770      	bx	lr
20022bae:	2001      	movs	r0, #1
20022bb0:	4770      	bx	lr

20022bb2 <HAL_FLASH_WRITE_ABYTE>:
20022bb2:	b108      	cbz	r0, 20022bb8 <HAL_FLASH_WRITE_ABYTE+0x6>
20022bb4:	6803      	ldr	r3, [r0, #0]
20022bb6:	6219      	str	r1, [r3, #32]
20022bb8:	4770      	bx	lr

20022bba <HAL_FLASH_IS_CMD_DONE>:
20022bba:	b118      	cbz	r0, 20022bc4 <HAL_FLASH_IS_CMD_DONE+0xa>
20022bbc:	6803      	ldr	r3, [r0, #0]
20022bbe:	6918      	ldr	r0, [r3, #16]
20022bc0:	f000 0001 	and.w	r0, r0, #1
20022bc4:	4770      	bx	lr

20022bc6 <HAL_FLASH_CLR_CMD_DONE>:
20022bc6:	b120      	cbz	r0, 20022bd2 <HAL_FLASH_CLR_CMD_DONE+0xc>
20022bc8:	6802      	ldr	r2, [r0, #0]
20022bca:	6953      	ldr	r3, [r2, #20]
20022bcc:	f043 0301 	orr.w	r3, r3, #1
20022bd0:	6153      	str	r3, [r2, #20]
20022bd2:	4770      	bx	lr

20022bd4 <HAL_FLASH_SET_CMD>:
20022bd4:	b538      	push	{r3, r4, r5, lr}
20022bd6:	460d      	mov	r5, r1
20022bd8:	4604      	mov	r4, r0
20022bda:	b1a8      	cbz	r0, 20022c08 <HAL_FLASH_SET_CMD+0x34>
20022bdc:	6803      	ldr	r3, [r0, #0]
20022bde:	61da      	str	r2, [r3, #28]
20022be0:	6ac3      	ldr	r3, [r0, #44]	@ 0x2c
20022be2:	b10b      	cbz	r3, 20022be8 <HAL_FLASH_SET_CMD+0x14>
20022be4:	2001      	movs	r0, #1
20022be6:	4798      	blx	r3
20022be8:	6823      	ldr	r3, [r4, #0]
20022bea:	619d      	str	r5, [r3, #24]
20022bec:	4620      	mov	r0, r4
20022bee:	f7ff ffe4 	bl	20022bba <HAL_FLASH_IS_CMD_DONE>
20022bf2:	2800      	cmp	r0, #0
20022bf4:	d0fa      	beq.n	20022bec <HAL_FLASH_SET_CMD+0x18>
20022bf6:	4620      	mov	r0, r4
20022bf8:	f7ff ffe5 	bl	20022bc6 <HAL_FLASH_CLR_CMD_DONE>
20022bfc:	6ae3      	ldr	r3, [r4, #44]	@ 0x2c
20022bfe:	b10b      	cbz	r3, 20022c04 <HAL_FLASH_SET_CMD+0x30>
20022c00:	2000      	movs	r0, #0
20022c02:	4798      	blx	r3
20022c04:	2000      	movs	r0, #0
20022c06:	bd38      	pop	{r3, r4, r5, pc}
20022c08:	2001      	movs	r0, #1
20022c0a:	e7fc      	b.n	20022c06 <HAL_FLASH_SET_CMD+0x32>

20022c0c <HAL_FLASH_CLR_STATUS>:
20022c0c:	b118      	cbz	r0, 20022c16 <HAL_FLASH_CLR_STATUS+0xa>
20022c0e:	6802      	ldr	r2, [r0, #0]
20022c10:	6953      	ldr	r3, [r2, #20]
20022c12:	4319      	orrs	r1, r3
20022c14:	6151      	str	r1, [r2, #20]
20022c16:	4770      	bx	lr

20022c18 <HAL_FLASH_STATUS_MATCH>:
20022c18:	b118      	cbz	r0, 20022c22 <HAL_FLASH_STATUS_MATCH+0xa>
20022c1a:	6803      	ldr	r3, [r0, #0]
20022c1c:	6918      	ldr	r0, [r3, #16]
20022c1e:	f3c0 00c0 	ubfx	r0, r0, #3, #1
20022c22:	4770      	bx	lr

20022c24 <HAL_FLASH_IS_PROG_DONE>:
20022c24:	b128      	cbz	r0, 20022c32 <HAL_FLASH_IS_PROG_DONE+0xe>
20022c26:	6803      	ldr	r3, [r0, #0]
20022c28:	6858      	ldr	r0, [r3, #4]
20022c2a:	43c0      	mvns	r0, r0
20022c2c:	f000 0001 	and.w	r0, r0, #1
20022c30:	4770      	bx	lr
20022c32:	2001      	movs	r0, #1
20022c34:	4770      	bx	lr

20022c36 <HAL_FLASH_READ32>:
20022c36:	b108      	cbz	r0, 20022c3c <HAL_FLASH_READ32+0x6>
20022c38:	6803      	ldr	r3, [r0, #0]
20022c3a:	6858      	ldr	r0, [r3, #4]
20022c3c:	4770      	bx	lr

20022c3e <HAL_FLASH_SET_TXSLOT>:
20022c3e:	b120      	cbz	r0, 20022c4a <HAL_FLASH_SET_TXSLOT+0xc>
20022c40:	6802      	ldr	r2, [r0, #0]
20022c42:	6d53      	ldr	r3, [r2, #84]	@ 0x54
20022c44:	f361 238e 	bfi	r3, r1, #10, #5
20022c48:	6553      	str	r3, [r2, #84]	@ 0x54
20022c4a:	4770      	bx	lr

20022c4c <HAL_FLASH_SET_CLK_rom>:
20022c4c:	b108      	cbz	r0, 20022c52 <HAL_FLASH_SET_CLK_rom+0x6>
20022c4e:	6803      	ldr	r3, [r0, #0]
20022c50:	60d9      	str	r1, [r3, #12]
20022c52:	4770      	bx	lr

20022c54 <HAL_FLASH_GET_DIV>:
20022c54:	b110      	cbz	r0, 20022c5c <HAL_FLASH_GET_DIV+0x8>
20022c56:	6803      	ldr	r3, [r0, #0]
20022c58:	68d8      	ldr	r0, [r3, #12]
20022c5a:	b2c0      	uxtb	r0, r0
20022c5c:	4770      	bx	lr

20022c5e <HAL_FLASH_MANUAL_CMD>:
20022c5e:	b570      	push	{r4, r5, r6, lr}
20022c60:	b1e8      	cbz	r0, 20022c9e <HAL_FLASH_MANUAL_CMD+0x40>
20022c62:	6805      	ldr	r5, [r0, #0]
20022c64:	f99d 601c 	ldrsb.w	r6, [sp, #28]
20022c68:	f99d 0020 	ldrsb.w	r0, [sp, #32]
20022c6c:	6aac      	ldr	r4, [r5, #40]	@ 0x28
20022c6e:	ea40 00c6 	orr.w	r0, r0, r6, lsl #3
20022c72:	f99d 6010 	ldrsb.w	r6, [sp, #16]
20022c76:	f36f 0415 	bfc	r4, #0, #22
20022c7a:	ea40 20c6 	orr.w	r0, r0, r6, lsl #11
20022c7e:	f99d 6014 	ldrsb.w	r6, [sp, #20]
20022c82:	ea40 2006 	orr.w	r0, r0, r6, lsl #8
20022c86:	f99d 6018 	ldrsb.w	r6, [sp, #24]
20022c8a:	ea40 1086 	orr.w	r0, r0, r6, lsl #6
20022c8e:	ea40 3343 	orr.w	r3, r0, r3, lsl #13
20022c92:	ea43 4282 	orr.w	r2, r3, r2, lsl #18
20022c96:	ea42 5141 	orr.w	r1, r2, r1, lsl #21
20022c9a:	4321      	orrs	r1, r4
20022c9c:	62a9      	str	r1, [r5, #40]	@ 0x28
20022c9e:	bd70      	pop	{r4, r5, r6, pc}

20022ca0 <HAL_FLASH_MANUAL_CMD2>:
20022ca0:	b570      	push	{r4, r5, r6, lr}
20022ca2:	b1e8      	cbz	r0, 20022ce0 <HAL_FLASH_MANUAL_CMD2+0x40>
20022ca4:	6805      	ldr	r5, [r0, #0]
20022ca6:	f99d 601c 	ldrsb.w	r6, [sp, #28]
20022caa:	f99d 0020 	ldrsb.w	r0, [sp, #32]
20022cae:	6bec      	ldr	r4, [r5, #60]	@ 0x3c
20022cb0:	ea40 00c6 	orr.w	r0, r0, r6, lsl #3
20022cb4:	f99d 6010 	ldrsb.w	r6, [sp, #16]
20022cb8:	f36f 0415 	bfc	r4, #0, #22
20022cbc:	ea40 20c6 	orr.w	r0, r0, r6, lsl #11
20022cc0:	f99d 6014 	ldrsb.w	r6, [sp, #20]
20022cc4:	ea40 2006 	orr.w	r0, r0, r6, lsl #8
20022cc8:	f99d 6018 	ldrsb.w	r6, [sp, #24]
20022ccc:	ea40 1086 	orr.w	r0, r0, r6, lsl #6
20022cd0:	ea40 3343 	orr.w	r3, r0, r3, lsl #13
20022cd4:	ea43 4282 	orr.w	r2, r3, r2, lsl #18
20022cd8:	ea42 5141 	orr.w	r1, r2, r1, lsl #21
20022cdc:	4321      	orrs	r1, r4
20022cde:	63e9      	str	r1, [r5, #60]	@ 0x3c
20022ce0:	bd70      	pop	{r4, r5, r6, pc}
	...

20022ce4 <HAL_FLASH_SET_ALIAS_RANGE>:
20022ce4:	b510      	push	{r4, lr}
20022ce6:	b158      	cbz	r0, 20022d00 <HAL_FLASH_SET_ALIAS_RANGE+0x1c>
20022ce8:	4b06      	ldr	r3, [pc, #24]	@ (20022d04 <HAL_FLASH_SET_ALIAS_RANGE+0x20>)
20022cea:	6804      	ldr	r4, [r0, #0]
20022cec:	f202 32ff 	addw	r2, r2, #1023	@ 0x3ff
20022cf0:	440a      	add	r2, r1
20022cf2:	4019      	ands	r1, r3
20022cf4:	66e1      	str	r1, [r4, #108]	@ 0x6c
20022cf6:	401a      	ands	r2, r3
20022cf8:	6803      	ldr	r3, [r0, #0]
20022cfa:	2000      	movs	r0, #0
20022cfc:	671a      	str	r2, [r3, #112]	@ 0x70
20022cfe:	bd10      	pop	{r4, pc}
20022d00:	2001      	movs	r0, #1
20022d02:	e7fc      	b.n	20022cfe <HAL_FLASH_SET_ALIAS_RANGE+0x1a>
20022d04:	fffffc00 	.word	0xfffffc00

20022d08 <HAL_FLASH_SET_ALIAS_OFFSET>:
20022d08:	b128      	cbz	r0, 20022d16 <HAL_FLASH_SET_ALIAS_OFFSET+0xe>
20022d0a:	6803      	ldr	r3, [r0, #0]
20022d0c:	f36f 0109 	bfc	r1, #0, #10
20022d10:	2000      	movs	r0, #0
20022d12:	6759      	str	r1, [r3, #116]	@ 0x74
20022d14:	4770      	bx	lr
20022d16:	2001      	movs	r0, #1
20022d18:	4770      	bx	lr
	...

20022d1c <HAL_FLASH_SET_CTR>:
20022d1c:	b510      	push	{r4, lr}
20022d1e:	b150      	cbz	r0, 20022d36 <HAL_FLASH_SET_CTR+0x1a>
20022d20:	4b06      	ldr	r3, [pc, #24]	@ (20022d3c <HAL_FLASH_SET_CTR+0x20>)
20022d22:	6804      	ldr	r4, [r0, #0]
20022d24:	4019      	ands	r1, r3
20022d26:	65e1      	str	r1, [r4, #92]	@ 0x5c
20022d28:	6801      	ldr	r1, [r0, #0]
20022d2a:	2000      	movs	r0, #0
20022d2c:	f202 32ff 	addw	r2, r2, #1023	@ 0x3ff
20022d30:	401a      	ands	r2, r3
20022d32:	660a      	str	r2, [r1, #96]	@ 0x60
20022d34:	bd10      	pop	{r4, pc}
20022d36:	2001      	movs	r0, #1
20022d38:	e7fc      	b.n	20022d34 <HAL_FLASH_SET_CTR+0x18>
20022d3a:	bf00      	nop
20022d3c:	fffffc00 	.word	0xfffffc00

20022d40 <HAL_FLASH_SET_NONCE>:
20022d40:	b150      	cbz	r0, 20022d58 <HAL_FLASH_SET_NONCE+0x18>
20022d42:	b149      	cbz	r1, 20022d58 <HAL_FLASH_SET_NONCE+0x18>
20022d44:	680b      	ldr	r3, [r1, #0]
20022d46:	6802      	ldr	r2, [r0, #0]
20022d48:	ba1b      	rev	r3, r3
20022d4a:	6653      	str	r3, [r2, #100]	@ 0x64
20022d4c:	684b      	ldr	r3, [r1, #4]
20022d4e:	6802      	ldr	r2, [r0, #0]
20022d50:	ba1b      	rev	r3, r3
20022d52:	2000      	movs	r0, #0
20022d54:	6693      	str	r3, [r2, #104]	@ 0x68
20022d56:	4770      	bx	lr
20022d58:	2001      	movs	r0, #1
20022d5a:	4770      	bx	lr

20022d5c <HAL_FLASH_SET_AES>:
20022d5c:	b158      	cbz	r0, 20022d76 <HAL_FLASH_SET_AES+0x1a>
20022d5e:	6803      	ldr	r3, [r0, #0]
20022d60:	2901      	cmp	r1, #1
20022d62:	681a      	ldr	r2, [r3, #0]
20022d64:	d104      	bne.n	20022d70 <HAL_FLASH_SET_AES+0x14>
20022d66:	f042 0280 	orr.w	r2, r2, #128	@ 0x80
20022d6a:	2000      	movs	r0, #0
20022d6c:	601a      	str	r2, [r3, #0]
20022d6e:	4770      	bx	lr
20022d70:	f022 0280 	bic.w	r2, r2, #128	@ 0x80
20022d74:	e7f9      	b.n	20022d6a <HAL_FLASH_SET_AES+0xe>
20022d76:	2001      	movs	r0, #1
20022d78:	4770      	bx	lr

20022d7a <HAL_FLASH_ENABLE_AES>:
20022d7a:	b150      	cbz	r0, 20022d92 <HAL_FLASH_ENABLE_AES+0x18>
20022d7c:	6803      	ldr	r3, [r0, #0]
20022d7e:	681a      	ldr	r2, [r3, #0]
20022d80:	b121      	cbz	r1, 20022d8c <HAL_FLASH_ENABLE_AES+0x12>
20022d82:	f042 0240 	orr.w	r2, r2, #64	@ 0x40
20022d86:	2000      	movs	r0, #0
20022d88:	601a      	str	r2, [r3, #0]
20022d8a:	4770      	bx	lr
20022d8c:	f022 0240 	bic.w	r2, r2, #64	@ 0x40
20022d90:	e7f9      	b.n	20022d86 <HAL_FLASH_ENABLE_AES+0xc>
20022d92:	2001      	movs	r0, #1
20022d94:	4770      	bx	lr

20022d96 <HAL_FLASH_ENABLE_QSPI>:
20022d96:	b150      	cbz	r0, 20022dae <HAL_FLASH_ENABLE_QSPI+0x18>
20022d98:	6803      	ldr	r3, [r0, #0]
20022d9a:	681a      	ldr	r2, [r3, #0]
20022d9c:	b121      	cbz	r1, 20022da8 <HAL_FLASH_ENABLE_QSPI+0x12>
20022d9e:	f042 0201 	orr.w	r2, r2, #1
20022da2:	2000      	movs	r0, #0
20022da4:	601a      	str	r2, [r3, #0]
20022da6:	4770      	bx	lr
20022da8:	f022 0201 	bic.w	r2, r2, #1
20022dac:	e7f9      	b.n	20022da2 <HAL_FLASH_ENABLE_QSPI+0xc>
20022dae:	2001      	movs	r0, #1
20022db0:	4770      	bx	lr

20022db2 <HAL_FLASH_ENABLE_OPI>:
20022db2:	b150      	cbz	r0, 20022dca <HAL_FLASH_ENABLE_OPI+0x18>
20022db4:	6803      	ldr	r3, [r0, #0]
20022db6:	681a      	ldr	r2, [r3, #0]
20022db8:	b121      	cbz	r1, 20022dc4 <HAL_FLASH_ENABLE_OPI+0x12>
20022dba:	f442 1200 	orr.w	r2, r2, #2097152	@ 0x200000
20022dbe:	2000      	movs	r0, #0
20022dc0:	601a      	str	r2, [r3, #0]
20022dc2:	4770      	bx	lr
20022dc4:	f422 1200 	bic.w	r2, r2, #2097152	@ 0x200000
20022dc8:	e7f9      	b.n	20022dbe <HAL_FLASH_ENABLE_OPI+0xc>
20022dca:	2001      	movs	r0, #1
20022dcc:	4770      	bx	lr

20022dce <HAL_FLASH_ENABLE_HYPER>:
20022dce:	b150      	cbz	r0, 20022de6 <HAL_FLASH_ENABLE_HYPER+0x18>
20022dd0:	6803      	ldr	r3, [r0, #0]
20022dd2:	689a      	ldr	r2, [r3, #8]
20022dd4:	b121      	cbz	r1, 20022de0 <HAL_FLASH_ENABLE_HYPER+0x12>
20022dd6:	f042 0210 	orr.w	r2, r2, #16
20022dda:	2000      	movs	r0, #0
20022ddc:	609a      	str	r2, [r3, #8]
20022dde:	4770      	bx	lr
20022de0:	f022 0210 	bic.w	r2, r2, #16
20022de4:	e7f9      	b.n	20022dda <HAL_FLASH_ENABLE_HYPER+0xc>
20022de6:	2001      	movs	r0, #1
20022de8:	4770      	bx	lr

20022dea <HAL_FLASH_ENABLE_CMD2>:
20022dea:	b150      	cbz	r0, 20022e02 <HAL_FLASH_ENABLE_CMD2+0x18>
20022dec:	6803      	ldr	r3, [r0, #0]
20022dee:	681a      	ldr	r2, [r3, #0]
20022df0:	b121      	cbz	r1, 20022dfc <HAL_FLASH_ENABLE_CMD2+0x12>
20022df2:	f442 3280 	orr.w	r2, r2, #65536	@ 0x10000
20022df6:	2000      	movs	r0, #0
20022df8:	601a      	str	r2, [r3, #0]
20022dfa:	4770      	bx	lr
20022dfc:	f422 3280 	bic.w	r2, r2, #65536	@ 0x10000
20022e00:	e7f9      	b.n	20022df6 <HAL_FLASH_ENABLE_CMD2+0xc>
20022e02:	2001      	movs	r0, #1
20022e04:	4770      	bx	lr

20022e06 <HAL_FLASH_STAUS_MATCH_CMD2>:
20022e06:	b150      	cbz	r0, 20022e1e <HAL_FLASH_STAUS_MATCH_CMD2+0x18>
20022e08:	6803      	ldr	r3, [r0, #0]
20022e0a:	681a      	ldr	r2, [r3, #0]
20022e0c:	b121      	cbz	r1, 20022e18 <HAL_FLASH_STAUS_MATCH_CMD2+0x12>
20022e0e:	f442 2280 	orr.w	r2, r2, #262144	@ 0x40000
20022e12:	2000      	movs	r0, #0
20022e14:	601a      	str	r2, [r3, #0]
20022e16:	4770      	bx	lr
20022e18:	f422 2280 	bic.w	r2, r2, #262144	@ 0x40000
20022e1c:	e7f9      	b.n	20022e12 <HAL_FLASH_STAUS_MATCH_CMD2+0xc>
20022e1e:	2001      	movs	r0, #1
20022e20:	4770      	bx	lr

20022e22 <HAL_FLASH_SET_CS_TIME>:
20022e22:	b530      	push	{r4, r5, lr}
20022e24:	b180      	cbz	r0, 20022e48 <HAL_FLASH_SET_CS_TIME+0x26>
20022e26:	6805      	ldr	r5, [r0, #0]
20022e28:	f8bd 000c 	ldrh.w	r0, [sp, #12]
20022e2c:	68ac      	ldr	r4, [r5, #8]
20022e2e:	0680      	lsls	r0, r0, #26
20022e30:	ea40 5383 	orr.w	r3, r0, r3, lsl #22
20022e34:	2000      	movs	r0, #0
20022e36:	ea43 4181 	orr.w	r1, r3, r1, lsl #18
20022e3a:	f36f 149e 	bfc	r4, #6, #25
20022e3e:	ea41 1282 	orr.w	r2, r1, r2, lsl #6
20022e42:	4322      	orrs	r2, r4
20022e44:	60aa      	str	r2, [r5, #8]
20022e46:	bd30      	pop	{r4, r5, pc}
20022e48:	2001      	movs	r0, #1
20022e4a:	e7fc      	b.n	20022e46 <HAL_FLASH_SET_CS_TIME+0x24>

20022e4c <HAL_FLASH_SET_ROW_BOUNDARY>:
20022e4c:	b130      	cbz	r0, 20022e5c <HAL_FLASH_SET_ROW_BOUNDARY+0x10>
20022e4e:	6802      	ldr	r2, [r0, #0]
20022e50:	2000      	movs	r0, #0
20022e52:	6893      	ldr	r3, [r2, #8]
20022e54:	f361 0302 	bfi	r3, r1, #0, #3
20022e58:	6093      	str	r3, [r2, #8]
20022e5a:	4770      	bx	lr
20022e5c:	2001      	movs	r0, #1
20022e5e:	4770      	bx	lr

20022e60 <HAL_FLASH_SET_LEGACY>:
20022e60:	b150      	cbz	r0, 20022e78 <HAL_FLASH_SET_LEGACY+0x18>
20022e62:	6803      	ldr	r3, [r0, #0]
20022e64:	689a      	ldr	r2, [r3, #8]
20022e66:	b121      	cbz	r1, 20022e72 <HAL_FLASH_SET_LEGACY+0x12>
20022e68:	f042 0220 	orr.w	r2, r2, #32
20022e6c:	2000      	movs	r0, #0
20022e6e:	609a      	str	r2, [r3, #8]
20022e70:	4770      	bx	lr
20022e72:	f022 0220 	bic.w	r2, r2, #32
20022e76:	e7f9      	b.n	20022e6c <HAL_FLASH_SET_LEGACY+0xc>
20022e78:	2001      	movs	r0, #1
20022e7a:	4770      	bx	lr

20022e7c <HAL_FLASH_SET_DUAL_MODE>:
20022e7c:	b150      	cbz	r0, 20022e94 <HAL_FLASH_SET_DUAL_MODE+0x18>
20022e7e:	6803      	ldr	r3, [r0, #0]
20022e80:	681a      	ldr	r2, [r3, #0]
20022e82:	b121      	cbz	r1, 20022e8e <HAL_FLASH_SET_DUAL_MODE+0x12>
20022e84:	f042 7280 	orr.w	r2, r2, #16777216	@ 0x1000000
20022e88:	2000      	movs	r0, #0
20022e8a:	601a      	str	r2, [r3, #0]
20022e8c:	4770      	bx	lr
20022e8e:	f022 7280 	bic.w	r2, r2, #16777216	@ 0x1000000
20022e92:	e7f9      	b.n	20022e88 <HAL_FLASH_SET_DUAL_MODE+0xc>
20022e94:	2001      	movs	r0, #1
20022e96:	4770      	bx	lr

20022e98 <HAL_MPI_EN_FIXLAT>:
20022e98:	b150      	cbz	r0, 20022eb0 <HAL_MPI_EN_FIXLAT+0x18>
20022e9a:	6803      	ldr	r3, [r0, #0]
20022e9c:	689a      	ldr	r2, [r3, #8]
20022e9e:	b121      	cbz	r1, 20022eaa <HAL_MPI_EN_FIXLAT+0x12>
20022ea0:	f042 4200 	orr.w	r2, r2, #2147483648	@ 0x80000000
20022ea4:	2000      	movs	r0, #0
20022ea6:	609a      	str	r2, [r3, #8]
20022ea8:	4770      	bx	lr
20022eaa:	f022 4200 	bic.w	r2, r2, #2147483648	@ 0x80000000
20022eae:	e7f9      	b.n	20022ea4 <HAL_MPI_EN_FIXLAT+0xc>
20022eb0:	2001      	movs	r0, #1
20022eb2:	4770      	bx	lr

20022eb4 <HAL_MPI_ENABLE_DQS>:
20022eb4:	b150      	cbz	r0, 20022ecc <HAL_MPI_ENABLE_DQS+0x18>
20022eb6:	6803      	ldr	r3, [r0, #0]
20022eb8:	689a      	ldr	r2, [r3, #8]
20022eba:	b121      	cbz	r1, 20022ec6 <HAL_MPI_ENABLE_DQS+0x12>
20022ebc:	f042 0208 	orr.w	r2, r2, #8
20022ec0:	2000      	movs	r0, #0
20022ec2:	609a      	str	r2, [r3, #8]
20022ec4:	4770      	bx	lr
20022ec6:	f022 0208 	bic.w	r2, r2, #8
20022eca:	e7f9      	b.n	20022ec0 <HAL_MPI_ENABLE_DQS+0xc>
20022ecc:	2001      	movs	r0, #1
20022ece:	4770      	bx	lr

20022ed0 <HAL_MPI_SET_DQS_DELAY>:
20022ed0:	b140      	cbz	r0, 20022ee4 <HAL_MPI_SET_DQS_DELAY+0x14>
20022ed2:	6802      	ldr	r2, [r0, #0]
20022ed4:	2000      	movs	r0, #0
20022ed6:	6d93      	ldr	r3, [r2, #88]	@ 0x58
20022ed8:	f423 037f 	bic.w	r3, r3, #16711680	@ 0xff0000
20022edc:	ea43 4101 	orr.w	r1, r3, r1, lsl #16
20022ee0:	6591      	str	r1, [r2, #88]	@ 0x58
20022ee2:	4770      	bx	lr
20022ee4:	2001      	movs	r0, #1
20022ee6:	4770      	bx	lr

20022ee8 <HAL_MPI_SET_SCK>:
20022ee8:	b160      	cbz	r0, 20022f04 <HAL_MPI_SET_SCK+0x1c>
20022eea:	6800      	ldr	r0, [r0, #0]
20022eec:	0652      	lsls	r2, r2, #25
20022eee:	6d83      	ldr	r3, [r0, #88]	@ 0x58
20022ef0:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
20022ef4:	f023 7300 	bic.w	r3, r3, #33554432	@ 0x2000000
20022ef8:	f423 437f 	bic.w	r3, r3, #65280	@ 0xff00
20022efc:	4319      	orrs	r1, r3
20022efe:	6581      	str	r1, [r0, #88]	@ 0x58
20022f00:	2000      	movs	r0, #0
20022f02:	4770      	bx	lr
20022f04:	2001      	movs	r0, #1
20022f06:	4770      	bx	lr

20022f08 <HAL_MPI_CFG_DTR>:
20022f08:	b510      	push	{r4, lr}
20022f0a:	b1f0      	cbz	r0, 20022f4a <HAL_MPI_CFG_DTR+0x42>
20022f0c:	6804      	ldr	r4, [r0, #0]
20022f0e:	6da0      	ldr	r0, [r4, #88]	@ 0x58
20022f10:	b1b1      	cbz	r1, 20022f40 <HAL_MPI_CFG_DTR+0x38>
20022f12:	2a02      	cmp	r2, #2
20022f14:	bf84      	itt	hi
20022f16:	3a02      	subhi	r2, #2
20022f18:	b2d2      	uxtbhi	r2, r2
20022f1a:	0213      	lsls	r3, r2, #8
20022f1c:	f36f 000f 	bfc	r0, #0, #16
20022f20:	f403 43fe 	and.w	r3, r3, #32512	@ 0x7f00
20022f24:	4303      	orrs	r3, r0
20022f26:	0612      	lsls	r2, r2, #24
20022f28:	bf54      	ite	pl
20022f2a:	f043 6380 	orrpl.w	r3, r3, #67108864	@ 0x4000000
20022f2e:	f043 63a0 	orrmi.w	r3, r3, #83886080	@ 0x5000000
20022f32:	f043 030a 	orr.w	r3, r3, #10
20022f36:	f023 7300 	bic.w	r3, r3, #33554432	@ 0x2000000
20022f3a:	2000      	movs	r0, #0
20022f3c:	65a3      	str	r3, [r4, #88]	@ 0x58
20022f3e:	bd10      	pop	{r4, pc}
20022f40:	4b03      	ldr	r3, [pc, #12]	@ (20022f50 <HAL_MPI_CFG_DTR+0x48>)
20022f42:	4003      	ands	r3, r0
20022f44:	f043 7300 	orr.w	r3, r3, #33554432	@ 0x2000000
20022f48:	e7f7      	b.n	20022f3a <HAL_MPI_CFG_DTR+0x32>
20022f4a:	2001      	movs	r0, #1
20022f4c:	e7f7      	b.n	20022f3e <HAL_MPI_CFG_DTR+0x36>
20022f4e:	bf00      	nop
20022f50:	faff0000 	.word	0xfaff0000

20022f54 <HAL_MPI_MODIFY_RCMD_DELAY>:
20022f54:	b130      	cbz	r0, 20022f64 <HAL_MPI_MODIFY_RCMD_DELAY+0x10>
20022f56:	6802      	ldr	r2, [r0, #0]
20022f58:	6c93      	ldr	r3, [r2, #72]	@ 0x48
20022f5a:	f423 3378 	bic.w	r3, r3, #253952	@ 0x3e000
20022f5e:	ea43 3141 	orr.w	r1, r3, r1, lsl #13
20022f62:	6491      	str	r1, [r2, #72]	@ 0x48
20022f64:	4770      	bx	lr

20022f66 <HAL_MPI_MODIFY_WCMD_DELAY>:
20022f66:	b130      	cbz	r0, 20022f76 <HAL_MPI_MODIFY_WCMD_DELAY+0x10>
20022f68:	6802      	ldr	r2, [r0, #0]
20022f6a:	6d13      	ldr	r3, [r2, #80]	@ 0x50
20022f6c:	f423 3378 	bic.w	r3, r3, #253952	@ 0x3e000
20022f70:	ea43 3141 	orr.w	r1, r3, r1, lsl #13
20022f74:	6511      	str	r1, [r2, #80]	@ 0x50
20022f76:	4770      	bx	lr

20022f78 <HAL_FLASH_CONFIG_AHB_READ>:
20022f78:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
20022f7a:	4605      	mov	r5, r0
20022f7c:	2800      	cmp	r0, #0
20022f7e:	d03d      	beq.n	20022ffc <HAL_FLASH_CONFIG_AHB_READ+0x84>
20022f80:	68c4      	ldr	r4, [r0, #12]
20022f82:	b301      	cbz	r1, 20022fc6 <HAL_FLASH_CONFIG_AHB_READ+0x4e>
20022f84:	f894 306a 	ldrb.w	r3, [r4, #106]	@ 0x6a
20022f88:	2b00      	cmp	r3, #0
20022f8a:	d037      	beq.n	20022ffc <HAL_FLASH_CONFIG_AHB_READ+0x84>
20022f8c:	f994 6072 	ldrsb.w	r6, [r4, #114]	@ 0x72
20022f90:	f994 306e 	ldrsb.w	r3, [r4, #110]	@ 0x6e
20022f94:	f994 106c 	ldrsb.w	r1, [r4, #108]	@ 0x6c
20022f98:	f994 206d 	ldrsb.w	r2, [r4, #109]	@ 0x6d
20022f9c:	9603      	str	r6, [sp, #12]
20022f9e:	f994 6071 	ldrsb.w	r6, [r4, #113]	@ 0x71
20022fa2:	9602      	str	r6, [sp, #8]
20022fa4:	f994 6070 	ldrsb.w	r6, [r4, #112]	@ 0x70
20022fa8:	9601      	str	r6, [sp, #4]
20022faa:	f994 406f 	ldrsb.w	r4, [r4, #111]	@ 0x6f
20022fae:	9400      	str	r4, [sp, #0]
20022fb0:	f7ff fd9e 	bl	20022af0 <HAL_FLASH_CFG_AHB_RCMD>
20022fb4:	68eb      	ldr	r3, [r5, #12]
20022fb6:	f893 106a 	ldrb.w	r1, [r3, #106]	@ 0x6a
20022fba:	4628      	mov	r0, r5
20022fbc:	f7ff fd8d 	bl	20022ada <HAL_FLASH_SET_AHB_RCMD>
20022fc0:	2000      	movs	r0, #0
20022fc2:	b004      	add	sp, #16
20022fc4:	bd70      	pop	{r4, r5, r6, pc}
20022fc6:	f894 3046 	ldrb.w	r3, [r4, #70]	@ 0x46
20022fca:	b1bb      	cbz	r3, 20022ffc <HAL_FLASH_CONFIG_AHB_READ+0x84>
20022fcc:	f994 604e 	ldrsb.w	r6, [r4, #78]	@ 0x4e
20022fd0:	f994 304a 	ldrsb.w	r3, [r4, #74]	@ 0x4a
20022fd4:	f994 1048 	ldrsb.w	r1, [r4, #72]	@ 0x48
20022fd8:	f994 2049 	ldrsb.w	r2, [r4, #73]	@ 0x49
20022fdc:	9603      	str	r6, [sp, #12]
20022fde:	f994 604d 	ldrsb.w	r6, [r4, #77]	@ 0x4d
20022fe2:	9602      	str	r6, [sp, #8]
20022fe4:	f994 604c 	ldrsb.w	r6, [r4, #76]	@ 0x4c
20022fe8:	9601      	str	r6, [sp, #4]
20022fea:	f994 404b 	ldrsb.w	r4, [r4, #75]	@ 0x4b
20022fee:	9400      	str	r4, [sp, #0]
20022ff0:	f7ff fd7e 	bl	20022af0 <HAL_FLASH_CFG_AHB_RCMD>
20022ff4:	68eb      	ldr	r3, [r5, #12]
20022ff6:	f893 1046 	ldrb.w	r1, [r3, #70]	@ 0x46
20022ffa:	e7de      	b.n	20022fba <HAL_FLASH_CONFIG_AHB_READ+0x42>
20022ffc:	2001      	movs	r0, #1
20022ffe:	e7e0      	b.n	20022fc2 <HAL_FLASH_CONFIG_AHB_READ+0x4a>

20023000 <HAL_FLASH_CONFIG_FULL_AHB_READ>:
20023000:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
20023002:	4605      	mov	r5, r0
20023004:	2800      	cmp	r0, #0
20023006:	d036      	beq.n	20023076 <HAL_FLASH_CONFIG_FULL_AHB_READ+0x76>
20023008:	68c4      	ldr	r4, [r0, #12]
2002300a:	b1e1      	cbz	r1, 20023046 <HAL_FLASH_CONFIG_FULL_AHB_READ+0x46>
2002300c:	f994 616e 	ldrsb.w	r6, [r4, #366]	@ 0x16e
20023010:	f994 316a 	ldrsb.w	r3, [r4, #362]	@ 0x16a
20023014:	f994 1168 	ldrsb.w	r1, [r4, #360]	@ 0x168
20023018:	f994 2169 	ldrsb.w	r2, [r4, #361]	@ 0x169
2002301c:	9603      	str	r6, [sp, #12]
2002301e:	f994 616d 	ldrsb.w	r6, [r4, #365]	@ 0x16d
20023022:	9602      	str	r6, [sp, #8]
20023024:	f994 616c 	ldrsb.w	r6, [r4, #364]	@ 0x16c
20023028:	9601      	str	r6, [sp, #4]
2002302a:	f994 416b 	ldrsb.w	r4, [r4, #363]	@ 0x16b
2002302e:	9400      	str	r4, [sp, #0]
20023030:	f7ff fd5e 	bl	20022af0 <HAL_FLASH_CFG_AHB_RCMD>
20023034:	68eb      	ldr	r3, [r5, #12]
20023036:	f893 1166 	ldrb.w	r1, [r3, #358]	@ 0x166
2002303a:	4628      	mov	r0, r5
2002303c:	f7ff fd4d 	bl	20022ada <HAL_FLASH_SET_AHB_RCMD>
20023040:	2000      	movs	r0, #0
20023042:	b004      	add	sp, #16
20023044:	bd70      	pop	{r4, r5, r6, pc}
20023046:	f994 615c 	ldrsb.w	r6, [r4, #348]	@ 0x15c
2002304a:	f994 3158 	ldrsb.w	r3, [r4, #344]	@ 0x158
2002304e:	f994 1156 	ldrsb.w	r1, [r4, #342]	@ 0x156
20023052:	f994 2157 	ldrsb.w	r2, [r4, #343]	@ 0x157
20023056:	9603      	str	r6, [sp, #12]
20023058:	f994 615b 	ldrsb.w	r6, [r4, #347]	@ 0x15b
2002305c:	9602      	str	r6, [sp, #8]
2002305e:	f994 615a 	ldrsb.w	r6, [r4, #346]	@ 0x15a
20023062:	9601      	str	r6, [sp, #4]
20023064:	f994 4159 	ldrsb.w	r4, [r4, #345]	@ 0x159
20023068:	9400      	str	r4, [sp, #0]
2002306a:	f7ff fd41 	bl	20022af0 <HAL_FLASH_CFG_AHB_RCMD>
2002306e:	68eb      	ldr	r3, [r5, #12]
20023070:	f893 1154 	ldrb.w	r1, [r3, #340]	@ 0x154
20023074:	e7e1      	b.n	2002303a <HAL_FLASH_CONFIG_FULL_AHB_READ+0x3a>
20023076:	2001      	movs	r0, #1
20023078:	e7e3      	b.n	20023042 <HAL_FLASH_CONFIG_FULL_AHB_READ+0x42>

2002307a <HAL_FLASH_PRE_CMD>:
2002307a:	b530      	push	{r4, r5, lr}
2002307c:	68c4      	ldr	r4, [r0, #12]
2002307e:	b087      	sub	sp, #28
20023080:	b304      	cbz	r4, 200230c4 <HAL_FLASH_PRE_CMD+0x4a>
20023082:	2938      	cmp	r1, #56	@ 0x38
20023084:	d81e      	bhi.n	200230c4 <HAL_FLASH_PRE_CMD+0x4a>
20023086:	eb01 01c1 	add.w	r1, r1, r1, lsl #3
2002308a:	440c      	add	r4, r1
2002308c:	7c23      	ldrb	r3, [r4, #16]
2002308e:	b1cb      	cbz	r3, 200230c4 <HAL_FLASH_PRE_CMD+0x4a>
20023090:	f994 5018 	ldrsb.w	r5, [r4, #24]
20023094:	f994 3013 	ldrsb.w	r3, [r4, #19]
20023098:	f994 2012 	ldrsb.w	r2, [r4, #18]
2002309c:	f994 1011 	ldrsb.w	r1, [r4, #17]
200230a0:	9504      	str	r5, [sp, #16]
200230a2:	f994 5017 	ldrsb.w	r5, [r4, #23]
200230a6:	9503      	str	r5, [sp, #12]
200230a8:	f994 5016 	ldrsb.w	r5, [r4, #22]
200230ac:	9502      	str	r5, [sp, #8]
200230ae:	f994 5015 	ldrsb.w	r5, [r4, #21]
200230b2:	9501      	str	r5, [sp, #4]
200230b4:	f994 4014 	ldrsb.w	r4, [r4, #20]
200230b8:	9400      	str	r4, [sp, #0]
200230ba:	f7ff fdd0 	bl	20022c5e <HAL_FLASH_MANUAL_CMD>
200230be:	2000      	movs	r0, #0
200230c0:	b007      	add	sp, #28
200230c2:	bd30      	pop	{r4, r5, pc}
200230c4:	2001      	movs	r0, #1
200230c6:	e7fb      	b.n	200230c0 <HAL_FLASH_PRE_CMD+0x46>

200230c8 <HAL_FLASH_ISSUE_CMD>:
200230c8:	b5f0      	push	{r4, r5, r6, r7, lr}
200230ca:	68c4      	ldr	r4, [r0, #12]
200230cc:	4606      	mov	r6, r0
200230ce:	4617      	mov	r7, r2
200230d0:	b087      	sub	sp, #28
200230d2:	b354      	cbz	r4, 2002312a <HAL_FLASH_ISSUE_CMD+0x62>
200230d4:	2938      	cmp	r1, #56	@ 0x38
200230d6:	d828      	bhi.n	2002312a <HAL_FLASH_ISSUE_CMD+0x62>
200230d8:	eb01 05c1 	add.w	r5, r1, r1, lsl #3
200230dc:	442c      	add	r4, r5
200230de:	7c23      	ldrb	r3, [r4, #16]
200230e0:	b31b      	cbz	r3, 2002312a <HAL_FLASH_ISSUE_CMD+0x62>
200230e2:	f994 c018 	ldrsb.w	ip, [r4, #24]
200230e6:	f994 3013 	ldrsb.w	r3, [r4, #19]
200230ea:	f994 2012 	ldrsb.w	r2, [r4, #18]
200230ee:	f994 1011 	ldrsb.w	r1, [r4, #17]
200230f2:	f8cd c010 	str.w	ip, [sp, #16]
200230f6:	f994 c017 	ldrsb.w	ip, [r4, #23]
200230fa:	f8cd c00c 	str.w	ip, [sp, #12]
200230fe:	f994 c016 	ldrsb.w	ip, [r4, #22]
20023102:	f8cd c008 	str.w	ip, [sp, #8]
20023106:	f994 c015 	ldrsb.w	ip, [r4, #21]
2002310a:	f8cd c004 	str.w	ip, [sp, #4]
2002310e:	f994 4014 	ldrsb.w	r4, [r4, #20]
20023112:	9400      	str	r4, [sp, #0]
20023114:	f7ff fda3 	bl	20022c5e <HAL_FLASH_MANUAL_CMD>
20023118:	68f3      	ldr	r3, [r6, #12]
2002311a:	463a      	mov	r2, r7
2002311c:	442b      	add	r3, r5
2002311e:	4630      	mov	r0, r6
20023120:	7c19      	ldrb	r1, [r3, #16]
20023122:	f7ff fd57 	bl	20022bd4 <HAL_FLASH_SET_CMD>
20023126:	b007      	add	sp, #28
20023128:	bdf0      	pop	{r4, r5, r6, r7, pc}
2002312a:	2001      	movs	r0, #1
2002312c:	e7fb      	b.n	20023126 <HAL_FLASH_ISSUE_CMD+0x5e>

2002312e <HAL_FLASH_ISSUE_CMD_SEQ>:
2002312e:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
20023132:	4690      	mov	r8, r2
20023134:	68c2      	ldr	r2, [r0, #12]
20023136:	4604      	mov	r4, r0
20023138:	b086      	sub	sp, #24
2002313a:	2a00      	cmp	r2, #0
2002313c:	d072      	beq.n	20023224 <HAL_FLASH_ISSUE_CMD_SEQ+0xf6>
2002313e:	2938      	cmp	r1, #56	@ 0x38
20023140:	d870      	bhi.n	20023224 <HAL_FLASH_ISSUE_CMD_SEQ+0xf6>
20023142:	eb01 07c1 	add.w	r7, r1, r1, lsl #3
20023146:	19d6      	adds	r6, r2, r7
20023148:	7c31      	ldrb	r1, [r6, #16]
2002314a:	2900      	cmp	r1, #0
2002314c:	d06a      	beq.n	20023224 <HAL_FLASH_ISSUE_CMD_SEQ+0xf6>
2002314e:	2b38      	cmp	r3, #56	@ 0x38
20023150:	d868      	bhi.n	20023224 <HAL_FLASH_ISSUE_CMD_SEQ+0xf6>
20023152:	eb03 05c3 	add.w	r5, r3, r3, lsl #3
20023156:	442a      	add	r2, r5
20023158:	7c13      	ldrb	r3, [r2, #16]
2002315a:	2b00      	cmp	r3, #0
2002315c:	d062      	beq.n	20023224 <HAL_FLASH_ISSUE_CMD_SEQ+0xf6>
2002315e:	f996 c018 	ldrsb.w	ip, [r6, #24]
20023162:	f996 3013 	ldrsb.w	r3, [r6, #19]
20023166:	f996 2012 	ldrsb.w	r2, [r6, #18]
2002316a:	f996 1011 	ldrsb.w	r1, [r6, #17]
2002316e:	f8cd c010 	str.w	ip, [sp, #16]
20023172:	f996 c017 	ldrsb.w	ip, [r6, #23]
20023176:	f8cd c00c 	str.w	ip, [sp, #12]
2002317a:	f996 c016 	ldrsb.w	ip, [r6, #22]
2002317e:	f8cd c008 	str.w	ip, [sp, #8]
20023182:	f996 c015 	ldrsb.w	ip, [r6, #21]
20023186:	f8cd c004 	str.w	ip, [sp, #4]
2002318a:	f996 6014 	ldrsb.w	r6, [r6, #20]
2002318e:	9600      	str	r6, [sp, #0]
20023190:	f7ff fd65 	bl	20022c5e <HAL_FLASH_MANUAL_CMD>
20023194:	68e0      	ldr	r0, [r4, #12]
20023196:	4428      	add	r0, r5
20023198:	f990 6018 	ldrsb.w	r6, [r0, #24]
2002319c:	f990 3013 	ldrsb.w	r3, [r0, #19]
200231a0:	f990 2012 	ldrsb.w	r2, [r0, #18]
200231a4:	f990 1011 	ldrsb.w	r1, [r0, #17]
200231a8:	9604      	str	r6, [sp, #16]
200231aa:	f990 6017 	ldrsb.w	r6, [r0, #23]
200231ae:	9603      	str	r6, [sp, #12]
200231b0:	f990 6016 	ldrsb.w	r6, [r0, #22]
200231b4:	9602      	str	r6, [sp, #8]
200231b6:	f990 6015 	ldrsb.w	r6, [r0, #21]
200231ba:	9601      	str	r6, [sp, #4]
200231bc:	f990 0014 	ldrsb.w	r0, [r0, #20]
200231c0:	9000      	str	r0, [sp, #0]
200231c2:	4620      	mov	r0, r4
200231c4:	f7ff fd6c 	bl	20022ca0 <HAL_FLASH_MANUAL_CMD2>
200231c8:	2200      	movs	r2, #0
200231ca:	6823      	ldr	r3, [r4, #0]
200231cc:	2101      	movs	r1, #1
200231ce:	67da      	str	r2, [r3, #124]	@ 0x7c
200231d0:	68e3      	ldr	r3, [r4, #12]
200231d2:	6822      	ldr	r2, [r4, #0]
200231d4:	442b      	add	r3, r5
200231d6:	7c1b      	ldrb	r3, [r3, #16]
200231d8:	4620      	mov	r0, r4
200231da:	62d3      	str	r3, [r2, #44]	@ 0x2c
200231dc:	6823      	ldr	r3, [r4, #0]
200231de:	9a0c      	ldr	r2, [sp, #48]	@ 0x30
200231e0:	f8c3 2080 	str.w	r2, [r3, #128]	@ 0x80
200231e4:	f7ff fe01 	bl	20022dea <HAL_FLASH_ENABLE_CMD2>
200231e8:	4620      	mov	r0, r4
200231ea:	f7ff fe0c 	bl	20022e06 <HAL_FLASH_STAUS_MATCH_CMD2>
200231ee:	6823      	ldr	r3, [r4, #0]
200231f0:	f8c3 801c 	str.w	r8, [r3, #28]
200231f4:	68e3      	ldr	r3, [r4, #12]
200231f6:	6822      	ldr	r2, [r4, #0]
200231f8:	443b      	add	r3, r7
200231fa:	7c1b      	ldrb	r3, [r3, #16]
200231fc:	6193      	str	r3, [r2, #24]
200231fe:	4620      	mov	r0, r4
20023200:	f7ff fd0a 	bl	20022c18 <HAL_FLASH_STATUS_MATCH>
20023204:	2800      	cmp	r0, #0
20023206:	d0fa      	beq.n	200231fe <HAL_FLASH_ISSUE_CMD_SEQ+0xd0>
20023208:	2109      	movs	r1, #9
2002320a:	4620      	mov	r0, r4
2002320c:	f7ff fcfe 	bl	20022c0c <HAL_FLASH_CLR_STATUS>
20023210:	2100      	movs	r1, #0
20023212:	f7ff fdea 	bl	20022dea <HAL_FLASH_ENABLE_CMD2>
20023216:	4620      	mov	r0, r4
20023218:	f7ff fdf5 	bl	20022e06 <HAL_FLASH_STAUS_MATCH_CMD2>
2002321c:	4608      	mov	r0, r1
2002321e:	b006      	add	sp, #24
20023220:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
20023224:	2001      	movs	r0, #1
20023226:	e7fa      	b.n	2002321e <HAL_FLASH_ISSUE_CMD_SEQ+0xf0>

20023228 <nor_qspi_switch>:
20023228:	b570      	push	{r4, r5, r6, lr}
2002322a:	4604      	mov	r4, r0
2002322c:	b3e0      	cbz	r0, 200232a8 <nor_qspi_switch+0x80>
2002322e:	68c3      	ldr	r3, [r0, #12]
20023230:	b3d3      	cbz	r3, 200232a8 <nor_qspi_switch+0x80>
20023232:	b3c9      	cbz	r1, 200232a8 <nor_qspi_switch+0x80>
20023234:	f893 5193 	ldrb.w	r5, [r3, #403]	@ 0x193
20023238:	2101      	movs	r1, #1
2002323a:	b3b5      	cbz	r5, 200232aa <nor_qspi_switch+0x82>
2002323c:	f7ff fca5 	bl	20022b8a <HAL_FLASH_WRITE_DLEN>
20023240:	2200      	movs	r2, #0
20023242:	2114      	movs	r1, #20
20023244:	4620      	mov	r0, r4
20023246:	f7ff ff3f 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
2002324a:	4620      	mov	r0, r4
2002324c:	f7ff fcf3 	bl	20022c36 <HAL_FLASH_READ32>
20023250:	f010 0501 	ands.w	r5, r0, #1
20023254:	d000      	beq.n	20023258 <nor_qspi_switch+0x30>
20023256:	e7fe      	b.n	20023256 <nor_qspi_switch+0x2e>
20023258:	462a      	mov	r2, r5
2002325a:	2115      	movs	r1, #21
2002325c:	4620      	mov	r0, r4
2002325e:	f7ff ff33 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
20023262:	4606      	mov	r6, r0
20023264:	b120      	cbz	r0, 20023270 <nor_qspi_switch+0x48>
20023266:	462a      	mov	r2, r5
20023268:	4629      	mov	r1, r5
2002326a:	4620      	mov	r0, r4
2002326c:	f7ff ff2c 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
20023270:	2102      	movs	r1, #2
20023272:	4620      	mov	r0, r4
20023274:	f7ff fc82 	bl	20022b7c <HAL_FLASH_WRITE_WORD>
20023278:	2101      	movs	r1, #1
2002327a:	4620      	mov	r0, r4
2002327c:	f7ff fc85 	bl	20022b8a <HAL_FLASH_WRITE_DLEN>
20023280:	2200      	movs	r2, #0
20023282:	212b      	movs	r1, #43	@ 0x2b
20023284:	4620      	mov	r0, r4
20023286:	f7ff ff1f 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
2002328a:	b16e      	cbz	r6, 200232a8 <nor_qspi_switch+0x80>
2002328c:	2101      	movs	r1, #1
2002328e:	4620      	mov	r0, r4
20023290:	f7ff fc7b 	bl	20022b8a <HAL_FLASH_WRITE_DLEN>
20023294:	2200      	movs	r2, #0
20023296:	2102      	movs	r1, #2
20023298:	4620      	mov	r0, r4
2002329a:	f7ff ff15 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
2002329e:	4620      	mov	r0, r4
200232a0:	f7ff fcc0 	bl	20022c24 <HAL_FLASH_IS_PROG_DONE>
200232a4:	2800      	cmp	r0, #0
200232a6:	d0f5      	beq.n	20023294 <nor_qspi_switch+0x6c>
200232a8:	bd70      	pop	{r4, r5, r6, pc}
200232aa:	f7ff fc6e 	bl	20022b8a <HAL_FLASH_WRITE_DLEN>
200232ae:	462a      	mov	r2, r5
200232b0:	2102      	movs	r1, #2
200232b2:	4620      	mov	r0, r4
200232b4:	f7ff ff08 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
200232b8:	4620      	mov	r0, r4
200232ba:	f7ff fcbc 	bl	20022c36 <HAL_FLASH_READ32>
200232be:	462a      	mov	r2, r5
200232c0:	2114      	movs	r1, #20
200232c2:	4620      	mov	r0, r4
200232c4:	f7ff ff00 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
200232c8:	b910      	cbnz	r0, 200232d0 <nor_qspi_switch+0xa8>
200232ca:	4620      	mov	r0, r4
200232cc:	f7ff fcb3 	bl	20022c36 <HAL_FLASH_READ32>
200232d0:	68e3      	ldr	r3, [r4, #12]
200232d2:	7a1b      	ldrb	r3, [r3, #8]
200232d4:	b3ab      	cbz	r3, 20023342 <nor_qspi_switch+0x11a>
200232d6:	2101      	movs	r1, #1
200232d8:	f003 050f 	and.w	r5, r3, #15
200232dc:	091b      	lsrs	r3, r3, #4
200232de:	fa01 f303 	lsl.w	r3, r1, r3
200232e2:	b2db      	uxtb	r3, r3
200232e4:	b10d      	cbz	r5, 200232ea <nor_qspi_switch+0xc2>
200232e6:	461d      	mov	r5, r3
200232e8:	2300      	movs	r3, #0
200232ea:	2200      	movs	r2, #0
200232ec:	2115      	movs	r1, #21
200232ee:	4620      	mov	r0, r4
200232f0:	ea43 2505 	orr.w	r5, r3, r5, lsl #8
200232f4:	f7ff fee8 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
200232f8:	4606      	mov	r6, r0
200232fa:	b120      	cbz	r0, 20023306 <nor_qspi_switch+0xde>
200232fc:	2200      	movs	r2, #0
200232fe:	4620      	mov	r0, r4
20023300:	4611      	mov	r1, r2
20023302:	f7ff fee1 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
20023306:	4629      	mov	r1, r5
20023308:	4620      	mov	r0, r4
2002330a:	f7ff fc37 	bl	20022b7c <HAL_FLASH_WRITE_WORD>
2002330e:	2102      	movs	r1, #2
20023310:	4620      	mov	r0, r4
20023312:	f7ff fc3a 	bl	20022b8a <HAL_FLASH_WRITE_DLEN>
20023316:	2200      	movs	r2, #0
20023318:	2103      	movs	r1, #3
2002331a:	4620      	mov	r0, r4
2002331c:	f7ff fed4 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
20023320:	2e00      	cmp	r6, #0
20023322:	d0c1      	beq.n	200232a8 <nor_qspi_switch+0x80>
20023324:	2101      	movs	r1, #1
20023326:	4620      	mov	r0, r4
20023328:	f7ff fc2f 	bl	20022b8a <HAL_FLASH_WRITE_DLEN>
2002332c:	2200      	movs	r2, #0
2002332e:	2102      	movs	r1, #2
20023330:	4620      	mov	r0, r4
20023332:	f7ff fec9 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
20023336:	4620      	mov	r0, r4
20023338:	f7ff fc74 	bl	20022c24 <HAL_FLASH_IS_PROG_DONE>
2002333c:	2800      	cmp	r0, #0
2002333e:	d0f5      	beq.n	2002332c <nor_qspi_switch+0x104>
20023340:	e7b2      	b.n	200232a8 <nor_qspi_switch+0x80>
20023342:	2502      	movs	r5, #2
20023344:	e7d1      	b.n	200232ea <nor_qspi_switch+0xc2>

20023346 <HAL_FLASH_SET_QUAL_SPI>:
20023346:	b538      	push	{r3, r4, r5, lr}
20023348:	4604      	mov	r4, r0
2002334a:	460d      	mov	r5, r1
2002334c:	f7ff ff6c 	bl	20023228 <nor_qspi_switch>
20023350:	4629      	mov	r1, r5
20023352:	4620      	mov	r0, r4
20023354:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
20023358:	f7ff be0e 	b.w	20022f78 <HAL_FLASH_CONFIG_AHB_READ>

2002335c <HAL_FLASH_FADDR_SET_QSPI>:
2002335c:	b538      	push	{r3, r4, r5, lr}
2002335e:	4604      	mov	r4, r0
20023360:	460d      	mov	r5, r1
20023362:	f7ff ff61 	bl	20023228 <nor_qspi_switch>
20023366:	4629      	mov	r1, r5
20023368:	4620      	mov	r0, r4
2002336a:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
2002336e:	f7ff be47 	b.w	20023000 <HAL_FLASH_CONFIG_FULL_AHB_READ>

20023372 <HAL_FLASH_GET_NOR_ID>:
20023372:	b510      	push	{r4, lr}
20023374:	4604      	mov	r4, r0
20023376:	b140      	cbz	r0, 2002338a <HAL_FLASH_GET_NOR_ID+0x18>
20023378:	6802      	ldr	r2, [r0, #0]
2002337a:	6a93      	ldr	r3, [r2, #40]	@ 0x28
2002337c:	f36f 0315 	bfc	r3, #0, #22
20023380:	f443 2380 	orr.w	r3, r3, #262144	@ 0x40000
20023384:	f043 0301 	orr.w	r3, r3, #1
20023388:	6293      	str	r3, [r2, #40]	@ 0x28
2002338a:	2103      	movs	r1, #3
2002338c:	4620      	mov	r0, r4
2002338e:	f7ff fbfc 	bl	20022b8a <HAL_FLASH_WRITE_DLEN>
20023392:	2200      	movs	r2, #0
20023394:	219f      	movs	r1, #159	@ 0x9f
20023396:	4620      	mov	r0, r4
20023398:	f7ff fc1c 	bl	20022bd4 <HAL_FLASH_SET_CMD>
2002339c:	4620      	mov	r0, r4
2002339e:	f7ff fc4a 	bl	20022c36 <HAL_FLASH_READ32>
200233a2:	f020 407f 	bic.w	r0, r0, #4278190080	@ 0xff000000
200233a6:	bd10      	pop	{r4, pc}

200233a8 <HAL_FLASH_CLR_PROTECT>:
200233a8:	b570      	push	{r4, r5, r6, lr}
200233aa:	4604      	mov	r4, r0
200233ac:	2800      	cmp	r0, #0
200233ae:	d03e      	beq.n	2002342e <HAL_FLASH_CLR_PROTECT+0x86>
200233b0:	68c3      	ldr	r3, [r0, #12]
200233b2:	2101      	movs	r1, #1
200233b4:	f893 5193 	ldrb.w	r5, [r3, #403]	@ 0x193
200233b8:	2d00      	cmp	r5, #0
200233ba:	d03b      	beq.n	20023434 <HAL_FLASH_CLR_PROTECT+0x8c>
200233bc:	f7ff fbe5 	bl	20022b8a <HAL_FLASH_WRITE_DLEN>
200233c0:	2200      	movs	r2, #0
200233c2:	2102      	movs	r1, #2
200233c4:	4620      	mov	r0, r4
200233c6:	f7ff fe7f 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
200233ca:	bb88      	cbnz	r0, 20023430 <HAL_FLASH_CLR_PROTECT+0x88>
200233cc:	4620      	mov	r0, r4
200233ce:	f7ff fc32 	bl	20022c36 <HAL_FLASH_READ32>
200233d2:	b2c0      	uxtb	r0, r0
200233d4:	68e3      	ldr	r3, [r4, #12]
200233d6:	79dd      	ldrb	r5, [r3, #7]
200233d8:	b10d      	cbz	r5, 200233de <HAL_FLASH_CLR_PROTECT+0x36>
200233da:	ea20 0505 	bic.w	r5, r0, r5
200233de:	2200      	movs	r2, #0
200233e0:	2115      	movs	r1, #21
200233e2:	4620      	mov	r0, r4
200233e4:	f7ff fe70 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
200233e8:	4606      	mov	r6, r0
200233ea:	b120      	cbz	r0, 200233f6 <HAL_FLASH_CLR_PROTECT+0x4e>
200233ec:	2200      	movs	r2, #0
200233ee:	4620      	mov	r0, r4
200233f0:	4611      	mov	r1, r2
200233f2:	f7ff fe69 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
200233f6:	4629      	mov	r1, r5
200233f8:	4620      	mov	r0, r4
200233fa:	f7ff fbbf 	bl	20022b7c <HAL_FLASH_WRITE_WORD>
200233fe:	2101      	movs	r1, #1
20023400:	4620      	mov	r0, r4
20023402:	f7ff fbc2 	bl	20022b8a <HAL_FLASH_WRITE_DLEN>
20023406:	2200      	movs	r2, #0
20023408:	2103      	movs	r1, #3
2002340a:	4620      	mov	r0, r4
2002340c:	f7ff fe5c 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
20023410:	b16e      	cbz	r6, 2002342e <HAL_FLASH_CLR_PROTECT+0x86>
20023412:	2101      	movs	r1, #1
20023414:	4620      	mov	r0, r4
20023416:	f7ff fbb8 	bl	20022b8a <HAL_FLASH_WRITE_DLEN>
2002341a:	2200      	movs	r2, #0
2002341c:	2102      	movs	r1, #2
2002341e:	4620      	mov	r0, r4
20023420:	f7ff fe52 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
20023424:	4620      	mov	r0, r4
20023426:	f7ff fbfd 	bl	20022c24 <HAL_FLASH_IS_PROG_DONE>
2002342a:	2800      	cmp	r0, #0
2002342c:	d0f5      	beq.n	2002341a <HAL_FLASH_CLR_PROTECT+0x72>
2002342e:	bd70      	pop	{r4, r5, r6, pc}
20023430:	2000      	movs	r0, #0
20023432:	e7cf      	b.n	200233d4 <HAL_FLASH_CLR_PROTECT+0x2c>
20023434:	f7ff fba9 	bl	20022b8a <HAL_FLASH_WRITE_DLEN>
20023438:	462a      	mov	r2, r5
2002343a:	2102      	movs	r1, #2
2002343c:	4620      	mov	r0, r4
2002343e:	f7ff fe43 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
20023442:	2800      	cmp	r0, #0
20023444:	d13e      	bne.n	200234c4 <HAL_FLASH_CLR_PROTECT+0x11c>
20023446:	4620      	mov	r0, r4
20023448:	f7ff fbf5 	bl	20022c36 <HAL_FLASH_READ32>
2002344c:	b2c6      	uxtb	r6, r0
2002344e:	2200      	movs	r2, #0
20023450:	2114      	movs	r1, #20
20023452:	4620      	mov	r0, r4
20023454:	f7ff fe38 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
20023458:	b918      	cbnz	r0, 20023462 <HAL_FLASH_CLR_PROTECT+0xba>
2002345a:	4620      	mov	r0, r4
2002345c:	f7ff fbeb 	bl	20022c36 <HAL_FLASH_READ32>
20023460:	b2c5      	uxtb	r5, r0
20023462:	68e3      	ldr	r3, [r4, #12]
20023464:	79d9      	ldrb	r1, [r3, #7]
20023466:	b109      	cbz	r1, 2002346c <HAL_FLASH_CLR_PROTECT+0xc4>
20023468:	ea26 0101 	bic.w	r1, r6, r1
2002346c:	2200      	movs	r2, #0
2002346e:	4620      	mov	r0, r4
20023470:	ea41 2505 	orr.w	r5, r1, r5, lsl #8
20023474:	2115      	movs	r1, #21
20023476:	f7ff fe27 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
2002347a:	4606      	mov	r6, r0
2002347c:	b120      	cbz	r0, 20023488 <HAL_FLASH_CLR_PROTECT+0xe0>
2002347e:	2200      	movs	r2, #0
20023480:	4620      	mov	r0, r4
20023482:	4611      	mov	r1, r2
20023484:	f7ff fe20 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
20023488:	4629      	mov	r1, r5
2002348a:	4620      	mov	r0, r4
2002348c:	f7ff fb76 	bl	20022b7c <HAL_FLASH_WRITE_WORD>
20023490:	2102      	movs	r1, #2
20023492:	4620      	mov	r0, r4
20023494:	f7ff fb79 	bl	20022b8a <HAL_FLASH_WRITE_DLEN>
20023498:	2200      	movs	r2, #0
2002349a:	2103      	movs	r1, #3
2002349c:	4620      	mov	r0, r4
2002349e:	f7ff fe13 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
200234a2:	2e00      	cmp	r6, #0
200234a4:	d0c3      	beq.n	2002342e <HAL_FLASH_CLR_PROTECT+0x86>
200234a6:	2101      	movs	r1, #1
200234a8:	4620      	mov	r0, r4
200234aa:	f7ff fb6e 	bl	20022b8a <HAL_FLASH_WRITE_DLEN>
200234ae:	2200      	movs	r2, #0
200234b0:	2102      	movs	r1, #2
200234b2:	4620      	mov	r0, r4
200234b4:	f7ff fe08 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
200234b8:	4620      	mov	r0, r4
200234ba:	f7ff fbb3 	bl	20022c24 <HAL_FLASH_IS_PROG_DONE>
200234be:	2800      	cmp	r0, #0
200234c0:	d0f5      	beq.n	200234ae <HAL_FLASH_CLR_PROTECT+0x106>
200234c2:	e7b4      	b.n	2002342e <HAL_FLASH_CLR_PROTECT+0x86>
200234c4:	462e      	mov	r6, r5
200234c6:	e7c2      	b.n	2002344e <HAL_FLASH_CLR_PROTECT+0xa6>

200234c8 <HAL_QSPI_SET_CLK_INV>:
200234c8:	b160      	cbz	r0, 200234e4 <HAL_QSPI_SET_CLK_INV+0x1c>
200234ca:	6800      	ldr	r0, [r0, #0]
200234cc:	b150      	cbz	r0, 200234e4 <HAL_QSPI_SET_CLK_INV+0x1c>
200234ce:	6d83      	ldr	r3, [r0, #88]	@ 0x58
200234d0:	0609      	lsls	r1, r1, #24
200234d2:	f023 7380 	bic.w	r3, r3, #16777216	@ 0x1000000
200234d6:	f001 7180 	and.w	r1, r1, #16777216	@ 0x1000000
200234da:	f023 03ff 	bic.w	r3, r3, #255	@ 0xff
200234de:	4311      	orrs	r1, r2
200234e0:	4319      	orrs	r1, r3
200234e2:	6581      	str	r1, [r0, #88]	@ 0x58
200234e4:	4770      	bx	lr

200234e6 <HAL_FLASH_RELEASE_DPD>:
200234e6:	b538      	push	{r3, r4, r5, lr}
200234e8:	4604      	mov	r4, r0
200234ea:	b1d0      	cbz	r0, 20023522 <HAL_FLASH_RELEASE_DPD+0x3c>
200234ec:	6803      	ldr	r3, [r0, #0]
200234ee:	21ab      	movs	r1, #171	@ 0xab
200234f0:	681d      	ldr	r5, [r3, #0]
200234f2:	f015 0501 	ands.w	r5, r5, #1
200234f6:	bf02      	ittt	eq
200234f8:	681a      	ldreq	r2, [r3, #0]
200234fa:	f042 0201 	orreq.w	r2, r2, #1
200234fe:	601a      	streq	r2, [r3, #0]
20023500:	6802      	ldr	r2, [r0, #0]
20023502:	6a93      	ldr	r3, [r2, #40]	@ 0x28
20023504:	f36f 0315 	bfc	r3, #0, #22
20023508:	f043 0301 	orr.w	r3, r3, #1
2002350c:	6293      	str	r3, [r2, #40]	@ 0x28
2002350e:	2200      	movs	r2, #0
20023510:	f7ff fb60 	bl	20022bd4 <HAL_FLASH_SET_CMD>
20023514:	b925      	cbnz	r5, 20023520 <HAL_FLASH_RELEASE_DPD+0x3a>
20023516:	6822      	ldr	r2, [r4, #0]
20023518:	6813      	ldr	r3, [r2, #0]
2002351a:	f023 0301 	bic.w	r3, r3, #1
2002351e:	6013      	str	r3, [r2, #0]
20023520:	bd38      	pop	{r3, r4, r5, pc}
20023522:	2001      	movs	r0, #1
20023524:	e7fc      	b.n	20023520 <HAL_FLASH_RELEASE_DPD+0x3a>

20023526 <flash_handle_valid>:
20023526:	b118      	cbz	r0, 20023530 <flash_handle_valid+0xa>
20023528:	68c0      	ldr	r0, [r0, #12]
2002352a:	3800      	subs	r0, #0
2002352c:	bf18      	it	ne
2002352e:	2001      	movne	r0, #1
20023530:	4770      	bx	lr

20023532 <HAL_GET_FLASH_MID>:
20023532:	2000      	movs	r0, #0
20023534:	4770      	bx	lr

20023536 <HAL_FLASH_DMA_START>:
20023536:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
2002353a:	4688      	mov	r8, r1
2002353c:	4699      	mov	r9, r3
2002353e:	4604      	mov	r4, r0
20023540:	2800      	cmp	r0, #0
20023542:	d045      	beq.n	200235d0 <HAL_FLASH_DMA_START+0x9a>
20023544:	6883      	ldr	r3, [r0, #8]
20023546:	2b00      	cmp	r3, #0
20023548:	d042      	beq.n	200235d0 <HAL_FLASH_DMA_START+0x9a>
2002354a:	f1b9 0f00 	cmp.w	r9, #0
2002354e:	d03f      	beq.n	200235d0 <HAL_FLASH_DMA_START+0x9a>
20023550:	6801      	ldr	r1, [r0, #0]
20023552:	680f      	ldr	r7, [r1, #0]
20023554:	b332      	cbz	r2, 200235a4 <HAL_FLASH_DMA_START+0x6e>
20023556:	2210      	movs	r2, #16
20023558:	609a      	str	r2, [r3, #8]
2002355a:	2300      	movs	r3, #0
2002355c:	6882      	ldr	r2, [r0, #8]
2002355e:	464e      	mov	r6, r9
20023560:	6153      	str	r3, [r2, #20]
20023562:	6882      	ldr	r2, [r0, #8]
20023564:	6193      	str	r3, [r2, #24]
20023566:	6882      	ldr	r2, [r0, #8]
20023568:	60d3      	str	r3, [r2, #12]
2002356a:	2280      	movs	r2, #128	@ 0x80
2002356c:	6883      	ldr	r3, [r0, #8]
2002356e:	611a      	str	r2, [r3, #16]
20023570:	6805      	ldr	r5, [r0, #0]
20023572:	3504      	adds	r5, #4
20023574:	68a0      	ldr	r0, [r4, #8]
20023576:	f7ff f84b 	bl	20022610 <HAL_DMA_DeInit>
2002357a:	bb50      	cbnz	r0, 200235d2 <HAL_FLASH_DMA_START+0x9c>
2002357c:	68a0      	ldr	r0, [r4, #8]
2002357e:	f7fe ffe3 	bl	20022548 <HAL_DMA_Init>
20023582:	bb30      	cbnz	r0, 200235d2 <HAL_FLASH_DMA_START+0x9c>
20023584:	6823      	ldr	r3, [r4, #0]
20023586:	f047 0720 	orr.w	r7, r7, #32
2002358a:	601f      	str	r7, [r3, #0]
2002358c:	6822      	ldr	r2, [r4, #0]
2002358e:	f109 33ff 	add.w	r3, r9, #4294967295
20023592:	6253      	str	r3, [r2, #36]	@ 0x24
20023594:	4641      	mov	r1, r8
20023596:	4633      	mov	r3, r6
20023598:	462a      	mov	r2, r5
2002359a:	68a0      	ldr	r0, [r4, #8]
2002359c:	e8bd 47f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
200235a0:	f7ff b994 	b.w	200228cc <HAL_DMA_Start>
200235a4:	f44f 7100 	mov.w	r1, #512	@ 0x200
200235a8:	609a      	str	r2, [r3, #8]
200235aa:	6883      	ldr	r3, [r0, #8]
200235ac:	f109 0603 	add.w	r6, r9, #3
200235b0:	6159      	str	r1, [r3, #20]
200235b2:	f44f 6100 	mov.w	r1, #2048	@ 0x800
200235b6:	6883      	ldr	r3, [r0, #8]
200235b8:	4645      	mov	r5, r8
200235ba:	6199      	str	r1, [r3, #24]
200235bc:	6883      	ldr	r3, [r0, #8]
200235be:	08b6      	lsrs	r6, r6, #2
200235c0:	60da      	str	r2, [r3, #12]
200235c2:	2280      	movs	r2, #128	@ 0x80
200235c4:	6883      	ldr	r3, [r0, #8]
200235c6:	611a      	str	r2, [r3, #16]
200235c8:	6803      	ldr	r3, [r0, #0]
200235ca:	f103 0804 	add.w	r8, r3, #4
200235ce:	e7d1      	b.n	20023574 <HAL_FLASH_DMA_START+0x3e>
200235d0:	2001      	movs	r0, #1
200235d2:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}

200235d6 <HAL_FLASH_DMA_WAIT_DONE>:
200235d6:	b510      	push	{r4, lr}
200235d8:	460a      	mov	r2, r1
200235da:	4604      	mov	r4, r0
200235dc:	b170      	cbz	r0, 200235fc <HAL_FLASH_DMA_WAIT_DONE+0x26>
200235de:	6880      	ldr	r0, [r0, #8]
200235e0:	b160      	cbz	r0, 200235fc <HAL_FLASH_DMA_WAIT_DONE+0x26>
200235e2:	6ae1      	ldr	r1, [r4, #44]	@ 0x2c
200235e4:	b111      	cbz	r1, 200235ec <HAL_FLASH_DMA_WAIT_DONE+0x16>
200235e6:	f04f 32ff 	mov.w	r2, #4294967295
200235ea:	2100      	movs	r1, #0
200235ec:	f7ff f870 	bl	200226d0 <HAL_DMA_PollForTransfer>
200235f0:	6822      	ldr	r2, [r4, #0]
200235f2:	6813      	ldr	r3, [r2, #0]
200235f4:	f023 0320 	bic.w	r3, r3, #32
200235f8:	6013      	str	r3, [r2, #0]
200235fa:	bd10      	pop	{r4, pc}
200235fc:	2001      	movs	r0, #1
200235fe:	e7fc      	b.n	200235fa <HAL_FLASH_DMA_WAIT_DONE+0x24>

20023600 <HAL_FLASH_ALIAS_CFG>:
20023600:	b538      	push	{r3, r4, r5, lr}
20023602:	461d      	mov	r5, r3
20023604:	4604      	mov	r4, r0
20023606:	b158      	cbz	r0, 20023620 <HAL_FLASH_ALIAS_CFG+0x20>
20023608:	6903      	ldr	r3, [r0, #16]
2002360a:	428b      	cmp	r3, r1
2002360c:	bf98      	it	ls
2002360e:	1ac9      	subls	r1, r1, r3
20023610:	f7ff fb68 	bl	20022ce4 <HAL_FLASH_SET_ALIAS_RANGE>
20023614:	4629      	mov	r1, r5
20023616:	4620      	mov	r0, r4
20023618:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
2002361c:	f7ff bb74 	b.w	20022d08 <HAL_FLASH_SET_ALIAS_OFFSET>
20023620:	bd38      	pop	{r3, r4, r5, pc}

20023622 <HAL_FLASH_NONCE_CFG>:
20023622:	b570      	push	{r4, r5, r6, lr}
20023624:	460c      	mov	r4, r1
20023626:	4615      	mov	r5, r2
20023628:	4619      	mov	r1, r3
2002362a:	4606      	mov	r6, r0
2002362c:	b180      	cbz	r0, 20023650 <HAL_FLASH_NONCE_CFG+0x2e>
2002362e:	b17b      	cbz	r3, 20023650 <HAL_FLASH_NONCE_CFG+0x2e>
20023630:	f7ff fb86 	bl	20022d40 <HAL_FLASH_SET_NONCE>
20023634:	6933      	ldr	r3, [r6, #16]
20023636:	4630      	mov	r0, r6
20023638:	42a3      	cmp	r3, r4
2002363a:	bf98      	it	ls
2002363c:	1ae4      	subls	r4, r4, r3
2002363e:	42ab      	cmp	r3, r5
20023640:	bf98      	it	ls
20023642:	1aed      	subls	r5, r5, r3
20023644:	462a      	mov	r2, r5
20023646:	4621      	mov	r1, r4
20023648:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
2002364c:	f7ff bb66 	b.w	20022d1c <HAL_FLASH_SET_CTR>
20023650:	bd70      	pop	{r4, r5, r6, pc}

20023652 <HAL_FLASH_AES_CFG>:
20023652:	b510      	push	{r4, lr}
20023654:	4604      	mov	r4, r0
20023656:	b148      	cbz	r0, 2002366c <HAL_FLASH_AES_CFG+0x1a>
20023658:	b101      	cbz	r1, 2002365c <HAL_FLASH_AES_CFG+0xa>
2002365a:	2101      	movs	r1, #1
2002365c:	f7ff fb7e 	bl	20022d5c <HAL_FLASH_SET_AES>
20023660:	4620      	mov	r0, r4
20023662:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
20023666:	2101      	movs	r1, #1
20023668:	f7ff bb87 	b.w	20022d7a <HAL_FLASH_ENABLE_AES>
2002366c:	bd10      	pop	{r4, pc}

2002366e <nand_read_id>:
2002366e:	b510      	push	{r4, lr}
20023670:	460b      	mov	r3, r1
20023672:	4604      	mov	r4, r0
20023674:	b086      	sub	sp, #24
20023676:	b320      	cbz	r0, 200236c2 <nand_read_id+0x54>
20023678:	2908      	cmp	r1, #8
2002367a:	f04f 0100 	mov.w	r1, #0
2002367e:	f04f 0201 	mov.w	r2, #1
20023682:	bf83      	ittte	hi
20023684:	460b      	movhi	r3, r1
20023686:	e9cd 1202 	strdhi	r1, r2, [sp, #8]
2002368a:	e9cd 1100 	strdhi	r1, r1, [sp]
2002368e:	e9cd 1102 	strdls	r1, r1, [sp, #8]
20023692:	bf8e      	itee	hi
20023694:	4619      	movhi	r1, r3
20023696:	e9cd 1100 	strdls	r1, r1, [sp]
2002369a:	b25b      	sxtbls	r3, r3
2002369c:	9204      	str	r2, [sp, #16]
2002369e:	f7ff fade 	bl	20022c5e <HAL_FLASH_MANUAL_CMD>
200236a2:	2103      	movs	r1, #3
200236a4:	4620      	mov	r0, r4
200236a6:	f7ff fa70 	bl	20022b8a <HAL_FLASH_WRITE_DLEN>
200236aa:	2200      	movs	r2, #0
200236ac:	219f      	movs	r1, #159	@ 0x9f
200236ae:	4620      	mov	r0, r4
200236b0:	f7ff fa90 	bl	20022bd4 <HAL_FLASH_SET_CMD>
200236b4:	4620      	mov	r0, r4
200236b6:	f7ff fabe 	bl	20022c36 <HAL_FLASH_READ32>
200236ba:	f020 407f 	bic.w	r0, r0, #4278190080	@ 0xff000000
200236be:	b006      	add	sp, #24
200236c0:	bd10      	pop	{r4, pc}
200236c2:	20ff      	movs	r0, #255	@ 0xff
200236c4:	e7fb      	b.n	200236be <nand_read_id+0x50>

200236c6 <HAL_NAND_CONF_ECC>:
200236c6:	b538      	push	{r3, r4, r5, lr}
200236c8:	460d      	mov	r5, r1
200236ca:	4604      	mov	r4, r0
200236cc:	b398      	cbz	r0, 20023736 <HAL_NAND_CONF_ECC+0x70>
200236ce:	68c3      	ldr	r3, [r0, #12]
200236d0:	b38b      	cbz	r3, 20023736 <HAL_NAND_CONF_ECC+0x70>
200236d2:	799a      	ldrb	r2, [r3, #6]
200236d4:	b392      	cbz	r2, 2002373c <HAL_NAND_CONF_ECC+0x76>
200236d6:	7a9b      	ldrb	r3, [r3, #10]
200236d8:	b383      	cbz	r3, 2002373c <HAL_NAND_CONF_ECC+0x76>
200236da:	2101      	movs	r1, #1
200236dc:	f7ff fa55 	bl	20022b8a <HAL_FLASH_WRITE_DLEN>
200236e0:	68e3      	ldr	r3, [r4, #12]
200236e2:	2102      	movs	r1, #2
200236e4:	799a      	ldrb	r2, [r3, #6]
200236e6:	4620      	mov	r0, r4
200236e8:	f7ff fcee 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
200236ec:	4620      	mov	r0, r4
200236ee:	f7ff faa2 	bl	20022c36 <HAL_FLASH_READ32>
200236f2:	68e3      	ldr	r3, [r4, #12]
200236f4:	7a9b      	ldrb	r3, [r3, #10]
200236f6:	b1dd      	cbz	r5, 20023730 <HAL_NAND_CONF_ECC+0x6a>
200236f8:	ea43 0100 	orr.w	r1, r3, r0
200236fc:	4620      	mov	r0, r4
200236fe:	f7ff fa3d 	bl	20022b7c <HAL_FLASH_WRITE_WORD>
20023702:	2101      	movs	r1, #1
20023704:	4620      	mov	r0, r4
20023706:	f7ff fa40 	bl	20022b8a <HAL_FLASH_WRITE_DLEN>
2002370a:	68e3      	ldr	r3, [r4, #12]
2002370c:	2103      	movs	r1, #3
2002370e:	799a      	ldrb	r2, [r3, #6]
20023710:	4620      	mov	r0, r4
20023712:	f7ff fcd9 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
20023716:	68e3      	ldr	r3, [r4, #12]
20023718:	f884 5025 	strb.w	r5, [r4, #37]	@ 0x25
2002371c:	2102      	movs	r1, #2
2002371e:	799a      	ldrb	r2, [r3, #6]
20023720:	4620      	mov	r0, r4
20023722:	f7ff fcd1 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
20023726:	4620      	mov	r0, r4
20023728:	f7ff fa85 	bl	20022c36 <HAL_FLASH_READ32>
2002372c:	2000      	movs	r0, #0
2002372e:	bd38      	pop	{r3, r4, r5, pc}
20023730:	ea20 0103 	bic.w	r1, r0, r3
20023734:	e7e2      	b.n	200236fc <HAL_NAND_CONF_ECC+0x36>
20023736:	f04f 30ff 	mov.w	r0, #4294967295
2002373a:	e7f8      	b.n	2002372e <HAL_NAND_CONF_ECC+0x68>
2002373c:	f06f 0001 	mvn.w	r0, #1
20023740:	e7f5      	b.n	2002372e <HAL_NAND_CONF_ECC+0x68>

20023742 <HAL_NAND_GET_ECC_STATUS>:
20023742:	b510      	push	{r4, lr}
20023744:	4604      	mov	r4, r0
20023746:	b320      	cbz	r0, 20023792 <HAL_NAND_GET_ECC_STATUS+0x50>
20023748:	68c2      	ldr	r2, [r0, #12]
2002374a:	b31a      	cbz	r2, 20023794 <HAL_NAND_GET_ECC_STATUS+0x52>
2002374c:	7913      	ldrb	r3, [r2, #4]
2002374e:	b31b      	cbz	r3, 20023798 <HAL_NAND_GET_ECC_STATUS+0x56>
20023750:	79d3      	ldrb	r3, [r2, #7]
20023752:	b30b      	cbz	r3, 20023798 <HAL_NAND_GET_ECC_STATUS+0x56>
20023754:	2101      	movs	r1, #1
20023756:	f7ff fa18 	bl	20022b8a <HAL_FLASH_WRITE_DLEN>
2002375a:	68e3      	ldr	r3, [r4, #12]
2002375c:	2102      	movs	r1, #2
2002375e:	791a      	ldrb	r2, [r3, #4]
20023760:	4620      	mov	r0, r4
20023762:	f7ff fcb1 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
20023766:	4620      	mov	r0, r4
20023768:	f7ff fa65 	bl	20022c36 <HAL_FLASH_READ32>
2002376c:	f894 2024 	ldrb.w	r2, [r4, #36]	@ 0x24
20023770:	2a3f      	cmp	r2, #63	@ 0x3f
20023772:	ea4f 1312 	mov.w	r3, r2, lsr #4
20023776:	d804      	bhi.n	20023782 <HAL_NAND_GET_ECC_STATUS+0x40>
20023778:	2b01      	cmp	r3, #1
2002377a:	d808      	bhi.n	2002378e <HAL_NAND_GET_ECC_STATUS+0x4c>
2002377c:	f000 0030 	and.w	r0, r0, #48	@ 0x30
20023780:	e007      	b.n	20023792 <HAL_NAND_GET_ECC_STATUS+0x50>
20023782:	3b04      	subs	r3, #4
20023784:	2b01      	cmp	r3, #1
20023786:	d8f9      	bhi.n	2002377c <HAL_NAND_GET_ECC_STATUS+0x3a>
20023788:	f000 00f0 	and.w	r0, r0, #240	@ 0xf0
2002378c:	e001      	b.n	20023792 <HAL_NAND_GET_ECC_STATUS+0x50>
2002378e:	f000 0070 	and.w	r0, r0, #112	@ 0x70
20023792:	bd10      	pop	{r4, pc}
20023794:	4610      	mov	r0, r2
20023796:	e7fc      	b.n	20023792 <HAL_NAND_GET_ECC_STATUS+0x50>
20023798:	4618      	mov	r0, r3
2002379a:	e7fa      	b.n	20023792 <HAL_NAND_GET_ECC_STATUS+0x50>

2002379c <HAL_NAND_CHECK_ECC>:
2002379c:	4603      	mov	r3, r0
2002379e:	1108      	asrs	r0, r1, #4
200237a0:	b172      	cbz	r2, 200237c0 <HAL_NAND_CHECK_ECC+0x24>
200237a2:	2b07      	cmp	r3, #7
200237a4:	d80c      	bhi.n	200237c0 <HAL_NAND_CHECK_ECC+0x24>
200237a6:	e8df f003 	tbb	[pc, r3]
200237aa:	0d04      	.short	0x0d04
200237ac:	3f352e18 	.word	0x3f352e18
200237b0:	4c47      	.short	0x4c47
200237b2:	b128      	cbz	r0, 200237c0 <HAL_NAND_CHECK_ECC+0x24>
200237b4:	2801      	cmp	r0, #1
200237b6:	6813      	ldr	r3, [r2, #0]
200237b8:	d10a      	bne.n	200237d0 <HAL_NAND_CHECK_ECC+0x34>
200237ba:	f043 0301 	orr.w	r3, r3, #1
200237be:	6013      	str	r3, [r2, #0]
200237c0:	2000      	movs	r0, #0
200237c2:	4770      	bx	lr
200237c4:	f020 0302 	bic.w	r3, r0, #2
200237c8:	2b01      	cmp	r3, #1
200237ca:	d003      	beq.n	200237d4 <HAL_NAND_CHECK_ECC+0x38>
200237cc:	b1d0      	cbz	r0, 20023804 <HAL_NAND_CHECK_ECC+0x68>
200237ce:	6813      	ldr	r3, [r2, #0]
200237d0:	4303      	orrs	r3, r0
200237d2:	e016      	b.n	20023802 <HAL_NAND_CHECK_ECC+0x66>
200237d4:	6813      	ldr	r3, [r2, #0]
200237d6:	4303      	orrs	r3, r0
200237d8:	e7f1      	b.n	200237be <HAL_NAND_CHECK_ECC+0x22>
200237da:	2805      	cmp	r0, #5
200237dc:	d8f7      	bhi.n	200237ce <HAL_NAND_CHECK_ECC+0x32>
200237de:	a301      	add	r3, pc, #4	@ (adr r3, 200237e4 <HAL_NAND_CHECK_ECC+0x48>)
200237e0:	f853 f020 	ldr.w	pc, [r3, r0, lsl #2]
200237e4:	200237c1 	.word	0x200237c1
200237e8:	200237d5 	.word	0x200237d5
200237ec:	200237fd 	.word	0x200237fd
200237f0:	200237d5 	.word	0x200237d5
200237f4:	200237cf 	.word	0x200237cf
200237f8:	200237d5 	.word	0x200237d5
200237fc:	6813      	ldr	r3, [r2, #0]
200237fe:	f043 0302 	orr.w	r3, r3, #2
20023802:	6013      	str	r3, [r2, #0]
20023804:	4770      	bx	lr
20023806:	2800      	cmp	r0, #0
20023808:	d0da      	beq.n	200237c0 <HAL_NAND_CHECK_ECC+0x24>
2002380a:	1e43      	subs	r3, r0, #1
2002380c:	2b05      	cmp	r3, #5
2002380e:	6813      	ldr	r3, [r2, #0]
20023810:	d9e1      	bls.n	200237d6 <HAL_NAND_CHECK_ECC+0x3a>
20023812:	e7dd      	b.n	200237d0 <HAL_NAND_CHECK_ECC+0x34>
20023814:	07c3      	lsls	r3, r0, #31
20023816:	f000 0103 	and.w	r1, r0, #3
2002381a:	d402      	bmi.n	20023822 <HAL_NAND_CHECK_ECC+0x86>
2002381c:	2900      	cmp	r1, #0
2002381e:	d0cf      	beq.n	200237c0 <HAL_NAND_CHECK_ECC+0x24>
20023820:	e7d5      	b.n	200237ce <HAL_NAND_CHECK_ECC+0x32>
20023822:	6813      	ldr	r3, [r2, #0]
20023824:	430b      	orrs	r3, r1
20023826:	e7ca      	b.n	200237be <HAL_NAND_CHECK_ECC+0x22>
20023828:	2800      	cmp	r0, #0
2002382a:	d0c9      	beq.n	200237c0 <HAL_NAND_CHECK_ECC+0x24>
2002382c:	6813      	ldr	r3, [r2, #0]
2002382e:	2808      	cmp	r0, #8
20023830:	ea43 0300 	orr.w	r3, r3, r0
20023834:	dce5      	bgt.n	20023802 <HAL_NAND_CHECK_ECC+0x66>
20023836:	e7c2      	b.n	200237be <HAL_NAND_CHECK_ECC+0x22>
20023838:	2800      	cmp	r0, #0
2002383a:	d0c1      	beq.n	200237c0 <HAL_NAND_CHECK_ECC+0x24>
2002383c:	1e43      	subs	r3, r0, #1
2002383e:	2b01      	cmp	r3, #1
20023840:	e7e5      	b.n	2002380e <HAL_NAND_CHECK_ECC+0x72>
20023842:	2800      	cmp	r0, #0
20023844:	d0bc      	beq.n	200237c0 <HAL_NAND_CHECK_ECC+0x24>
20023846:	1e43      	subs	r3, r0, #1
20023848:	2b02      	cmp	r3, #2
2002384a:	e7e0      	b.n	2002380e <HAL_NAND_CHECK_ECC+0x72>

2002384c <HAL_NAND_GET_ECC_RESULT>:
2002384c:	b510      	push	{r4, lr}
2002384e:	f890 3025 	ldrb.w	r3, [r0, #37]	@ 0x25
20023852:	4604      	mov	r4, r0
20023854:	b183      	cbz	r3, 20023878 <HAL_NAND_GET_ECC_RESULT+0x2c>
20023856:	f7ff ff74 	bl	20023742 <HAL_NAND_GET_ECC_STATUS>
2002385a:	4601      	mov	r1, r0
2002385c:	b160      	cbz	r0, 20023878 <HAL_NAND_GET_ECC_RESULT+0x2c>
2002385e:	4622      	mov	r2, r4
20023860:	6863      	ldr	r3, [r4, #4]
20023862:	f443 4300 	orr.w	r3, r3, #32768	@ 0x8000
20023866:	f842 3f04 	str.w	r3, [r2, #4]!
2002386a:	f894 0024 	ldrb.w	r0, [r4, #36]	@ 0x24
2002386e:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
20023872:	0900      	lsrs	r0, r0, #4
20023874:	f7ff bf92 	b.w	2002379c <HAL_NAND_CHECK_ECC>
20023878:	2000      	movs	r0, #0
2002387a:	bd10      	pop	{r4, pc}

2002387c <HAL_NAND_EN_QUAL>:
2002387c:	b538      	push	{r3, r4, r5, lr}
2002387e:	460d      	mov	r5, r1
20023880:	4604      	mov	r4, r0
20023882:	b348      	cbz	r0, 200238d8 <HAL_NAND_EN_QUAL+0x5c>
20023884:	68c3      	ldr	r3, [r0, #12]
20023886:	b33b      	cbz	r3, 200238d8 <HAL_NAND_EN_QUAL+0x5c>
20023888:	799a      	ldrb	r2, [r3, #6]
2002388a:	b10a      	cbz	r2, 20023890 <HAL_NAND_EN_QUAL+0x14>
2002388c:	7a1b      	ldrb	r3, [r3, #8]
2002388e:	b90b      	cbnz	r3, 20023894 <HAL_NAND_EN_QUAL+0x18>
20023890:	2000      	movs	r0, #0
20023892:	bd38      	pop	{r3, r4, r5, pc}
20023894:	2101      	movs	r1, #1
20023896:	f7ff f978 	bl	20022b8a <HAL_FLASH_WRITE_DLEN>
2002389a:	68e3      	ldr	r3, [r4, #12]
2002389c:	2102      	movs	r1, #2
2002389e:	799a      	ldrb	r2, [r3, #6]
200238a0:	4620      	mov	r0, r4
200238a2:	f7ff fc11 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
200238a6:	4620      	mov	r0, r4
200238a8:	f7ff f9c5 	bl	20022c36 <HAL_FLASH_READ32>
200238ac:	68e3      	ldr	r3, [r4, #12]
200238ae:	7a1b      	ldrb	r3, [r3, #8]
200238b0:	b17d      	cbz	r5, 200238d2 <HAL_NAND_EN_QUAL+0x56>
200238b2:	ea43 0100 	orr.w	r1, r3, r0
200238b6:	4620      	mov	r0, r4
200238b8:	f7ff f960 	bl	20022b7c <HAL_FLASH_WRITE_WORD>
200238bc:	2101      	movs	r1, #1
200238be:	4620      	mov	r0, r4
200238c0:	f7ff f963 	bl	20022b8a <HAL_FLASH_WRITE_DLEN>
200238c4:	68e3      	ldr	r3, [r4, #12]
200238c6:	2103      	movs	r1, #3
200238c8:	4620      	mov	r0, r4
200238ca:	799a      	ldrb	r2, [r3, #6]
200238cc:	f7ff fbfc 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
200238d0:	e7de      	b.n	20023890 <HAL_NAND_EN_QUAL+0x14>
200238d2:	ea20 0103 	bic.w	r1, r0, r3
200238d6:	e7ee      	b.n	200238b6 <HAL_NAND_EN_QUAL+0x3a>
200238d8:	f04f 30ff 	mov.w	r0, #4294967295
200238dc:	e7d9      	b.n	20023892 <HAL_NAND_EN_QUAL+0x16>

200238de <nand_clear_status>:
200238de:	b510      	push	{r4, lr}
200238e0:	4604      	mov	r4, r0
200238e2:	2101      	movs	r1, #1
200238e4:	f7ff f951 	bl	20022b8a <HAL_FLASH_WRITE_DLEN>
200238e8:	2102      	movs	r1, #2
200238ea:	4620      	mov	r0, r4
200238ec:	f7ff f946 	bl	20022b7c <HAL_FLASH_WRITE_WORD>
200238f0:	68e3      	ldr	r3, [r4, #12]
200238f2:	2103      	movs	r1, #3
200238f4:	795a      	ldrb	r2, [r3, #5]
200238f6:	4620      	mov	r0, r4
200238f8:	f7ff fbe6 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
200238fc:	2100      	movs	r1, #0
200238fe:	4620      	mov	r0, r4
20023900:	f7ff f93c 	bl	20022b7c <HAL_FLASH_WRITE_WORD>
20023904:	68e3      	ldr	r3, [r4, #12]
20023906:	2103      	movs	r1, #3
20023908:	4620      	mov	r0, r4
2002390a:	795a      	ldrb	r2, [r3, #5]
2002390c:	f7ff fbdc 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
20023910:	2000      	movs	r0, #0
20023912:	bd10      	pop	{r4, pc}

20023914 <HAL_NAND_PAGE_SIZE>:
20023914:	b140      	cbz	r0, 20023928 <HAL_NAND_PAGE_SIZE+0x14>
20023916:	f890 3024 	ldrb.w	r3, [r0, #36]	@ 0x24
2002391a:	f013 0f01 	tst.w	r3, #1
2002391e:	bf14      	ite	ne
20023920:	f44f 5080 	movne.w	r0, #4096	@ 0x1000
20023924:	f44f 6000 	moveq.w	r0, #2048	@ 0x800
20023928:	4770      	bx	lr

2002392a <HAL_NAND_READ_WITHOOB>:
2002392a:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
2002392e:	b085      	sub	sp, #20
20023930:	460e      	mov	r6, r1
20023932:	4691      	mov	r9, r2
20023934:	461d      	mov	r5, r3
20023936:	4604      	mov	r4, r0
20023938:	9f0f      	ldr	r7, [sp, #60]	@ 0x3c
2002393a:	b1b0      	cbz	r0, 2002396a <HAL_NAND_READ_WITHOOB+0x40>
2002393c:	68c3      	ldr	r3, [r0, #12]
2002393e:	b1a3      	cbz	r3, 2002396a <HAL_NAND_READ_WITHOOB+0x40>
20023940:	69c3      	ldr	r3, [r0, #28]
20023942:	b193      	cbz	r3, 2002396a <HAL_NAND_READ_WITHOOB+0x40>
20023944:	2f80      	cmp	r7, #128	@ 0x80
20023946:	d810      	bhi.n	2002396a <HAL_NAND_READ_WITHOOB+0x40>
20023948:	f7ff ffe4 	bl	20023914 <HAL_NAND_PAGE_SIZE>
2002394c:	f100 3aff 	add.w	sl, r0, #4294967295
20023950:	ea0a 0a01 	and.w	sl, sl, r1
20023954:	eb0a 0305 	add.w	r3, sl, r5
20023958:	4283      	cmp	r3, r0
2002395a:	4680      	mov	r8, r0
2002395c:	d907      	bls.n	2002396e <HAL_NAND_READ_WITHOOB+0x44>
2002395e:	2002      	movs	r0, #2
20023960:	6060      	str	r0, [r4, #4]
20023962:	2000      	movs	r0, #0
20023964:	b005      	add	sp, #20
20023966:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
2002396a:	2001      	movs	r0, #1
2002396c:	e7f8      	b.n	20023960 <HAL_NAND_READ_WITHOOB+0x36>
2002396e:	2300      	movs	r3, #0
20023970:	6063      	str	r3, [r4, #4]
20023972:	6923      	ldr	r3, [r4, #16]
20023974:	f04f 0b00 	mov.w	fp, #0
20023978:	428b      	cmp	r3, r1
2002397a:	bf98      	it	ls
2002397c:	1ace      	subls	r6, r1, r3
2002397e:	fbb6 f2f0 	udiv	r2, r6, r0
20023982:	2104      	movs	r1, #4
20023984:	4620      	mov	r0, r4
20023986:	f7ff fb9f 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
2002398a:	2014      	movs	r0, #20
2002398c:	f7fe fad6 	bl	20021f3c <HAL_Delay_us_>
20023990:	2101      	movs	r1, #1
20023992:	4620      	mov	r0, r4
20023994:	f7ff f8f9 	bl	20022b8a <HAL_FLASH_WRITE_DLEN>
20023998:	2005      	movs	r0, #5
2002399a:	f7fe facf 	bl	20021f3c <HAL_Delay_us_>
2002399e:	68e2      	ldr	r2, [r4, #12]
200239a0:	2102      	movs	r1, #2
200239a2:	7912      	ldrb	r2, [r2, #4]
200239a4:	4620      	mov	r0, r4
200239a6:	f7ff fb8f 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
200239aa:	4620      	mov	r0, r4
200239ac:	f7ff f943 	bl	20022c36 <HAL_FLASH_READ32>
200239b0:	07c1      	lsls	r1, r0, #31
200239b2:	d4f1      	bmi.n	20023998 <HAL_NAND_READ_WITHOOB+0x6e>
200239b4:	f1bb 0f00 	cmp.w	fp, #0
200239b8:	d102      	bne.n	200239c0 <HAL_NAND_READ_WITHOOB+0x96>
200239ba:	f04f 0b01 	mov.w	fp, #1
200239be:	e7eb      	b.n	20023998 <HAL_NAND_READ_WITHOOB+0x6e>
200239c0:	4620      	mov	r0, r4
200239c2:	f7ff ff43 	bl	2002384c <HAL_NAND_GET_ECC_RESULT>
200239c6:	b110      	cbz	r0, 200239ce <HAL_NAND_READ_WITHOOB+0xa4>
200239c8:	f440 4000 	orr.w	r0, r0, #32768	@ 0x8000
200239cc:	e7c8      	b.n	20023960 <HAL_NAND_READ_WITHOOB+0x36>
200239ce:	f894 2020 	ldrb.w	r2, [r4, #32]
200239d2:	68e3      	ldr	r3, [r4, #12]
200239d4:	bbb2      	cbnz	r2, 20023a44 <HAL_NAND_READ_WITHOOB+0x11a>
200239d6:	f893 1046 	ldrb.w	r1, [r3, #70]	@ 0x46
200239da:	4620      	mov	r0, r4
200239dc:	f7ff f87d 	bl	20022ada <HAL_FLASH_SET_AHB_RCMD>
200239e0:	68e0      	ldr	r0, [r4, #12]
200239e2:	f990 c04e 	ldrsb.w	ip, [r0, #78]	@ 0x4e
200239e6:	f990 304a 	ldrsb.w	r3, [r0, #74]	@ 0x4a
200239ea:	f990 2049 	ldrsb.w	r2, [r0, #73]	@ 0x49
200239ee:	f990 1048 	ldrsb.w	r1, [r0, #72]	@ 0x48
200239f2:	f8cd c00c 	str.w	ip, [sp, #12]
200239f6:	f990 c04d 	ldrsb.w	ip, [r0, #77]	@ 0x4d
200239fa:	f8cd c008 	str.w	ip, [sp, #8]
200239fe:	f990 c04c 	ldrsb.w	ip, [r0, #76]	@ 0x4c
20023a02:	f8cd c004 	str.w	ip, [sp, #4]
20023a06:	f990 004b 	ldrsb.w	r0, [r0, #75]	@ 0x4b
20023a0a:	9000      	str	r0, [sp, #0]
20023a0c:	4620      	mov	r0, r4
20023a0e:	f7ff f86f 	bl	20022af0 <HAL_FLASH_CFG_AHB_RCMD>
20023a12:	03b2      	lsls	r2, r6, #14
20023a14:	f8d4 b010 	ldr.w	fp, [r4, #16]
20023a18:	d504      	bpl.n	20023a24 <HAL_NAND_READ_WITHOOB+0xfa>
20023a1a:	f894 2027 	ldrb.w	r2, [r4, #39]	@ 0x27
20023a1e:	b10a      	cbz	r2, 20023a24 <HAL_NAND_READ_WITHOOB+0xfa>
20023a20:	f44b 5b80 	orr.w	fp, fp, #4096	@ 0x1000
20023a24:	ea49 0205 	orr.w	r2, r9, r5
20023a28:	ea42 020a 	orr.w	r2, r2, sl
20023a2c:	0793      	lsls	r3, r2, #30
20023a2e:	d102      	bne.n	20023a36 <HAL_NAND_READ_WITHOOB+0x10c>
20023a30:	1e6a      	subs	r2, r5, #1
20023a32:	2afe      	cmp	r2, #254	@ 0xfe
20023a34:	d821      	bhi.n	20023a7a <HAL_NAND_READ_WITHOOB+0x150>
20023a36:	462a      	mov	r2, r5
20023a38:	4648      	mov	r0, r9
20023a3a:	eb0b 010a 	add.w	r1, fp, sl
20023a3e:	f006 feef 	bl	2002a820 <memcpy>
20023a42:	e01d      	b.n	20023a80 <HAL_NAND_READ_WITHOOB+0x156>
20023a44:	f893 106a 	ldrb.w	r1, [r3, #106]	@ 0x6a
20023a48:	4620      	mov	r0, r4
20023a4a:	f7ff f846 	bl	20022ada <HAL_FLASH_SET_AHB_RCMD>
20023a4e:	68e0      	ldr	r0, [r4, #12]
20023a50:	f990 c072 	ldrsb.w	ip, [r0, #114]	@ 0x72
20023a54:	f990 306e 	ldrsb.w	r3, [r0, #110]	@ 0x6e
20023a58:	f990 206d 	ldrsb.w	r2, [r0, #109]	@ 0x6d
20023a5c:	f990 106c 	ldrsb.w	r1, [r0, #108]	@ 0x6c
20023a60:	f8cd c00c 	str.w	ip, [sp, #12]
20023a64:	f990 c071 	ldrsb.w	ip, [r0, #113]	@ 0x71
20023a68:	f8cd c008 	str.w	ip, [sp, #8]
20023a6c:	f990 c070 	ldrsb.w	ip, [r0, #112]	@ 0x70
20023a70:	f8cd c004 	str.w	ip, [sp, #4]
20023a74:	f990 006f 	ldrsb.w	r0, [r0, #111]	@ 0x6f
20023a78:	e7c7      	b.n	20023a0a <HAL_NAND_READ_WITHOOB+0xe0>
20023a7a:	f1b9 0f00 	cmp.w	r9, #0
20023a7e:	d1da      	bne.n	20023a36 <HAL_NAND_READ_WITHOOB+0x10c>
20023a80:	9b0e      	ldr	r3, [sp, #56]	@ 0x38
20023a82:	b12b      	cbz	r3, 20023a90 <HAL_NAND_READ_WITHOOB+0x166>
20023a84:	463a      	mov	r2, r7
20023a86:	4618      	mov	r0, r3
20023a88:	eb0b 0108 	add.w	r1, fp, r8
20023a8c:	f006 fec8 	bl	2002a820 <memcpy>
20023a90:	1978      	adds	r0, r7, r5
20023a92:	e767      	b.n	20023964 <HAL_NAND_READ_WITHOOB+0x3a>

20023a94 <HAL_NAND_BLOCK_SIZE>:
20023a94:	b508      	push	{r3, lr}
20023a96:	4602      	mov	r2, r0
20023a98:	f7ff ff3c 	bl	20023914 <HAL_NAND_PAGE_SIZE>
20023a9c:	b128      	cbz	r0, 20023aaa <HAL_NAND_BLOCK_SIZE+0x16>
20023a9e:	f892 3024 	ldrb.w	r3, [r2, #36]	@ 0x24
20023aa2:	079b      	lsls	r3, r3, #30
20023aa4:	bf4c      	ite	mi
20023aa6:	01c0      	lslmi	r0, r0, #7
20023aa8:	0180      	lslpl	r0, r0, #6
20023aaa:	bd08      	pop	{r3, pc}

20023aac <HAL_NAND_GET_BADBLK>:
20023aac:	b51f      	push	{r0, r1, r2, r3, r4, lr}
20023aae:	4604      	mov	r4, r0
20023ab0:	b910      	cbnz	r0, 20023ab8 <HAL_NAND_GET_BADBLK+0xc>
20023ab2:	2000      	movs	r0, #0
20023ab4:	b004      	add	sp, #16
20023ab6:	bd10      	pop	{r4, pc}
20023ab8:	69c3      	ldr	r3, [r0, #28]
20023aba:	2b00      	cmp	r3, #0
20023abc:	d0f9      	beq.n	20023ab2 <HAL_NAND_GET_BADBLK+0x6>
20023abe:	f7ff ffe9 	bl	20023a94 <HAL_NAND_BLOCK_SIZE>
20023ac2:	2304      	movs	r3, #4
20023ac4:	9301      	str	r3, [sp, #4]
20023ac6:	ab03      	add	r3, sp, #12
20023ac8:	9300      	str	r3, [sp, #0]
20023aca:	2300      	movs	r3, #0
20023acc:	4341      	muls	r1, r0
20023ace:	461a      	mov	r2, r3
20023ad0:	4620      	mov	r0, r4
20023ad2:	f7ff ff2a 	bl	2002392a <HAL_NAND_READ_WITHOOB>
20023ad6:	b140      	cbz	r0, 20023aea <HAL_NAND_GET_BADBLK+0x3e>
20023ad8:	f89d 300c 	ldrb.w	r3, [sp, #12]
20023adc:	2bff      	cmp	r3, #255	@ 0xff
20023ade:	d0e8      	beq.n	20023ab2 <HAL_NAND_GET_BADBLK+0x6>
20023ae0:	9803      	ldr	r0, [sp, #12]
20023ae2:	2800      	cmp	r0, #0
20023ae4:	bf08      	it	eq
20023ae6:	2001      	moveq	r0, #1
20023ae8:	e7e4      	b.n	20023ab4 <HAL_NAND_GET_BADBLK+0x8>
20023aea:	2001      	movs	r0, #1
20023aec:	e7e2      	b.n	20023ab4 <HAL_NAND_GET_BADBLK+0x8>

20023aee <HAL_QSPIEX_WRITE_PAGE>:
20023aee:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20023af2:	b099      	sub	sp, #100	@ 0x64
20023af4:	4604      	mov	r4, r0
20023af6:	460e      	mov	r6, r1
20023af8:	4691      	mov	r9, r2
20023afa:	f7ff fd14 	bl	20023526 <flash_handle_valid>
20023afe:	b318      	cbz	r0, 20023b48 <HAL_QSPIEX_WRITE_PAGE+0x5a>
20023b00:	2b00      	cmp	r3, #0
20023b02:	f000 80d7 	beq.w	20023cb4 <HAL_QSPIEX_WRITE_PAGE+0x1c6>
20023b06:	f5b3 7f80 	cmp.w	r3, #256	@ 0x100
20023b0a:	bf28      	it	cs
20023b0c:	f44f 7380 	movcs.w	r3, #256	@ 0x100
20023b10:	68a1      	ldr	r1, [r4, #8]
20023b12:	461d      	mov	r5, r3
20023b14:	6962      	ldr	r2, [r4, #20]
20023b16:	f894 3020 	ldrb.w	r3, [r4, #32]
20023b1a:	2900      	cmp	r1, #0
20023b1c:	d03b      	beq.n	20023b96 <HAL_QSPIEX_WRITE_PAGE+0xa8>
20023b1e:	f1b2 7f80 	cmp.w	r2, #16777216	@ 0x1000000
20023b22:	d914      	bls.n	20023b4e <HAL_QSPIEX_WRITE_PAGE+0x60>
20023b24:	2b02      	cmp	r3, #2
20023b26:	bf14      	ite	ne
20023b28:	2727      	movne	r7, #39	@ 0x27
20023b2a:	2728      	moveq	r7, #40	@ 0x28
20023b2c:	4639      	mov	r1, r7
20023b2e:	4620      	mov	r0, r4
20023b30:	f7ff faa3 	bl	2002307a <HAL_FLASH_PRE_CMD>
20023b34:	4649      	mov	r1, r9
20023b36:	462b      	mov	r3, r5
20023b38:	2201      	movs	r2, #1
20023b3a:	4620      	mov	r0, r4
20023b3c:	f7ff fcfb 	bl	20023536 <HAL_FLASH_DMA_START>
20023b40:	4601      	mov	r1, r0
20023b42:	b148      	cbz	r0, 20023b58 <HAL_QSPIEX_WRITE_PAGE+0x6a>
20023b44:	2500      	movs	r5, #0
20023b46:	4628      	mov	r0, r5
20023b48:	b019      	add	sp, #100	@ 0x64
20023b4a:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
20023b4e:	2b02      	cmp	r3, #2
20023b50:	bf14      	ite	ne
20023b52:	2716      	movne	r7, #22
20023b54:	2717      	moveq	r7, #23
20023b56:	e7e9      	b.n	20023b2c <HAL_QSPIEX_WRITE_PAGE+0x3e>
20023b58:	4632      	mov	r2, r6
20023b5a:	4620      	mov	r0, r4
20023b5c:	f7ff fab4 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
20023b60:	2101      	movs	r1, #1
20023b62:	4620      	mov	r0, r4
20023b64:	f7ff f81b 	bl	20022b9e <HAL_FLASH_WRITE_DLEN2>
20023b68:	2301      	movs	r3, #1
20023b6a:	4632      	mov	r2, r6
20023b6c:	9300      	str	r3, [sp, #0]
20023b6e:	4639      	mov	r1, r7
20023b70:	2302      	movs	r3, #2
20023b72:	4620      	mov	r0, r4
20023b74:	f7ff fadb 	bl	2002312e <HAL_FLASH_ISSUE_CMD_SEQ>
20023b78:	2800      	cmp	r0, #0
20023b7a:	d1e3      	bne.n	20023b44 <HAL_QSPIEX_WRITE_PAGE+0x56>
20023b7c:	f44f 717a 	mov.w	r1, #1000	@ 0x3e8
20023b80:	4620      	mov	r0, r4
20023b82:	f7ff fd28 	bl	200235d6 <HAL_FLASH_DMA_WAIT_DONE>
20023b86:	2800      	cmp	r0, #0
20023b88:	d1dc      	bne.n	20023b44 <HAL_QSPIEX_WRITE_PAGE+0x56>
20023b8a:	6822      	ldr	r2, [r4, #0]
20023b8c:	6813      	ldr	r3, [r2, #0]
20023b8e:	f023 0320 	bic.w	r3, r3, #32
20023b92:	6013      	str	r3, [r2, #0]
20023b94:	e7d7      	b.n	20023b46 <HAL_QSPIEX_WRITE_PAGE+0x58>
20023b96:	f1b2 7f80 	cmp.w	r2, #16777216	@ 0x1000000
20023b9a:	f240 8082 	bls.w	20023ca2 <HAL_QSPIEX_WRITE_PAGE+0x1b4>
20023b9e:	2b02      	cmp	r3, #2
20023ba0:	bf14      	ite	ne
20023ba2:	2327      	movne	r3, #39	@ 0x27
20023ba4:	2328      	moveq	r3, #40	@ 0x28
20023ba6:	462f      	mov	r7, r5
20023ba8:	f04f 0800 	mov.w	r8, #0
20023bac:	9303      	str	r3, [sp, #12]
20023bae:	f64f 7afc 	movw	sl, #65532	@ 0xfffc
20023bb2:	2f40      	cmp	r7, #64	@ 0x40
20023bb4:	bfd4      	ite	le
20023bb6:	ea0a 0a07 	andle.w	sl, sl, r7
20023bba:	f00a 0a40 	andgt.w	sl, sl, #64	@ 0x40
20023bbe:	f1ba 0f00 	cmp.w	sl, #0
20023bc2:	d03f      	beq.n	20023c44 <HAL_QSPIEX_WRITE_PAGE+0x156>
20023bc4:	2200      	movs	r2, #0
20023bc6:	4620      	mov	r0, r4
20023bc8:	4611      	mov	r1, r2
20023bca:	f7ff fa7d 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
20023bce:	eb09 0308 	add.w	r3, r9, r8
20023bd2:	f10d 0c20 	add.w	ip, sp, #32
20023bd6:	f103 0e40 	add.w	lr, r3, #64	@ 0x40
20023bda:	4662      	mov	r2, ip
20023bdc:	6818      	ldr	r0, [r3, #0]
20023bde:	6859      	ldr	r1, [r3, #4]
20023be0:	3308      	adds	r3, #8
20023be2:	c203      	stmia	r2!, {r0, r1}
20023be4:	4573      	cmp	r3, lr
20023be6:	4694      	mov	ip, r2
20023be8:	d1f7      	bne.n	20023bda <HAL_QSPIEX_WRITE_PAGE+0xec>
20023bea:	f04f 0b00 	mov.w	fp, #0
20023bee:	ea4f 02aa 	mov.w	r2, sl, asr #2
20023bf2:	ab08      	add	r3, sp, #32
20023bf4:	f853 1b04 	ldr.w	r1, [r3], #4
20023bf8:	4620      	mov	r0, r4
20023bfa:	9205      	str	r2, [sp, #20]
20023bfc:	9304      	str	r3, [sp, #16]
20023bfe:	f7fe ffbd 	bl	20022b7c <HAL_FLASH_WRITE_WORD>
20023c02:	9a05      	ldr	r2, [sp, #20]
20023c04:	f10b 0b01 	add.w	fp, fp, #1
20023c08:	4593      	cmp	fp, r2
20023c0a:	9b04      	ldr	r3, [sp, #16]
20023c0c:	d1f2      	bne.n	20023bf4 <HAL_QSPIEX_WRITE_PAGE+0x106>
20023c0e:	4651      	mov	r1, sl
20023c10:	4620      	mov	r0, r4
20023c12:	f7fe ffba 	bl	20022b8a <HAL_FLASH_WRITE_DLEN>
20023c16:	4620      	mov	r0, r4
20023c18:	9903      	ldr	r1, [sp, #12]
20023c1a:	eb06 0208 	add.w	r2, r6, r8
20023c1e:	f7ff fa53 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
20023c22:	2101      	movs	r1, #1
20023c24:	4620      	mov	r0, r4
20023c26:	f7fe ffb0 	bl	20022b8a <HAL_FLASH_WRITE_DLEN>
20023c2a:	2200      	movs	r2, #0
20023c2c:	2102      	movs	r1, #2
20023c2e:	4620      	mov	r0, r4
20023c30:	f7ff fa4a 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
20023c34:	4620      	mov	r0, r4
20023c36:	f7fe fff5 	bl	20022c24 <HAL_FLASH_IS_PROG_DONE>
20023c3a:	2800      	cmp	r0, #0
20023c3c:	d0f1      	beq.n	20023c22 <HAL_QSPIEX_WRITE_PAGE+0x134>
20023c3e:	eba7 070a 	sub.w	r7, r7, sl
20023c42:	44d0      	add	r8, sl
20023c44:	1e7b      	subs	r3, r7, #1
20023c46:	2b02      	cmp	r3, #2
20023c48:	d830      	bhi.n	20023cac <HAL_QSPIEX_WRITE_PAGE+0x1be>
20023c4a:	6923      	ldr	r3, [r4, #16]
20023c4c:	4446      	add	r6, r8
20023c4e:	4333      	orrs	r3, r6
20023c50:	681b      	ldr	r3, [r3, #0]
20023c52:	463a      	mov	r2, r7
20023c54:	eb09 0108 	add.w	r1, r9, r8
20023c58:	a807      	add	r0, sp, #28
20023c5a:	9307      	str	r3, [sp, #28]
20023c5c:	f006 fde0 	bl	2002a820 <memcpy>
20023c60:	2200      	movs	r2, #0
20023c62:	4620      	mov	r0, r4
20023c64:	4611      	mov	r1, r2
20023c66:	f7ff fa2f 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
20023c6a:	9907      	ldr	r1, [sp, #28]
20023c6c:	4620      	mov	r0, r4
20023c6e:	f7fe ff85 	bl	20022b7c <HAL_FLASH_WRITE_WORD>
20023c72:	2104      	movs	r1, #4
20023c74:	4620      	mov	r0, r4
20023c76:	f7fe ff88 	bl	20022b8a <HAL_FLASH_WRITE_DLEN>
20023c7a:	4632      	mov	r2, r6
20023c7c:	4620      	mov	r0, r4
20023c7e:	9903      	ldr	r1, [sp, #12]
20023c80:	f7ff fa22 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
20023c84:	2101      	movs	r1, #1
20023c86:	4620      	mov	r0, r4
20023c88:	f7fe ff7f 	bl	20022b8a <HAL_FLASH_WRITE_DLEN>
20023c8c:	2200      	movs	r2, #0
20023c8e:	2102      	movs	r1, #2
20023c90:	4620      	mov	r0, r4
20023c92:	f7ff fa19 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
20023c96:	4620      	mov	r0, r4
20023c98:	f7fe ffc4 	bl	20022c24 <HAL_FLASH_IS_PROG_DONE>
20023c9c:	2800      	cmp	r0, #0
20023c9e:	d0f1      	beq.n	20023c84 <HAL_QSPIEX_WRITE_PAGE+0x196>
20023ca0:	e751      	b.n	20023b46 <HAL_QSPIEX_WRITE_PAGE+0x58>
20023ca2:	2b02      	cmp	r3, #2
20023ca4:	bf14      	ite	ne
20023ca6:	2316      	movne	r3, #22
20023ca8:	2317      	moveq	r3, #23
20023caa:	e77c      	b.n	20023ba6 <HAL_QSPIEX_WRITE_PAGE+0xb8>
20023cac:	2f00      	cmp	r7, #0
20023cae:	f73f af7e 	bgt.w	20023bae <HAL_QSPIEX_WRITE_PAGE+0xc0>
20023cb2:	e748      	b.n	20023b46 <HAL_QSPIEX_WRITE_PAGE+0x58>
20023cb4:	4618      	mov	r0, r3
20023cb6:	e747      	b.n	20023b48 <HAL_QSPIEX_WRITE_PAGE+0x5a>

20023cb8 <HAL_QSPIEX_SECT_ERASE>:
20023cb8:	b573      	push	{r0, r1, r4, r5, r6, lr}
20023cba:	4604      	mov	r4, r0
20023cbc:	460d      	mov	r5, r1
20023cbe:	f7ff fc32 	bl	20023526 <flash_handle_valid>
20023cc2:	b1e8      	cbz	r0, 20023d00 <HAL_QSPIEX_SECT_ERASE+0x48>
20023cc4:	6963      	ldr	r3, [r4, #20]
20023cc6:	460a      	mov	r2, r1
20023cc8:	f1b3 7f80 	cmp.w	r3, #16777216	@ 0x1000000
20023ccc:	f04f 0100 	mov.w	r1, #0
20023cd0:	4620      	mov	r0, r4
20023cd2:	bf94      	ite	ls
20023cd4:	261b      	movls	r6, #27
20023cd6:	2629      	movhi	r6, #41	@ 0x29
20023cd8:	f7ff f9f6 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
20023cdc:	2101      	movs	r1, #1
20023cde:	4620      	mov	r0, r4
20023ce0:	f7fe ff5d 	bl	20022b9e <HAL_FLASH_WRITE_DLEN2>
20023ce4:	2301      	movs	r3, #1
20023ce6:	462a      	mov	r2, r5
20023ce8:	9300      	str	r3, [sp, #0]
20023cea:	4631      	mov	r1, r6
20023cec:	2302      	movs	r3, #2
20023cee:	4620      	mov	r0, r4
20023cf0:	f7ff fa1d 	bl	2002312e <HAL_FLASH_ISSUE_CMD_SEQ>
20023cf4:	3800      	subs	r0, #0
20023cf6:	bf18      	it	ne
20023cf8:	2001      	movne	r0, #1
20023cfa:	4240      	negs	r0, r0
20023cfc:	b002      	add	sp, #8
20023cfe:	bd70      	pop	{r4, r5, r6, pc}
20023d00:	f04f 30ff 	mov.w	r0, #4294967295
20023d04:	e7fa      	b.n	20023cfc <HAL_QSPIEX_SECT_ERASE+0x44>
	...

20023d08 <HAL_QSPI_GET_SRC_CLK>:
20023d08:	b508      	push	{r3, lr}
20023d0a:	b1e8      	cbz	r0, 20023d48 <HAL_QSPI_GET_SRC_CLK+0x40>
20023d0c:	6803      	ldr	r3, [r0, #0]
20023d0e:	4a0f      	ldr	r2, [pc, #60]	@ (20023d4c <HAL_QSPI_GET_SRC_CLK+0x44>)
20023d10:	4293      	cmp	r3, r2
20023d12:	d00c      	beq.n	20023d2e <HAL_QSPI_GET_SRC_CLK+0x26>
20023d14:	f502 5280 	add.w	r2, r2, #4096	@ 0x1000
20023d18:	4293      	cmp	r3, r2
20023d1a:	d115      	bne.n	20023d48 <HAL_QSPI_GET_SRC_CLK+0x40>
20023d1c:	2006      	movs	r0, #6
20023d1e:	f001 f88d 	bl	20024e3c <HAL_RCC_HCPU_GetClockSrc>
20023d22:	2802      	cmp	r0, #2
20023d24:	d105      	bne.n	20023d32 <HAL_QSPI_GET_SRC_CLK+0x2a>
20023d26:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
20023d2a:	f001 b8bc 	b.w	20024ea6 <HAL_RCC_HCPU_GetDLL2Freq>
20023d2e:	2004      	movs	r0, #4
20023d30:	e7f5      	b.n	20023d1e <HAL_QSPI_GET_SRC_CLK+0x16>
20023d32:	2803      	cmp	r0, #3
20023d34:	d103      	bne.n	20023d3e <HAL_QSPI_GET_SRC_CLK+0x36>
20023d36:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
20023d3a:	f001 b8b7 	b.w	20024eac <HAL_RCC_HCPU_GetDLL3Freq>
20023d3e:	2001      	movs	r0, #1
20023d40:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
20023d44:	f001 b916 	b.w	20024f74 <HAL_RCC_GetSysCLKFreq>
20023d48:	2000      	movs	r0, #0
20023d4a:	bd08      	pop	{r3, pc}
20023d4c:	50041000 	.word	0x50041000

20023d50 <HAL_QSPI_GET_CLK>:
20023d50:	b538      	push	{r3, r4, r5, lr}
20023d52:	4605      	mov	r5, r0
20023d54:	b908      	cbnz	r0, 20023d5a <HAL_QSPI_GET_CLK+0xa>
20023d56:	2000      	movs	r0, #0
20023d58:	bd38      	pop	{r3, r4, r5, pc}
20023d5a:	f7fe ff7b 	bl	20022c54 <HAL_FLASH_GET_DIV>
20023d5e:	4604      	mov	r4, r0
20023d60:	2800      	cmp	r0, #0
20023d62:	d0f8      	beq.n	20023d56 <HAL_QSPI_GET_CLK+0x6>
20023d64:	4628      	mov	r0, r5
20023d66:	f7ff ffcf 	bl	20023d08 <HAL_QSPI_GET_SRC_CLK>
20023d6a:	fbb0 f0f4 	udiv	r0, r0, r4
20023d6e:	e7f3      	b.n	20023d58 <HAL_QSPI_GET_CLK+0x8>

20023d70 <HAL_QSPI_READ_ID>:
20023d70:	b138      	cbz	r0, 20023d82 <HAL_QSPI_READ_ID+0x12>
20023d72:	f890 3023 	ldrb.w	r3, [r0, #35]	@ 0x23
20023d76:	b113      	cbz	r3, 20023d7e <HAL_QSPI_READ_ID+0xe>
20023d78:	2100      	movs	r1, #0
20023d7a:	f7ff bc78 	b.w	2002366e <nand_read_id>
20023d7e:	f7ff baf8 	b.w	20023372 <HAL_FLASH_GET_NOR_ID>
20023d82:	20ff      	movs	r0, #255	@ 0xff
20023d84:	4770      	bx	lr

20023d86 <HAL_NOR_CFG_DTR>:
20023d86:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
20023d88:	4604      	mov	r4, r0
20023d8a:	460a      	mov	r2, r1
20023d8c:	b351      	cbz	r1, 20023de4 <HAL_NOR_CFG_DTR+0x5e>
20023d8e:	68c5      	ldr	r5, [r0, #12]
20023d90:	f895 31ff 	ldrb.w	r3, [r5, #511]	@ 0x1ff
20023d94:	2b00      	cmp	r3, #0
20023d96:	d03b      	beq.n	20023e10 <HAL_NOR_CFG_DTR+0x8a>
20023d98:	f890 3020 	ldrb.w	r3, [r0, #32]
20023d9c:	b3c3      	cbz	r3, 20023e10 <HAL_NOR_CFG_DTR+0x8a>
20023d9e:	f995 6207 	ldrsb.w	r6, [r5, #519]	@ 0x207
20023da2:	f995 2202 	ldrsb.w	r2, [r5, #514]	@ 0x202
20023da6:	f995 3203 	ldrsb.w	r3, [r5, #515]	@ 0x203
20023daa:	f995 1201 	ldrsb.w	r1, [r5, #513]	@ 0x201
20023dae:	9603      	str	r6, [sp, #12]
20023db0:	f995 6206 	ldrsb.w	r6, [r5, #518]	@ 0x206
20023db4:	9602      	str	r6, [sp, #8]
20023db6:	f995 6205 	ldrsb.w	r6, [r5, #517]	@ 0x205
20023dba:	9601      	str	r6, [sp, #4]
20023dbc:	f995 5204 	ldrsb.w	r5, [r5, #516]	@ 0x204
20023dc0:	9500      	str	r5, [sp, #0]
20023dc2:	f7fe fe95 	bl	20022af0 <HAL_FLASH_CFG_AHB_RCMD>
20023dc6:	68e3      	ldr	r3, [r4, #12]
20023dc8:	4620      	mov	r0, r4
20023dca:	f893 11ff 	ldrb.w	r1, [r3, #511]	@ 0x1ff
20023dce:	f7fe fe84 	bl	20022ada <HAL_FLASH_SET_AHB_RCMD>
20023dd2:	2101      	movs	r1, #1
20023dd4:	4620      	mov	r0, r4
20023dd6:	f894 2025 	ldrb.w	r2, [r4, #37]	@ 0x25
20023dda:	f7ff f895 	bl	20022f08 <HAL_MPI_CFG_DTR>
20023dde:	2000      	movs	r0, #0
20023de0:	b004      	add	sp, #16
20023de2:	bd70      	pop	{r4, r5, r6, pc}
20023de4:	f7ff f890 	bl	20022f08 <HAL_MPI_CFG_DTR>
20023de8:	6963      	ldr	r3, [r4, #20]
20023dea:	f894 1020 	ldrb.w	r1, [r4, #32]
20023dee:	f1b3 7f80 	cmp.w	r3, #16777216	@ 0x1000000
20023df2:	d906      	bls.n	20023e02 <HAL_NOR_CFG_DTR+0x7c>
20023df4:	b919      	cbnz	r1, 20023dfe <HAL_NOR_CFG_DTR+0x78>
20023df6:	4620      	mov	r0, r4
20023df8:	f7ff f902 	bl	20023000 <HAL_FLASH_CONFIG_FULL_AHB_READ>
20023dfc:	e7ef      	b.n	20023dde <HAL_NOR_CFG_DTR+0x58>
20023dfe:	2101      	movs	r1, #1
20023e00:	e7f9      	b.n	20023df6 <HAL_NOR_CFG_DTR+0x70>
20023e02:	b919      	cbnz	r1, 20023e0c <HAL_NOR_CFG_DTR+0x86>
20023e04:	4620      	mov	r0, r4
20023e06:	f7ff f8b7 	bl	20022f78 <HAL_FLASH_CONFIG_AHB_READ>
20023e0a:	e7e8      	b.n	20023dde <HAL_NOR_CFG_DTR+0x58>
20023e0c:	2101      	movs	r1, #1
20023e0e:	e7f9      	b.n	20023e04 <HAL_NOR_CFG_DTR+0x7e>
20023e10:	2001      	movs	r0, #1
20023e12:	e7e5      	b.n	20023de0 <HAL_NOR_CFG_DTR+0x5a>

20023e14 <HAL_NOR_DTR_CAL>:
20023e14:	b510      	push	{r4, lr}
20023e16:	4604      	mov	r4, r0
20023e18:	b1f0      	cbz	r0, 20023e58 <HAL_NOR_DTR_CAL+0x44>
20023e1a:	6802      	ldr	r2, [r0, #0]
20023e1c:	2014      	movs	r0, #20
20023e1e:	f8d2 3094 	ldr.w	r3, [r2, #148]	@ 0x94
20023e22:	f043 4300 	orr.w	r3, r3, #2147483648	@ 0x80000000
20023e26:	f8c2 3094 	str.w	r3, [r2, #148]	@ 0x94
20023e2a:	f7fe f8e6 	bl	20021ffa <HAL_Delay_us>
20023e2e:	6823      	ldr	r3, [r4, #0]
20023e30:	f8d3 2094 	ldr.w	r2, [r3, #148]	@ 0x94
20023e34:	05d2      	lsls	r2, r2, #23
20023e36:	d5fb      	bpl.n	20023e30 <HAL_NOR_DTR_CAL+0x1c>
20023e38:	f8d3 0094 	ldr.w	r0, [r3, #148]	@ 0x94
20023e3c:	f8d3 2094 	ldr.w	r2, [r3, #148]	@ 0x94
20023e40:	b2c0      	uxtb	r0, r0
20023e42:	f022 4200 	bic.w	r2, r2, #2147483648	@ 0x80000000
20023e46:	f8c3 2094 	str.w	r2, [r3, #148]	@ 0x94
20023e4a:	f894 3025 	ldrb.w	r3, [r4, #37]	@ 0x25
20023e4e:	f023 037f 	bic.w	r3, r3, #127	@ 0x7f
20023e52:	4303      	orrs	r3, r0
20023e54:	f884 3025 	strb.w	r3, [r4, #37]	@ 0x25
20023e58:	bd10      	pop	{r4, pc}
	...

20023e5c <HAL_FLASH_Init>:
20023e5c:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
20023e60:	460e      	mov	r6, r1
20023e62:	4690      	mov	r8, r2
20023e64:	461f      	mov	r7, r3
20023e66:	4604      	mov	r4, r0
20023e68:	b087      	sub	sp, #28
20023e6a:	2800      	cmp	r0, #0
20023e6c:	f000 80e5 	beq.w	2002403a <HAL_FLASH_Init+0x1de>
20023e70:	2900      	cmp	r1, #0
20023e72:	f000 80e2 	beq.w	2002403a <HAL_FLASH_Init+0x1de>
20023e76:	f7fe fe0f 	bl	20022a98 <HAL_QSPI_Init>
20023e7a:	6820      	ldr	r0, [r4, #0]
20023e7c:	f7ff fb59 	bl	20023532 <HAL_GET_FLASH_MID>
20023e80:	6933      	ldr	r3, [r6, #16]
20023e82:	2100      	movs	r1, #0
20023e84:	f884 3034 	strb.w	r3, [r4, #52]	@ 0x34
20023e88:	68b3      	ldr	r3, [r6, #8]
20023e8a:	4605      	mov	r5, r0
20023e8c:	63a3      	str	r3, [r4, #56]	@ 0x38
20023e8e:	68f3      	ldr	r3, [r6, #12]
20023e90:	f884 1024 	strb.w	r1, [r4, #36]	@ 0x24
20023e94:	051b      	lsls	r3, r3, #20
20023e96:	63e3      	str	r3, [r4, #60]	@ 0x3c
20023e98:	2302      	movs	r3, #2
20023e9a:	f884 3036 	strb.w	r3, [r4, #54]	@ 0x36
20023e9e:	6933      	ldr	r3, [r6, #16]
20023ea0:	f8c4 8008 	str.w	r8, [r4, #8]
20023ea4:	1e5a      	subs	r2, r3, #1
20023ea6:	4253      	negs	r3, r2
20023ea8:	4153      	adcs	r3, r2
20023eaa:	f884 3023 	strb.w	r3, [r4, #35]	@ 0x23
20023eae:	f1b8 0f00 	cmp.w	r8, #0
20023eb2:	d058      	beq.n	20023f66 <HAL_FLASH_Init+0x10a>
20023eb4:	2f00      	cmp	r7, #0
20023eb6:	d056      	beq.n	20023f66 <HAL_FLASH_Init+0x10a>
20023eb8:	683b      	ldr	r3, [r7, #0]
20023eba:	f8c8 3000 	str.w	r3, [r8]
20023ebe:	68a3      	ldr	r3, [r4, #8]
20023ec0:	68fa      	ldr	r2, [r7, #12]
20023ec2:	605a      	str	r2, [r3, #4]
20023ec4:	2210      	movs	r2, #16
20023ec6:	68a3      	ldr	r3, [r4, #8]
20023ec8:	609a      	str	r2, [r3, #8]
20023eca:	2280      	movs	r2, #128	@ 0x80
20023ecc:	68a3      	ldr	r3, [r4, #8]
20023ece:	60d9      	str	r1, [r3, #12]
20023ed0:	68a3      	ldr	r3, [r4, #8]
20023ed2:	611a      	str	r2, [r3, #16]
20023ed4:	f44f 5280 	mov.w	r2, #4096	@ 0x1000
20023ed8:	68a3      	ldr	r3, [r4, #8]
20023eda:	6159      	str	r1, [r3, #20]
20023edc:	68a3      	ldr	r3, [r4, #8]
20023ede:	6199      	str	r1, [r3, #24]
20023ee0:	68a3      	ldr	r3, [r4, #8]
20023ee2:	61d9      	str	r1, [r3, #28]
20023ee4:	68a3      	ldr	r3, [r4, #8]
20023ee6:	621a      	str	r2, [r3, #32]
20023ee8:	68a3      	ldr	r3, [r4, #8]
20023eea:	6259      	str	r1, [r3, #36]	@ 0x24
20023eec:	b1c0      	cbz	r0, 20023f20 <HAL_FLASH_Init+0xc4>
20023eee:	f06f 437f 	mvn.w	r3, #4278190080	@ 0xff000000
20023ef2:	4298      	cmp	r0, r3
20023ef4:	d014      	beq.n	20023f20 <HAL_FLASH_Init+0xc4>
20023ef6:	2601      	movs	r6, #1
20023ef8:	f894 3023 	ldrb.w	r3, [r4, #35]	@ 0x23
20023efc:	2b00      	cmp	r3, #0
20023efe:	d13d      	bne.n	20023f7c <HAL_FLASH_Init+0x120>
20023f00:	2e00      	cmp	r6, #0
20023f02:	d15a      	bne.n	20023fba <HAL_FLASH_Init+0x15e>
20023f04:	4620      	mov	r0, r4
20023f06:	f7ff faee 	bl	200234e6 <HAL_FLASH_RELEASE_DPD>
20023f0a:	4630      	mov	r0, r6
20023f0c:	f7fe f875 	bl	20021ffa <HAL_Delay_us>
20023f10:	2032      	movs	r0, #50	@ 0x32
20023f12:	f7fe f872 	bl	20021ffa <HAL_Delay_us>
20023f16:	4620      	mov	r0, r4
20023f18:	f7ff ff2a 	bl	20023d70 <HAL_QSPI_READ_ID>
20023f1c:	4605      	mov	r5, r0
20023f1e:	e04c      	b.n	20023fba <HAL_FLASH_Init+0x15e>
20023f20:	2101      	movs	r1, #1
20023f22:	4620      	mov	r0, r4
20023f24:	f7fe fe8b 	bl	20022c3e <HAL_FLASH_SET_TXSLOT>
20023f28:	4ba7      	ldr	r3, [pc, #668]	@ (200241c8 <HAL_FLASH_Init+0x36c>)
20023f2a:	69a2      	ldr	r2, [r4, #24]
20023f2c:	4620      	mov	r0, r4
20023f2e:	429a      	cmp	r2, r3
20023f30:	f04f 0200 	mov.w	r2, #0
20023f34:	bf8c      	ite	hi
20023f36:	2101      	movhi	r1, #1
20023f38:	4611      	movls	r1, r2
20023f3a:	f7ff fac5 	bl	200234c8 <HAL_QSPI_SET_CLK_INV>
20023f3e:	4620      	mov	r0, r4
20023f40:	f89d 1038 	ldrb.w	r1, [sp, #56]	@ 0x38
20023f44:	f7fe fe82 	bl	20022c4c <HAL_FLASH_SET_CLK_rom>
20023f48:	f894 3035 	ldrb.w	r3, [r4, #53]	@ 0x35
20023f4c:	b12b      	cbz	r3, 20023f5a <HAL_FLASH_Init+0xfe>
20023f4e:	2b01      	cmp	r3, #1
20023f50:	d110      	bne.n	20023f74 <HAL_FLASH_Init+0x118>
20023f52:	2100      	movs	r1, #0
20023f54:	4620      	mov	r0, r4
20023f56:	f7fe ff91 	bl	20022e7c <HAL_FLASH_SET_DUAL_MODE>
20023f5a:	2101      	movs	r1, #1
20023f5c:	4620      	mov	r0, r4
20023f5e:	f7fe ff1a 	bl	20022d96 <HAL_FLASH_ENABLE_QSPI>
20023f62:	2600      	movs	r6, #0
20023f64:	e7c8      	b.n	20023ef8 <HAL_FLASH_Init+0x9c>
20023f66:	2d00      	cmp	r5, #0
20023f68:	d0de      	beq.n	20023f28 <HAL_FLASH_Init+0xcc>
20023f6a:	f06f 437f 	mvn.w	r3, #4278190080	@ 0xff000000
20023f6e:	429d      	cmp	r5, r3
20023f70:	d1c1      	bne.n	20023ef6 <HAL_FLASH_Init+0x9a>
20023f72:	e7d9      	b.n	20023f28 <HAL_FLASH_Init+0xcc>
20023f74:	2b02      	cmp	r3, #2
20023f76:	d1f0      	bne.n	20023f5a <HAL_FLASH_Init+0xfe>
20023f78:	2101      	movs	r1, #1
20023f7a:	e7eb      	b.n	20023f54 <HAL_FLASH_Init+0xf8>
20023f7c:	6822      	ldr	r2, [r4, #0]
20023f7e:	2700      	movs	r7, #0
20023f80:	6893      	ldr	r3, [r2, #8]
20023f82:	4639      	mov	r1, r7
20023f84:	f043 7370 	orr.w	r3, r3, #62914560	@ 0x3c00000
20023f88:	6093      	str	r3, [r2, #8]
20023f8a:	2301      	movs	r3, #1
20023f8c:	463a      	mov	r2, r7
20023f8e:	4620      	mov	r0, r4
20023f90:	e9cd 7303 	strd	r7, r3, [sp, #12]
20023f94:	e9cd 7701 	strd	r7, r7, [sp, #4]
20023f98:	463b      	mov	r3, r7
20023f9a:	9700      	str	r7, [sp, #0]
20023f9c:	f7fe fe5f 	bl	20022c5e <HAL_FLASH_MANUAL_CMD>
20023fa0:	463a      	mov	r2, r7
20023fa2:	21ff      	movs	r1, #255	@ 0xff
20023fa4:	4620      	mov	r0, r4
20023fa6:	f7fe fe15 	bl	20022bd4 <HAL_FLASH_SET_CMD>
20023faa:	4638      	mov	r0, r7
20023fac:	f7fe f825 	bl	20021ffa <HAL_Delay_us>
20023fb0:	20c8      	movs	r0, #200	@ 0xc8
20023fb2:	f7fe f822 	bl	20021ffa <HAL_Delay_us>
20023fb6:	2e00      	cmp	r6, #0
20023fb8:	d0ad      	beq.n	20023f16 <HAL_FLASH_Init+0xba>
20023fba:	f894 3023 	ldrb.w	r3, [r4, #35]	@ 0x23
20023fbe:	b2ef      	uxtb	r7, r5
20023fc0:	f3c5 2807 	ubfx	r8, r5, #8, #8
20023fc4:	6325      	str	r5, [r4, #48]	@ 0x30
20023fc6:	f3c5 4507 	ubfx	r5, r5, #16, #8
20023fca:	4642      	mov	r2, r8
20023fcc:	4629      	mov	r1, r5
20023fce:	4638      	mov	r0, r7
20023fd0:	b3ab      	cbz	r3, 2002403e <HAL_FLASH_Init+0x1e2>
20023fd2:	f001 f9d7 	bl	20025384 <spi_nand_get_cmd_by_id>
20023fd6:	60e0      	str	r0, [r4, #12]
20023fd8:	bba0      	cbnz	r0, 20024044 <HAL_FLASH_Init+0x1e8>
20023fda:	f894 3023 	ldrb.w	r3, [r4, #35]	@ 0x23
20023fde:	b32b      	cbz	r3, 2002402c <HAL_FLASH_Init+0x1d0>
20023fe0:	2108      	movs	r1, #8
20023fe2:	4620      	mov	r0, r4
20023fe4:	f7ff fb43 	bl	2002366e <nand_read_id>
20023fe8:	f3c0 2807 	ubfx	r8, r0, #8, #8
20023fec:	f3c0 4507 	ubfx	r5, r0, #16, #8
20023ff0:	b2c7      	uxtb	r7, r0
20023ff2:	6320      	str	r0, [r4, #48]	@ 0x30
20023ff4:	4642      	mov	r2, r8
20023ff6:	4629      	mov	r1, r5
20023ff8:	4638      	mov	r0, r7
20023ffa:	f001 f9c3 	bl	20025384 <spi_nand_get_cmd_by_id>
20023ffe:	60e0      	str	r0, [r4, #12]
20024000:	bb00      	cbnz	r0, 20024044 <HAL_FLASH_Init+0x1e8>
20024002:	210f      	movs	r1, #15
20024004:	4620      	mov	r0, r4
20024006:	f7ff fb32 	bl	2002366e <nand_read_id>
2002400a:	f3c0 2807 	ubfx	r8, r0, #8, #8
2002400e:	f3c0 4507 	ubfx	r5, r0, #16, #8
20024012:	b2c7      	uxtb	r7, r0
20024014:	6320      	str	r0, [r4, #48]	@ 0x30
20024016:	4642      	mov	r2, r8
20024018:	4629      	mov	r1, r5
2002401a:	4638      	mov	r0, r7
2002401c:	f001 f9b2 	bl	20025384 <spi_nand_get_cmd_by_id>
20024020:	60e0      	str	r0, [r4, #12]
20024022:	b978      	cbnz	r0, 20024044 <HAL_FLASH_Init+0x1e8>
20024024:	f001 f9c4 	bl	200253b0 <spi_nand_get_default_ctable>
20024028:	60e0      	str	r0, [r4, #12]
2002402a:	b958      	cbnz	r0, 20024044 <HAL_FLASH_Init+0x1e8>
2002402c:	2100      	movs	r1, #0
2002402e:	4620      	mov	r0, r4
20024030:	f7fe feb1 	bl	20022d96 <HAL_FLASH_ENABLE_QSPI>
20024034:	2300      	movs	r3, #0
20024036:	e9c4 330e 	strd	r3, r3, [r4, #56]	@ 0x38
2002403a:	2001      	movs	r0, #1
2002403c:	e04c      	b.n	200240d8 <HAL_FLASH_Init+0x27c>
2002403e:	f001 f959 	bl	200252f4 <spi_flash_get_cmd_by_id>
20024042:	e7c8      	b.n	20023fd6 <HAL_FLASH_Init+0x17a>
20024044:	f894 3023 	ldrb.w	r3, [r4, #35]	@ 0x23
20024048:	4642      	mov	r2, r8
2002404a:	4629      	mov	r1, r5
2002404c:	4638      	mov	r0, r7
2002404e:	2b00      	cmp	r3, #0
20024050:	d045      	beq.n	200240de <HAL_FLASH_Init+0x282>
20024052:	f001 f9bb 	bl	200253cc <spi_nand_get_size_by_id>
20024056:	4642      	mov	r2, r8
20024058:	4629      	mov	r1, r5
2002405a:	4681      	mov	r9, r0
2002405c:	4638      	mov	r0, r7
2002405e:	f001 f9bf 	bl	200253e0 <spi_nand_get_plane_select_flag>
20024062:	4642      	mov	r2, r8
20024064:	4629      	mov	r1, r5
20024066:	f884 0027 	strb.w	r0, [r4, #39]	@ 0x27
2002406a:	4638      	mov	r0, r7
2002406c:	f001 f9c1 	bl	200253f2 <spi_nand_get_big_page_flag>
20024070:	4642      	mov	r2, r8
20024072:	f884 0024 	strb.w	r0, [r4, #36]	@ 0x24
20024076:	4629      	mov	r1, r5
20024078:	4638      	mov	r0, r7
2002407a:	f001 f9c3 	bl	20025404 <spi_nand_get_ecc_mode>
2002407e:	f894 3024 	ldrb.w	r3, [r4, #36]	@ 0x24
20024082:	ea43 1300 	orr.w	r3, r3, r0, lsl #4
20024086:	f884 3024 	strb.w	r3, [r4, #36]	@ 0x24
2002408a:	f1b9 0f00 	cmp.w	r9, #0
2002408e:	d003      	beq.n	20024098 <HAL_FLASH_Init+0x23c>
20024090:	f8c4 903c 	str.w	r9, [r4, #60]	@ 0x3c
20024094:	f8c4 9014 	str.w	r9, [r4, #20]
20024098:	f894 3023 	ldrb.w	r3, [r4, #35]	@ 0x23
2002409c:	2b00      	cmp	r3, #0
2002409e:	d173      	bne.n	20024188 <HAL_FLASH_Init+0x32c>
200240a0:	2e00      	cmp	r6, #0
200240a2:	d16e      	bne.n	20024182 <HAL_FLASH_Init+0x326>
200240a4:	4620      	mov	r0, r4
200240a6:	f7ff f97f 	bl	200233a8 <HAL_FLASH_CLR_PROTECT>
200240aa:	6963      	ldr	r3, [r4, #20]
200240ac:	f1b3 7f80 	cmp.w	r3, #16777216	@ 0x1000000
200240b0:	d938      	bls.n	20024124 <HAL_FLASH_Init+0x2c8>
200240b2:	4632      	mov	r2, r6
200240b4:	2121      	movs	r1, #33	@ 0x21
200240b6:	4620      	mov	r0, r4
200240b8:	f7ff f806 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
200240bc:	f894 3020 	ldrb.w	r3, [r4, #32]
200240c0:	b98b      	cbnz	r3, 200240e6 <HAL_FLASH_Init+0x28a>
200240c2:	4631      	mov	r1, r6
200240c4:	4620      	mov	r0, r4
200240c6:	f884 6026 	strb.w	r6, [r4, #38]	@ 0x26
200240ca:	f7ff f947 	bl	2002335c <HAL_FLASH_FADDR_SET_QSPI>
200240ce:	2107      	movs	r1, #7
200240d0:	4620      	mov	r0, r4
200240d2:	f7fe febb 	bl	20022e4c <HAL_FLASH_SET_ROW_BOUNDARY>
200240d6:	2000      	movs	r0, #0
200240d8:	b007      	add	sp, #28
200240da:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
200240de:	f001 f91d 	bl	2002531c <spi_flash_get_size_by_id>
200240e2:	4681      	mov	r9, r0
200240e4:	e7d1      	b.n	2002408a <HAL_FLASH_Init+0x22e>
200240e6:	2101      	movs	r1, #1
200240e8:	4620      	mov	r0, r4
200240ea:	f7ff f937 	bl	2002335c <HAL_FLASH_FADDR_SET_QSPI>
200240ee:	f894 9026 	ldrb.w	r9, [r4, #38]	@ 0x26
200240f2:	f1b9 0f01 	cmp.w	r9, #1
200240f6:	d1ea      	bne.n	200240ce <HAL_FLASH_Init+0x272>
200240f8:	4642      	mov	r2, r8
200240fa:	4629      	mov	r1, r5
200240fc:	4638      	mov	r0, r7
200240fe:	f001 f917 	bl	20025330 <spi_flash_is_support_dtr>
20024102:	b138      	cbz	r0, 20024114 <HAL_FLASH_Init+0x2b8>
20024104:	4620      	mov	r0, r4
20024106:	f7ff fe85 	bl	20023e14 <HAL_NOR_DTR_CAL>
2002410a:	4649      	mov	r1, r9
2002410c:	4620      	mov	r0, r4
2002410e:	f7ff fe3a 	bl	20023d86 <HAL_NOR_CFG_DTR>
20024112:	e7dc      	b.n	200240ce <HAL_FLASH_Init+0x272>
20024114:	4632      	mov	r2, r6
20024116:	4631      	mov	r1, r6
20024118:	4620      	mov	r0, r4
2002411a:	f7fe fef5 	bl	20022f08 <HAL_MPI_CFG_DTR>
2002411e:	f884 6026 	strb.w	r6, [r4, #38]	@ 0x26
20024122:	e7d4      	b.n	200240ce <HAL_FLASH_Init+0x272>
20024124:	f894 3020 	ldrb.w	r3, [r4, #32]
20024128:	b933      	cbnz	r3, 20024138 <HAL_FLASH_Init+0x2dc>
2002412a:	4631      	mov	r1, r6
2002412c:	4620      	mov	r0, r4
2002412e:	f884 6026 	strb.w	r6, [r4, #38]	@ 0x26
20024132:	f7ff f908 	bl	20023346 <HAL_FLASH_SET_QUAL_SPI>
20024136:	e7ce      	b.n	200240d6 <HAL_FLASH_Init+0x27a>
20024138:	2101      	movs	r1, #1
2002413a:	4620      	mov	r0, r4
2002413c:	f7ff f903 	bl	20023346 <HAL_FLASH_SET_QUAL_SPI>
20024140:	f894 9026 	ldrb.w	r9, [r4, #38]	@ 0x26
20024144:	f1b9 0f01 	cmp.w	r9, #1
20024148:	d115      	bne.n	20024176 <HAL_FLASH_Init+0x31a>
2002414a:	4642      	mov	r2, r8
2002414c:	4629      	mov	r1, r5
2002414e:	4638      	mov	r0, r7
20024150:	f001 f8ee 	bl	20025330 <spi_flash_is_support_dtr>
20024154:	b138      	cbz	r0, 20024166 <HAL_FLASH_Init+0x30a>
20024156:	4620      	mov	r0, r4
20024158:	f7ff fe5c 	bl	20023e14 <HAL_NOR_DTR_CAL>
2002415c:	4649      	mov	r1, r9
2002415e:	4620      	mov	r0, r4
20024160:	f7ff fe11 	bl	20023d86 <HAL_NOR_CFG_DTR>
20024164:	e7b7      	b.n	200240d6 <HAL_FLASH_Init+0x27a>
20024166:	4632      	mov	r2, r6
20024168:	4631      	mov	r1, r6
2002416a:	4620      	mov	r0, r4
2002416c:	f7fe fecc 	bl	20022f08 <HAL_MPI_CFG_DTR>
20024170:	f884 6026 	strb.w	r6, [r4, #38]	@ 0x26
20024174:	e7af      	b.n	200240d6 <HAL_FLASH_Init+0x27a>
20024176:	4632      	mov	r2, r6
20024178:	4631      	mov	r1, r6
2002417a:	4620      	mov	r0, r4
2002417c:	f7fe fec4 	bl	20022f08 <HAL_MPI_CFG_DTR>
20024180:	e7a9      	b.n	200240d6 <HAL_FLASH_Init+0x27a>
20024182:	f884 3026 	strb.w	r3, [r4, #38]	@ 0x26
20024186:	e7a6      	b.n	200240d6 <HAL_FLASH_Init+0x27a>
20024188:	2101      	movs	r1, #1
2002418a:	4620      	mov	r0, r4
2002418c:	f7fe fcfd 	bl	20022b8a <HAL_FLASH_WRITE_DLEN>
20024190:	68e3      	ldr	r3, [r4, #12]
20024192:	2102      	movs	r1, #2
20024194:	791a      	ldrb	r2, [r3, #4]
20024196:	4620      	mov	r0, r4
20024198:	f7fe ff96 	bl	200230c8 <HAL_FLASH_ISSUE_CMD>
2002419c:	4620      	mov	r0, r4
2002419e:	f7fe fd4a 	bl	20022c36 <HAL_FLASH_READ32>
200241a2:	4605      	mov	r5, r0
200241a4:	200a      	movs	r0, #10
200241a6:	f7fd ff28 	bl	20021ffa <HAL_Delay_us>
200241aa:	07eb      	lsls	r3, r5, #31
200241ac:	d4ec      	bmi.n	20024188 <HAL_FLASH_Init+0x32c>
200241ae:	4620      	mov	r0, r4
200241b0:	f7ff fb95 	bl	200238de <nand_clear_status>
200241b4:	f894 3020 	ldrb.w	r3, [r4, #32]
200241b8:	2b02      	cmp	r3, #2
200241ba:	d18c      	bne.n	200240d6 <HAL_FLASH_Init+0x27a>
200241bc:	2101      	movs	r1, #1
200241be:	4620      	mov	r0, r4
200241c0:	f7ff fb5c 	bl	2002387c <HAL_NAND_EN_QUAL>
200241c4:	e787      	b.n	200240d6 <HAL_FLASH_Init+0x27a>
200241c6:	bf00      	nop
200241c8:	05f5e100 	.word	0x05f5e100

200241cc <HAL_Delay_us_psram>:
200241cc:	b51f      	push	{r0, r1, r2, r3, r4, lr}
200241ce:	9001      	str	r0, [sp, #4]
200241d0:	9b01      	ldr	r3, [sp, #4]
200241d2:	4c11      	ldr	r4, [pc, #68]	@ (20024218 <HAL_Delay_us_psram+0x4c>)
200241d4:	b10b      	cbz	r3, 200241da <HAL_Delay_us_psram+0xe>
200241d6:	6820      	ldr	r0, [r4, #0]
200241d8:	b940      	cbnz	r0, 200241ec <HAL_Delay_us_psram+0x20>
200241da:	2000      	movs	r0, #0
200241dc:	f000 feda 	bl	20024f94 <HAL_RCC_GetHCLKFreq>
200241e0:	4b0e      	ldr	r3, [pc, #56]	@ (2002421c <HAL_Delay_us_psram+0x50>)
200241e2:	fbb0 f0f3 	udiv	r0, r0, r3
200241e6:	9b01      	ldr	r3, [sp, #4]
200241e8:	6020      	str	r0, [r4, #0]
200241ea:	b19b      	cbz	r3, 20024214 <HAL_Delay_us_psram+0x48>
200241ec:	2830      	cmp	r0, #48	@ 0x30
200241ee:	bf82      	ittt	hi
200241f0:	9b01      	ldrhi	r3, [sp, #4]
200241f2:	f103 33ff 	addhi.w	r3, r3, #4294967295
200241f6:	9301      	strhi	r3, [sp, #4]
200241f8:	9b01      	ldr	r3, [sp, #4]
200241fa:	b15b      	cbz	r3, 20024214 <HAL_Delay_us_psram+0x48>
200241fc:	2205      	movs	r2, #5
200241fe:	9b01      	ldr	r3, [sp, #4]
20024200:	3b01      	subs	r3, #1
20024202:	4343      	muls	r3, r0
20024204:	fbb3 f3f2 	udiv	r3, r3, r2
20024208:	9303      	str	r3, [sp, #12]
2002420a:	9b03      	ldr	r3, [sp, #12]
2002420c:	1e5a      	subs	r2, r3, #1
2002420e:	9203      	str	r2, [sp, #12]
20024210:	2b00      	cmp	r3, #0
20024212:	d1fa      	bne.n	2002420a <HAL_Delay_us_psram+0x3e>
20024214:	b004      	add	sp, #16
20024216:	bd10      	pop	{r4, pc}
20024218:	2004cbcc 	.word	0x2004cbcc
2002421c:	000f4240 	.word	0x000f4240

20024220 <HAL_MPI_OPSRAM_CAL_DELAY>:
20024220:	b570      	push	{r4, r5, r6, lr}
20024222:	460e      	mov	r6, r1
20024224:	4615      	mov	r5, r2
20024226:	4604      	mov	r4, r0
20024228:	b358      	cbz	r0, 20024282 <HAL_MPI_OPSRAM_CAL_DELAY+0x62>
2002422a:	2202      	movs	r2, #2
2002422c:	6803      	ldr	r3, [r0, #0]
2002422e:	60da      	str	r2, [r3, #12]
20024230:	6802      	ldr	r2, [r0, #0]
20024232:	6d93      	ldr	r3, [r2, #88]	@ 0x58
20024234:	f023 7300 	bic.w	r3, r3, #33554432	@ 0x2000000
20024238:	6593      	str	r3, [r2, #88]	@ 0x58
2002423a:	6802      	ldr	r2, [r0, #0]
2002423c:	2000      	movs	r0, #0
2002423e:	f8d2 3094 	ldr.w	r3, [r2, #148]	@ 0x94
20024242:	f043 4300 	orr.w	r3, r3, #2147483648	@ 0x80000000
20024246:	f8c2 3094 	str.w	r3, [r2, #148]	@ 0x94
2002424a:	f7ff ffbf 	bl	200241cc <HAL_Delay_us_psram>
2002424e:	2014      	movs	r0, #20
20024250:	f7ff ffbc 	bl	200241cc <HAL_Delay_us_psram>
20024254:	6820      	ldr	r0, [r4, #0]
20024256:	f8d0 3094 	ldr.w	r3, [r0, #148]	@ 0x94
2002425a:	05db      	lsls	r3, r3, #23
2002425c:	d5fb      	bpl.n	20024256 <HAL_MPI_OPSRAM_CAL_DELAY+0x36>
2002425e:	f8d0 3094 	ldr.w	r3, [r0, #148]	@ 0x94
20024262:	f8d0 2094 	ldr.w	r2, [r0, #148]	@ 0x94
20024266:	b2db      	uxtb	r3, r3
20024268:	f022 4200 	bic.w	r2, r2, #2147483648	@ 0x80000000
2002426c:	f8c0 2094 	str.w	r2, [r0, #148]	@ 0x94
20024270:	1e5a      	subs	r2, r3, #1
20024272:	7032      	strb	r2, [r6, #0]
20024274:	2201      	movs	r2, #1
20024276:	2000      	movs	r0, #0
20024278:	3b04      	subs	r3, #4
2002427a:	702b      	strb	r3, [r5, #0]
2002427c:	6823      	ldr	r3, [r4, #0]
2002427e:	60da      	str	r2, [r3, #12]
20024280:	bd70      	pop	{r4, r5, r6, pc}
20024282:	2001      	movs	r0, #1
20024284:	e7fc      	b.n	20024280 <HAL_MPI_OPSRAM_CAL_DELAY+0x60>
	...

20024288 <HAL_SPI_PSRAM_Init>:
20024288:	b537      	push	{r0, r1, r2, r4, r5, lr}
2002428a:	4614      	mov	r4, r2
2002428c:	4605      	mov	r5, r0
2002428e:	2800      	cmp	r0, #0
20024290:	d043      	beq.n	2002431a <HAL_SPI_PSRAM_Init+0x92>
20024292:	2900      	cmp	r1, #0
20024294:	d041      	beq.n	2002431a <HAL_SPI_PSRAM_Init+0x92>
20024296:	f7fe fbff 	bl	20022a98 <HAL_QSPI_Init>
2002429a:	4628      	mov	r0, r5
2002429c:	b2e1      	uxtb	r1, r4
2002429e:	f7fe fcd5 	bl	20022c4c <HAL_FLASH_SET_CLK_rom>
200242a2:	4628      	mov	r0, r5
200242a4:	f7ff fd54 	bl	20023d50 <HAL_QSPI_GET_CLK>
200242a8:	4b1d      	ldr	r3, [pc, #116]	@ (20024320 <HAL_SPI_PSRAM_Init+0x98>)
200242aa:	4298      	cmp	r0, r3
200242ac:	d930      	bls.n	20024310 <HAL_SPI_PSRAM_Init+0x88>
200242ae:	4b1d      	ldr	r3, [pc, #116]	@ (20024324 <HAL_SPI_PSRAM_Init+0x9c>)
200242b0:	4298      	cmp	r0, r3
200242b2:	d92f      	bls.n	20024314 <HAL_SPI_PSRAM_Init+0x8c>
200242b4:	4b1c      	ldr	r3, [pc, #112]	@ (20024328 <HAL_SPI_PSRAM_Init+0xa0>)
200242b6:	4298      	cmp	r0, r3
200242b8:	d922      	bls.n	20024300 <HAL_SPI_PSRAM_Init+0x78>
200242ba:	f240 34b6 	movw	r4, #950	@ 0x3b6
200242be:	f240 4374 	movw	r3, #1140	@ 0x474
200242c2:	4a1a      	ldr	r2, [pc, #104]	@ (2002432c <HAL_SPI_PSRAM_Init+0xa4>)
200242c4:	4290      	cmp	r0, r2
200242c6:	bf88      	it	hi
200242c8:	461c      	movhi	r4, r3
200242ca:	2200      	movs	r2, #0
200242cc:	2101      	movs	r1, #1
200242ce:	4628      	mov	r0, r5
200242d0:	f7ff f8fa 	bl	200234c8 <HAL_QSPI_SET_CLK_INV>
200242d4:	2100      	movs	r1, #0
200242d6:	4622      	mov	r2, r4
200242d8:	2302      	movs	r3, #2
200242da:	4628      	mov	r0, r5
200242dc:	9100      	str	r1, [sp, #0]
200242de:	f7fe fda0 	bl	20022e22 <HAL_FLASH_SET_CS_TIME>
200242e2:	4604      	mov	r4, r0
200242e4:	b948      	cbnz	r0, 200242fa <HAL_SPI_PSRAM_Init+0x72>
200242e6:	2106      	movs	r1, #6
200242e8:	4628      	mov	r0, r5
200242ea:	f7fe fdaf 	bl	20022e4c <HAL_FLASH_SET_ROW_BOUNDARY>
200242ee:	4604      	mov	r4, r0
200242f0:	b918      	cbnz	r0, 200242fa <HAL_SPI_PSRAM_Init+0x72>
200242f2:	2101      	movs	r1, #1
200242f4:	4628      	mov	r0, r5
200242f6:	f7fe fd4e 	bl	20022d96 <HAL_FLASH_ENABLE_QSPI>
200242fa:	4620      	mov	r0, r4
200242fc:	b003      	add	sp, #12
200242fe:	bd30      	pop	{r4, r5, pc}
20024300:	4b0b      	ldr	r3, [pc, #44]	@ (20024330 <HAL_SPI_PSRAM_Init+0xa8>)
20024302:	f44f 743e 	mov.w	r4, #760	@ 0x2f8
20024306:	4298      	cmp	r0, r3
20024308:	d8df      	bhi.n	200242ca <HAL_SPI_PSRAM_Init+0x42>
2002430a:	2200      	movs	r2, #0
2002430c:	4611      	mov	r1, r2
2002430e:	e7de      	b.n	200242ce <HAL_SPI_PSRAM_Init+0x46>
20024310:	24b4      	movs	r4, #180	@ 0xb4
20024312:	e7fa      	b.n	2002430a <HAL_SPI_PSRAM_Init+0x82>
20024314:	f44f 74be 	mov.w	r4, #380	@ 0x17c
20024318:	e7f7      	b.n	2002430a <HAL_SPI_PSRAM_Init+0x82>
2002431a:	2401      	movs	r4, #1
2002431c:	e7ed      	b.n	200242fa <HAL_SPI_PSRAM_Init+0x72>
2002431e:	bf00      	nop
20024320:	016e3600 	.word	0x016e3600
20024324:	02dc6c00 	.word	0x02dc6c00
20024328:	05b8d800 	.word	0x05b8d800
2002432c:	07270e00 	.word	0x07270e00
20024330:	03938700 	.word	0x03938700

20024334 <HAL_MPI_MR_WRITE>:
20024334:	b5f0      	push	{r4, r5, r6, r7, lr}
20024336:	460e      	mov	r6, r1
20024338:	4617      	mov	r7, r2
2002433a:	4605      	mov	r5, r0
2002433c:	b087      	sub	sp, #28
2002433e:	b1d8      	cbz	r0, 20024378 <HAL_MPI_MR_WRITE+0x44>
20024340:	2207      	movs	r2, #7
20024342:	2400      	movs	r4, #0
20024344:	2303      	movs	r3, #3
20024346:	e9cd 2203 	strd	r2, r2, [sp, #12]
2002434a:	2101      	movs	r1, #1
2002434c:	e9cd 4301 	strd	r4, r3, [sp, #4]
20024350:	9400      	str	r4, [sp, #0]
20024352:	4623      	mov	r3, r4
20024354:	f7fe fc83 	bl	20022c5e <HAL_FLASH_MANUAL_CMD>
20024358:	2102      	movs	r1, #2
2002435a:	4628      	mov	r0, r5
2002435c:	f7fe fc15 	bl	20022b8a <HAL_FLASH_WRITE_DLEN>
20024360:	4639      	mov	r1, r7
20024362:	4628      	mov	r0, r5
20024364:	f7fe fc0a 	bl	20022b7c <HAL_FLASH_WRITE_WORD>
20024368:	4632      	mov	r2, r6
2002436a:	21c0      	movs	r1, #192	@ 0xc0
2002436c:	4628      	mov	r0, r5
2002436e:	f7fe fc31 	bl	20022bd4 <HAL_FLASH_SET_CMD>
20024372:	4620      	mov	r0, r4
20024374:	b007      	add	sp, #28
20024376:	bdf0      	pop	{r4, r5, r6, r7, pc}
20024378:	2001      	movs	r0, #1
2002437a:	e7fb      	b.n	20024374 <HAL_MPI_MR_WRITE+0x40>

2002437c <HAL_MPI_SET_FIXLAT>:
2002437c:	e92d 41ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
20024380:	460c      	mov	r4, r1
20024382:	4616      	mov	r6, r2
20024384:	461f      	mov	r7, r3
20024386:	4605      	mov	r5, r0
20024388:	2800      	cmp	r0, #0
2002438a:	d040      	beq.n	2002440e <HAL_MPI_SET_FIXLAT+0x92>
2002438c:	466b      	mov	r3, sp
2002438e:	4a21      	ldr	r2, [pc, #132]	@ (20024414 <HAL_MPI_SET_FIXLAT+0x98>)
20024390:	6810      	ldr	r0, [r2, #0]
20024392:	6851      	ldr	r1, [r2, #4]
20024394:	c303      	stmia	r3!, {r0, r1}
20024396:	6890      	ldr	r0, [r2, #8]
20024398:	68d1      	ldr	r1, [r2, #12]
2002439a:	c303      	stmia	r3!, {r0, r1}
2002439c:	4628      	mov	r0, r5
2002439e:	b2e1      	uxtb	r1, r4
200243a0:	f7fe fd7a 	bl	20022e98 <HAL_MPI_EN_FIXLAT>
200243a4:	f107 0310 	add.w	r3, r7, #16
200243a8:	446b      	add	r3, sp
200243aa:	f813 8c08 	ldrb.w	r8, [r3, #-8]
200243ae:	ea4f 1848 	mov.w	r8, r8, lsl #5
200243b2:	fa5f f888 	uxtb.w	r8, r8
200243b6:	b30c      	cbz	r4, 200243fc <HAL_MPI_SET_FIXLAT+0x80>
200243b8:	ab04      	add	r3, sp, #16
200243ba:	eb03 0356 	add.w	r3, r3, r6, lsr #1
200243be:	f813 4c10 	ldrb.w	r4, [r3, #-16]
200243c2:	00a4      	lsls	r4, r4, #2
200243c4:	f044 0421 	orr.w	r4, r4, #33	@ 0x21
200243c8:	b264      	sxtb	r4, r4
200243ca:	f004 02fd 	and.w	r2, r4, #253	@ 0xfd
200243ce:	2100      	movs	r1, #0
200243d0:	4628      	mov	r0, r5
200243d2:	f7ff ffaf 	bl	20024334 <HAL_MPI_MR_WRITE>
200243d6:	1e71      	subs	r1, r6, #1
200243d8:	4628      	mov	r0, r5
200243da:	b249      	sxtb	r1, r1
200243dc:	f7fe fdba 	bl	20022f54 <HAL_MPI_MODIFY_RCMD_DELAY>
200243e0:	4642      	mov	r2, r8
200243e2:	2104      	movs	r1, #4
200243e4:	4628      	mov	r0, r5
200243e6:	f7ff ffa5 	bl	20024334 <HAL_MPI_MR_WRITE>
200243ea:	1e79      	subs	r1, r7, #1
200243ec:	4628      	mov	r0, r5
200243ee:	b249      	sxtb	r1, r1
200243f0:	f7fe fdb9 	bl	20022f66 <HAL_MPI_MODIFY_WCMD_DELAY>
200243f4:	2000      	movs	r0, #0
200243f6:	b004      	add	sp, #16
200243f8:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
200243fc:	f106 0310 	add.w	r3, r6, #16
20024400:	446b      	add	r3, sp
20024402:	f813 4c10 	ldrb.w	r4, [r3, #-16]
20024406:	00a4      	lsls	r4, r4, #2
20024408:	f044 0401 	orr.w	r4, r4, #1
2002440c:	e7dc      	b.n	200243c8 <HAL_MPI_SET_FIXLAT+0x4c>
2002440e:	2001      	movs	r0, #1
20024410:	e7f1      	b.n	200243f6 <HAL_MPI_SET_FIXLAT+0x7a>
20024412:	bf00      	nop
20024414:	2002b818 	.word	0x2002b818

20024418 <HAL_LEGACY_MR_WRITE>:
20024418:	b5f0      	push	{r4, r5, r6, r7, lr}
2002441a:	460e      	mov	r6, r1
2002441c:	4617      	mov	r7, r2
2002441e:	4605      	mov	r5, r0
20024420:	b087      	sub	sp, #28
20024422:	b1d8      	cbz	r0, 2002445c <HAL_LEGACY_MR_WRITE+0x44>
20024424:	2207      	movs	r2, #7
20024426:	2400      	movs	r4, #0
20024428:	2302      	movs	r3, #2
2002442a:	e9cd 2203 	strd	r2, r2, [sp, #12]
2002442e:	2101      	movs	r1, #1
20024430:	e9cd 4301 	strd	r4, r3, [sp, #4]
20024434:	9400      	str	r4, [sp, #0]
20024436:	4623      	mov	r3, r4
20024438:	f7fe fc11 	bl	20022c5e <HAL_FLASH_MANUAL_CMD>
2002443c:	2104      	movs	r1, #4
2002443e:	4628      	mov	r0, r5
20024440:	f7fe fba3 	bl	20022b8a <HAL_FLASH_WRITE_DLEN>
20024444:	4639      	mov	r1, r7
20024446:	4628      	mov	r0, r5
20024448:	f7fe fb98 	bl	20022b7c <HAL_FLASH_WRITE_WORD>
2002444c:	4632      	mov	r2, r6
2002444e:	21c0      	movs	r1, #192	@ 0xc0
20024450:	4628      	mov	r0, r5
20024452:	f7fe fbbf 	bl	20022bd4 <HAL_FLASH_SET_CMD>
20024456:	4620      	mov	r0, r4
20024458:	b007      	add	sp, #28
2002445a:	bdf0      	pop	{r4, r5, r6, r7, pc}
2002445c:	2001      	movs	r0, #1
2002445e:	e7fb      	b.n	20024458 <HAL_LEGACY_MR_WRITE+0x40>

20024460 <HAL_LEGACY_CFG_READ>:
20024460:	b530      	push	{r4, r5, lr}
20024462:	4605      	mov	r5, r0
20024464:	b085      	sub	sp, #20
20024466:	b1a0      	cbz	r0, 20024492 <HAL_LEGACY_CFG_READ+0x32>
20024468:	2400      	movs	r4, #0
2002446a:	2107      	movs	r1, #7
2002446c:	2302      	movs	r3, #2
2002446e:	f890 2025 	ldrb.w	r2, [r0, #37]	@ 0x25
20024472:	e9cd 1102 	strd	r1, r1, [sp, #8]
20024476:	0052      	lsls	r2, r2, #1
20024478:	e9cd 4300 	strd	r4, r3, [sp]
2002447c:	b252      	sxtb	r2, r2
2002447e:	4623      	mov	r3, r4
20024480:	f7fe fb36 	bl	20022af0 <HAL_FLASH_CFG_AHB_RCMD>
20024484:	4621      	mov	r1, r4
20024486:	4628      	mov	r0, r5
20024488:	f7fe fb27 	bl	20022ada <HAL_FLASH_SET_AHB_RCMD>
2002448c:	4620      	mov	r0, r4
2002448e:	b005      	add	sp, #20
20024490:	bd30      	pop	{r4, r5, pc}
20024492:	2001      	movs	r0, #1
20024494:	e7fb      	b.n	2002448e <HAL_LEGACY_CFG_READ+0x2e>

20024496 <HAL_LEGACY_CFG_WRITE>:
20024496:	b530      	push	{r4, r5, lr}
20024498:	4605      	mov	r5, r0
2002449a:	b085      	sub	sp, #20
2002449c:	b190      	cbz	r0, 200244c4 <HAL_LEGACY_CFG_WRITE+0x2e>
2002449e:	2107      	movs	r1, #7
200244a0:	2400      	movs	r4, #0
200244a2:	2302      	movs	r3, #2
200244a4:	e9cd 1102 	strd	r1, r1, [sp, #8]
200244a8:	e9cd 4300 	strd	r4, r3, [sp]
200244ac:	4623      	mov	r3, r4
200244ae:	f990 2026 	ldrsb.w	r2, [r0, #38]	@ 0x26
200244b2:	f7fe fb46 	bl	20022b42 <HAL_FLASH_CFG_AHB_WCMD>
200244b6:	2180      	movs	r1, #128	@ 0x80
200244b8:	4628      	mov	r0, r5
200244ba:	f7fe fb36 	bl	20022b2a <HAL_FLASH_SET_AHB_WCMD>
200244be:	4620      	mov	r0, r4
200244c0:	b005      	add	sp, #20
200244c2:	bd30      	pop	{r4, r5, pc}
200244c4:	2001      	movs	r0, #1
200244c6:	e7fb      	b.n	200244c0 <HAL_LEGACY_CFG_WRITE+0x2a>

200244c8 <HAL_PSRAM_RESET>:
200244c8:	b5f0      	push	{r4, r5, r6, r7, lr}
200244ca:	4604      	mov	r4, r0
200244cc:	b087      	sub	sp, #28
200244ce:	2800      	cmp	r0, #0
200244d0:	d03b      	beq.n	2002454a <HAL_PSRAM_RESET+0x82>
200244d2:	f890 3023 	ldrb.w	r3, [r0, #35]	@ 0x23
200244d6:	2b05      	cmp	r3, #5
200244d8:	d034      	beq.n	20024544 <HAL_PSRAM_RESET+0x7c>
200244da:	3b03      	subs	r3, #3
200244dc:	2b01      	cmp	r3, #1
200244de:	d82e      	bhi.n	2002453e <HAL_PSRAM_RESET+0x76>
200244e0:	2601      	movs	r6, #1
200244e2:	2703      	movs	r7, #3
200244e4:	2300      	movs	r3, #0
200244e6:	2507      	movs	r5, #7
200244e8:	b276      	sxtb	r6, r6
200244ea:	b27f      	sxtb	r7, r7
200244ec:	461a      	mov	r2, r3
200244ee:	2101      	movs	r1, #1
200244f0:	4620      	mov	r0, r4
200244f2:	e9cd 5503 	strd	r5, r5, [sp, #12]
200244f6:	e9cd 5701 	strd	r5, r7, [sp, #4]
200244fa:	9600      	str	r6, [sp, #0]
200244fc:	f7fe fbaf 	bl	20022c5e <HAL_FLASH_MANUAL_CMD>
20024500:	2200      	movs	r2, #0
20024502:	21ff      	movs	r1, #255	@ 0xff
20024504:	4620      	mov	r0, r4
20024506:	f7fe fb65 	bl	20022bd4 <HAL_FLASH_SET_CMD>
2002450a:	f894 3023 	ldrb.w	r3, [r4, #35]	@ 0x23
2002450e:	2b05      	cmp	r3, #5
20024510:	d10f      	bne.n	20024532 <HAL_PSRAM_RESET+0x6a>
20024512:	2300      	movs	r3, #0
20024514:	2101      	movs	r1, #1
20024516:	461a      	mov	r2, r3
20024518:	4620      	mov	r0, r4
2002451a:	e9cd 5503 	strd	r5, r5, [sp, #12]
2002451e:	e9cd 5701 	strd	r5, r7, [sp, #4]
20024522:	9600      	str	r6, [sp, #0]
20024524:	f7fe fb9b 	bl	20022c5e <HAL_FLASH_MANUAL_CMD>
20024528:	2200      	movs	r2, #0
2002452a:	21ff      	movs	r1, #255	@ 0xff
2002452c:	4620      	mov	r0, r4
2002452e:	f7fe fb51 	bl	20022bd4 <HAL_FLASH_SET_CMD>
20024532:	2000      	movs	r0, #0
20024534:	f7fd fd61 	bl	20021ffa <HAL_Delay_us>
20024538:	2003      	movs	r0, #3
2002453a:	f7fd fd5e 	bl	20021ffa <HAL_Delay_us>
2002453e:	2000      	movs	r0, #0
20024540:	b007      	add	sp, #28
20024542:	bdf0      	pop	{r4, r5, r6, r7, pc}
20024544:	2603      	movs	r6, #3
20024546:	2702      	movs	r7, #2
20024548:	e7cc      	b.n	200244e4 <HAL_PSRAM_RESET+0x1c>
2002454a:	2001      	movs	r0, #1
2002454c:	e7f8      	b.n	20024540 <HAL_PSRAM_RESET+0x78>
	...

20024550 <HAL_OPI_PSRAM_Init>:
20024550:	b530      	push	{r4, r5, lr}
20024552:	4604      	mov	r4, r0
20024554:	b085      	sub	sp, #20
20024556:	2800      	cmp	r0, #0
20024558:	d06e      	beq.n	20024638 <HAL_OPI_PSRAM_Init+0xe8>
2002455a:	2900      	cmp	r1, #0
2002455c:	d06c      	beq.n	20024638 <HAL_OPI_PSRAM_Init+0xe8>
2002455e:	f7fe fa9b 	bl	20022a98 <HAL_QSPI_Init>
20024562:	6823      	ldr	r3, [r4, #0]
20024564:	f10d 020e 	add.w	r2, sp, #14
20024568:	f10d 010f 	add.w	r1, sp, #15
2002456c:	4620      	mov	r0, r4
2002456e:	681d      	ldr	r5, [r3, #0]
20024570:	f7ff fe56 	bl	20024220 <HAL_MPI_OPSRAM_CAL_DELAY>
20024574:	2101      	movs	r1, #1
20024576:	4620      	mov	r0, r4
20024578:	f7fe fb68 	bl	20022c4c <HAL_FLASH_SET_CLK_rom>
2002457c:	4620      	mov	r0, r4
2002457e:	f7ff fbe7 	bl	20023d50 <HAL_QSPI_GET_CLK>
20024582:	4b2e      	ldr	r3, [pc, #184]	@ (2002463c <HAL_OPI_PSRAM_Init+0xec>)
20024584:	f005 0501 	and.w	r5, r5, #1
20024588:	4298      	cmp	r0, r3
2002458a:	d836      	bhi.n	200245fa <HAL_OPI_PSRAM_Init+0xaa>
2002458c:	2314      	movs	r3, #20
2002458e:	2103      	movs	r1, #3
20024590:	f88d 300e 	strb.w	r3, [sp, #14]
20024594:	f88d 300f 	strb.w	r3, [sp, #15]
20024598:	4608      	mov	r0, r1
2002459a:	2300      	movs	r3, #0
2002459c:	22b4      	movs	r2, #180	@ 0xb4
2002459e:	f884 1025 	strb.w	r1, [r4, #37]	@ 0x25
200245a2:	f884 1026 	strb.w	r1, [r4, #38]	@ 0x26
200245a6:	2106      	movs	r1, #6
200245a8:	9000      	str	r0, [sp, #0]
200245aa:	4620      	mov	r0, r4
200245ac:	f7fe fc39 	bl	20022e22 <HAL_FLASH_SET_CS_TIME>
200245b0:	2107      	movs	r1, #7
200245b2:	4620      	mov	r0, r4
200245b4:	f7fe fc4a 	bl	20022e4c <HAL_FLASH_SET_ROW_BOUNDARY>
200245b8:	2101      	movs	r1, #1
200245ba:	4620      	mov	r0, r4
200245bc:	f7fe fc7a 	bl	20022eb4 <HAL_MPI_ENABLE_DQS>
200245c0:	f89d 100e 	ldrb.w	r1, [sp, #14]
200245c4:	4620      	mov	r0, r4
200245c6:	f7fe fc83 	bl	20022ed0 <HAL_MPI_SET_DQS_DELAY>
200245ca:	2200      	movs	r2, #0
200245cc:	f89d 100f 	ldrb.w	r1, [sp, #15]
200245d0:	4620      	mov	r0, r4
200245d2:	f7fe fc89 	bl	20022ee8 <HAL_MPI_SET_SCK>
200245d6:	2101      	movs	r1, #1
200245d8:	4620      	mov	r0, r4
200245da:	f7fe fbdc 	bl	20022d96 <HAL_FLASH_ENABLE_QSPI>
200245de:	2101      	movs	r1, #1
200245e0:	4620      	mov	r0, r4
200245e2:	f7fe fbe6 	bl	20022db2 <HAL_FLASH_ENABLE_OPI>
200245e6:	b92d      	cbnz	r5, 200245f4 <HAL_OPI_PSRAM_Init+0xa4>
200245e8:	4b15      	ldr	r3, [pc, #84]	@ (20024640 <HAL_OPI_PSRAM_Init+0xf0>)
200245ea:	681b      	ldr	r3, [r3, #0]
200245ec:	f003 0303 	and.w	r3, r3, #3
200245f0:	2b03      	cmp	r3, #3
200245f2:	d11d      	bne.n	20024630 <HAL_OPI_PSRAM_Init+0xe0>
200245f4:	2000      	movs	r0, #0
200245f6:	b005      	add	sp, #20
200245f8:	bd30      	pop	{r4, r5, pc}
200245fa:	4b12      	ldr	r3, [pc, #72]	@ (20024644 <HAL_OPI_PSRAM_Init+0xf4>)
200245fc:	4298      	cmp	r0, r3
200245fe:	d90b      	bls.n	20024618 <HAL_OPI_PSRAM_Init+0xc8>
20024600:	f103 7337 	add.w	r3, r3, #47972352	@ 0x2dc0000
20024604:	f503 43d8 	add.w	r3, r3, #27648	@ 0x6c00
20024608:	4298      	cmp	r0, r3
2002460a:	d90b      	bls.n	20024624 <HAL_OPI_PSRAM_Init+0xd4>
2002460c:	2107      	movs	r1, #7
2002460e:	2014      	movs	r0, #20
20024610:	2308      	movs	r3, #8
20024612:	f240 5232 	movw	r2, #1330	@ 0x532
20024616:	e7c2      	b.n	2002459e <HAL_OPI_PSRAM_Init+0x4e>
20024618:	2105      	movs	r1, #5
2002461a:	200e      	movs	r0, #14
2002461c:	2303      	movs	r3, #3
2002461e:	f240 32b6 	movw	r2, #950	@ 0x3b6
20024622:	e7bc      	b.n	2002459e <HAL_OPI_PSRAM_Init+0x4e>
20024624:	2106      	movs	r1, #6
20024626:	2011      	movs	r0, #17
20024628:	2305      	movs	r3, #5
2002462a:	f240 4274 	movw	r2, #1140	@ 0x474
2002462e:	e7b6      	b.n	2002459e <HAL_OPI_PSRAM_Init+0x4e>
20024630:	4620      	mov	r0, r4
20024632:	f7ff ff49 	bl	200244c8 <HAL_PSRAM_RESET>
20024636:	e7dd      	b.n	200245f4 <HAL_OPI_PSRAM_Init+0xa4>
20024638:	2001      	movs	r0, #1
2002463a:	e7dc      	b.n	200245f6 <HAL_OPI_PSRAM_Init+0xa6>
2002463c:	02dc6c01 	.word	0x02dc6c01
20024640:	500c0000 	.word	0x500c0000
20024644:	0e4e1c01 	.word	0x0e4e1c01

20024648 <HAL_LEGACY_PSRAM_Init>:
20024648:	b5f0      	push	{r4, r5, r6, r7, lr}
2002464a:	4604      	mov	r4, r0
2002464c:	b085      	sub	sp, #20
2002464e:	2800      	cmp	r0, #0
20024650:	f000 8096 	beq.w	20024780 <HAL_LEGACY_PSRAM_Init+0x138>
20024654:	2900      	cmp	r1, #0
20024656:	f000 8093 	beq.w	20024780 <HAL_LEGACY_PSRAM_Init+0x138>
2002465a:	f7fe fa1d 	bl	20022a98 <HAL_QSPI_Init>
2002465e:	6823      	ldr	r3, [r4, #0]
20024660:	f10d 020e 	add.w	r2, sp, #14
20024664:	f10d 010f 	add.w	r1, sp, #15
20024668:	4620      	mov	r0, r4
2002466a:	681e      	ldr	r6, [r3, #0]
2002466c:	f7ff fdd8 	bl	20024220 <HAL_MPI_OPSRAM_CAL_DELAY>
20024670:	2101      	movs	r1, #1
20024672:	4620      	mov	r0, r4
20024674:	f7fe faea 	bl	20022c4c <HAL_FLASH_SET_CLK_rom>
20024678:	4620      	mov	r0, r4
2002467a:	f7ff fb69 	bl	20023d50 <HAL_QSPI_GET_CLK>
2002467e:	4b41      	ldr	r3, [pc, #260]	@ (20024784 <HAL_LEGACY_PSRAM_Init+0x13c>)
20024680:	4605      	mov	r5, r0
20024682:	4298      	cmp	r0, r3
20024684:	4f40      	ldr	r7, [pc, #256]	@ (20024788 <HAL_LEGACY_PSRAM_Init+0x140>)
20024686:	f006 0601 	and.w	r6, r6, #1
2002468a:	d850      	bhi.n	2002472e <HAL_LEGACY_PSRAM_Init+0xe6>
2002468c:	2314      	movs	r3, #20
2002468e:	2103      	movs	r1, #3
20024690:	f88d 300e 	strb.w	r3, [sp, #14]
20024694:	f88d 300f 	strb.w	r3, [sp, #15]
20024698:	22b4      	movs	r2, #180	@ 0xb4
2002469a:	2300      	movs	r3, #0
2002469c:	9100      	str	r1, [sp, #0]
2002469e:	4620      	mov	r0, r4
200246a0:	2106      	movs	r1, #6
200246a2:	f7fe fbbe 	bl	20022e22 <HAL_FLASH_SET_CS_TIME>
200246a6:	2107      	movs	r1, #7
200246a8:	4620      	mov	r0, r4
200246aa:	f7fe fbcf 	bl	20022e4c <HAL_FLASH_SET_ROW_BOUNDARY>
200246ae:	2101      	movs	r1, #1
200246b0:	4620      	mov	r0, r4
200246b2:	f7fe fbff 	bl	20022eb4 <HAL_MPI_ENABLE_DQS>
200246b6:	f89d 100e 	ldrb.w	r1, [sp, #14]
200246ba:	4620      	mov	r0, r4
200246bc:	f7fe fc08 	bl	20022ed0 <HAL_MPI_SET_DQS_DELAY>
200246c0:	2200      	movs	r2, #0
200246c2:	f89d 100f 	ldrb.w	r1, [sp, #15]
200246c6:	4620      	mov	r0, r4
200246c8:	f7fe fc0e 	bl	20022ee8 <HAL_MPI_SET_SCK>
200246cc:	2101      	movs	r1, #1
200246ce:	4620      	mov	r0, r4
200246d0:	f7fe fbc6 	bl	20022e60 <HAL_FLASH_SET_LEGACY>
200246d4:	2101      	movs	r1, #1
200246d6:	4620      	mov	r0, r4
200246d8:	f7fe fb5d 	bl	20022d96 <HAL_FLASH_ENABLE_QSPI>
200246dc:	2101      	movs	r1, #1
200246de:	4620      	mov	r0, r4
200246e0:	f7fe fb67 	bl	20022db2 <HAL_FLASH_ENABLE_OPI>
200246e4:	b92e      	cbnz	r6, 200246f2 <HAL_LEGACY_PSRAM_Init+0xaa>
200246e6:	f894 3027 	ldrb.w	r3, [r4, #39]	@ 0x27
200246ea:	b913      	cbnz	r3, 200246f2 <HAL_LEGACY_PSRAM_Init+0xaa>
200246ec:	4620      	mov	r0, r4
200246ee:	f7ff feeb 	bl	200244c8 <HAL_PSRAM_RESET>
200246f2:	42bd      	cmp	r5, r7
200246f4:	d93a      	bls.n	2002476c <HAL_LEGACY_PSRAM_Init+0x124>
200246f6:	4b25      	ldr	r3, [pc, #148]	@ (2002478c <HAL_LEGACY_PSRAM_Init+0x144>)
200246f8:	429d      	cmp	r5, r3
200246fa:	d93c      	bls.n	20024776 <HAL_LEGACY_PSRAM_Init+0x12e>
200246fc:	2206      	movs	r2, #6
200246fe:	2302      	movs	r3, #2
20024700:	2588      	movs	r5, #136	@ 0x88
20024702:	263b      	movs	r6, #59	@ 0x3b
20024704:	f884 3026 	strb.w	r3, [r4, #38]	@ 0x26
20024708:	2101      	movs	r1, #1
2002470a:	f884 2025 	strb.w	r2, [r4, #37]	@ 0x25
2002470e:	4620      	mov	r0, r4
20024710:	f7fe fbc2 	bl	20022e98 <HAL_MPI_EN_FIXLAT>
20024714:	4632      	mov	r2, r6
20024716:	2100      	movs	r1, #0
20024718:	4620      	mov	r0, r4
2002471a:	f7ff fe7d 	bl	20024418 <HAL_LEGACY_MR_WRITE>
2002471e:	462a      	mov	r2, r5
20024720:	2104      	movs	r1, #4
20024722:	4620      	mov	r0, r4
20024724:	f7ff fe78 	bl	20024418 <HAL_LEGACY_MR_WRITE>
20024728:	2000      	movs	r0, #0
2002472a:	b005      	add	sp, #20
2002472c:	bdf0      	pop	{r4, r5, r6, r7, pc}
2002472e:	42b8      	cmp	r0, r7
20024730:	d90d      	bls.n	2002474e <HAL_LEGACY_PSRAM_Init+0x106>
20024732:	4b16      	ldr	r3, [pc, #88]	@ (2002478c <HAL_LEGACY_PSRAM_Init+0x144>)
20024734:	4298      	cmp	r0, r3
20024736:	d90f      	bls.n	20024758 <HAL_LEGACY_PSRAM_Init+0x110>
20024738:	f103 7337 	add.w	r3, r3, #47972352	@ 0x2dc0000
2002473c:	f503 43d8 	add.w	r3, r3, #27648	@ 0x6c00
20024740:	4298      	cmp	r0, r3
20024742:	d80e      	bhi.n	20024762 <HAL_LEGACY_PSRAM_Init+0x11a>
20024744:	2114      	movs	r1, #20
20024746:	2308      	movs	r3, #8
20024748:	f240 5232 	movw	r2, #1330	@ 0x532
2002474c:	e7a6      	b.n	2002469c <HAL_LEGACY_PSRAM_Init+0x54>
2002474e:	210e      	movs	r1, #14
20024750:	2303      	movs	r3, #3
20024752:	f240 32b6 	movw	r2, #950	@ 0x3b6
20024756:	e7a1      	b.n	2002469c <HAL_LEGACY_PSRAM_Init+0x54>
20024758:	2111      	movs	r1, #17
2002475a:	2305      	movs	r3, #5
2002475c:	f240 4274 	movw	r2, #1140	@ 0x474
20024760:	e79c      	b.n	2002469c <HAL_LEGACY_PSRAM_Init+0x54>
20024762:	2117      	movs	r1, #23
20024764:	2309      	movs	r3, #9
20024766:	f44f 62be 	mov.w	r2, #1520	@ 0x5f0
2002476a:	e797      	b.n	2002469c <HAL_LEGACY_PSRAM_Init+0x54>
2002476c:	2204      	movs	r2, #4
2002476e:	2300      	movs	r3, #0
20024770:	2508      	movs	r5, #8
20024772:	2633      	movs	r6, #51	@ 0x33
20024774:	e7c6      	b.n	20024704 <HAL_LEGACY_PSRAM_Init+0xbc>
20024776:	2205      	movs	r2, #5
20024778:	2300      	movs	r3, #0
2002477a:	2508      	movs	r5, #8
2002477c:	2637      	movs	r6, #55	@ 0x37
2002477e:	e7c1      	b.n	20024704 <HAL_LEGACY_PSRAM_Init+0xbc>
20024780:	2001      	movs	r0, #1
20024782:	e7d2      	b.n	2002472a <HAL_LEGACY_PSRAM_Init+0xe2>
20024784:	02dc6c01 	.word	0x02dc6c01
20024788:	0e4e1c01 	.word	0x0e4e1c01
2002478c:	112a8801 	.word	0x112a8801

20024790 <HAL_HYPER_PSRAM_WriteCR>:
20024790:	b570      	push	{r4, r5, r6, lr}
20024792:	460e      	mov	r6, r1
20024794:	4615      	mov	r5, r2
20024796:	4604      	mov	r4, r0
20024798:	b086      	sub	sp, #24
2002479a:	b1f8      	cbz	r0, 200247dc <HAL_HYPER_PSRAM_WriteCR+0x4c>
2002479c:	2207      	movs	r2, #7
2002479e:	2303      	movs	r3, #3
200247a0:	e9cd 2301 	strd	r2, r3, [sp, #4]
200247a4:	2300      	movs	r3, #0
200247a6:	e9cd 2203 	strd	r2, r2, [sp, #12]
200247aa:	9300      	str	r3, [sp, #0]
200247ac:	2101      	movs	r1, #1
200247ae:	f7fe fa56 	bl	20022c5e <HAL_FLASH_MANUAL_CMD>
200247b2:	4631      	mov	r1, r6
200247b4:	4620      	mov	r0, r4
200247b6:	f7fe f9fc 	bl	20022bb2 <HAL_FLASH_WRITE_ABYTE>
200247ba:	2102      	movs	r1, #2
200247bc:	4620      	mov	r0, r4
200247be:	f7fe f9e4 	bl	20022b8a <HAL_FLASH_WRITE_DLEN>
200247c2:	4629      	mov	r1, r5
200247c4:	4620      	mov	r0, r4
200247c6:	f7fe f9d9 	bl	20022b7c <HAL_FLASH_WRITE_WORD>
200247ca:	f44f 3280 	mov.w	r2, #65536	@ 0x10000
200247ce:	2160      	movs	r1, #96	@ 0x60
200247d0:	4620      	mov	r0, r4
200247d2:	b006      	add	sp, #24
200247d4:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
200247d8:	f7fe b9fc 	b.w	20022bd4 <HAL_FLASH_SET_CMD>
200247dc:	b006      	add	sp, #24
200247de:	bd70      	pop	{r4, r5, r6, pc}

200247e0 <HAL_HYPER_PSRAM_Init>:
200247e0:	b538      	push	{r3, r4, r5, lr}
200247e2:	4604      	mov	r4, r0
200247e4:	2201      	movs	r2, #1
200247e6:	f7ff feb3 	bl	20024550 <HAL_OPI_PSRAM_Init>
200247ea:	4620      	mov	r0, r4
200247ec:	f7ff fab0 	bl	20023d50 <HAL_QSPI_GET_CLK>
200247f0:	4b15      	ldr	r3, [pc, #84]	@ (20024848 <HAL_HYPER_PSRAM_Init+0x68>)
200247f2:	4298      	cmp	r0, r3
200247f4:	d91f      	bls.n	20024836 <HAL_HYPER_PSRAM_Init+0x56>
200247f6:	4b15      	ldr	r3, [pc, #84]	@ (2002484c <HAL_HYPER_PSRAM_Init+0x6c>)
200247f8:	4298      	cmp	r0, r3
200247fa:	d91f      	bls.n	2002483c <HAL_HYPER_PSRAM_Init+0x5c>
200247fc:	f103 73f4 	add.w	r3, r3, #31981568	@ 0x1e80000
20024800:	f503 4390 	add.w	r3, r3, #18432	@ 0x4800
20024804:	4298      	cmp	r0, r3
20024806:	d91c      	bls.n	20024842 <HAL_HYPER_PSRAM_Init+0x62>
20024808:	f242 758f 	movw	r5, #10127	@ 0x278f
2002480c:	f241 738f 	movw	r3, #6031	@ 0x178f
20024810:	4a0f      	ldr	r2, [pc, #60]	@ (20024850 <HAL_HYPER_PSRAM_Init+0x70>)
20024812:	4290      	cmp	r0, r2
20024814:	bf98      	it	ls
20024816:	461d      	movls	r5, r3
20024818:	2101      	movs	r1, #1
2002481a:	4620      	mov	r0, r4
2002481c:	f7fe fad7 	bl	20022dce <HAL_FLASH_ENABLE_HYPER>
20024820:	462a      	mov	r2, r5
20024822:	4620      	mov	r0, r4
20024824:	2100      	movs	r1, #0
20024826:	f7ff ffb3 	bl	20024790 <HAL_HYPER_PSRAM_WriteCR>
2002482a:	2101      	movs	r1, #1
2002482c:	4620      	mov	r0, r4
2002482e:	f7fe fb33 	bl	20022e98 <HAL_MPI_EN_FIXLAT>
20024832:	2000      	movs	r0, #0
20024834:	bd38      	pop	{r3, r4, r5, pc}
20024836:	f24e 758f 	movw	r5, #59279	@ 0xe78f
2002483a:	e7ed      	b.n	20024818 <HAL_HYPER_PSRAM_Init+0x38>
2002483c:	f24f 758f 	movw	r5, #63375	@ 0xf78f
20024840:	e7ea      	b.n	20024818 <HAL_HYPER_PSRAM_Init+0x38>
20024842:	f240 758f 	movw	r5, #1935	@ 0x78f
20024846:	e7e7      	b.n	20024818 <HAL_HYPER_PSRAM_Init+0x38>
20024848:	0a21fe81 	.word	0x0a21fe81
2002484c:	0c65d401 	.word	0x0c65d401
20024850:	112a8801 	.word	0x112a8801

20024854 <HAL_HYPER_CFG_READ>:
20024854:	b51f      	push	{r0, r1, r2, r3, r4, lr}
20024856:	b160      	cbz	r0, 20024872 <HAL_HYPER_CFG_READ+0x1e>
20024858:	2107      	movs	r1, #7
2002485a:	2303      	movs	r3, #3
2002485c:	f890 2025 	ldrb.w	r2, [r0, #37]	@ 0x25
20024860:	e9cd 1300 	strd	r1, r3, [sp]
20024864:	3a01      	subs	r2, #1
20024866:	2300      	movs	r3, #0
20024868:	e9cd 1102 	strd	r1, r1, [sp, #8]
2002486c:	b252      	sxtb	r2, r2
2002486e:	f7fe f93f 	bl	20022af0 <HAL_FLASH_CFG_AHB_RCMD>
20024872:	b005      	add	sp, #20
20024874:	f85d fb04 	ldr.w	pc, [sp], #4

20024878 <HAL_HYPER_CFG_WRITE>:
20024878:	b51f      	push	{r0, r1, r2, r3, r4, lr}
2002487a:	b160      	cbz	r0, 20024896 <HAL_HYPER_CFG_WRITE+0x1e>
2002487c:	2107      	movs	r1, #7
2002487e:	2303      	movs	r3, #3
20024880:	f890 2026 	ldrb.w	r2, [r0, #38]	@ 0x26
20024884:	e9cd 1300 	strd	r1, r3, [sp]
20024888:	3a01      	subs	r2, #1
2002488a:	2300      	movs	r3, #0
2002488c:	e9cd 1102 	strd	r1, r1, [sp, #8]
20024890:	b252      	sxtb	r2, r2
20024892:	f7fe f956 	bl	20022b42 <HAL_FLASH_CFG_AHB_WCMD>
20024896:	b005      	add	sp, #20
20024898:	f85d fb04 	ldr.w	pc, [sp], #4

2002489c <HAL_PIN_SetUartFunc.part.0>:
2002489c:	108b      	asrs	r3, r1, #2
2002489e:	f1a3 0248 	sub.w	r2, r3, #72	@ 0x48
200248a2:	b5f0      	push	{r4, r5, r6, r7, lr}
200248a4:	b2d6      	uxtb	r6, r2
200248a6:	2e04      	cmp	r6, #4
200248a8:	d849      	bhi.n	2002493e <HAL_PIN_SetUartFunc.part.0+0xa2>
200248aa:	2e02      	cmp	r6, #2
200248ac:	d810      	bhi.n	200248d0 <HAL_PIN_SetUartFunc.part.0+0x34>
200248ae:	4d25      	ldr	r5, [pc, #148]	@ (20024944 <HAL_PIN_SetUartFunc.part.0+0xa8>)
200248b0:	240e      	movs	r4, #14
200248b2:	eb05 0582 	add.w	r5, r5, r2, lsl #2
200248b6:	f240 22b2 	movw	r2, #690	@ 0x2b2
200248ba:	eba1 0386 	sub.w	r3, r1, r6, lsl #2
200248be:	b29b      	uxth	r3, r3
200248c0:	f5a3 7390 	sub.w	r3, r3, #288	@ 0x120
200248c4:	2b03      	cmp	r3, #3
200248c6:	d83a      	bhi.n	2002493e <HAL_PIN_SetUartFunc.part.0+0xa2>
200248c8:	e8df f003 	tbb	[pc, r3]
200248cc:	20271a09 	.word	0x20271a09
200248d0:	4d1d      	ldr	r5, [pc, #116]	@ (20024948 <HAL_PIN_SetUartFunc.part.0+0xac>)
200248d2:	009b      	lsls	r3, r3, #2
200248d4:	243d      	movs	r4, #61	@ 0x3d
200248d6:	f240 3221 	movw	r2, #801	@ 0x321
200248da:	441d      	add	r5, r3
200248dc:	e7ed      	b.n	200248ba <HAL_PIN_SetUartFunc.part.0+0x1e>
200248de:	2c0e      	cmp	r4, #14
200248e0:	f04f 0608 	mov.w	r6, #8
200248e4:	d120      	bne.n	20024928 <HAL_PIN_SetUartFunc.part.0+0x8c>
200248e6:	f44f 517c 	mov.w	r1, #16128	@ 0x3f00
200248ea:	682f      	ldr	r7, [r5, #0]
200248ec:	1b03      	subs	r3, r0, r4
200248ee:	40b3      	lsls	r3, r6
200248f0:	407b      	eors	r3, r7
200248f2:	400b      	ands	r3, r1
200248f4:	4410      	add	r0, r2
200248f6:	407b      	eors	r3, r7
200248f8:	1b00      	subs	r0, r0, r4
200248fa:	602b      	str	r3, [r5, #0]
200248fc:	b280      	uxth	r0, r0
200248fe:	bdf0      	pop	{r4, r5, r6, r7, pc}
20024900:	2c0e      	cmp	r4, #14
20024902:	f04f 0600 	mov.w	r6, #0
20024906:	d112      	bne.n	2002492e <HAL_PIN_SetUartFunc.part.0+0x92>
20024908:	213f      	movs	r1, #63	@ 0x3f
2002490a:	e7ee      	b.n	200248ea <HAL_PIN_SetUartFunc.part.0+0x4e>
2002490c:	2c0e      	cmp	r4, #14
2002490e:	f04f 0610 	mov.w	r6, #16
20024912:	d10e      	bne.n	20024932 <HAL_PIN_SetUartFunc.part.0+0x96>
20024914:	f44f 117c 	mov.w	r1, #4128768	@ 0x3f0000
20024918:	e7e7      	b.n	200248ea <HAL_PIN_SetUartFunc.part.0+0x4e>
2002491a:	2c0e      	cmp	r4, #14
2002491c:	f04f 0618 	mov.w	r6, #24
20024920:	d10a      	bne.n	20024938 <HAL_PIN_SetUartFunc.part.0+0x9c>
20024922:	f04f 517c 	mov.w	r1, #1056964608	@ 0x3f000000
20024926:	e7e0      	b.n	200248ea <HAL_PIN_SetUartFunc.part.0+0x4e>
20024928:	f44f 61e0 	mov.w	r1, #1792	@ 0x700
2002492c:	e7dd      	b.n	200248ea <HAL_PIN_SetUartFunc.part.0+0x4e>
2002492e:	2107      	movs	r1, #7
20024930:	e7db      	b.n	200248ea <HAL_PIN_SetUartFunc.part.0+0x4e>
20024932:	f44f 21e0 	mov.w	r1, #458752	@ 0x70000
20024936:	e7d8      	b.n	200248ea <HAL_PIN_SetUartFunc.part.0+0x4e>
20024938:	f04f 61e0 	mov.w	r1, #117440512	@ 0x7000000
2002493c:	e7d5      	b.n	200248ea <HAL_PIN_SetUartFunc.part.0+0x4e>
2002493e:	2000      	movs	r0, #0
20024940:	e7dd      	b.n	200248fe <HAL_PIN_SetUartFunc.part.0+0x62>
20024942:	bf00      	nop
20024944:	5000b058 	.word	0x5000b058
20024948:	4000ef0c 	.word	0x4000ef0c

2002494c <HAL_PIN_SetAonPE>:
2002494c:	2a00      	cmp	r2, #0
2002494e:	d031      	beq.n	200249b4 <HAL_PIN_SetAonPE+0x68>
20024950:	282f      	cmp	r0, #47	@ 0x2f
20024952:	dd16      	ble.n	20024982 <HAL_PIN_SetAonPE+0x36>
20024954:	283a      	cmp	r0, #58	@ 0x3a
20024956:	dc2d      	bgt.n	200249b4 <HAL_PIN_SetAonPE+0x68>
20024958:	2301      	movs	r3, #1
2002495a:	4a17      	ldr	r2, [pc, #92]	@ (200249b8 <HAL_PIN_SetAonPE+0x6c>)
2002495c:	382a      	subs	r0, #42	@ 0x2a
2002495e:	4083      	lsls	r3, r0
20024960:	6f10      	ldr	r0, [r2, #112]	@ 0x70
20024962:	f011 0f20 	tst.w	r1, #32
20024966:	bf14      	ite	ne
20024968:	4318      	orrne	r0, r3
2002496a:	4398      	biceq	r0, r3
2002496c:	6710      	str	r0, [r2, #112]	@ 0x70
2002496e:	4a12      	ldr	r2, [pc, #72]	@ (200249b8 <HAL_PIN_SetAonPE+0x6c>)
20024970:	f011 0f10 	tst.w	r1, #16
20024974:	6ed1      	ldr	r1, [r2, #108]	@ 0x6c
20024976:	bf14      	ite	ne
20024978:	430b      	orrne	r3, r1
2002497a:	ea21 0303 	biceq.w	r3, r1, r3
2002497e:	66d3      	str	r3, [r2, #108]	@ 0x6c
20024980:	4770      	bx	lr
20024982:	3826      	subs	r0, #38	@ 0x26
20024984:	2803      	cmp	r0, #3
20024986:	d815      	bhi.n	200249b4 <HAL_PIN_SetAonPE+0x68>
20024988:	4b0c      	ldr	r3, [pc, #48]	@ (200249bc <HAL_PIN_SetAonPE+0x70>)
2002498a:	f011 0f20 	tst.w	r1, #32
2002498e:	f853 2020 	ldr.w	r2, [r3, r0, lsl #2]
20024992:	bf14      	ite	ne
20024994:	f042 0210 	orrne.w	r2, r2, #16
20024998:	f022 0210 	biceq.w	r2, r2, #16
2002499c:	f843 2020 	str.w	r2, [r3, r0, lsl #2]
200249a0:	f853 2020 	ldr.w	r2, [r3, r0, lsl #2]
200249a4:	06c9      	lsls	r1, r1, #27
200249a6:	bf4c      	ite	mi
200249a8:	f042 0208 	orrmi.w	r2, r2, #8
200249ac:	f022 0208 	bicpl.w	r2, r2, #8
200249b0:	f843 2020 	str.w	r2, [r3, r0, lsl #2]
200249b4:	4770      	bx	lr
200249b6:	bf00      	nop
200249b8:	500cb000 	.word	0x500cb000
200249bc:	500cb05c 	.word	0x500cb05c

200249c0 <HAL_PIN_Get_Base>:
200249c0:	b138      	cbz	r0, 200249d2 <HAL_PIN_Get_Base+0x12>
200249c2:	f04f 42a0 	mov.w	r2, #1342177280	@ 0x50000000
200249c6:	6893      	ldr	r3, [r2, #8]
200249c8:	4806      	ldr	r0, [pc, #24]	@ (200249e4 <HAL_PIN_Get_Base+0x24>)
200249ca:	f043 0304 	orr.w	r3, r3, #4
200249ce:	6093      	str	r3, [r2, #8]
200249d0:	4770      	bx	lr
200249d2:	f04f 4280 	mov.w	r2, #1073741824	@ 0x40000000
200249d6:	6853      	ldr	r3, [r2, #4]
200249d8:	4803      	ldr	r0, [pc, #12]	@ (200249e8 <HAL_PIN_Get_Base+0x28>)
200249da:	f043 0308 	orr.w	r3, r3, #8
200249de:	6053      	str	r3, [r2, #4]
200249e0:	4770      	bx	lr
200249e2:	bf00      	nop
200249e4:	50003000 	.word	0x50003000
200249e8:	40003000 	.word	0x40003000

200249ec <HAL_PIN_Func2Idx>:
200249ec:	283b      	cmp	r0, #59	@ 0x3b
200249ee:	bfc8      	it	gt
200249f0:	383c      	subgt	r0, #60	@ 0x3c
200249f2:	0143      	lsls	r3, r0, #5
200249f4:	b152      	cbz	r2, 20024a0c <HAL_PIN_Func2Idx+0x20>
200249f6:	4a06      	ldr	r2, [pc, #24]	@ (20024a10 <HAL_PIN_Func2Idx+0x24>)
200249f8:	2000      	movs	r0, #0
200249fa:	4413      	add	r3, r2
200249fc:	f833 2010 	ldrh.w	r2, [r3, r0, lsl #1]
20024a00:	428a      	cmp	r2, r1
20024a02:	d002      	beq.n	20024a0a <HAL_PIN_Func2Idx+0x1e>
20024a04:	3001      	adds	r0, #1
20024a06:	2810      	cmp	r0, #16
20024a08:	d1f8      	bne.n	200249fc <HAL_PIN_Func2Idx+0x10>
20024a0a:	4770      	bx	lr
20024a0c:	4a01      	ldr	r2, [pc, #4]	@ (20024a14 <HAL_PIN_Func2Idx+0x28>)
20024a0e:	e7f3      	b.n	200249f8 <HAL_PIN_Func2Idx+0xc>
20024a10:	2002b0b4 	.word	0x2002b0b4
20024a14:	2002b014 	.word	0x2002b014

20024a18 <HAL_PIN_Set>:
20024a18:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
20024a1c:	4615      	mov	r5, r2
20024a1e:	4604      	mov	r4, r0
20024a20:	b918      	cbnz	r0, 20024a2a <HAL_PIN_Set+0x12>
20024a22:	f04f 30ff 	mov.w	r0, #4294967295
20024a26:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
20024a2a:	283a      	cmp	r0, #58	@ 0x3a
20024a2c:	bfcd      	iteet	gt
20024a2e:	2700      	movgt	r7, #0
20024a30:	2701      	movle	r7, #1
20024a32:	4606      	movle	r6, r0
20024a34:	f1a0 063c 	subgt.w	r6, r0, #60	@ 0x3c
20024a38:	4638      	mov	r0, r7
20024a3a:	f7ff ffc1 	bl	200249c0 <HAL_PIN_Get_Base>
20024a3e:	4680      	mov	r8, r0
20024a40:	2f00      	cmp	r7, #0
20024a42:	f000 815e 	beq.w	20024d02 <HAL_PIN_Set+0x2ea>
20024a46:	f1a4 0026 	sub.w	r0, r4, #38	@ 0x26
20024a4a:	2803      	cmp	r0, #3
20024a4c:	d80a      	bhi.n	20024a64 <HAL_PIN_Set+0x4c>
20024a4e:	f8df c30c 	ldr.w	ip, [pc, #780]	@ 20024d5c <HAL_PIN_Set+0x344>
20024a52:	f104 4380 	add.w	r3, r4, #1073741824	@ 0x40000000
20024a56:	3b26      	subs	r3, #38	@ 0x26
20024a58:	f85c 2023 	ldr.w	r2, [ip, r3, lsl #2]
20024a5c:	f022 0202 	bic.w	r2, r2, #2
20024a60:	f84c 2023 	str.w	r2, [ip, r3, lsl #2]
20024a64:	f5a1 7390 	sub.w	r3, r1, #288	@ 0x120
20024a68:	b29b      	uxth	r3, r3
20024a6a:	2b0b      	cmp	r3, #11
20024a6c:	d804      	bhi.n	20024a78 <HAL_PIN_Set+0x60>
20024a6e:	4620      	mov	r0, r4
20024a70:	f7ff ff14 	bl	2002489c <HAL_PIN_SetUartFunc.part.0>
20024a74:	4601      	mov	r1, r0
20024a76:	e025      	b.n	20024ac4 <HAL_PIN_Set+0xac>
20024a78:	f5a1 739c 	sub.w	r3, r1, #312	@ 0x138
20024a7c:	b29b      	uxth	r3, r3
20024a7e:	2b07      	cmp	r3, #7
20024a80:	d850      	bhi.n	20024b24 <HAL_PIN_Set+0x10c>
20024a82:	104a      	asrs	r2, r1, #1
20024a84:	3a9c      	subs	r2, #156	@ 0x9c
20024a86:	eba1 0142 	sub.w	r1, r1, r2, lsl #1
20024a8a:	b289      	uxth	r1, r1
20024a8c:	f5b1 7f9c 	cmp.w	r1, #312	@ 0x138
20024a90:	d043      	beq.n	20024b1a <HAL_PIN_Set+0x102>
20024a92:	f240 1339 	movw	r3, #313	@ 0x139
20024a96:	4299      	cmp	r1, r3
20024a98:	f040 813a 	bne.w	20024d10 <HAL_PIN_Set+0x2f8>
20024a9c:	f04f 0e08 	mov.w	lr, #8
20024aa0:	f44f 5c7c 	mov.w	ip, #16128	@ 0x3f00
20024aa4:	49a5      	ldr	r1, [pc, #660]	@ (20024d3c <HAL_PIN_Set+0x324>)
20024aa6:	f1a4 030e 	sub.w	r3, r4, #14
20024aaa:	f851 0022 	ldr.w	r0, [r1, r2, lsl #2]
20024aae:	fa03 f30e 	lsl.w	r3, r3, lr
20024ab2:	4043      	eors	r3, r0
20024ab4:	ea03 030c 	and.w	r3, r3, ip
20024ab8:	4043      	eors	r3, r0
20024aba:	f841 3022 	str.w	r3, [r1, r2, lsl #2]
20024abe:	f504 7129 	add.w	r1, r4, #676	@ 0x2a4
20024ac2:	b289      	uxth	r1, r1
20024ac4:	463a      	mov	r2, r7
20024ac6:	4620      	mov	r0, r4
20024ac8:	f7ff ff90 	bl	200249ec <HAL_PIN_Func2Idx>
20024acc:	280f      	cmp	r0, #15
20024ace:	4681      	mov	r9, r0
20024ad0:	dca7      	bgt.n	20024a22 <HAL_PIN_Set+0xa>
20024ad2:	463a      	mov	r2, r7
20024ad4:	4629      	mov	r1, r5
20024ad6:	4620      	mov	r0, r4
20024ad8:	f7ff ff38 	bl	2002494c <HAL_PIN_SetAonPE>
20024adc:	2f00      	cmp	r7, #0
20024ade:	f040 8119 	bne.w	20024d14 <HAL_PIN_Set+0x2fc>
20024ae2:	2c40      	cmp	r4, #64	@ 0x40
20024ae4:	f340 8116 	ble.w	20024d14 <HAL_PIN_Set+0x2fc>
20024ae8:	4a95      	ldr	r2, [pc, #596]	@ (20024d40 <HAL_PIN_Set+0x328>)
20024aea:	06e8      	lsls	r0, r5, #27
20024aec:	f852 3024 	ldr.w	r3, [r2, r4, lsl #2]
20024af0:	ea4f 3909 	mov.w	r9, r9, lsl #12
20024af4:	f423 43e0 	bic.w	r3, r3, #28672	@ 0x7000
20024af8:	f023 0318 	bic.w	r3, r3, #24
20024afc:	bf48      	it	mi
20024afe:	f043 0308 	orrmi.w	r3, r3, #8
20024b02:	06a9      	lsls	r1, r5, #26
20024b04:	bf48      	it	mi
20024b06:	f043 0310 	orrmi.w	r3, r3, #16
20024b0a:	f409 49e0 	and.w	r9, r9, #28672	@ 0x7000
20024b0e:	ea49 0303 	orr.w	r3, r9, r3
20024b12:	f842 3024 	str.w	r3, [r2, r4, lsl #2]
20024b16:	2000      	movs	r0, #0
20024b18:	e785      	b.n	20024a26 <HAL_PIN_Set+0xe>
20024b1a:	f04f 0e00 	mov.w	lr, #0
20024b1e:	f04f 0c3f 	mov.w	ip, #63	@ 0x3f
20024b22:	e7bf      	b.n	20024aa4 <HAL_PIN_Set+0x8c>
20024b24:	f5a1 73ec 	sub.w	r3, r1, #472	@ 0x1d8
20024b28:	b29a      	uxth	r2, r3
20024b2a:	2a09      	cmp	r2, #9
20024b2c:	d837      	bhi.n	20024b9e <HAL_PIN_Set+0x186>
20024b2e:	2205      	movs	r2, #5
20024b30:	fbb3 f3f2 	udiv	r3, r3, r2
20024b34:	ebc3 3283 	rsb	r2, r3, r3, lsl #14
20024b38:	ebc3 0282 	rsb	r2, r3, r2, lsl #2
20024b3c:	440a      	add	r2, r1
20024b3e:	b292      	uxth	r2, r2
20024b40:	f5a2 71ec 	sub.w	r1, r2, #472	@ 0x1d8
20024b44:	b288      	uxth	r0, r1
20024b46:	2803      	cmp	r0, #3
20024b48:	d814      	bhi.n	20024b74 <HAL_PIN_Set+0x15c>
20024b4a:	f04f 0e3f 	mov.w	lr, #63	@ 0x3f
20024b4e:	487d      	ldr	r0, [pc, #500]	@ (20024d44 <HAL_PIN_Set+0x32c>)
20024b50:	00c9      	lsls	r1, r1, #3
20024b52:	f850 c023 	ldr.w	ip, [r0, r3, lsl #2]
20024b56:	f1a4 020e 	sub.w	r2, r4, #14
20024b5a:	408a      	lsls	r2, r1
20024b5c:	ea82 020c 	eor.w	r2, r2, ip
20024b60:	fa0e f101 	lsl.w	r1, lr, r1
20024b64:	400a      	ands	r2, r1
20024b66:	ea82 020c 	eor.w	r2, r2, ip
20024b6a:	f840 2023 	str.w	r2, [r0, r3, lsl #2]
20024b6e:	f204 2155 	addw	r1, r4, #597	@ 0x255
20024b72:	e7a6      	b.n	20024ac2 <HAL_PIN_Set+0xaa>
20024b74:	f5b2 7fee 	cmp.w	r2, #476	@ 0x1dc
20024b78:	f040 80ca 	bne.w	20024d10 <HAL_PIN_Set+0x2f8>
20024b7c:	213f      	movs	r1, #63	@ 0x3f
20024b7e:	4872      	ldr	r0, [pc, #456]	@ (20024d48 <HAL_PIN_Set+0x330>)
20024b80:	00da      	lsls	r2, r3, #3
20024b82:	f8d0 c06c 	ldr.w	ip, [r0, #108]	@ 0x6c
20024b86:	f1a4 030e 	sub.w	r3, r4, #14
20024b8a:	4093      	lsls	r3, r2
20024b8c:	ea83 030c 	eor.w	r3, r3, ip
20024b90:	fa01 f202 	lsl.w	r2, r1, r2
20024b94:	4013      	ands	r3, r2
20024b96:	ea83 030c 	eor.w	r3, r3, ip
20024b9a:	66c3      	str	r3, [r0, #108]	@ 0x6c
20024b9c:	e7e7      	b.n	20024b6e <HAL_PIN_Set+0x156>
20024b9e:	f46f 7a01 	mvn.w	sl, #516	@ 0x204
20024ba2:	eb01 020a 	add.w	r2, r1, sl
20024ba6:	b293      	uxth	r3, r2
20024ba8:	2b05      	cmp	r3, #5
20024baa:	d828      	bhi.n	20024bfe <HAL_PIN_Set+0x1e6>
20024bac:	2303      	movs	r3, #3
20024bae:	fbb2 f2f3 	udiv	r2, r2, r3
20024bb2:	f46f 7901 	mvn.w	r9, #516	@ 0x204
20024bb6:	ebc2 3382 	rsb	r3, r2, r2, lsl #14
20024bba:	eb02 0383 	add.w	r3, r2, r3, lsl #2
20024bbe:	440b      	add	r3, r1
20024bc0:	b29b      	uxth	r3, r3
20024bc2:	eb03 0c09 	add.w	ip, r3, r9
20024bc6:	fa1f fc8c 	uxth.w	ip, ip
20024bca:	f1bc 0f02 	cmp.w	ip, #2
20024bce:	f200 809f 	bhi.w	20024d10 <HAL_PIN_Set+0x2f8>
20024bd2:	00db      	lsls	r3, r3, #3
20024bd4:	f5a3 5381 	sub.w	r3, r3, #4128	@ 0x1020
20024bd8:	495c      	ldr	r1, [pc, #368]	@ (20024d4c <HAL_PIN_Set+0x334>)
20024bda:	f1a4 0e0e 	sub.w	lr, r4, #14
20024bde:	3b08      	subs	r3, #8
20024be0:	fa0e f303 	lsl.w	r3, lr, r3
20024be4:	f8df e178 	ldr.w	lr, [pc, #376]	@ 20024d60 <HAL_PIN_Set+0x348>
20024be8:	f851 0022 	ldr.w	r0, [r1, r2, lsl #2]
20024bec:	f85e c02c 	ldr.w	ip, [lr, ip, lsl #2]
20024bf0:	4043      	eors	r3, r0
20024bf2:	ea03 030c 	and.w	r3, r3, ip
20024bf6:	4043      	eors	r3, r0
20024bf8:	f841 3022 	str.w	r3, [r1, r2, lsl #2]
20024bfc:	e7b7      	b.n	20024b6e <HAL_PIN_Set+0x156>
20024bfe:	f46f 7ef8 	mvn.w	lr, #496	@ 0x1f0
20024c02:	eb01 030e 	add.w	r3, r1, lr
20024c06:	b29a      	uxth	r2, r3
20024c08:	2a09      	cmp	r2, #9
20024c0a:	d82a      	bhi.n	20024c62 <HAL_PIN_Set+0x24a>
20024c0c:	f5b1 7ffc 	cmp.w	r1, #504	@ 0x1f8
20024c10:	d216      	bcs.n	20024c40 <HAL_PIN_Set+0x228>
20024c12:	0859      	lsrs	r1, r3, #1
20024c14:	f013 0f01 	tst.w	r3, #1
20024c18:	4b4d      	ldr	r3, [pc, #308]	@ (20024d50 <HAL_PIN_Set+0x338>)
20024c1a:	f04f 003f 	mov.w	r0, #63	@ 0x3f
20024c1e:	4a4d      	ldr	r2, [pc, #308]	@ (20024d54 <HAL_PIN_Set+0x33c>)
20024c20:	bf18      	it	ne
20024c22:	461a      	movne	r2, r3
20024c24:	00c9      	lsls	r1, r1, #3
20024c26:	4088      	lsls	r0, r1
20024c28:	f8d2 c000 	ldr.w	ip, [r2]
20024c2c:	f1a4 030e 	sub.w	r3, r4, #14
20024c30:	408b      	lsls	r3, r1
20024c32:	ea83 030c 	eor.w	r3, r3, ip
20024c36:	4003      	ands	r3, r0
20024c38:	ea83 030c 	eor.w	r3, r3, ip
20024c3c:	6013      	str	r3, [r2, #0]
20024c3e:	e796      	b.n	20024b6e <HAL_PIN_Set+0x156>
20024c40:	d007      	beq.n	20024c52 <HAL_PIN_Set+0x23a>
20024c42:	f240 13f9 	movw	r3, #505	@ 0x1f9
20024c46:	4299      	cmp	r1, r3
20024c48:	d107      	bne.n	20024c5a <HAL_PIN_Set+0x242>
20024c4a:	2100      	movs	r1, #0
20024c4c:	203f      	movs	r0, #63	@ 0x3f
20024c4e:	4a42      	ldr	r2, [pc, #264]	@ (20024d58 <HAL_PIN_Set+0x340>)
20024c50:	e7ea      	b.n	20024c28 <HAL_PIN_Set+0x210>
20024c52:	2110      	movs	r1, #16
20024c54:	f44f 107c 	mov.w	r0, #4128768	@ 0x3f0000
20024c58:	e7f9      	b.n	20024c4e <HAL_PIN_Set+0x236>
20024c5a:	2108      	movs	r1, #8
20024c5c:	f44f 507c 	mov.w	r0, #16128	@ 0x3f00
20024c60:	e7f5      	b.n	20024c4e <HAL_PIN_Set+0x236>
20024c62:	f46f 7c58 	mvn.w	ip, #864	@ 0x360
20024c66:	eb01 030c 	add.w	r3, r1, ip
20024c6a:	b29b      	uxth	r3, r3
20024c6c:	2b05      	cmp	r3, #5
20024c6e:	f63f af29 	bhi.w	20024ac4 <HAL_PIN_Set+0xac>
20024c72:	2803      	cmp	r0, #3
20024c74:	d84c      	bhi.n	20024d10 <HAL_PIN_Set+0x2f8>
20024c76:	f104 4380 	add.w	r3, r4, #1073741824	@ 0x40000000
20024c7a:	f2a1 3262 	subw	r2, r1, #866	@ 0x362
20024c7e:	f8df c0dc 	ldr.w	ip, [pc, #220]	@ 20024d5c <HAL_PIN_Set+0x344>
20024c82:	3b26      	subs	r3, #38	@ 0x26
20024c84:	2a04      	cmp	r2, #4
20024c86:	d815      	bhi.n	20024cb4 <HAL_PIN_Set+0x29c>
20024c88:	e8df f002 	tbb	[pc, r2]
20024c8c:	31032a38 	.word	0x31032a38
20024c90:	23          	.byte	0x23
20024c91:	00          	.byte	0x00
20024c92:	f44f 5240 	mov.w	r2, #12288	@ 0x3000
20024c96:	f04f 4ae0 	mov.w	sl, #1879048192	@ 0x70000000
20024c9a:	f04f 5e00 	mov.w	lr, #536870912	@ 0x20000000
20024c9e:	f8df 90c4 	ldr.w	r9, [pc, #196]	@ 20024d64 <HAL_PIN_Set+0x34c>
20024ca2:	f8d9 0004 	ldr.w	r0, [r9, #4]
20024ca6:	ea20 000a 	bic.w	r0, r0, sl
20024caa:	ea40 000e 	orr.w	r0, r0, lr
20024cae:	f8c9 0004 	str.w	r0, [r9, #4]
20024cb2:	e000      	b.n	20024cb6 <HAL_PIN_Set+0x29e>
20024cb4:	2200      	movs	r2, #0
20024cb6:	f85c 0023 	ldr.w	r0, [ip, r3, lsl #2]
20024cba:	f420 40e0 	bic.w	r0, r0, #28672	@ 0x7000
20024cbe:	4302      	orrs	r2, r0
20024cc0:	f84c 2023 	str.w	r2, [ip, r3, lsl #2]
20024cc4:	f85c 2023 	ldr.w	r2, [ip, r3, lsl #2]
20024cc8:	f042 0202 	orr.w	r2, r2, #2
20024ccc:	f84c 2023 	str.w	r2, [ip, r3, lsl #2]
20024cd0:	e6f8      	b.n	20024ac4 <HAL_PIN_Set+0xac>
20024cd2:	f44f 5240 	mov.w	r2, #12288	@ 0x3000
20024cd6:	f04f 4ae0 	mov.w	sl, #1879048192	@ 0x70000000
20024cda:	f04f 5e40 	mov.w	lr, #805306368	@ 0x30000000
20024cde:	e7de      	b.n	20024c9e <HAL_PIN_Set+0x286>
20024ce0:	f44f 5200 	mov.w	r2, #8192	@ 0x2000
20024ce4:	f04f 6a60 	mov.w	sl, #234881024	@ 0xe000000
20024ce8:	f04f 6e80 	mov.w	lr, #67108864	@ 0x4000000
20024cec:	e7d7      	b.n	20024c9e <HAL_PIN_Set+0x286>
20024cee:	f44f 5200 	mov.w	r2, #8192	@ 0x2000
20024cf2:	f04f 6a60 	mov.w	sl, #234881024	@ 0xe000000
20024cf6:	f04f 6ec0 	mov.w	lr, #100663296	@ 0x6000000
20024cfa:	e7d0      	b.n	20024c9e <HAL_PIN_Set+0x286>
20024cfc:	f44f 5280 	mov.w	r2, #4096	@ 0x1000
20024d00:	e7d9      	b.n	20024cb6 <HAL_PIN_Set+0x29e>
20024d02:	f5a1 7396 	sub.w	r3, r1, #300	@ 0x12c
20024d06:	b29b      	uxth	r3, r3
20024d08:	2b07      	cmp	r3, #7
20024d0a:	f63f aedb 	bhi.w	20024ac4 <HAL_PIN_Set+0xac>
20024d0e:	e6ae      	b.n	20024a6e <HAL_PIN_Set+0x56>
20024d10:	2100      	movs	r1, #0
20024d12:	e6d7      	b.n	20024ac4 <HAL_PIN_Set+0xac>
20024d14:	f106 4680 	add.w	r6, r6, #1073741824	@ 0x40000000
20024d18:	3e01      	subs	r6, #1
20024d1a:	f858 3026 	ldr.w	r3, [r8, r6, lsl #2]
20024d1e:	f005 0530 	and.w	r5, r5, #48	@ 0x30
20024d22:	f009 090f 	and.w	r9, r9, #15
20024d26:	ea45 0509 	orr.w	r5, r5, r9
20024d2a:	f023 033f 	bic.w	r3, r3, #63	@ 0x3f
20024d2e:	431d      	orrs	r5, r3
20024d30:	f045 0540 	orr.w	r5, r5, #64	@ 0x40
20024d34:	f848 5026 	str.w	r5, [r8, r6, lsl #2]
20024d38:	e6ed      	b.n	20024b16 <HAL_PIN_Set+0xfe>
20024d3a:	bf00      	nop
20024d3c:	5000b048 	.word	0x5000b048
20024d40:	500caf58 	.word	0x500caf58
20024d44:	5000b064 	.word	0x5000b064
20024d48:	5000b000 	.word	0x5000b000
20024d4c:	5000b070 	.word	0x5000b070
20024d50:	5000b07c 	.word	0x5000b07c
20024d54:	5000b078 	.word	0x5000b078
20024d58:	5000b080 	.word	0x5000b080
20024d5c:	500cb05c 	.word	0x500cb05c
20024d60:	2002b828 	.word	0x2002b828
20024d64:	500c0000 	.word	0x500c0000

20024d68 <HAL_PIN_Set_Analog>:
20024d68:	283a      	cmp	r0, #58	@ 0x3a
20024d6a:	b538      	push	{r3, r4, r5, lr}
20024d6c:	4604      	mov	r4, r0
20024d6e:	dd25      	ble.n	20024dbc <HAL_PIN_Set_Analog+0x54>
20024d70:	2840      	cmp	r0, #64	@ 0x40
20024d72:	dc16      	bgt.n	20024da2 <HAL_PIN_Set_Analog+0x3a>
20024d74:	2500      	movs	r5, #0
20024d76:	f1a0 013c 	sub.w	r1, r0, #60	@ 0x3c
20024d7a:	4628      	mov	r0, r5
20024d7c:	f7ff fe20 	bl	200249c0 <HAL_PIN_Get_Base>
20024d80:	f101 4380 	add.w	r3, r1, #1073741824	@ 0x40000000
20024d84:	3b01      	subs	r3, #1
20024d86:	f850 1023 	ldr.w	r1, [r0, r3, lsl #2]
20024d8a:	462a      	mov	r2, r5
20024d8c:	f021 015f 	bic.w	r1, r1, #95	@ 0x5f
20024d90:	f041 010f 	orr.w	r1, r1, #15
20024d94:	f840 1023 	str.w	r1, [r0, r3, lsl #2]
20024d98:	2100      	movs	r1, #0
20024d9a:	4620      	mov	r0, r4
20024d9c:	f7ff fdd6 	bl	2002494c <HAL_PIN_SetAonPE>
20024da0:	e00a      	b.n	20024db8 <HAL_PIN_Set_Analog+0x50>
20024da2:	4a08      	ldr	r2, [pc, #32]	@ (20024dc4 <HAL_PIN_Set_Analog+0x5c>)
20024da4:	f852 3020 	ldr.w	r3, [r2, r0, lsl #2]
20024da8:	f423 43e0 	bic.w	r3, r3, #28672	@ 0x7000
20024dac:	f023 030e 	bic.w	r3, r3, #14
20024db0:	f443 43e0 	orr.w	r3, r3, #28672	@ 0x7000
20024db4:	f842 3020 	str.w	r3, [r2, r0, lsl #2]
20024db8:	2000      	movs	r0, #0
20024dba:	bd38      	pop	{r3, r4, r5, pc}
20024dbc:	4601      	mov	r1, r0
20024dbe:	2501      	movs	r5, #1
20024dc0:	e7db      	b.n	20024d7a <HAL_PIN_Set_Analog+0x12>
20024dc2:	bf00      	nop
20024dc4:	500caf58 	.word	0x500caf58

20024dc8 <HAL_PMU_EnableDLL>:
20024dc8:	4b05      	ldr	r3, [pc, #20]	@ (20024de0 <HAL_PMU_EnableDLL+0x18>)
20024dca:	6e9a      	ldr	r2, [r3, #104]	@ 0x68
20024dcc:	b120      	cbz	r0, 20024dd8 <HAL_PMU_EnableDLL+0x10>
20024dce:	f042 0220 	orr.w	r2, r2, #32
20024dd2:	2000      	movs	r0, #0
20024dd4:	669a      	str	r2, [r3, #104]	@ 0x68
20024dd6:	4770      	bx	lr
20024dd8:	f022 0220 	bic.w	r2, r2, #32
20024ddc:	e7f9      	b.n	20024dd2 <HAL_PMU_EnableDLL+0xa>
20024dde:	bf00      	nop
20024de0:	500ca000 	.word	0x500ca000

20024de4 <HAL_RCC_HCPU_ConfigSxModeVolt>:
20024de4:	b507      	push	{r0, r1, r2, lr}
20024de6:	4a13      	ldr	r2, [pc, #76]	@ (20024e34 <HAL_RCC_HCPU_ConfigSxModeVolt+0x50>)
20024de8:	4913      	ldr	r1, [pc, #76]	@ (20024e38 <HAL_RCC_HCPU_ConfigSxModeVolt+0x54>)
20024dea:	eb02 02c0 	add.w	r2, r2, r0, lsl #3
20024dee:	f8d1 309c 	ldr.w	r3, [r1, #156]	@ 0x9c
20024df2:	7892      	ldrb	r2, [r2, #2]
20024df4:	2802      	cmp	r0, #2
20024df6:	f362 0303 	bfi	r3, r2, #0, #4
20024dfa:	f8c1 309c 	str.w	r3, [r1, #156]	@ 0x9c
20024dfe:	f10d 0007 	add.w	r0, sp, #7
20024e02:	d111      	bne.n	20024e28 <HAL_RCC_HCPU_ConfigSxModeVolt+0x44>
20024e04:	f007 fab6 	bl	2002c374 <HAL_PMU_GetHpsysVoutRef>
20024e08:	b110      	cbz	r0, 20024e10 <HAL_RCC_HCPU_ConfigSxModeVolt+0x2c>
20024e0a:	230b      	movs	r3, #11
20024e0c:	f88d 3007 	strb.w	r3, [sp, #7]
20024e10:	4a09      	ldr	r2, [pc, #36]	@ (20024e38 <HAL_RCC_HCPU_ConfigSxModeVolt+0x54>)
20024e12:	f89d 1007 	ldrb.w	r1, [sp, #7]
20024e16:	f8d2 3094 	ldr.w	r3, [r2, #148]	@ 0x94
20024e1a:	f361 0303 	bfi	r3, r1, #0, #4
20024e1e:	f8c2 3094 	str.w	r3, [r2, #148]	@ 0x94
20024e22:	b003      	add	sp, #12
20024e24:	f85d fb04 	ldr.w	pc, [sp], #4
20024e28:	f007 fab0 	bl	2002c38c <HAL_PMU_GetHpsysVoutRef2>
20024e2c:	2800      	cmp	r0, #0
20024e2e:	d0ef      	beq.n	20024e10 <HAL_RCC_HCPU_ConfigSxModeVolt+0x2c>
20024e30:	230d      	movs	r3, #13
20024e32:	e7eb      	b.n	20024e0c <HAL_RCC_HCPU_ConfigSxModeVolt+0x28>
20024e34:	2002b844 	.word	0x2002b844
20024e38:	500ca000 	.word	0x500ca000

20024e3c <HAL_RCC_HCPU_GetClockSrc>:
20024e3c:	f04f 43a0 	mov.w	r3, #1342177280	@ 0x50000000
20024e40:	280d      	cmp	r0, #13
20024e42:	6a1a      	ldr	r2, [r3, #32]
20024e44:	d80d      	bhi.n	20024e62 <HAL_RCC_HCPU_GetClockSrc+0x26>
20024e46:	f642 73f1 	movw	r3, #12273	@ 0x2ff1
20024e4a:	40c3      	lsrs	r3, r0
20024e4c:	f013 0f01 	tst.w	r3, #1
20024e50:	bf0c      	ite	eq
20024e52:	2301      	moveq	r3, #1
20024e54:	2303      	movne	r3, #3
20024e56:	4083      	lsls	r3, r0
20024e58:	4013      	ands	r3, r2
20024e5a:	fa23 f000 	lsr.w	r0, r3, r0
20024e5e:	b2c0      	uxtb	r0, r0
20024e60:	4770      	bx	lr
20024e62:	2301      	movs	r3, #1
20024e64:	e7f7      	b.n	20024e56 <HAL_RCC_HCPU_GetClockSrc+0x1a>
	...

20024e68 <HAL_RCC_HCPU_GetDLLFreq>:
20024e68:	2801      	cmp	r0, #1
20024e6a:	d003      	beq.n	20024e74 <HAL_RCC_HCPU_GetDLLFreq+0xc>
20024e6c:	2802      	cmp	r0, #2
20024e6e:	d00e      	beq.n	20024e8e <HAL_RCC_HCPU_GetDLLFreq+0x26>
20024e70:	2000      	movs	r0, #0
20024e72:	4770      	bx	lr
20024e74:	f04f 43a0 	mov.w	r3, #1342177280	@ 0x50000000
20024e78:	6adb      	ldr	r3, [r3, #44]	@ 0x2c
20024e7a:	b163      	cbz	r3, 20024e96 <HAL_RCC_HCPU_GetDLLFreq+0x2e>
20024e7c:	f013 0001 	ands.w	r0, r3, #1
20024e80:	d00a      	beq.n	20024e98 <HAL_RCC_HCPU_GetDLLFreq+0x30>
20024e82:	4806      	ldr	r0, [pc, #24]	@ (20024e9c <HAL_RCC_HCPU_GetDLLFreq+0x34>)
20024e84:	f3c3 0383 	ubfx	r3, r3, #2, #4
20024e88:	fb03 0000 	mla	r0, r3, r0, r0
20024e8c:	4770      	bx	lr
20024e8e:	f04f 43a0 	mov.w	r3, #1342177280	@ 0x50000000
20024e92:	6b1b      	ldr	r3, [r3, #48]	@ 0x30
20024e94:	e7f1      	b.n	20024e7a <HAL_RCC_HCPU_GetDLLFreq+0x12>
20024e96:	4618      	mov	r0, r3
20024e98:	4770      	bx	lr
20024e9a:	bf00      	nop
20024e9c:	016e3600 	.word	0x016e3600

20024ea0 <HAL_RCC_HCPU_GetDLL1Freq>:
20024ea0:	2001      	movs	r0, #1
20024ea2:	f7ff bfe1 	b.w	20024e68 <HAL_RCC_HCPU_GetDLLFreq>

20024ea6 <HAL_RCC_HCPU_GetDLL2Freq>:
20024ea6:	2002      	movs	r0, #2
20024ea8:	f7ff bfde 	b.w	20024e68 <HAL_RCC_HCPU_GetDLLFreq>

20024eac <HAL_RCC_HCPU_GetDLL3Freq>:
20024eac:	2000      	movs	r0, #0
20024eae:	4770      	bx	lr

20024eb0 <HAL_RCC_HCPU_EnableDLL>:
20024eb0:	4b23      	ldr	r3, [pc, #140]	@ (20024f40 <HAL_RCC_HCPU_EnableDLL+0x90>)
20024eb2:	f1a1 71b7 	sub.w	r1, r1, #23986176	@ 0x16e0000
20024eb6:	f5a1 5158 	sub.w	r1, r1, #13824	@ 0x3600
20024eba:	4299      	cmp	r1, r3
20024ebc:	b510      	push	{r4, lr}
20024ebe:	d83c      	bhi.n	20024f3a <HAL_RCC_HCPU_EnableDLL+0x8a>
20024ec0:	2801      	cmp	r0, #1
20024ec2:	d002      	beq.n	20024eca <HAL_RCC_HCPU_EnableDLL+0x1a>
20024ec4:	2802      	cmp	r0, #2
20024ec6:	d036      	beq.n	20024f36 <HAL_RCC_HCPU_EnableDLL+0x86>
20024ec8:	e7fe      	b.n	20024ec8 <HAL_RCC_HCPU_EnableDLL+0x18>
20024eca:	4c1e      	ldr	r4, [pc, #120]	@ (20024f44 <HAL_RCC_HCPU_EnableDLL+0x94>)
20024ecc:	4b1e      	ldr	r3, [pc, #120]	@ (20024f48 <HAL_RCC_HCPU_EnableDLL+0x98>)
20024ece:	f8d3 2094 	ldr.w	r2, [r3, #148]	@ 0x94
20024ed2:	0790      	lsls	r0, r2, #30
20024ed4:	bf58      	it	pl
20024ed6:	f8d3 2094 	ldrpl.w	r2, [r3, #148]	@ 0x94
20024eda:	f04f 0000 	mov.w	r0, #0
20024ede:	bf5c      	itt	pl
20024ee0:	f042 0202 	orrpl.w	r2, r2, #2
20024ee4:	f8c3 2094 	strpl.w	r2, [r3, #148]	@ 0x94
20024ee8:	f8d3 2094 	ldr.w	r2, [r3, #148]	@ 0x94
20024eec:	07d2      	lsls	r2, r2, #31
20024eee:	bf5e      	ittt	pl
20024ef0:	f8d3 2094 	ldrpl.w	r2, [r3, #148]	@ 0x94
20024ef4:	f042 0201 	orrpl.w	r2, r2, #1
20024ef8:	f8c3 2094 	strpl.w	r2, [r3, #148]	@ 0x94
20024efc:	4a13      	ldr	r2, [pc, #76]	@ (20024f4c <HAL_RCC_HCPU_EnableDLL+0x9c>)
20024efe:	6823      	ldr	r3, [r4, #0]
20024f00:	fbb1 f1f2 	udiv	r1, r1, r2
20024f04:	f023 0301 	bic.w	r3, r3, #1
20024f08:	6023      	str	r3, [r4, #0]
20024f0a:	6823      	ldr	r3, [r4, #0]
20024f0c:	f423 5300 	bic.w	r3, r3, #8192	@ 0x2000
20024f10:	f023 033c 	bic.w	r3, r3, #60	@ 0x3c
20024f14:	ea43 0381 	orr.w	r3, r3, r1, lsl #2
20024f18:	f443 5380 	orr.w	r3, r3, #4096	@ 0x1000
20024f1c:	f043 0301 	orr.w	r3, r3, #1
20024f20:	6023      	str	r3, [r4, #0]
20024f22:	f7fd f86a 	bl	20021ffa <HAL_Delay_us>
20024f26:	200a      	movs	r0, #10
20024f28:	f7fd f867 	bl	20021ffa <HAL_Delay_us>
20024f2c:	6823      	ldr	r3, [r4, #0]
20024f2e:	2b00      	cmp	r3, #0
20024f30:	dafc      	bge.n	20024f2c <HAL_RCC_HCPU_EnableDLL+0x7c>
20024f32:	2000      	movs	r0, #0
20024f34:	bd10      	pop	{r4, pc}
20024f36:	4c06      	ldr	r4, [pc, #24]	@ (20024f50 <HAL_RCC_HCPU_EnableDLL+0xa0>)
20024f38:	e7c8      	b.n	20024ecc <HAL_RCC_HCPU_EnableDLL+0x1c>
20024f3a:	2001      	movs	r0, #1
20024f3c:	e7fa      	b.n	20024f34 <HAL_RCC_HCPU_EnableDLL+0x84>
20024f3e:	bf00      	nop
20024f40:	15752a00 	.word	0x15752a00
20024f44:	5000002c 	.word	0x5000002c
20024f48:	5000b000 	.word	0x5000b000
20024f4c:	016e3600 	.word	0x016e3600
20024f50:	50000030 	.word	0x50000030

20024f54 <HAL_RCC_HCPU_EnableDLL1>:
20024f54:	4601      	mov	r1, r0
20024f56:	2001      	movs	r0, #1
20024f58:	f7ff bfaa 	b.w	20024eb0 <HAL_RCC_HCPU_EnableDLL>

20024f5c <HAL_RCC_HCPU_EnableDLL2>:
20024f5c:	4601      	mov	r1, r0
20024f5e:	2002      	movs	r0, #2
20024f60:	f7ff bfa6 	b.w	20024eb0 <HAL_RCC_HCPU_EnableDLL>

20024f64 <HAL_RCC_HCPU_DisableDLL1>:
20024f64:	f04f 42a0 	mov.w	r2, #1342177280	@ 0x50000000
20024f68:	6ad3      	ldr	r3, [r2, #44]	@ 0x2c
20024f6a:	2000      	movs	r0, #0
20024f6c:	f023 0301 	bic.w	r3, r3, #1
20024f70:	62d3      	str	r3, [r2, #44]	@ 0x2c
20024f72:	4770      	bx	lr

20024f74 <HAL_RCC_GetSysCLKFreq>:
20024f74:	2801      	cmp	r0, #1
20024f76:	d108      	bne.n	20024f8a <HAL_RCC_GetSysCLKFreq+0x16>
20024f78:	f04f 43a0 	mov.w	r3, #1342177280	@ 0x50000000
20024f7c:	6a1b      	ldr	r3, [r3, #32]
20024f7e:	f003 0303 	and.w	r3, r3, #3
20024f82:	2b03      	cmp	r3, #3
20024f84:	d101      	bne.n	20024f8a <HAL_RCC_GetSysCLKFreq+0x16>
20024f86:	f7ff bf8b 	b.w	20024ea0 <HAL_RCC_HCPU_GetDLL1Freq>
20024f8a:	4801      	ldr	r0, [pc, #4]	@ (20024f90 <HAL_RCC_GetSysCLKFreq+0x1c>)
20024f8c:	4770      	bx	lr
20024f8e:	bf00      	nop
20024f90:	02dc6c00 	.word	0x02dc6c00

20024f94 <HAL_RCC_GetHCLKFreq>:
20024f94:	1e02      	subs	r2, r0, #0
20024f96:	bf08      	it	eq
20024f98:	2201      	moveq	r2, #1
20024f9a:	b508      	push	{r3, lr}
20024f9c:	4610      	mov	r0, r2
20024f9e:	f7ff ffe9 	bl	20024f74 <HAL_RCC_GetSysCLKFreq>
20024fa2:	2a01      	cmp	r2, #1
20024fa4:	d002      	beq.n	20024fac <HAL_RCC_GetHCLKFreq+0x18>
20024fa6:	2a02      	cmp	r2, #2
20024fa8:	d00a      	beq.n	20024fc0 <HAL_RCC_GetHCLKFreq+0x2c>
20024faa:	e7fe      	b.n	20024faa <HAL_RCC_GetHCLKFreq+0x16>
20024fac:	f04f 43a0 	mov.w	r3, #1342177280	@ 0x50000000
20024fb0:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
20024fb2:	b2db      	uxtb	r3, r3
20024fb4:	2b01      	cmp	r3, #1
20024fb6:	bfb8      	it	lt
20024fb8:	2301      	movlt	r3, #1
20024fba:	fbb0 f0f3 	udiv	r0, r0, r3
20024fbe:	bd08      	pop	{r3, pc}
20024fc0:	f04f 4380 	mov.w	r3, #1073741824	@ 0x40000000
20024fc4:	695b      	ldr	r3, [r3, #20]
20024fc6:	f003 033f 	and.w	r3, r3, #63	@ 0x3f
20024fca:	e7f3      	b.n	20024fb4 <HAL_RCC_GetHCLKFreq+0x20>

20024fcc <HAL_RCC_HCPU_ClockSelect>:
20024fcc:	f04f 43a0 	mov.w	r3, #1342177280	@ 0x50000000
20024fd0:	b510      	push	{r4, lr}
20024fd2:	280d      	cmp	r0, #13
20024fd4:	6a1b      	ldr	r3, [r3, #32]
20024fd6:	d818      	bhi.n	2002500a <HAL_RCC_HCPU_ClockSelect+0x3e>
20024fd8:	f642 72f1 	movw	r2, #12273	@ 0x2ff1
20024fdc:	40c2      	lsrs	r2, r0
20024fde:	f012 0f01 	tst.w	r2, #1
20024fe2:	bf0c      	ite	eq
20024fe4:	2201      	moveq	r2, #1
20024fe6:	2203      	movne	r2, #3
20024fe8:	fa02 f400 	lsl.w	r4, r2, r0
20024fec:	4011      	ands	r1, r2
20024fee:	f04f 42a0 	mov.w	r2, #1342177280	@ 0x50000000
20024ff2:	ea23 0304 	bic.w	r3, r3, r4
20024ff6:	4081      	lsls	r1, r0
20024ff8:	430b      	orrs	r3, r1
20024ffa:	6213      	str	r3, [r2, #32]
20024ffc:	b920      	cbnz	r0, 20025008 <HAL_RCC_HCPU_ClockSelect+0x3c>
20024ffe:	2001      	movs	r0, #1
20025000:	f7ff ffc8 	bl	20024f94 <HAL_RCC_GetHCLKFreq>
20025004:	4b02      	ldr	r3, [pc, #8]	@ (20025010 <HAL_RCC_HCPU_ClockSelect+0x44>)
20025006:	6018      	str	r0, [r3, #0]
20025008:	bd10      	pop	{r4, pc}
2002500a:	2201      	movs	r2, #1
2002500c:	e7ec      	b.n	20024fe8 <HAL_RCC_HCPU_ClockSelect+0x1c>
2002500e:	bf00      	nop
20025010:	20042c10 	.word	0x20042c10

20025014 <HAL_RCC_HCPU_SetDiv>:
20025014:	2800      	cmp	r0, #0
20025016:	bfd8      	it	le
20025018:	2000      	movle	r0, #0
2002501a:	b508      	push	{r3, lr}
2002501c:	bfcc      	ite	gt
2002501e:	23ff      	movgt	r3, #255	@ 0xff
20025020:	4603      	movle	r3, r0
20025022:	2900      	cmp	r1, #0
20025024:	db12      	blt.n	2002504c <HAL_RCC_HCPU_SetDiv+0x38>
20025026:	2a00      	cmp	r2, #0
20025028:	f443 63e0 	orr.w	r3, r3, #1792	@ 0x700
2002502c:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
20025030:	da0e      	bge.n	20025050 <HAL_RCC_HCPU_SetDiv+0x3c>
20025032:	f04f 41a0 	mov.w	r1, #1342177280	@ 0x50000000
20025036:	6a4a      	ldr	r2, [r1, #36]	@ 0x24
20025038:	ea22 0303 	bic.w	r3, r2, r3
2002503c:	4303      	orrs	r3, r0
2002503e:	624b      	str	r3, [r1, #36]	@ 0x24
20025040:	2001      	movs	r0, #1
20025042:	f7ff ffa7 	bl	20024f94 <HAL_RCC_GetHCLKFreq>
20025046:	4b07      	ldr	r3, [pc, #28]	@ (20025064 <HAL_RCC_HCPU_SetDiv+0x50>)
20025048:	6018      	str	r0, [r3, #0]
2002504a:	bd08      	pop	{r3, pc}
2002504c:	2a00      	cmp	r2, #0
2002504e:	db04      	blt.n	2002505a <HAL_RCC_HCPU_SetDiv+0x46>
20025050:	f443 43e0 	orr.w	r3, r3, #28672	@ 0x7000
20025054:	ea40 3002 	orr.w	r0, r0, r2, lsl #12
20025058:	e7eb      	b.n	20025032 <HAL_RCC_HCPU_SetDiv+0x1e>
2002505a:	2b00      	cmp	r3, #0
2002505c:	d0f0      	beq.n	20025040 <HAL_RCC_HCPU_SetDiv+0x2c>
2002505e:	23ff      	movs	r3, #255	@ 0xff
20025060:	e7e7      	b.n	20025032 <HAL_RCC_HCPU_SetDiv+0x1e>
20025062:	bf00      	nop
20025064:	20042c10 	.word	0x20042c10

20025068 <HAL_RCC_HCPU_SwitchDvfsD2S>:
20025068:	b570      	push	{r4, r5, r6, lr}
2002506a:	460c      	mov	r4, r1
2002506c:	4d19      	ldr	r5, [pc, #100]	@ (200250d4 <HAL_RCC_HCPU_SwitchDvfsD2S+0x6c>)
2002506e:	4606      	mov	r6, r0
20025070:	f7ff feb8 	bl	20024de4 <HAL_RCC_HCPU_ConfigSxModeVolt>
20025074:	692b      	ldr	r3, [r5, #16]
20025076:	20fa      	movs	r0, #250	@ 0xfa
20025078:	f023 0304 	bic.w	r3, r3, #4
2002507c:	612b      	str	r3, [r5, #16]
2002507e:	f7fc ffbc 	bl	20021ffa <HAL_Delay_us>
20025082:	2c30      	cmp	r4, #48	@ 0x30
20025084:	d80d      	bhi.n	200250a2 <HAL_RCC_HCPU_SwitchDvfsD2S+0x3a>
20025086:	2100      	movs	r1, #0
20025088:	4608      	mov	r0, r1
2002508a:	f7ff ff9f 	bl	20024fcc <HAL_RCC_HCPU_ClockSelect>
2002508e:	2030      	movs	r0, #48	@ 0x30
20025090:	2204      	movs	r2, #4
20025092:	2100      	movs	r1, #0
20025094:	fbb0 f0f4 	udiv	r0, r0, r4
20025098:	f7ff ffbc 	bl	20025014 <HAL_RCC_HCPU_SetDiv>
2002509c:	2400      	movs	r4, #0
2002509e:	4620      	mov	r0, r4
200250a0:	bd70      	pop	{r4, r5, r6, pc}
200250a2:	f7fd fce5 	bl	20022a70 <HAL_HPAON_EnableXT48>
200250a6:	480c      	ldr	r0, [pc, #48]	@ (200250d8 <HAL_RCC_HCPU_SwitchDvfsD2S+0x70>)
200250a8:	eb00 00c6 	add.w	r0, r0, r6, lsl #3
200250ac:	6843      	ldr	r3, [r0, #4]
200250ae:	480b      	ldr	r0, [pc, #44]	@ (200250dc <HAL_RCC_HCPU_SwitchDvfsD2S+0x74>)
200250b0:	61eb      	str	r3, [r5, #28]
200250b2:	4360      	muls	r0, r4
200250b4:	f7ff ff4e 	bl	20024f54 <HAL_RCC_HCPU_EnableDLL1>
200250b8:	4604      	mov	r4, r0
200250ba:	2800      	cmp	r0, #0
200250bc:	d1ef      	bne.n	2002509e <HAL_RCC_HCPU_SwitchDvfsD2S+0x36>
200250be:	2101      	movs	r1, #1
200250c0:	2206      	movs	r2, #6
200250c2:	4608      	mov	r0, r1
200250c4:	f7ff ffa6 	bl	20025014 <HAL_RCC_HCPU_SetDiv>
200250c8:	2103      	movs	r1, #3
200250ca:	4620      	mov	r0, r4
200250cc:	f7ff ff7e 	bl	20024fcc <HAL_RCC_HCPU_ClockSelect>
200250d0:	e7e4      	b.n	2002509c <HAL_RCC_HCPU_SwitchDvfsD2S+0x34>
200250d2:	bf00      	nop
200250d4:	5000b000 	.word	0x5000b000
200250d8:	2002b844 	.word	0x2002b844
200250dc:	000f4240 	.word	0x000f4240

200250e0 <HAL_RCC_HCPU_SwitchDvfsS2D.isra.0>:
200250e0:	e92d 41f3 	stmdb	sp!, {r0, r1, r4, r5, r6, r7, r8, lr}
200250e4:	4c1d      	ldr	r4, [pc, #116]	@ (2002515c <HAL_RCC_HCPU_SwitchDvfsS2D.isra.0+0x7c>)
200250e6:	4f1e      	ldr	r7, [pc, #120]	@ (20025160 <HAL_RCC_HCPU_SwitchDvfsS2D.isra.0+0x80>)
200250e8:	eb04 02c0 	add.w	r2, r4, r0, lsl #3
200250ec:	6b3b      	ldr	r3, [r7, #48]	@ 0x30
200250ee:	7892      	ldrb	r2, [r2, #2]
200250f0:	4605      	mov	r5, r0
200250f2:	f362 5317 	bfi	r3, r2, #20, #4
200250f6:	ea4f 08c0 	mov.w	r8, r0, lsl #3
200250fa:	633b      	str	r3, [r7, #48]	@ 0x30
200250fc:	f10d 0007 	add.w	r0, sp, #7
20025100:	460e      	mov	r6, r1
20025102:	f007 f937 	bl	2002c374 <HAL_PMU_GetHpsysVoutRef>
20025106:	b110      	cbz	r0, 2002510e <HAL_RCC_HCPU_SwitchDvfsS2D.isra.0+0x2e>
20025108:	230b      	movs	r3, #11
2002510a:	f88d 3007 	strb.w	r3, [sp, #7]
2002510e:	f89d 1007 	ldrb.w	r1, [sp, #7]
20025112:	f914 2035 	ldrsb.w	r2, [r4, r5, lsl #3]
20025116:	6cfb      	ldr	r3, [r7, #76]	@ 0x4c
20025118:	440a      	add	r2, r1
2002511a:	2100      	movs	r1, #0
2002511c:	f362 0385 	bfi	r3, r2, #2, #4
20025120:	4608      	mov	r0, r1
20025122:	64fb      	str	r3, [r7, #76]	@ 0x4c
20025124:	f7ff ff52 	bl	20024fcc <HAL_RCC_HCPU_ClockSelect>
20025128:	2e30      	cmp	r6, #48	@ 0x30
2002512a:	d900      	bls.n	2002512e <HAL_RCC_HCPU_SwitchDvfsS2D.isra.0+0x4e>
2002512c:	e7fe      	b.n	2002512c <HAL_RCC_HCPU_SwitchDvfsS2D.isra.0+0x4c>
2002512e:	2030      	movs	r0, #48	@ 0x30
20025130:	2204      	movs	r2, #4
20025132:	2100      	movs	r1, #0
20025134:	fbb0 f0f6 	udiv	r0, r0, r6
20025138:	f7ff ff6c 	bl	20025014 <HAL_RCC_HCPU_SetDiv>
2002513c:	f7ff ff12 	bl	20024f64 <HAL_RCC_HCPU_DisableDLL1>
20025140:	f7fd fca2 	bl	20022a88 <HAL_HPAON_DisableXT48>
20025144:	4444      	add	r4, r8
20025146:	4b07      	ldr	r3, [pc, #28]	@ (20025164 <HAL_RCC_HCPU_SwitchDvfsS2D.isra.0+0x84>)
20025148:	6862      	ldr	r2, [r4, #4]
2002514a:	61da      	str	r2, [r3, #28]
2002514c:	691a      	ldr	r2, [r3, #16]
2002514e:	f042 0204 	orr.w	r2, r2, #4
20025152:	611a      	str	r2, [r3, #16]
20025154:	b002      	add	sp, #8
20025156:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
2002515a:	bf00      	nop
2002515c:	2002b844 	.word	0x2002b844
20025160:	500ca000 	.word	0x500ca000
20025164:	5000b000 	.word	0x5000b000

20025168 <HAL_RCC_HCPU_ConfigDvfs>:
20025168:	b570      	push	{r4, r5, r6, lr}
2002516a:	4e31      	ldr	r6, [pc, #196]	@ (20025230 <HAL_RCC_HCPU_ConfigDvfs+0xc8>)
2002516c:	4605      	mov	r5, r0
2002516e:	7833      	ldrb	r3, [r6, #0]
20025170:	460c      	mov	r4, r1
20025172:	2b01      	cmp	r3, #1
20025174:	d943      	bls.n	200251fe <HAL_RCC_HCPU_ConfigDvfs+0x96>
20025176:	3b02      	subs	r3, #2
20025178:	2b01      	cmp	r3, #1
2002517a:	d902      	bls.n	20025182 <HAL_RCC_HCPU_ConfigDvfs+0x1a>
2002517c:	2501      	movs	r5, #1
2002517e:	4628      	mov	r0, r5
20025180:	bd70      	pop	{r4, r5, r6, pc}
20025182:	4b2c      	ldr	r3, [pc, #176]	@ (20025234 <HAL_RCC_HCPU_ConfigDvfs+0xcc>)
20025184:	f853 2021 	ldr.w	r2, [r3, r1, lsl #2]
20025188:	f7ff fe8d 	bl	20024ea6 <HAL_RCC_HCPU_GetDLL2Freq>
2002518c:	4290      	cmp	r0, r2
2002518e:	d8f5      	bhi.n	2002517c <HAL_RCC_HCPU_ConfigDvfs+0x14>
20025190:	2901      	cmp	r1, #1
20025192:	d805      	bhi.n	200251a0 <HAL_RCC_HCPU_ConfigDvfs+0x38>
20025194:	4629      	mov	r1, r5
20025196:	4620      	mov	r0, r4
20025198:	f7ff ffa2 	bl	200250e0 <HAL_RCC_HCPU_SwitchDvfsS2D.isra.0>
2002519c:	2500      	movs	r5, #0
2002519e:	e035      	b.n	2002520c <HAL_RCC_HCPU_ConfigDvfs+0xa4>
200251a0:	2100      	movs	r1, #0
200251a2:	4608      	mov	r0, r1
200251a4:	f7ff ff12 	bl	20024fcc <HAL_RCC_HCPU_ClockSelect>
200251a8:	4620      	mov	r0, r4
200251aa:	f7ff fe1b 	bl	20024de4 <HAL_RCC_HCPU_ConfigSxModeVolt>
200251ae:	20fa      	movs	r0, #250	@ 0xfa
200251b0:	f7fc ff23 	bl	20021ffa <HAL_Delay_us>
200251b4:	f7ff fed6 	bl	20024f64 <HAL_RCC_HCPU_DisableDLL1>
200251b8:	2d30      	cmp	r5, #48	@ 0x30
200251ba:	d80d      	bhi.n	200251d8 <HAL_RCC_HCPU_ConfigDvfs+0x70>
200251bc:	f7fd fc64 	bl	20022a88 <HAL_HPAON_DisableXT48>
200251c0:	2100      	movs	r1, #0
200251c2:	4608      	mov	r0, r1
200251c4:	f7ff ff02 	bl	20024fcc <HAL_RCC_HCPU_ClockSelect>
200251c8:	2204      	movs	r2, #4
200251ca:	2100      	movs	r1, #0
200251cc:	2030      	movs	r0, #48	@ 0x30
200251ce:	fbb0 f0f5 	udiv	r0, r0, r5
200251d2:	f7ff ff1f 	bl	20025014 <HAL_RCC_HCPU_SetDiv>
200251d6:	e7e1      	b.n	2002519c <HAL_RCC_HCPU_ConfigDvfs+0x34>
200251d8:	f7fd fc4a 	bl	20022a70 <HAL_HPAON_EnableXT48>
200251dc:	4816      	ldr	r0, [pc, #88]	@ (20025238 <HAL_RCC_HCPU_ConfigDvfs+0xd0>)
200251de:	4368      	muls	r0, r5
200251e0:	f7ff feb8 	bl	20024f54 <HAL_RCC_HCPU_EnableDLL1>
200251e4:	4605      	mov	r5, r0
200251e6:	2800      	cmp	r0, #0
200251e8:	d1c8      	bne.n	2002517c <HAL_RCC_HCPU_ConfigDvfs+0x14>
200251ea:	2101      	movs	r1, #1
200251ec:	2206      	movs	r2, #6
200251ee:	4608      	mov	r0, r1
200251f0:	f7ff ff10 	bl	20025014 <HAL_RCC_HCPU_SetDiv>
200251f4:	2103      	movs	r1, #3
200251f6:	4628      	mov	r0, r5
200251f8:	f7ff fee8 	bl	20024fcc <HAL_RCC_HCPU_ClockSelect>
200251fc:	e7ce      	b.n	2002519c <HAL_RCC_HCPU_ConfigDvfs+0x34>
200251fe:	2901      	cmp	r1, #1
20025200:	d909      	bls.n	20025216 <HAL_RCC_HCPU_ConfigDvfs+0xae>
20025202:	4601      	mov	r1, r0
20025204:	4620      	mov	r0, r4
20025206:	f7ff ff2f 	bl	20025068 <HAL_RCC_HCPU_SwitchDvfsD2S>
2002520a:	4605      	mov	r5, r0
2002520c:	2000      	movs	r0, #0
2002520e:	7034      	strb	r4, [r6, #0]
20025210:	f7fc fef3 	bl	20021ffa <HAL_Delay_us>
20025214:	e7b3      	b.n	2002517e <HAL_RCC_HCPU_ConfigDvfs+0x16>
20025216:	428b      	cmp	r3, r1
20025218:	d103      	bne.n	20025222 <HAL_RCC_HCPU_ConfigDvfs+0xba>
2002521a:	f04f 32ff 	mov.w	r2, #4294967295
2002521e:	4611      	mov	r1, r2
20025220:	e7d4      	b.n	200251cc <HAL_RCC_HCPU_ConfigDvfs+0x64>
20025222:	2190      	movs	r1, #144	@ 0x90
20025224:	2002      	movs	r0, #2
20025226:	f7ff ff1f 	bl	20025068 <HAL_RCC_HCPU_SwitchDvfsD2S>
2002522a:	2800      	cmp	r0, #0
2002522c:	d1a6      	bne.n	2002517c <HAL_RCC_HCPU_ConfigDvfs+0x14>
2002522e:	e7b1      	b.n	20025194 <HAL_RCC_HCPU_ConfigDvfs+0x2c>
20025230:	20042c14 	.word	0x20042c14
20025234:	2002b834 	.word	0x2002b834
20025238:	000f4240 	.word	0x000f4240

2002523c <HAL_RCC_Reset_and_Halt_LCPU>:
2002523c:	4a13      	ldr	r2, [pc, #76]	@ (2002528c <HAL_RCC_Reset_and_Halt_LCPU+0x50>)
2002523e:	6813      	ldr	r3, [r2, #0]
20025240:	0759      	lsls	r1, r3, #29
20025242:	d421      	bmi.n	20025288 <HAL_RCC_Reset_and_Halt_LCPU+0x4c>
20025244:	6811      	ldr	r1, [r2, #0]
20025246:	2800      	cmp	r0, #0
20025248:	bf0c      	ite	eq
2002524a:	2301      	moveq	r3, #1
2002524c:	f04f 33ff 	movne.w	r3, #4294967295
20025250:	f041 0104 	orr.w	r1, r1, #4
20025254:	6011      	str	r1, [r2, #0]
20025256:	f04f 4280 	mov.w	r2, #1073741824	@ 0x40000000
2002525a:	f443 1380 	orr.w	r3, r3, #1048576	@ 0x100000
2002525e:	6013      	str	r3, [r2, #0]
20025260:	6811      	ldr	r1, [r2, #0]
20025262:	2900      	cmp	r1, #0
20025264:	d0fc      	beq.n	20025260 <HAL_RCC_Reset_and_Halt_LCPU+0x24>
20025266:	4a09      	ldr	r2, [pc, #36]	@ (2002528c <HAL_RCC_Reset_and_Halt_LCPU+0x50>)
20025268:	6c11      	ldr	r1, [r2, #64]	@ 0x40
2002526a:	06c8      	lsls	r0, r1, #27
2002526c:	d506      	bpl.n	2002527c <HAL_RCC_Reset_and_Halt_LCPU+0x40>
2002526e:	6c11      	ldr	r1, [r2, #64]	@ 0x40
20025270:	f041 0102 	orr.w	r1, r1, #2
20025274:	6411      	str	r1, [r2, #64]	@ 0x40
20025276:	6c11      	ldr	r1, [r2, #64]	@ 0x40
20025278:	06c9      	lsls	r1, r1, #27
2002527a:	d4fc      	bmi.n	20025276 <HAL_RCC_Reset_and_Halt_LCPU+0x3a>
2002527c:	f04f 4180 	mov.w	r1, #1073741824	@ 0x40000000
20025280:	680a      	ldr	r2, [r1, #0]
20025282:	ea22 0303 	bic.w	r3, r2, r3
20025286:	600b      	str	r3, [r1, #0]
20025288:	4770      	bx	lr
2002528a:	bf00      	nop
2002528c:	40040000 	.word	0x40040000

20025290 <HAL_RCC_HCPU_ConfigHCLK>:
20025290:	28f0      	cmp	r0, #240	@ 0xf0
20025292:	d80d      	bhi.n	200252b0 <HAL_RCC_HCPU_ConfigHCLK+0x20>
20025294:	2890      	cmp	r0, #144	@ 0x90
20025296:	d807      	bhi.n	200252a8 <HAL_RCC_HCPU_ConfigHCLK+0x18>
20025298:	2830      	cmp	r0, #48	@ 0x30
2002529a:	d807      	bhi.n	200252ac <HAL_RCC_HCPU_ConfigHCLK+0x1c>
2002529c:	2818      	cmp	r0, #24
2002529e:	bf94      	ite	ls
200252a0:	2100      	movls	r1, #0
200252a2:	2101      	movhi	r1, #1
200252a4:	f7ff bf60 	b.w	20025168 <HAL_RCC_HCPU_ConfigDvfs>
200252a8:	2103      	movs	r1, #3
200252aa:	e7fb      	b.n	200252a4 <HAL_RCC_HCPU_ConfigHCLK+0x14>
200252ac:	2102      	movs	r1, #2
200252ae:	e7f9      	b.n	200252a4 <HAL_RCC_HCPU_ConfigHCLK+0x14>
200252b0:	2001      	movs	r0, #1
200252b2:	4770      	bx	lr

200252b4 <spi_flash_get_rdid>:
200252b4:	b5f0      	push	{r4, r5, r6, r7, lr}
200252b6:	4605      	mov	r5, r0
200252b8:	3801      	subs	r0, #1
200252ba:	b2c0      	uxtb	r0, r0
200252bc:	28fd      	cmp	r0, #253	@ 0xfd
200252be:	d808      	bhi.n	200252d2 <spi_flash_get_rdid+0x1e>
200252c0:	2400      	movs	r4, #0
200252c2:	4f0b      	ldr	r7, [pc, #44]	@ (200252f0 <spi_flash_get_rdid+0x3c>)
200252c4:	f857 0b04 	ldr.w	r0, [r7], #4
200252c8:	7806      	ldrb	r6, [r0, #0]
200252ca:	b926      	cbnz	r6, 200252d6 <spi_flash_get_rdid+0x22>
200252cc:	3401      	adds	r4, #1
200252ce:	2c06      	cmp	r4, #6
200252d0:	d1f8      	bne.n	200252c4 <spi_flash_get_rdid+0x10>
200252d2:	2000      	movs	r0, #0
200252d4:	e00b      	b.n	200252ee <spi_flash_get_rdid+0x3a>
200252d6:	42ae      	cmp	r6, r5
200252d8:	d105      	bne.n	200252e6 <spi_flash_get_rdid+0x32>
200252da:	7846      	ldrb	r6, [r0, #1]
200252dc:	4296      	cmp	r6, r2
200252de:	d102      	bne.n	200252e6 <spi_flash_get_rdid+0x32>
200252e0:	7886      	ldrb	r6, [r0, #2]
200252e2:	428e      	cmp	r6, r1
200252e4:	d001      	beq.n	200252ea <spi_flash_get_rdid+0x36>
200252e6:	3008      	adds	r0, #8
200252e8:	e7ee      	b.n	200252c8 <spi_flash_get_rdid+0x14>
200252ea:	b103      	cbz	r3, 200252ee <spi_flash_get_rdid+0x3a>
200252ec:	701c      	strb	r4, [r3, #0]
200252ee:	bdf0      	pop	{r4, r5, r6, r7, pc}
200252f0:	20042c18 	.word	0x20042c18

200252f4 <spi_flash_get_cmd_by_id>:
200252f4:	b507      	push	{r0, r1, r2, lr}
200252f6:	f10d 0307 	add.w	r3, sp, #7
200252fa:	f7ff ffdb 	bl	200252b4 <spi_flash_get_rdid>
200252fe:	4b06      	ldr	r3, [pc, #24]	@ (20025318 <spi_flash_get_cmd_by_id+0x24>)
20025300:	b140      	cbz	r0, 20025314 <spi_flash_get_cmd_by_id+0x20>
20025302:	f44f 7105 	mov.w	r1, #532	@ 0x214
20025306:	f89d 2007 	ldrb.w	r2, [sp, #7]
2002530a:	fb01 3002 	mla	r0, r1, r2, r3
2002530e:	b003      	add	sp, #12
20025310:	f85d fb04 	ldr.w	pc, [sp], #4
20025314:	4618      	mov	r0, r3
20025316:	e7fa      	b.n	2002530e <spi_flash_get_cmd_by_id+0x1a>
20025318:	20042e50 	.word	0x20042e50

2002531c <spi_flash_get_size_by_id>:
2002531c:	b508      	push	{r3, lr}
2002531e:	2300      	movs	r3, #0
20025320:	f7ff ffc8 	bl	200252b4 <spi_flash_get_rdid>
20025324:	b108      	cbz	r0, 2002532a <spi_flash_get_size_by_id+0xe>
20025326:	6840      	ldr	r0, [r0, #4]
20025328:	bd08      	pop	{r3, pc}
2002532a:	f44f 2000 	mov.w	r0, #524288	@ 0x80000
2002532e:	e7fb      	b.n	20025328 <spi_flash_get_size_by_id+0xc>

20025330 <spi_flash_is_support_dtr>:
20025330:	b508      	push	{r3, lr}
20025332:	2300      	movs	r3, #0
20025334:	f7ff ffbe 	bl	200252b4 <spi_flash_get_rdid>
20025338:	b110      	cbz	r0, 20025340 <spi_flash_is_support_dtr+0x10>
2002533a:	78c0      	ldrb	r0, [r0, #3]
2002533c:	f000 0001 	and.w	r0, r0, #1
20025340:	bd08      	pop	{r3, pc}
	...

20025344 <spi_nand_get_rdid>:
20025344:	b5f0      	push	{r4, r5, r6, r7, lr}
20025346:	4605      	mov	r5, r0
20025348:	3801      	subs	r0, #1
2002534a:	b2c0      	uxtb	r0, r0
2002534c:	28fd      	cmp	r0, #253	@ 0xfd
2002534e:	d808      	bhi.n	20025362 <spi_nand_get_rdid+0x1e>
20025350:	2400      	movs	r4, #0
20025352:	4f0b      	ldr	r7, [pc, #44]	@ (20025380 <spi_nand_get_rdid+0x3c>)
20025354:	f857 0b04 	ldr.w	r0, [r7], #4
20025358:	7806      	ldrb	r6, [r0, #0]
2002535a:	b926      	cbnz	r6, 20025366 <spi_nand_get_rdid+0x22>
2002535c:	3401      	adds	r4, #1
2002535e:	2c06      	cmp	r4, #6
20025360:	d1f8      	bne.n	20025354 <spi_nand_get_rdid+0x10>
20025362:	2000      	movs	r0, #0
20025364:	e00b      	b.n	2002537e <spi_nand_get_rdid+0x3a>
20025366:	42ae      	cmp	r6, r5
20025368:	d105      	bne.n	20025376 <spi_nand_get_rdid+0x32>
2002536a:	7846      	ldrb	r6, [r0, #1]
2002536c:	4296      	cmp	r6, r2
2002536e:	d102      	bne.n	20025376 <spi_nand_get_rdid+0x32>
20025370:	7886      	ldrb	r6, [r0, #2]
20025372:	428e      	cmp	r6, r1
20025374:	d001      	beq.n	2002537a <spi_nand_get_rdid+0x36>
20025376:	3008      	adds	r0, #8
20025378:	e7ee      	b.n	20025358 <spi_nand_get_rdid+0x14>
2002537a:	b103      	cbz	r3, 2002537e <spi_nand_get_rdid+0x3a>
2002537c:	701c      	strb	r4, [r3, #0]
2002537e:	bdf0      	pop	{r4, r5, r6, r7, pc}
20025380:	20043ac8 	.word	0x20043ac8

20025384 <spi_nand_get_cmd_by_id>:
20025384:	b507      	push	{r0, r1, r2, lr}
20025386:	f10d 0307 	add.w	r3, sp, #7
2002538a:	f7ff ffdb 	bl	20025344 <spi_nand_get_rdid>
2002538e:	b130      	cbz	r0, 2002539e <spi_nand_get_cmd_by_id+0x1a>
20025390:	f44f 7205 	mov.w	r2, #532	@ 0x214
20025394:	f89d 3007 	ldrb.w	r3, [sp, #7]
20025398:	4802      	ldr	r0, [pc, #8]	@ (200253a4 <spi_nand_get_cmd_by_id+0x20>)
2002539a:	fb02 0003 	mla	r0, r2, r3, r0
2002539e:	b003      	add	sp, #12
200253a0:	f85d fb04 	ldr.w	pc, [sp], #4
200253a4:	20043ce0 	.word	0x20043ce0

200253a8 <HAL_GET_FLASH_DEFAUT_INX>:
200253a8:	f04f 30ff 	mov.w	r0, #4294967295
200253ac:	4770      	bx	lr
	...

200253b0 <spi_nand_get_default_ctable>:
200253b0:	b508      	push	{r3, lr}
200253b2:	f7ff fff9 	bl	200253a8 <HAL_GET_FLASH_DEFAUT_INX>
200253b6:	1e03      	subs	r3, r0, #0
200253b8:	bfa5      	ittet	ge
200253ba:	f44f 7205 	movge.w	r2, #532	@ 0x214
200253be:	4802      	ldrge	r0, [pc, #8]	@ (200253c8 <spi_nand_get_default_ctable+0x18>)
200253c0:	2000      	movlt	r0, #0
200253c2:	fb02 0003 	mlage	r0, r2, r3, r0
200253c6:	bd08      	pop	{r3, pc}
200253c8:	20043ce0 	.word	0x20043ce0

200253cc <spi_nand_get_size_by_id>:
200253cc:	b508      	push	{r3, lr}
200253ce:	2300      	movs	r3, #0
200253d0:	f7ff ffb8 	bl	20025344 <spi_nand_get_rdid>
200253d4:	b108      	cbz	r0, 200253da <spi_nand_get_size_by_id+0xe>
200253d6:	6840      	ldr	r0, [r0, #4]
200253d8:	bd08      	pop	{r3, pc}
200253da:	f04f 6080 	mov.w	r0, #67108864	@ 0x4000000
200253de:	e7fb      	b.n	200253d8 <spi_nand_get_size_by_id+0xc>

200253e0 <spi_nand_get_plane_select_flag>:
200253e0:	b508      	push	{r3, lr}
200253e2:	2300      	movs	r3, #0
200253e4:	f7ff ffae 	bl	20025344 <spi_nand_get_rdid>
200253e8:	b110      	cbz	r0, 200253f0 <spi_nand_get_plane_select_flag+0x10>
200253ea:	78c0      	ldrb	r0, [r0, #3]
200253ec:	f3c0 0040 	ubfx	r0, r0, #1, #1
200253f0:	bd08      	pop	{r3, pc}

200253f2 <spi_nand_get_big_page_flag>:
200253f2:	b508      	push	{r3, lr}
200253f4:	2300      	movs	r3, #0
200253f6:	f7ff ffa5 	bl	20025344 <spi_nand_get_rdid>
200253fa:	b110      	cbz	r0, 20025402 <spi_nand_get_big_page_flag+0x10>
200253fc:	78c0      	ldrb	r0, [r0, #3]
200253fe:	f3c0 0081 	ubfx	r0, r0, #2, #2
20025402:	bd08      	pop	{r3, pc}

20025404 <spi_nand_get_ecc_mode>:
20025404:	b508      	push	{r3, lr}
20025406:	2300      	movs	r3, #0
20025408:	f7ff ff9c 	bl	20025344 <spi_nand_get_rdid>
2002540c:	b108      	cbz	r0, 20025412 <spi_nand_get_ecc_mode+0xe>
2002540e:	78c0      	ldrb	r0, [r0, #3]
20025410:	0900      	lsrs	r0, r0, #4
20025412:	bd08      	pop	{r3, pc}

20025414 <bbm_map_check.part.0>:
20025414:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
20025416:	4b21      	ldr	r3, [pc, #132]	@ (2002549c <bbm_map_check.part.0+0x88>)
20025418:	4606      	mov	r6, r0
2002541a:	681d      	ldr	r5, [r3, #0]
2002541c:	4b20      	ldr	r3, [pc, #128]	@ (200254a0 <bbm_map_check.part.0+0x8c>)
2002541e:	3d04      	subs	r5, #4
20025420:	681f      	ldr	r7, [r3, #0]
20025422:	2300      	movs	r3, #0
20025424:	f100 0e1a 	add.w	lr, r0, #26
20025428:	42ab      	cmp	r3, r5
2002542a:	db02      	blt.n	20025432 <bbm_map_check.part.0+0x1e>
2002542c:	2000      	movs	r0, #0
2002542e:	b003      	add	sp, #12
20025430:	bdf0      	pop	{r4, r5, r6, r7, pc}
20025432:	8b31      	ldrh	r1, [r6, #24]
20025434:	b321      	cbz	r1, 20025480 <bbm_map_check.part.0+0x6c>
20025436:	8b72      	ldrh	r2, [r6, #26]
20025438:	b33a      	cbz	r2, 2002548a <bbm_map_check.part.0+0x76>
2002543a:	42b9      	cmp	r1, r7
2002543c:	d201      	bcs.n	20025442 <bbm_map_check.part.0+0x2e>
2002543e:	4297      	cmp	r7, r2
20025440:	d905      	bls.n	2002544e <bbm_map_check.part.0+0x3a>
20025442:	4b18      	ldr	r3, [pc, #96]	@ (200254a4 <bbm_map_check.part.0+0x90>)
20025444:	681b      	ldr	r3, [r3, #0]
20025446:	b10b      	cbz	r3, 2002544c <bbm_map_check.part.0+0x38>
20025448:	4817      	ldr	r0, [pc, #92]	@ (200254a8 <bbm_map_check.part.0+0x94>)
2002544a:	4798      	blx	r3
2002544c:	e7fe      	b.n	2002544c <bbm_map_check.part.0+0x38>
2002544e:	3301      	adds	r3, #1
20025450:	461c      	mov	r4, r3
20025452:	42ac      	cmp	r4, r5
20025454:	db01      	blt.n	2002545a <bbm_map_check.part.0+0x46>
20025456:	3604      	adds	r6, #4
20025458:	e7e6      	b.n	20025428 <bbm_map_check.part.0+0x14>
2002545a:	f83e c024 	ldrh.w	ip, [lr, r4, lsl #2]
2002545e:	f1bc 0f00 	cmp.w	ip, #0
20025462:	d0f8      	beq.n	20025456 <bbm_map_check.part.0+0x42>
20025464:	4562      	cmp	r2, ip
20025466:	d109      	bne.n	2002547c <bbm_map_check.part.0+0x68>
20025468:	4b0e      	ldr	r3, [pc, #56]	@ (200254a4 <bbm_map_check.part.0+0x90>)
2002546a:	681d      	ldr	r5, [r3, #0]
2002546c:	b12d      	cbz	r5, 2002547a <bbm_map_check.part.0+0x66>
2002546e:	3406      	adds	r4, #6
20025470:	f830 3024 	ldrh.w	r3, [r0, r4, lsl #2]
20025474:	480d      	ldr	r0, [pc, #52]	@ (200254ac <bbm_map_check.part.0+0x98>)
20025476:	9200      	str	r2, [sp, #0]
20025478:	47a8      	blx	r5
2002547a:	e7fe      	b.n	2002547a <bbm_map_check.part.0+0x66>
2002547c:	3401      	adds	r4, #1
2002547e:	e7e8      	b.n	20025452 <bbm_map_check.part.0+0x3e>
20025480:	eb00 0283 	add.w	r2, r0, r3, lsl #2
20025484:	8b52      	ldrh	r2, [r2, #26]
20025486:	2a00      	cmp	r2, #0
20025488:	d0d0      	beq.n	2002542c <bbm_map_check.part.0+0x18>
2002548a:	4a06      	ldr	r2, [pc, #24]	@ (200254a4 <bbm_map_check.part.0+0x90>)
2002548c:	6814      	ldr	r4, [r2, #0]
2002548e:	b124      	cbz	r4, 2002549a <bbm_map_check.part.0+0x86>
20025490:	eb00 0383 	add.w	r3, r0, r3, lsl #2
20025494:	8b5a      	ldrh	r2, [r3, #26]
20025496:	4806      	ldr	r0, [pc, #24]	@ (200254b0 <bbm_map_check.part.0+0x9c>)
20025498:	47a0      	blx	r4
2002549a:	e7fe      	b.n	2002549a <bbm_map_check.part.0+0x86>
2002549c:	2004cbf0 	.word	0x2004cbf0
200254a0:	2004cbf4 	.word	0x2004cbf4
200254a4:	2004cbe0 	.word	0x2004cbe0
200254a8:	2002a9d4 	.word	0x2002a9d4
200254ac:	2002a9f1 	.word	0x2002a9f1
200254b0:	2002aa3e 	.word	0x2002aa3e

200254b4 <bbm_crc_check>:
200254b4:	f04f 32ff 	mov.w	r2, #4294967295
200254b8:	b510      	push	{r4, lr}
200254ba:	4c07      	ldr	r4, [pc, #28]	@ (200254d8 <bbm_crc_check+0x24>)
200254bc:	4401      	add	r1, r0
200254be:	4288      	cmp	r0, r1
200254c0:	d101      	bne.n	200254c6 <bbm_crc_check+0x12>
200254c2:	43d0      	mvns	r0, r2
200254c4:	bd10      	pop	{r4, pc}
200254c6:	f810 3b01 	ldrb.w	r3, [r0], #1
200254ca:	4053      	eors	r3, r2
200254cc:	b2db      	uxtb	r3, r3
200254ce:	f854 3023 	ldr.w	r3, [r4, r3, lsl #2]
200254d2:	ea83 2212 	eor.w	r2, r3, r2, lsr #8
200254d6:	e7f2      	b.n	200254be <bbm_crc_check+0xa>
200254d8:	2002b864 	.word	0x2002b864

200254dc <bbm_get_phy_blk>:
200254dc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
200254de:	4b14      	ldr	r3, [pc, #80]	@ (20025530 <bbm_get_phy_blk+0x54>)
200254e0:	4601      	mov	r1, r0
200254e2:	681e      	ldr	r6, [r3, #0]
200254e4:	42b0      	cmp	r0, r6
200254e6:	d21e      	bcs.n	20025526 <bbm_get_phy_blk+0x4a>
200254e8:	b138      	cbz	r0, 200254fa <bbm_get_phy_blk+0x1e>
200254ea:	4b12      	ldr	r3, [pc, #72]	@ (20025534 <bbm_get_phy_blk+0x58>)
200254ec:	2200      	movs	r2, #0
200254ee:	681c      	ldr	r4, [r3, #0]
200254f0:	4b11      	ldr	r3, [pc, #68]	@ (20025538 <bbm_get_phy_blk+0x5c>)
200254f2:	3c04      	subs	r4, #4
200254f4:	461d      	mov	r5, r3
200254f6:	4294      	cmp	r4, r2
200254f8:	dc00      	bgt.n	200254fc <bbm_get_phy_blk+0x20>
200254fa:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
200254fc:	8b1f      	ldrh	r7, [r3, #24]
200254fe:	428f      	cmp	r7, r1
20025500:	d10a      	bne.n	20025518 <bbm_get_phy_blk+0x3c>
20025502:	eb05 0582 	add.w	r5, r5, r2, lsl #2
20025506:	8b6a      	ldrh	r2, [r5, #26]
20025508:	4296      	cmp	r6, r2
2002550a:	dd0f      	ble.n	2002552c <bbm_get_phy_blk+0x50>
2002550c:	4b0b      	ldr	r3, [pc, #44]	@ (2002553c <bbm_get_phy_blk+0x60>)
2002550e:	681b      	ldr	r3, [r3, #0]
20025510:	b10b      	cbz	r3, 20025516 <bbm_get_phy_blk+0x3a>
20025512:	480b      	ldr	r0, [pc, #44]	@ (20025540 <bbm_get_phy_blk+0x64>)
20025514:	4798      	blx	r3
20025516:	e7fe      	b.n	20025516 <bbm_get_phy_blk+0x3a>
20025518:	b917      	cbnz	r7, 20025520 <bbm_get_phy_blk+0x44>
2002551a:	8b5f      	ldrh	r7, [r3, #26]
2002551c:	2f00      	cmp	r7, #0
2002551e:	d0ec      	beq.n	200254fa <bbm_get_phy_blk+0x1e>
20025520:	3201      	adds	r2, #1
20025522:	3304      	adds	r3, #4
20025524:	e7e7      	b.n	200254f6 <bbm_get_phy_blk+0x1a>
20025526:	f04f 30ff 	mov.w	r0, #4294967295
2002552a:	e7e6      	b.n	200254fa <bbm_get_phy_blk+0x1e>
2002552c:	4610      	mov	r0, r2
2002552e:	e7e4      	b.n	200254fa <bbm_get_phy_blk+0x1e>
20025530:	2004cbf4 	.word	0x2004cbf4
20025534:	2004cbf0 	.word	0x2004cbf0
20025538:	2004cbf8 	.word	0x2004cbf8
2002553c:	2004cbe0 	.word	0x2004cbe0
20025540:	2002aa5c 	.word	0x2002aa5c

20025544 <bbm_get_version_inblk>:
20025544:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20025548:	4607      	mov	r7, r0
2002554a:	4688      	mov	r8, r1
2002554c:	b087      	sub	sp, #28
2002554e:	2900      	cmp	r1, #0
20025550:	d14b      	bne.n	200255ea <bbm_get_version_inblk+0xa6>
20025552:	2500      	movs	r5, #0
20025554:	4628      	mov	r0, r5
20025556:	b007      	add	sp, #28
20025558:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
2002555c:	2200      	movs	r2, #0
2002555e:	e9cd 2201 	strd	r2, r2, [sp, #4]
20025562:	4e26      	ldr	r6, [pc, #152]	@ (200255fc <bbm_get_version_inblk+0xb8>)
20025564:	9100      	str	r1, [sp, #0]
20025566:	4638      	mov	r0, r7
20025568:	4621      	mov	r1, r4
2002556a:	6833      	ldr	r3, [r6, #0]
2002556c:	f7fb fb0c 	bl	20020b88 <port_read_page>
20025570:	2800      	cmp	r0, #0
20025572:	dd32      	ble.n	200255da <bbm_get_version_inblk+0x96>
20025574:	6832      	ldr	r2, [r6, #0]
20025576:	6813      	ldr	r3, [r2, #0]
20025578:	455b      	cmp	r3, fp
2002557a:	d123      	bne.n	200255c4 <bbm_get_version_inblk+0x80>
2002557c:	6856      	ldr	r6, [r2, #4]
2002557e:	f3c6 061e 	ubfx	r6, r6, #0, #31
20025582:	42ae      	cmp	r6, r5
20025584:	dd15      	ble.n	200255b2 <bbm_get_version_inblk+0x6e>
20025586:	4610      	mov	r0, r2
20025588:	2110      	movs	r1, #16
2002558a:	9205      	str	r2, [sp, #20]
2002558c:	f7ff ff92 	bl	200254b4 <bbm_crc_check>
20025590:	9a05      	ldr	r2, [sp, #20]
20025592:	6913      	ldr	r3, [r2, #16]
20025594:	4283      	cmp	r3, r0
20025596:	d113      	bne.n	200255c0 <bbm_get_version_inblk+0x7c>
20025598:	f8c8 4000 	str.w	r4, [r8]
2002559c:	4635      	mov	r5, r6
2002559e:	3401      	adds	r4, #1
200255a0:	f8da 1000 	ldr.w	r1, [sl]
200255a4:	f8d9 3000 	ldr.w	r3, [r9]
200255a8:	fbb3 f3f1 	udiv	r3, r3, r1
200255ac:	42a3      	cmp	r3, r4
200255ae:	d8d5      	bhi.n	2002555c <bbm_get_version_inblk+0x18>
200255b0:	e7d0      	b.n	20025554 <bbm_get_version_inblk+0x10>
200255b2:	4b13      	ldr	r3, [pc, #76]	@ (20025600 <bbm_get_version_inblk+0xbc>)
200255b4:	681b      	ldr	r3, [r3, #0]
200255b6:	b11b      	cbz	r3, 200255c0 <bbm_get_version_inblk+0x7c>
200255b8:	4632      	mov	r2, r6
200255ba:	4629      	mov	r1, r5
200255bc:	4811      	ldr	r0, [pc, #68]	@ (20025604 <bbm_get_version_inblk+0xc0>)
200255be:	4798      	blx	r3
200255c0:	462e      	mov	r6, r5
200255c2:	e7eb      	b.n	2002559c <bbm_get_version_inblk+0x58>
200255c4:	1c5a      	adds	r2, r3, #1
200255c6:	d0c5      	beq.n	20025554 <bbm_get_version_inblk+0x10>
200255c8:	4a0d      	ldr	r2, [pc, #52]	@ (20025600 <bbm_get_version_inblk+0xbc>)
200255ca:	6815      	ldr	r5, [r2, #0]
200255cc:	2d00      	cmp	r5, #0
200255ce:	d0c0      	beq.n	20025552 <bbm_get_version_inblk+0xe>
200255d0:	4622      	mov	r2, r4
200255d2:	4639      	mov	r1, r7
200255d4:	480c      	ldr	r0, [pc, #48]	@ (20025608 <bbm_get_version_inblk+0xc4>)
200255d6:	47a8      	blx	r5
200255d8:	e7bb      	b.n	20025552 <bbm_get_version_inblk+0xe>
200255da:	4b09      	ldr	r3, [pc, #36]	@ (20025600 <bbm_get_version_inblk+0xbc>)
200255dc:	681b      	ldr	r3, [r3, #0]
200255de:	2b00      	cmp	r3, #0
200255e0:	d0ee      	beq.n	200255c0 <bbm_get_version_inblk+0x7c>
200255e2:	4622      	mov	r2, r4
200255e4:	4639      	mov	r1, r7
200255e6:	4809      	ldr	r0, [pc, #36]	@ (2002560c <bbm_get_version_inblk+0xc8>)
200255e8:	e7e9      	b.n	200255be <bbm_get_version_inblk+0x7a>
200255ea:	2400      	movs	r4, #0
200255ec:	f8df a020 	ldr.w	sl, [pc, #32]	@ 20025610 <bbm_get_version_inblk+0xcc>
200255f0:	4625      	mov	r5, r4
200255f2:	f8df 9020 	ldr.w	r9, [pc, #32]	@ 20025614 <bbm_get_version_inblk+0xd0>
200255f6:	f8df b020 	ldr.w	fp, [pc, #32]	@ 20025618 <bbm_get_version_inblk+0xd4>
200255fa:	e7d1      	b.n	200255a0 <bbm_get_version_inblk+0x5c>
200255fc:	2004cbe4 	.word	0x2004cbe4
20025600:	2004cbe0 	.word	0x2004cbe0
20025604:	2002aa7b 	.word	0x2002aa7b
20025608:	2002aaa8 	.word	0x2002aaa8
2002560c:	2002aad9 	.word	0x2002aad9
20025610:	20044958 	.word	0x20044958
20025614:	2004495c 	.word	0x2004495c
20025618:	5366424d 	.word	0x5366424d

2002561c <bbm_get_map_table>:
2002561c:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20025620:	2801      	cmp	r0, #1
20025622:	4607      	mov	r7, r0
20025624:	f8df b15c 	ldr.w	fp, [pc, #348]	@ 20025784 <bbm_get_map_table+0x168>
20025628:	b087      	sub	sp, #28
2002562a:	dd0a      	ble.n	20025642 <bbm_get_map_table+0x26>
2002562c:	f8db 3000 	ldr.w	r3, [fp]
20025630:	b91b      	cbnz	r3, 2002563a <bbm_get_map_table+0x1e>
20025632:	2000      	movs	r0, #0
20025634:	b007      	add	sp, #28
20025636:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
2002563a:	4601      	mov	r1, r0
2002563c:	4847      	ldr	r0, [pc, #284]	@ (2002575c <bbm_get_map_table+0x140>)
2002563e:	4798      	blx	r3
20025640:	e7f7      	b.n	20025632 <bbm_get_map_table+0x16>
20025642:	f8df 8144 	ldr.w	r8, [pc, #324]	@ 20025788 <bbm_get_map_table+0x16c>
20025646:	2800      	cmp	r0, #0
20025648:	d163      	bne.n	20025712 <bbm_get_map_table+0xf6>
2002564a:	f8b8 6000 	ldrh.w	r6, [r8]
2002564e:	f8b8 5002 	ldrh.w	r5, [r8, #2]
20025652:	2e00      	cmp	r6, #0
20025654:	d062      	beq.n	2002571c <bbm_get_map_table+0x100>
20025656:	4630      	mov	r0, r6
20025658:	a904      	add	r1, sp, #16
2002565a:	f7ff ff73 	bl	20025544 <bbm_get_version_inblk>
2002565e:	4681      	mov	r9, r0
20025660:	2d00      	cmp	r5, #0
20025662:	d05d      	beq.n	20025720 <bbm_get_map_table+0x104>
20025664:	4628      	mov	r0, r5
20025666:	a905      	add	r1, sp, #20
20025668:	f7ff ff6c 	bl	20025544 <bbm_get_version_inblk>
2002566c:	4604      	mov	r4, r0
2002566e:	f8db a000 	ldr.w	sl, [fp]
20025672:	f1ba 0f00 	cmp.w	sl, #0
20025676:	d005      	beq.n	20025684 <bbm_get_map_table+0x68>
20025678:	4623      	mov	r3, r4
2002567a:	4632      	mov	r2, r6
2002567c:	4649      	mov	r1, r9
2002567e:	4838      	ldr	r0, [pc, #224]	@ (20025760 <bbm_get_map_table+0x144>)
20025680:	9500      	str	r5, [sp, #0]
20025682:	47d0      	blx	sl
20025684:	45a1      	cmp	r9, r4
20025686:	d0d4      	beq.n	20025632 <bbm_get_map_table+0x16>
20025688:	f04f 0200 	mov.w	r2, #0
2002568c:	bf98      	it	ls
2002568e:	462e      	movls	r6, r5
20025690:	f107 0308 	add.w	r3, r7, #8
20025694:	bf94      	ite	ls
20025696:	f828 5013 	strhls.w	r5, [r8, r3, lsl #1]
2002569a:	f828 6013 	strhhi.w	r6, [r8, r3, lsl #1]
2002569e:	e9cd 2201 	strd	r2, r2, [sp, #4]
200256a2:	4b30      	ldr	r3, [pc, #192]	@ (20025764 <bbm_get_map_table+0x148>)
200256a4:	bf88      	it	hi
200256a6:	f8dd a010 	ldrhi.w	sl, [sp, #16]
200256aa:	681b      	ldr	r3, [r3, #0]
200256ac:	bf98      	it	ls
200256ae:	f8dd a014 	ldrls.w	sl, [sp, #20]
200256b2:	f8df 80d8 	ldr.w	r8, [pc, #216]	@ 2002578c <bbm_get_map_table+0x170>
200256b6:	9300      	str	r3, [sp, #0]
200256b8:	4651      	mov	r1, sl
200256ba:	4630      	mov	r0, r6
200256bc:	f8d8 3000 	ldr.w	r3, [r8]
200256c0:	bf88      	it	hi
200256c2:	464c      	movhi	r4, r9
200256c4:	f7fb fa60 	bl	20020b88 <port_read_page>
200256c8:	2800      	cmp	r0, #0
200256ca:	f8db 5000 	ldr.w	r5, [fp]
200256ce:	dd38      	ble.n	20025742 <bbm_get_map_table+0x126>
200256d0:	f8d8 8000 	ldr.w	r8, [r8]
200256d4:	4b24      	ldr	r3, [pc, #144]	@ (20025768 <bbm_get_map_table+0x14c>)
200256d6:	f8d8 2000 	ldr.w	r2, [r8]
200256da:	429a      	cmp	r2, r3
200256dc:	d12b      	bne.n	20025736 <bbm_get_map_table+0x11a>
200256de:	2110      	movs	r1, #16
200256e0:	4640      	mov	r0, r8
200256e2:	f7ff fee7 	bl	200254b4 <bbm_crc_check>
200256e6:	f8d8 2010 	ldr.w	r2, [r8, #16]
200256ea:	4601      	mov	r1, r0
200256ec:	4282      	cmp	r2, r0
200256ee:	d11e      	bne.n	2002572e <bbm_get_map_table+0x112>
200256f0:	f8d8 1004 	ldr.w	r1, [r8, #4]
200256f4:	f3c1 011e 	ubfx	r1, r1, #0, #31
200256f8:	42a1      	cmp	r1, r4
200256fa:	d113      	bne.n	20025724 <bbm_get_map_table+0x108>
200256fc:	f44f 7202 	mov.w	r2, #520	@ 0x208
20025700:	481a      	ldr	r0, [pc, #104]	@ (2002576c <bbm_get_map_table+0x150>)
20025702:	4641      	mov	r1, r8
20025704:	fb02 0007 	mla	r0, r2, r7, r0
20025708:	f005 f88a 	bl	2002a820 <memcpy>
2002570c:	bb0d      	cbnz	r5, 20025752 <bbm_get_map_table+0x136>
2002570e:	4620      	mov	r0, r4
20025710:	e790      	b.n	20025634 <bbm_get_map_table+0x18>
20025712:	f8b8 6004 	ldrh.w	r6, [r8, #4]
20025716:	f8b8 5006 	ldrh.w	r5, [r8, #6]
2002571a:	e79a      	b.n	20025652 <bbm_get_map_table+0x36>
2002571c:	46b1      	mov	r9, r6
2002571e:	e79f      	b.n	20025660 <bbm_get_map_table+0x44>
20025720:	462c      	mov	r4, r5
20025722:	e7a4      	b.n	2002566e <bbm_get_map_table+0x52>
20025724:	b115      	cbz	r5, 2002572c <bbm_get_map_table+0x110>
20025726:	4622      	mov	r2, r4
20025728:	4811      	ldr	r0, [pc, #68]	@ (20025770 <bbm_get_map_table+0x154>)
2002572a:	47a8      	blx	r5
2002572c:	e7fe      	b.n	2002572c <bbm_get_map_table+0x110>
2002572e:	b10d      	cbz	r5, 20025734 <bbm_get_map_table+0x118>
20025730:	4810      	ldr	r0, [pc, #64]	@ (20025774 <bbm_get_map_table+0x158>)
20025732:	47a8      	blx	r5
20025734:	e7fe      	b.n	20025734 <bbm_get_map_table+0x118>
20025736:	b11d      	cbz	r5, 20025740 <bbm_get_map_table+0x124>
20025738:	4652      	mov	r2, sl
2002573a:	4631      	mov	r1, r6
2002573c:	480e      	ldr	r0, [pc, #56]	@ (20025778 <bbm_get_map_table+0x15c>)
2002573e:	47a8      	blx	r5
20025740:	e7fe      	b.n	20025740 <bbm_get_map_table+0x124>
20025742:	2d00      	cmp	r5, #0
20025744:	f43f af75 	beq.w	20025632 <bbm_get_map_table+0x16>
20025748:	4652      	mov	r2, sl
2002574a:	4631      	mov	r1, r6
2002574c:	480b      	ldr	r0, [pc, #44]	@ (2002577c <bbm_get_map_table+0x160>)
2002574e:	47a8      	blx	r5
20025750:	e76f      	b.n	20025632 <bbm_get_map_table+0x16>
20025752:	4621      	mov	r1, r4
20025754:	480a      	ldr	r0, [pc, #40]	@ (20025780 <bbm_get_map_table+0x164>)
20025756:	47a8      	blx	r5
20025758:	e7d9      	b.n	2002570e <bbm_get_map_table+0xf2>
2002575a:	bf00      	nop
2002575c:	2002aaf7 	.word	0x2002aaf7
20025760:	2002ab0b 	.word	0x2002ab0b
20025764:	20044958 	.word	0x20044958
20025768:	5366424d 	.word	0x5366424d
2002576c:	2004cbf8 	.word	0x2004cbf8
20025770:	2002ab31 	.word	0x2002ab31
20025774:	2002ab7b 	.word	0x2002ab7b
20025778:	2002ab8d 	.word	0x2002ab8d
2002577c:	2002abc2 	.word	0x2002abc2
20025780:	2002abee 	.word	0x2002abee
20025784:	2004cbe0 	.word	0x2004cbe0
20025788:	2004d008 	.word	0x2004d008
2002578c:	2004cbe4 	.word	0x2004cbe4

20025790 <bbm_get_page_num>:
20025790:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
20025794:	4605      	mov	r5, r0
20025796:	2400      	movs	r4, #0
20025798:	4f13      	ldr	r7, [pc, #76]	@ (200257e8 <bbm_get_page_num+0x58>)
2002579a:	4e14      	ldr	r6, [pc, #80]	@ (200257ec <bbm_get_page_num+0x5c>)
2002579c:	f8df 8050 	ldr.w	r8, [pc, #80]	@ 200257f0 <bbm_get_page_num+0x60>
200257a0:	b085      	sub	sp, #20
200257a2:	6839      	ldr	r1, [r7, #0]
200257a4:	6833      	ldr	r3, [r6, #0]
200257a6:	fbb3 f3f1 	udiv	r3, r3, r1
200257aa:	42a3      	cmp	r3, r4
200257ac:	d802      	bhi.n	200257b4 <bbm_get_page_num+0x24>
200257ae:	f04f 34ff 	mov.w	r4, #4294967295
200257b2:	e015      	b.n	200257e0 <bbm_get_page_num+0x50>
200257b4:	2200      	movs	r2, #0
200257b6:	e9cd 2201 	strd	r2, r2, [sp, #4]
200257ba:	f8df 9038 	ldr.w	r9, [pc, #56]	@ 200257f4 <bbm_get_page_num+0x64>
200257be:	9100      	str	r1, [sp, #0]
200257c0:	4628      	mov	r0, r5
200257c2:	4621      	mov	r1, r4
200257c4:	f8d9 3000 	ldr.w	r3, [r9]
200257c8:	f7fb f9de 	bl	20020b88 <port_read_page>
200257cc:	b120      	cbz	r0, 200257d8 <bbm_get_page_num+0x48>
200257ce:	f8d9 3000 	ldr.w	r3, [r9]
200257d2:	681b      	ldr	r3, [r3, #0]
200257d4:	4543      	cmp	r3, r8
200257d6:	d101      	bne.n	200257dc <bbm_get_page_num+0x4c>
200257d8:	3401      	adds	r4, #1
200257da:	e7e2      	b.n	200257a2 <bbm_get_page_num+0x12>
200257dc:	3301      	adds	r3, #1
200257de:	d1fb      	bne.n	200257d8 <bbm_get_page_num+0x48>
200257e0:	4620      	mov	r0, r4
200257e2:	b005      	add	sp, #20
200257e4:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
200257e8:	20044958 	.word	0x20044958
200257ec:	2004495c 	.word	0x2004495c
200257f0:	5366424d 	.word	0x5366424d
200257f4:	2004cbe4 	.word	0x2004cbe4

200257f8 <bbm_read_page>:
200257f8:	b5f0      	push	{r4, r5, r6, r7, lr}
200257fa:	4604      	mov	r4, r0
200257fc:	b085      	sub	sp, #20
200257fe:	b280      	uxth	r0, r0
20025800:	461f      	mov	r7, r3
20025802:	460d      	mov	r5, r1
20025804:	4616      	mov	r6, r2
20025806:	f7ff fe69 	bl	200254dc <bbm_get_phy_blk>
2002580a:	1c43      	adds	r3, r0, #1
2002580c:	d108      	bne.n	20025820 <bbm_read_page+0x28>
2002580e:	4b0a      	ldr	r3, [pc, #40]	@ (20025838 <bbm_read_page+0x40>)
20025810:	681b      	ldr	r3, [r3, #0]
20025812:	b113      	cbz	r3, 2002581a <bbm_read_page+0x22>
20025814:	4621      	mov	r1, r4
20025816:	4809      	ldr	r0, [pc, #36]	@ (2002583c <bbm_read_page+0x44>)
20025818:	4798      	blx	r3
2002581a:	2000      	movs	r0, #0
2002581c:	b005      	add	sp, #20
2002581e:	bdf0      	pop	{r4, r5, r6, r7, pc}
20025820:	9b0c      	ldr	r3, [sp, #48]	@ 0x30
20025822:	4632      	mov	r2, r6
20025824:	9302      	str	r3, [sp, #8]
20025826:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
20025828:	4629      	mov	r1, r5
2002582a:	9301      	str	r3, [sp, #4]
2002582c:	9b0a      	ldr	r3, [sp, #40]	@ 0x28
2002582e:	9300      	str	r3, [sp, #0]
20025830:	463b      	mov	r3, r7
20025832:	f7fb f9a9 	bl	20020b88 <port_read_page>
20025836:	e7f1      	b.n	2002581c <bbm_read_page+0x24>
20025838:	2004cbe0 	.word	0x2004cbe0
2002583c:	2002ac01 	.word	0x2002ac01

20025840 <port_write_page>:
20025840:	4b01      	ldr	r3, [pc, #4]	@ (20025848 <port_write_page+0x8>)
20025842:	6818      	ldr	r0, [r3, #0]
20025844:	4770      	bx	lr
20025846:	bf00      	nop
20025848:	20044958 	.word	0x20044958

2002584c <bbm_write_talbe.isra.0>:
2002584c:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
2002584e:	4604      	mov	r4, r0
20025850:	4608      	mov	r0, r1
20025852:	460e      	mov	r6, r1
20025854:	f7ff ff9c 	bl	20025790 <bbm_get_page_num>
20025858:	1e05      	subs	r5, r0, #0
2002585a:	db25      	blt.n	200258a8 <bbm_write_talbe.isra.0+0x5c>
2002585c:	4b13      	ldr	r3, [pc, #76]	@ (200258ac <bbm_write_talbe.isra.0+0x60>)
2002585e:	681a      	ldr	r2, [r3, #0]
20025860:	4b13      	ldr	r3, [pc, #76]	@ (200258b0 <bbm_write_talbe.isra.0+0x64>)
20025862:	681b      	ldr	r3, [r3, #0]
20025864:	fbb3 f3f2 	udiv	r3, r3, r2
20025868:	429d      	cmp	r5, r3
2002586a:	da1d      	bge.n	200258a8 <bbm_write_talbe.isra.0+0x5c>
2002586c:	4f11      	ldr	r7, [pc, #68]	@ (200258b4 <bbm_write_talbe.isra.0+0x68>)
2002586e:	21ff      	movs	r1, #255	@ 0xff
20025870:	6838      	ldr	r0, [r7, #0]
20025872:	f004 ffbb 	bl	2002a7ec <memset>
20025876:	4264      	negs	r4, r4
20025878:	490f      	ldr	r1, [pc, #60]	@ (200258b8 <bbm_write_talbe.isra.0+0x6c>)
2002587a:	f404 7402 	and.w	r4, r4, #520	@ 0x208
2002587e:	f44f 7202 	mov.w	r2, #520	@ 0x208
20025882:	6838      	ldr	r0, [r7, #0]
20025884:	4421      	add	r1, r4
20025886:	f004 ffcb 	bl	2002a820 <memcpy>
2002588a:	6838      	ldr	r0, [r7, #0]
2002588c:	b160      	cbz	r0, 200258a8 <bbm_write_talbe.isra.0+0x5c>
2002588e:	6802      	ldr	r2, [r0, #0]
20025890:	4b0a      	ldr	r3, [pc, #40]	@ (200258bc <bbm_write_talbe.isra.0+0x70>)
20025892:	429a      	cmp	r2, r3
20025894:	d108      	bne.n	200258a8 <bbm_write_talbe.isra.0+0x5c>
20025896:	f7ff fdbd 	bl	20025414 <bbm_map_check.part.0>
2002589a:	2300      	movs	r3, #0
2002589c:	9300      	str	r3, [sp, #0]
2002589e:	4629      	mov	r1, r5
200258a0:	4630      	mov	r0, r6
200258a2:	683a      	ldr	r2, [r7, #0]
200258a4:	f7ff ffcc 	bl	20025840 <port_write_page>
200258a8:	b003      	add	sp, #12
200258aa:	bdf0      	pop	{r4, r5, r6, r7, pc}
200258ac:	20044958 	.word	0x20044958
200258b0:	2004495c 	.word	0x2004495c
200258b4:	2004cbe4 	.word	0x2004cbe4
200258b8:	2004cbf8 	.word	0x2004cbf8
200258bc:	5366424d 	.word	0x5366424d

200258c0 <port_erase_block>:
200258c0:	2000      	movs	r0, #0
200258c2:	4770      	bx	lr

200258c4 <bbm_init_table>:
200258c4:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
200258c8:	4c7d      	ldr	r4, [pc, #500]	@ (20025ac0 <bbm_init_table+0x1fc>)
200258ca:	4b7e      	ldr	r3, [pc, #504]	@ (20025ac4 <bbm_init_table+0x200>)
200258cc:	6822      	ldr	r2, [r4, #0]
200258ce:	b085      	sub	sp, #20
200258d0:	429a      	cmp	r2, r3
200258d2:	f000 80ef 	beq.w	20025ab4 <bbm_init_table+0x1f0>
200258d6:	f8d4 2208 	ldr.w	r2, [r4, #520]	@ 0x208
200258da:	429a      	cmp	r2, r3
200258dc:	f000 80ea 	beq.w	20025ab4 <bbm_init_table+0x1f0>
200258e0:	6023      	str	r3, [r4, #0]
200258e2:	2301      	movs	r3, #1
200258e4:	6063      	str	r3, [r4, #4]
200258e6:	2300      	movs	r3, #0
200258e8:	f8df 9210 	ldr.w	r9, [pc, #528]	@ 20025afc <bbm_init_table+0x238>
200258ec:	8123      	strh	r3, [r4, #8]
200258ee:	f8d9 3000 	ldr.w	r3, [r9]
200258f2:	4f75      	ldr	r7, [pc, #468]	@ (20025ac8 <bbm_init_table+0x204>)
200258f4:	3b04      	subs	r3, #4
200258f6:	f8df a208 	ldr.w	sl, [pc, #520]	@ 20025b00 <bbm_init_table+0x23c>
200258fa:	8163      	strh	r3, [r4, #10]
200258fc:	683b      	ldr	r3, [r7, #0]
200258fe:	f8da 5000 	ldr.w	r5, [sl]
20025902:	3b01      	subs	r3, #1
20025904:	4e71      	ldr	r6, [pc, #452]	@ (20025acc <bbm_init_table+0x208>)
20025906:	81a3      	strh	r3, [r4, #12]
20025908:	81e5      	strh	r5, [r4, #14]
2002590a:	683b      	ldr	r3, [r7, #0]
2002590c:	429d      	cmp	r5, r3
2002590e:	db10      	blt.n	20025932 <bbm_init_table+0x6e>
20025910:	2500      	movs	r5, #0
20025912:	46a8      	mov	r8, r5
20025914:	f8df b1b4 	ldr.w	fp, [pc, #436]	@ 20025acc <bbm_init_table+0x208>
20025918:	f8da 6000 	ldr.w	r6, [sl]
2002591c:	42b5      	cmp	r5, r6
2002591e:	db20      	blt.n	20025962 <bbm_init_table+0x9e>
20025920:	8963      	ldrh	r3, [r4, #10]
20025922:	2b00      	cmp	r3, #0
20025924:	d14d      	bne.n	200259c2 <bbm_init_table+0xfe>
20025926:	4b69      	ldr	r3, [pc, #420]	@ (20025acc <bbm_init_table+0x208>)
20025928:	681b      	ldr	r3, [r3, #0]
2002592a:	b10b      	cbz	r3, 20025930 <bbm_init_table+0x6c>
2002592c:	4868      	ldr	r0, [pc, #416]	@ (20025ad0 <bbm_init_table+0x20c>)
2002592e:	4798      	blx	r3
20025930:	e7fe      	b.n	20025930 <bbm_init_table+0x6c>
20025932:	4628      	mov	r0, r5
20025934:	f7fb f988 	bl	20020c48 <bbm_get_bb>
20025938:	b968      	cbnz	r0, 20025956 <bbm_init_table+0x92>
2002593a:	4628      	mov	r0, r5
2002593c:	f7ff ffc0 	bl	200258c0 <port_erase_block>
20025940:	b138      	cbz	r0, 20025952 <bbm_init_table+0x8e>
20025942:	6833      	ldr	r3, [r6, #0]
20025944:	b113      	cbz	r3, 2002594c <bbm_init_table+0x88>
20025946:	4629      	mov	r1, r5
20025948:	4862      	ldr	r0, [pc, #392]	@ (20025ad4 <bbm_init_table+0x210>)
2002594a:	4798      	blx	r3
2002594c:	8963      	ldrh	r3, [r4, #10]
2002594e:	3b01      	subs	r3, #1
20025950:	8163      	strh	r3, [r4, #10]
20025952:	3501      	adds	r5, #1
20025954:	e7d9      	b.n	2002590a <bbm_init_table+0x46>
20025956:	6833      	ldr	r3, [r6, #0]
20025958:	2b00      	cmp	r3, #0
2002595a:	d0f7      	beq.n	2002594c <bbm_init_table+0x88>
2002595c:	4629      	mov	r1, r5
2002595e:	485e      	ldr	r0, [pc, #376]	@ (20025ad8 <bbm_init_table+0x214>)
20025960:	e7f3      	b.n	2002594a <bbm_init_table+0x86>
20025962:	4628      	mov	r0, r5
20025964:	f7fb f970 	bl	20020c48 <bbm_get_bb>
20025968:	b348      	cbz	r0, 200259be <bbm_init_table+0xfa>
2002596a:	f8db 3000 	ldr.w	r3, [fp]
2002596e:	b113      	cbz	r3, 20025976 <bbm_init_table+0xb2>
20025970:	4629      	mov	r1, r5
20025972:	485a      	ldr	r0, [pc, #360]	@ (20025adc <bbm_init_table+0x218>)
20025974:	4798      	blx	r3
20025976:	89a0      	ldrh	r0, [r4, #12]
20025978:	f7fb f966 	bl	20020c48 <bbm_get_bb>
2002597c:	89a3      	ldrh	r3, [r4, #12]
2002597e:	4606      	mov	r6, r0
20025980:	3b01      	subs	r3, #1
20025982:	81a3      	strh	r3, [r4, #12]
20025984:	8963      	ldrh	r3, [r4, #10]
20025986:	3b01      	subs	r3, #1
20025988:	b29b      	uxth	r3, r3
2002598a:	8163      	strh	r3, [r4, #10]
2002598c:	b108      	cbz	r0, 20025992 <bbm_init_table+0xce>
2002598e:	2b00      	cmp	r3, #0
20025990:	d1f1      	bne.n	20025976 <bbm_init_table+0xb2>
20025992:	f8db 3000 	ldr.w	r3, [fp]
20025996:	b11b      	cbz	r3, 200259a0 <bbm_init_table+0xdc>
20025998:	4642      	mov	r2, r8
2002599a:	4629      	mov	r1, r5
2002599c:	4850      	ldr	r0, [pc, #320]	@ (20025ae0 <bbm_init_table+0x21c>)
2002599e:	4798      	blx	r3
200259a0:	b946      	cbnz	r6, 200259b4 <bbm_init_table+0xf0>
200259a2:	89a2      	ldrh	r2, [r4, #12]
200259a4:	f108 0306 	add.w	r3, r8, #6
200259a8:	f824 5023 	strh.w	r5, [r4, r3, lsl #2]
200259ac:	3201      	adds	r2, #1
200259ae:	eb04 0383 	add.w	r3, r4, r3, lsl #2
200259b2:	805a      	strh	r2, [r3, #2]
200259b4:	8923      	ldrh	r3, [r4, #8]
200259b6:	f108 0801 	add.w	r8, r8, #1
200259ba:	3301      	adds	r3, #1
200259bc:	8123      	strh	r3, [r4, #8]
200259be:	3501      	adds	r5, #1
200259c0:	e7aa      	b.n	20025918 <bbm_init_table+0x54>
200259c2:	2110      	movs	r1, #16
200259c4:	483e      	ldr	r0, [pc, #248]	@ (20025ac0 <bbm_init_table+0x1fc>)
200259c6:	f7ff fd75 	bl	200254b4 <bbm_crc_check>
200259ca:	f8d9 1000 	ldr.w	r1, [r9]
200259ce:	6120      	str	r0, [r4, #16]
200259d0:	3904      	subs	r1, #4
200259d2:	0089      	lsls	r1, r1, #2
200259d4:	4843      	ldr	r0, [pc, #268]	@ (20025ae4 <bbm_init_table+0x220>)
200259d6:	f7ff fd6d 	bl	200254b4 <bbm_crc_check>
200259da:	f44f 7202 	mov.w	r2, #520	@ 0x208
200259de:	4938      	ldr	r1, [pc, #224]	@ (20025ac0 <bbm_init_table+0x1fc>)
200259e0:	6160      	str	r0, [r4, #20]
200259e2:	1888      	adds	r0, r1, r2
200259e4:	f004 ff1c 	bl	2002a820 <memcpy>
200259e8:	f894 320f 	ldrb.w	r3, [r4, #527]	@ 0x20f
200259ec:	2110      	movs	r1, #16
200259ee:	f043 0380 	orr.w	r3, r3, #128	@ 0x80
200259f2:	f884 320f 	strb.w	r3, [r4, #527]	@ 0x20f
200259f6:	483c      	ldr	r0, [pc, #240]	@ (20025ae8 <bbm_init_table+0x224>)
200259f8:	f7ff fd5c 	bl	200254b4 <bbm_crc_check>
200259fc:	f8c4 0218 	str.w	r0, [r4, #536]	@ 0x218
20025a00:	2400      	movs	r4, #0
20025a02:	f8df 9100 	ldr.w	r9, [pc, #256]	@ 20025b04 <bbm_init_table+0x240>
20025a06:	f8df 8100 	ldr.w	r8, [pc, #256]	@ 20025b08 <bbm_init_table+0x244>
20025a0a:	683b      	ldr	r3, [r7, #0]
20025a0c:	429e      	cmp	r6, r3
20025a0e:	db08      	blt.n	20025a22 <bbm_init_table+0x15e>
20025a10:	2c03      	cmp	r4, #3
20025a12:	dc30      	bgt.n	20025a76 <bbm_init_table+0x1b2>
20025a14:	4b2d      	ldr	r3, [pc, #180]	@ (20025acc <bbm_init_table+0x208>)
20025a16:	681b      	ldr	r3, [r3, #0]
20025a18:	b113      	cbz	r3, 20025a20 <bbm_init_table+0x15c>
20025a1a:	4621      	mov	r1, r4
20025a1c:	4833      	ldr	r0, [pc, #204]	@ (20025aec <bbm_init_table+0x228>)
20025a1e:	4798      	blx	r3
20025a20:	e7fe      	b.n	20025a20 <bbm_init_table+0x15c>
20025a22:	4630      	mov	r0, r6
20025a24:	f7fb f910 	bl	20020c48 <bbm_get_bb>
20025a28:	4605      	mov	r5, r0
20025a2a:	bb10      	cbnz	r0, 20025a72 <bbm_init_table+0x1ae>
20025a2c:	f8d9 a000 	ldr.w	sl, [r9]
20025a30:	21ff      	movs	r1, #255	@ 0xff
20025a32:	4652      	mov	r2, sl
20025a34:	f8d8 0000 	ldr.w	r0, [r8]
20025a38:	f004 fed8 	bl	2002a7ec <memset>
20025a3c:	e9cd 5501 	strd	r5, r5, [sp, #4]
20025a40:	f8cd a000 	str.w	sl, [sp]
20025a44:	f8d8 3000 	ldr.w	r3, [r8]
20025a48:	462a      	mov	r2, r5
20025a4a:	4629      	mov	r1, r5
20025a4c:	4630      	mov	r0, r6
20025a4e:	f7fb f89b 	bl	20020b88 <port_read_page>
20025a52:	f8d9 3000 	ldr.w	r3, [r9]
20025a56:	4298      	cmp	r0, r3
20025a58:	d109      	bne.n	20025a6e <bbm_init_table+0x1aa>
20025a5a:	f8d8 3000 	ldr.w	r3, [r8]
20025a5e:	681b      	ldr	r3, [r3, #0]
20025a60:	3301      	adds	r3, #1
20025a62:	bf01      	itttt	eq
20025a64:	4b22      	ldreq	r3, [pc, #136]	@ (20025af0 <bbm_init_table+0x22c>)
20025a66:	1d22      	addeq	r2, r4, #4
20025a68:	f823 6012 	strheq.w	r6, [r3, r2, lsl #1]
20025a6c:	3401      	addeq	r4, #1
20025a6e:	2c03      	cmp	r4, #3
20025a70:	dc01      	bgt.n	20025a76 <bbm_init_table+0x1b2>
20025a72:	3601      	adds	r6, #1
20025a74:	e7c9      	b.n	20025a0a <bbm_init_table+0x146>
20025a76:	2500      	movs	r5, #0
20025a78:	4c1d      	ldr	r4, [pc, #116]	@ (20025af0 <bbm_init_table+0x22c>)
20025a7a:	2000      	movs	r0, #0
20025a7c:	8921      	ldrh	r1, [r4, #8]
20025a7e:	f7ff fee5 	bl	2002584c <bbm_write_talbe.isra.0>
20025a82:	8923      	ldrh	r3, [r4, #8]
20025a84:	2001      	movs	r0, #1
20025a86:	8961      	ldrh	r1, [r4, #10]
20025a88:	8023      	strh	r3, [r4, #0]
20025a8a:	8223      	strh	r3, [r4, #16]
20025a8c:	8125      	strh	r5, [r4, #8]
20025a8e:	f7ff fedd 	bl	2002584c <bbm_write_talbe.isra.0>
20025a92:	8963      	ldrh	r3, [r4, #10]
20025a94:	8165      	strh	r5, [r4, #10]
20025a96:	80a3      	strh	r3, [r4, #4]
20025a98:	8263      	strh	r3, [r4, #18]
20025a9a:	89a3      	ldrh	r3, [r4, #12]
20025a9c:	8063      	strh	r3, [r4, #2]
20025a9e:	89e3      	ldrh	r3, [r4, #14]
20025aa0:	80e3      	strh	r3, [r4, #6]
20025aa2:	4b0a      	ldr	r3, [pc, #40]	@ (20025acc <bbm_init_table+0x208>)
20025aa4:	681b      	ldr	r3, [r3, #0]
20025aa6:	b10b      	cbz	r3, 20025aac <bbm_init_table+0x1e8>
20025aa8:	4812      	ldr	r0, [pc, #72]	@ (20025af4 <bbm_init_table+0x230>)
20025aaa:	4798      	blx	r3
20025aac:	2000      	movs	r0, #0
20025aae:	b005      	add	sp, #20
20025ab0:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
20025ab4:	4b05      	ldr	r3, [pc, #20]	@ (20025acc <bbm_init_table+0x208>)
20025ab6:	681b      	ldr	r3, [r3, #0]
20025ab8:	b10b      	cbz	r3, 20025abe <bbm_init_table+0x1fa>
20025aba:	480f      	ldr	r0, [pc, #60]	@ (20025af8 <bbm_init_table+0x234>)
20025abc:	4798      	blx	r3
20025abe:	e7fe      	b.n	20025abe <bbm_init_table+0x1fa>
20025ac0:	2004cbf8 	.word	0x2004cbf8
20025ac4:	5366424d 	.word	0x5366424d
20025ac8:	2004cbec 	.word	0x2004cbec
20025acc:	2004cbe0 	.word	0x2004cbe0
20025ad0:	2002ac96 	.word	0x2002ac96
20025ad4:	2002ac24 	.word	0x2002ac24
20025ad8:	2002ac46 	.word	0x2002ac46
20025adc:	2002ac63 	.word	0x2002ac63
20025ae0:	2002ac82 	.word	0x2002ac82
20025ae4:	2004cc10 	.word	0x2004cc10
20025ae8:	2004ce00 	.word	0x2004ce00
20025aec:	2002acb0 	.word	0x2002acb0
20025af0:	2004d008 	.word	0x2004d008
20025af4:	2002acd7 	.word	0x2002acd7
20025af8:	2002acf3 	.word	0x2002acf3
20025afc:	2004cbf0 	.word	0x2004cbf0
20025b00:	2004cbf4 	.word	0x2004cbf4
20025b04:	20044958 	.word	0x20044958
20025b08:	2004cbe4 	.word	0x2004cbe4

20025b0c <sif_bbm_init>:
20025b0c:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20025b10:	b087      	sub	sp, #28
20025b12:	2900      	cmp	r1, #0
20025b14:	f000 8129 	beq.w	20025d6a <sif_bbm_init+0x25e>
20025b18:	4b95      	ldr	r3, [pc, #596]	@ (20025d70 <sif_bbm_init+0x264>)
20025b1a:	681a      	ldr	r2, [r3, #0]
20025b1c:	2a01      	cmp	r2, #1
20025b1e:	d108      	bne.n	20025b32 <sif_bbm_init+0x26>
20025b20:	4b94      	ldr	r3, [pc, #592]	@ (20025d74 <sif_bbm_init+0x268>)
20025b22:	681b      	ldr	r3, [r3, #0]
20025b24:	b10b      	cbz	r3, 20025b2a <sif_bbm_init+0x1e>
20025b26:	4894      	ldr	r0, [pc, #592]	@ (20025d78 <sif_bbm_init+0x26c>)
20025b28:	4798      	blx	r3
20025b2a:	2000      	movs	r0, #0
20025b2c:	b007      	add	sp, #28
20025b2e:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
20025b32:	2201      	movs	r2, #1
20025b34:	601a      	str	r2, [r3, #0]
20025b36:	4b91      	ldr	r3, [pc, #580]	@ (20025d7c <sif_bbm_init+0x270>)
20025b38:	681c      	ldr	r4, [r3, #0]
20025b3a:	b904      	cbnz	r4, 20025b3e <sif_bbm_init+0x32>
20025b3c:	e7fe      	b.n	20025b3c <sif_bbm_init+0x30>
20025b3e:	f8df a27c 	ldr.w	sl, [pc, #636]	@ 20025dbc <sif_bbm_init+0x2b0>
20025b42:	f8da 2000 	ldr.w	r2, [sl]
20025b46:	b902      	cbnz	r2, 20025b4a <sif_bbm_init+0x3e>
20025b48:	e7fe      	b.n	20025b48 <sif_bbm_init+0x3c>
20025b4a:	fbb0 f4f4 	udiv	r4, r0, r4
20025b4e:	f04f 0800 	mov.w	r8, #0
20025b52:	4a8b      	ldr	r2, [pc, #556]	@ (20025d80 <sif_bbm_init+0x274>)
20025b54:	f8df b268 	ldr.w	fp, [pc, #616]	@ 20025dc0 <sif_bbm_init+0x2b4>
20025b58:	0963      	lsrs	r3, r4, #5
20025b5a:	f8df 9268 	ldr.w	r9, [pc, #616]	@ 20025dc4 <sif_bbm_init+0x2b8>
20025b5e:	6013      	str	r3, [r2, #0]
20025b60:	f8cb 4000 	str.w	r4, [fp]
20025b64:	1ae4      	subs	r4, r4, r3
20025b66:	4b87      	ldr	r3, [pc, #540]	@ (20025d84 <sif_bbm_init+0x278>)
20025b68:	2218      	movs	r2, #24
20025b6a:	f8c9 1000 	str.w	r1, [r9]
20025b6e:	4886      	ldr	r0, [pc, #536]	@ (20025d88 <sif_bbm_init+0x27c>)
20025b70:	2100      	movs	r1, #0
20025b72:	601c      	str	r4, [r3, #0]
20025b74:	f004 fe3a 	bl	2002a7ec <memset>
20025b78:	f44f 6282 	mov.w	r2, #1040	@ 0x410
20025b7c:	2100      	movs	r1, #0
20025b7e:	4883      	ldr	r0, [pc, #524]	@ (20025d8c <sif_bbm_init+0x280>)
20025b80:	f004 fe34 	bl	2002a7ec <memset>
20025b84:	4647      	mov	r7, r8
20025b86:	4646      	mov	r6, r8
20025b88:	f8db 3000 	ldr.w	r3, [fp]
20025b8c:	429c      	cmp	r4, r3
20025b8e:	db02      	blt.n	20025b96 <sif_bbm_init+0x8a>
20025b90:	f04f 35ff 	mov.w	r5, #4294967295
20025b94:	e064      	b.n	20025c60 <sif_bbm_init+0x154>
20025b96:	4620      	mov	r0, r4
20025b98:	f7fb f856 	bl	20020c48 <bbm_get_bb>
20025b9c:	4605      	mov	r5, r0
20025b9e:	b138      	cbz	r0, 20025bb0 <sif_bbm_init+0xa4>
20025ba0:	4b74      	ldr	r3, [pc, #464]	@ (20025d74 <sif_bbm_init+0x268>)
20025ba2:	681b      	ldr	r3, [r3, #0]
20025ba4:	b113      	cbz	r3, 20025bac <sif_bbm_init+0xa0>
20025ba6:	487a      	ldr	r0, [pc, #488]	@ (20025d90 <sif_bbm_init+0x284>)
20025ba8:	1c61      	adds	r1, r4, #1
20025baa:	4798      	blx	r3
20025bac:	3401      	adds	r4, #1
20025bae:	e7eb      	b.n	20025b88 <sif_bbm_init+0x7c>
20025bb0:	f8da 2000 	ldr.w	r2, [sl]
20025bb4:	21ff      	movs	r1, #255	@ 0xff
20025bb6:	f8d9 0000 	ldr.w	r0, [r9]
20025bba:	9205      	str	r2, [sp, #20]
20025bbc:	f004 fe16 	bl	2002a7ec <memset>
20025bc0:	9a05      	ldr	r2, [sp, #20]
20025bc2:	e9cd 5501 	strd	r5, r5, [sp, #4]
20025bc6:	9200      	str	r2, [sp, #0]
20025bc8:	f8d9 3000 	ldr.w	r3, [r9]
20025bcc:	462a      	mov	r2, r5
20025bce:	4629      	mov	r1, r5
20025bd0:	4620      	mov	r0, r4
20025bd2:	f7fa ffd9 	bl	20020b88 <port_read_page>
20025bd6:	f8da 3000 	ldr.w	r3, [sl]
20025bda:	4298      	cmp	r0, r3
20025bdc:	d12e      	bne.n	20025c3c <sif_bbm_init+0x130>
20025bde:	f8d9 1000 	ldr.w	r1, [r9]
20025be2:	486c      	ldr	r0, [pc, #432]	@ (20025d94 <sif_bbm_init+0x288>)
20025be4:	680b      	ldr	r3, [r1, #0]
20025be6:	b2a2      	uxth	r2, r4
20025be8:	4283      	cmp	r3, r0
20025bea:	4b67      	ldr	r3, [pc, #412]	@ (20025d88 <sif_bbm_init+0x27c>)
20025bec:	d11f      	bne.n	20025c2e <sif_bbm_init+0x122>
20025bee:	f991 1007 	ldrsb.w	r1, [r1, #7]
20025bf2:	2900      	cmp	r1, #0
20025bf4:	bfb5      	itete	lt
20025bf6:	eb03 0147 	addlt.w	r1, r3, r7, lsl #1
20025bfa:	f823 2016 	strhge.w	r2, [r3, r6, lsl #1]
20025bfe:	808a      	strhlt	r2, [r1, #4]
20025c00:	3601      	addge	r6, #1
20025c02:	bfb8      	it	lt
20025c04:	3701      	addlt	r7, #1
20025c06:	eb06 0208 	add.w	r2, r6, r8
20025c0a:	443a      	add	r2, r7
20025c0c:	2a03      	cmp	r2, #3
20025c0e:	ddcd      	ble.n	20025bac <sif_bbm_init+0xa0>
20025c10:	2e00      	cmp	r6, #0
20025c12:	f000 8081 	beq.w	20025d18 <sif_bbm_init+0x20c>
20025c16:	2f00      	cmp	r7, #0
20025c18:	d07e      	beq.n	20025d18 <sif_bbm_init+0x20c>
20025c1a:	2e01      	cmp	r6, #1
20025c1c:	d001      	beq.n	20025c22 <sif_bbm_init+0x116>
20025c1e:	2f01      	cmp	r7, #1
20025c20:	d11e      	bne.n	20025c60 <sif_bbm_init+0x154>
20025c22:	8819      	ldrh	r1, [r3, #0]
20025c24:	891a      	ldrh	r2, [r3, #8]
20025c26:	b981      	cbnz	r1, 20025c4a <sif_bbm_init+0x13e>
20025c28:	801a      	strh	r2, [r3, #0]
20025c2a:	895a      	ldrh	r2, [r3, #10]
20025c2c:	e013      	b.n	20025c56 <sif_bbm_init+0x14a>
20025c2e:	f108 0104 	add.w	r1, r8, #4
20025c32:	f823 2011 	strh.w	r2, [r3, r1, lsl #1]
20025c36:	f108 0801 	add.w	r8, r8, #1
20025c3a:	e7e4      	b.n	20025c06 <sif_bbm_init+0xfa>
20025c3c:	4b4d      	ldr	r3, [pc, #308]	@ (20025d74 <sif_bbm_init+0x268>)
20025c3e:	681b      	ldr	r3, [r3, #0]
20025c40:	2b00      	cmp	r3, #0
20025c42:	d0b3      	beq.n	20025bac <sif_bbm_init+0xa0>
20025c44:	4854      	ldr	r0, [pc, #336]	@ (20025d98 <sif_bbm_init+0x28c>)
20025c46:	1c61      	adds	r1, r4, #1
20025c48:	e7af      	b.n	20025baa <sif_bbm_init+0x9e>
20025c4a:	8859      	ldrh	r1, [r3, #2]
20025c4c:	b909      	cbnz	r1, 20025c52 <sif_bbm_init+0x146>
20025c4e:	805a      	strh	r2, [r3, #2]
20025c50:	e7eb      	b.n	20025c2a <sif_bbm_init+0x11e>
20025c52:	2a00      	cmp	r2, #0
20025c54:	d0e9      	beq.n	20025c2a <sif_bbm_init+0x11e>
20025c56:	8899      	ldrh	r1, [r3, #4]
20025c58:	2900      	cmp	r1, #0
20025c5a:	d158      	bne.n	20025d0e <sif_bbm_init+0x202>
20025c5c:	809a      	strh	r2, [r3, #4]
20025c5e:	2502      	movs	r5, #2
20025c60:	f8df 9110 	ldr.w	r9, [pc, #272]	@ 20025d74 <sif_bbm_init+0x268>
20025c64:	f8d9 4000 	ldr.w	r4, [r9]
20025c68:	b124      	cbz	r4, 20025c74 <sif_bbm_init+0x168>
20025c6a:	4643      	mov	r3, r8
20025c6c:	463a      	mov	r2, r7
20025c6e:	4631      	mov	r1, r6
20025c70:	484a      	ldr	r0, [pc, #296]	@ (20025d9c <sif_bbm_init+0x290>)
20025c72:	47a0      	blx	r4
20025c74:	f8d9 3000 	ldr.w	r3, [r9]
20025c78:	b113      	cbz	r3, 20025c80 <sif_bbm_init+0x174>
20025c7a:	4629      	mov	r1, r5
20025c7c:	4848      	ldr	r0, [pc, #288]	@ (20025da0 <sif_bbm_init+0x294>)
20025c7e:	4798      	blx	r3
20025c80:	f035 0002 	bics.w	r0, r5, #2
20025c84:	d164      	bne.n	20025d50 <sif_bbm_init+0x244>
20025c86:	f7ff fcc9 	bl	2002561c <bbm_get_map_table>
20025c8a:	4605      	mov	r5, r0
20025c8c:	2001      	movs	r0, #1
20025c8e:	f7ff fcc5 	bl	2002561c <bbm_get_map_table>
20025c92:	f8d9 6000 	ldr.w	r6, [r9]
20025c96:	4604      	mov	r4, r0
20025c98:	b13e      	cbz	r6, 20025caa <sif_bbm_init+0x19e>
20025c9a:	4a3b      	ldr	r2, [pc, #236]	@ (20025d88 <sif_bbm_init+0x27c>)
20025c9c:	4629      	mov	r1, r5
20025c9e:	8a53      	ldrh	r3, [r2, #18]
20025ca0:	9300      	str	r3, [sp, #0]
20025ca2:	8a12      	ldrh	r2, [r2, #16]
20025ca4:	4603      	mov	r3, r0
20025ca6:	483f      	ldr	r0, [pc, #252]	@ (20025da4 <sif_bbm_init+0x298>)
20025ca8:	47b0      	blx	r6
20025caa:	42a5      	cmp	r5, r4
20025cac:	4c37      	ldr	r4, [pc, #220]	@ (20025d8c <sif_bbm_init+0x280>)
20025cae:	dd35      	ble.n	20025d1c <sif_bbm_init+0x210>
20025cb0:	f44f 7202 	mov.w	r2, #520	@ 0x208
20025cb4:	4621      	mov	r1, r4
20025cb6:	18a0      	adds	r0, r4, r2
20025cb8:	f004 fdb2 	bl	2002a820 <memcpy>
20025cbc:	f894 320f 	ldrb.w	r3, [r4, #527]	@ 0x20f
20025cc0:	2110      	movs	r1, #16
20025cc2:	f043 0380 	orr.w	r3, r3, #128	@ 0x80
20025cc6:	f884 320f 	strb.w	r3, [r4, #527]	@ 0x20f
20025cca:	f504 7002 	add.w	r0, r4, #520	@ 0x208
20025cce:	f7ff fbf1 	bl	200254b4 <bbm_crc_check>
20025cd2:	f8c4 0218 	str.w	r0, [r4, #536]	@ 0x218
20025cd6:	2001      	movs	r0, #1
20025cd8:	4b2b      	ldr	r3, [pc, #172]	@ (20025d88 <sif_bbm_init+0x27c>)
20025cda:	8a59      	ldrh	r1, [r3, #18]
20025cdc:	f7ff fdb6 	bl	2002584c <bbm_write_talbe.isra.0>
20025ce0:	6822      	ldr	r2, [r4, #0]
20025ce2:	4b2c      	ldr	r3, [pc, #176]	@ (20025d94 <sif_bbm_init+0x288>)
20025ce4:	429a      	cmp	r2, r3
20025ce6:	d12d      	bne.n	20025d44 <sif_bbm_init+0x238>
20025ce8:	4828      	ldr	r0, [pc, #160]	@ (20025d8c <sif_bbm_init+0x280>)
20025cea:	f7ff fb93 	bl	20025414 <bbm_map_check.part.0>
20025cee:	f8d9 4000 	ldr.w	r4, [r9]
20025cf2:	b12c      	cbz	r4, 20025d00 <sif_bbm_init+0x1f4>
20025cf4:	4b2c      	ldr	r3, [pc, #176]	@ (20025da8 <sif_bbm_init+0x29c>)
20025cf6:	4924      	ldr	r1, [pc, #144]	@ (20025d88 <sif_bbm_init+0x27c>)
20025cf8:	482c      	ldr	r0, [pc, #176]	@ (20025dac <sif_bbm_init+0x2a0>)
20025cfa:	f5a3 7202 	sub.w	r2, r3, #520	@ 0x208
20025cfe:	47a0      	blx	r4
20025d00:	f8d9 3000 	ldr.w	r3, [r9]
20025d04:	2b00      	cmp	r3, #0
20025d06:	f43f af10 	beq.w	20025b2a <sif_bbm_init+0x1e>
20025d0a:	4829      	ldr	r0, [pc, #164]	@ (20025db0 <sif_bbm_init+0x2a4>)
20025d0c:	e70c      	b.n	20025b28 <sif_bbm_init+0x1c>
20025d0e:	88d9      	ldrh	r1, [r3, #6]
20025d10:	2900      	cmp	r1, #0
20025d12:	d1a4      	bne.n	20025c5e <sif_bbm_init+0x152>
20025d14:	80da      	strh	r2, [r3, #6]
20025d16:	e7a2      	b.n	20025c5e <sif_bbm_init+0x152>
20025d18:	2501      	movs	r5, #1
20025d1a:	e7a1      	b.n	20025c60 <sif_bbm_init+0x154>
20025d1c:	dae0      	bge.n	20025ce0 <sif_bbm_init+0x1d4>
20025d1e:	f44f 7202 	mov.w	r2, #520	@ 0x208
20025d22:	4620      	mov	r0, r4
20025d24:	18a1      	adds	r1, r4, r2
20025d26:	f004 fd7b 	bl	2002a820 <memcpy>
20025d2a:	79e3      	ldrb	r3, [r4, #7]
20025d2c:	2110      	movs	r1, #16
20025d2e:	f023 0380 	bic.w	r3, r3, #128	@ 0x80
20025d32:	71e3      	strb	r3, [r4, #7]
20025d34:	4620      	mov	r0, r4
20025d36:	f7ff fbbd 	bl	200254b4 <bbm_crc_check>
20025d3a:	4b13      	ldr	r3, [pc, #76]	@ (20025d88 <sif_bbm_init+0x27c>)
20025d3c:	6120      	str	r0, [r4, #16]
20025d3e:	8a19      	ldrh	r1, [r3, #16]
20025d40:	2000      	movs	r0, #0
20025d42:	e7cb      	b.n	20025cdc <sif_bbm_init+0x1d0>
20025d44:	f8d9 3000 	ldr.w	r3, [r9]
20025d48:	b10b      	cbz	r3, 20025d4e <sif_bbm_init+0x242>
20025d4a:	481a      	ldr	r0, [pc, #104]	@ (20025db4 <sif_bbm_init+0x2a8>)
20025d4c:	4798      	blx	r3
20025d4e:	e7fe      	b.n	20025d4e <sif_bbm_init+0x242>
20025d50:	2d01      	cmp	r5, #1
20025d52:	d102      	bne.n	20025d5a <sif_bbm_init+0x24e>
20025d54:	f7ff fdb6 	bl	200258c4 <bbm_init_table>
20025d58:	e7c9      	b.n	20025cee <sif_bbm_init+0x1e2>
20025d5a:	f8d9 3000 	ldr.w	r3, [r9]
20025d5e:	b11b      	cbz	r3, 20025d68 <sif_bbm_init+0x25c>
20025d60:	f04f 31ff 	mov.w	r1, #4294967295
20025d64:	4814      	ldr	r0, [pc, #80]	@ (20025db8 <sif_bbm_init+0x2ac>)
20025d66:	4798      	blx	r3
20025d68:	e7fe      	b.n	20025d68 <sif_bbm_init+0x25c>
20025d6a:	f04f 30ff 	mov.w	r0, #4294967295
20025d6e:	e6dd      	b.n	20025b2c <sif_bbm_init+0x20>
20025d70:	2004cbe8 	.word	0x2004cbe8
20025d74:	2004cbe0 	.word	0x2004cbe0
20025d78:	2002ad07 	.word	0x2002ad07
20025d7c:	2004495c 	.word	0x2004495c
20025d80:	2004cbf0 	.word	0x2004cbf0
20025d84:	2004cbf4 	.word	0x2004cbf4
20025d88:	2004d008 	.word	0x2004d008
20025d8c:	2004cbf8 	.word	0x2004cbf8
20025d90:	2002ad35 	.word	0x2002ad35
20025d94:	5366424d 	.word	0x5366424d
20025d98:	2002ad41 	.word	0x2002ad41
20025d9c:	2002ad60 	.word	0x2002ad60
20025da0:	2002ad7f 	.word	0x2002ad7f
20025da4:	2002ad91 	.word	0x2002ad91
20025da8:	2004ce00 	.word	0x2004ce00
20025dac:	2002adec 	.word	0x2002adec
20025db0:	2002ae10 	.word	0x2002ae10
20025db4:	2002adb5 	.word	0x2002adb5
20025db8:	2002adcb 	.word	0x2002adcb
20025dbc:	20044958 	.word	0x20044958
20025dc0:	2004cbec 	.word	0x2004cbec
20025dc4:	2004cbe4 	.word	0x2004cbe4

20025dc8 <bbm_set_page_size>:
20025dc8:	4b01      	ldr	r3, [pc, #4]	@ (20025dd0 <bbm_set_page_size+0x8>)
20025dca:	6018      	str	r0, [r3, #0]
20025dcc:	4770      	bx	lr
20025dce:	bf00      	nop
20025dd0:	20044958 	.word	0x20044958

20025dd4 <bbm_set_blk_size>:
20025dd4:	4b01      	ldr	r3, [pc, #4]	@ (20025ddc <bbm_set_blk_size+0x8>)
20025dd6:	6018      	str	r0, [r3, #0]
20025dd8:	4770      	bx	lr
20025dda:	bf00      	nop
20025ddc:	2004495c 	.word	0x2004495c

20025de0 <mbedtls_md_info_from_type>:
20025de0:	3805      	subs	r0, #5
20025de2:	b2c0      	uxtb	r0, r0
20025de4:	2803      	cmp	r0, #3
20025de6:	bf9a      	itte	ls
20025de8:	4b02      	ldrls	r3, [pc, #8]	@ (20025df4 <mbedtls_md_info_from_type+0x14>)
20025dea:	f853 0020 	ldrls.w	r0, [r3, r0, lsl #2]
20025dee:	2000      	movhi	r0, #0
20025df0:	4770      	bx	lr
20025df2:	bf00      	nop
20025df4:	2002bc64 	.word	0x2002bc64

20025df8 <mbedtls_md_get_size>:
20025df8:	b100      	cbz	r0, 20025dfc <mbedtls_md_get_size+0x4>
20025dfa:	7a00      	ldrb	r0, [r0, #8]
20025dfc:	4770      	bx	lr

20025dfe <sha224_process_wrap>:
20025dfe:	f000 b8a9 	b.w	20025f54 <mbedtls_sha256_process>

20025e02 <sha224_clone_wrap>:
20025e02:	f000 b85a 	b.w	20025eba <mbedtls_sha256_clone>

20025e06 <sha224_ctx_free>:
20025e06:	b510      	push	{r4, lr}
20025e08:	4604      	mov	r4, r0
20025e0a:	f000 f84c 	bl	20025ea6 <mbedtls_sha256_free>
20025e0e:	4620      	mov	r0, r4
20025e10:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
20025e14:	f004 bc24 	b.w	2002a660 <free>

20025e18 <sha224_ctx_alloc>:
20025e18:	b510      	push	{r4, lr}
20025e1a:	216c      	movs	r1, #108	@ 0x6c
20025e1c:	2001      	movs	r0, #1
20025e1e:	f004 fc03 	bl	2002a628 <calloc>
20025e22:	4604      	mov	r4, r0
20025e24:	b108      	cbz	r0, 20025e2a <sha224_ctx_alloc+0x12>
20025e26:	f000 f83a 	bl	20025e9e <mbedtls_sha256_init>
20025e2a:	4620      	mov	r0, r4
20025e2c:	bd10      	pop	{r4, pc}

20025e2e <sha224_wrap>:
20025e2e:	2301      	movs	r3, #1
20025e30:	f000 bc94 	b.w	2002675c <mbedtls_sha256>

20025e34 <sha256_wrap>:
20025e34:	2300      	movs	r3, #0
20025e36:	f000 bc91 	b.w	2002675c <mbedtls_sha256>

20025e3a <sha224_finish_wrap>:
20025e3a:	f000 bc21 	b.w	20026680 <mbedtls_sha256_finish>

20025e3e <sha224_update_wrap>:
20025e3e:	f000 bc1b 	b.w	20026678 <mbedtls_sha256_update>

20025e42 <sha224_starts_wrap>:
20025e42:	2101      	movs	r1, #1
20025e44:	f000 b83e 	b.w	20025ec4 <mbedtls_sha256_starts>

20025e48 <sha256_starts_wrap>:
20025e48:	2100      	movs	r1, #0
20025e4a:	f000 b83b 	b.w	20025ec4 <mbedtls_sha256_starts>

20025e4e <sha384_process_wrap>:
20025e4e:	f000 bd8f 	b.w	20026970 <mbedtls_sha512_process>

20025e52 <sha384_clone_wrap>:
20025e52:	f000 bcf5 	b.w	20026840 <mbedtls_sha512_clone>

20025e56 <sha384_ctx_free>:
20025e56:	b510      	push	{r4, lr}
20025e58:	4604      	mov	r4, r0
20025e5a:	f000 fce7 	bl	2002682c <mbedtls_sha512_free>
20025e5e:	4620      	mov	r0, r4
20025e60:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
20025e64:	f004 bbfc 	b.w	2002a660 <free>

20025e68 <sha384_ctx_alloc>:
20025e68:	b510      	push	{r4, lr}
20025e6a:	21d8      	movs	r1, #216	@ 0xd8
20025e6c:	2001      	movs	r0, #1
20025e6e:	f004 fbdb 	bl	2002a628 <calloc>
20025e72:	4604      	mov	r4, r0
20025e74:	b108      	cbz	r0, 20025e7a <sha384_ctx_alloc+0x12>
20025e76:	f000 fcd5 	bl	20026824 <mbedtls_sha512_init>
20025e7a:	4620      	mov	r0, r4
20025e7c:	bd10      	pop	{r4, pc}

20025e7e <sha384_wrap>:
20025e7e:	2301      	movs	r3, #1
20025e80:	f001 bbfa 	b.w	20027678 <mbedtls_sha512>

20025e84 <sha512_wrap>:
20025e84:	2300      	movs	r3, #0
20025e86:	f001 bbf7 	b.w	20027678 <mbedtls_sha512>

20025e8a <sha384_finish_wrap>:
20025e8a:	f001 baef 	b.w	2002746c <mbedtls_sha512_finish>

20025e8e <sha384_update_wrap>:
20025e8e:	f001 bae8 	b.w	20027462 <mbedtls_sha512_update>

20025e92 <sha384_starts_wrap>:
20025e92:	2101      	movs	r1, #1
20025e94:	f000 bcdc 	b.w	20026850 <mbedtls_sha512_starts>

20025e98 <sha512_starts_wrap>:
20025e98:	2100      	movs	r1, #0
20025e9a:	f000 bcd9 	b.w	20026850 <mbedtls_sha512_starts>

20025e9e <mbedtls_sha256_init>:
20025e9e:	226c      	movs	r2, #108	@ 0x6c
20025ea0:	2100      	movs	r1, #0
20025ea2:	f004 bca3 	b.w	2002a7ec <memset>

20025ea6 <mbedtls_sha256_free>:
20025ea6:	b138      	cbz	r0, 20025eb8 <mbedtls_sha256_free+0x12>
20025ea8:	2100      	movs	r1, #0
20025eaa:	f100 036c 	add.w	r3, r0, #108	@ 0x6c
20025eae:	4602      	mov	r2, r0
20025eb0:	3001      	adds	r0, #1
20025eb2:	4298      	cmp	r0, r3
20025eb4:	7011      	strb	r1, [r2, #0]
20025eb6:	d1fa      	bne.n	20025eae <mbedtls_sha256_free+0x8>
20025eb8:	4770      	bx	lr

20025eba <mbedtls_sha256_clone>:
20025eba:	b508      	push	{r3, lr}
20025ebc:	226c      	movs	r2, #108	@ 0x6c
20025ebe:	f004 fcaf 	bl	2002a820 <memcpy>
20025ec2:	bd08      	pop	{r3, pc}

20025ec4 <mbedtls_sha256_starts>:
20025ec4:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
20025ec8:	b1c1      	cbz	r1, 20025efc <mbedtls_sha256_starts+0x38>
20025eca:	f8df e078 	ldr.w	lr, [pc, #120]	@ 20025f44 <mbedtls_sha256_starts+0x80>
20025ece:	f8df c078 	ldr.w	ip, [pc, #120]	@ 20025f48 <mbedtls_sha256_starts+0x84>
20025ed2:	4f10      	ldr	r7, [pc, #64]	@ (20025f14 <mbedtls_sha256_starts+0x50>)
20025ed4:	4e10      	ldr	r6, [pc, #64]	@ (20025f18 <mbedtls_sha256_starts+0x54>)
20025ed6:	4d11      	ldr	r5, [pc, #68]	@ (20025f1c <mbedtls_sha256_starts+0x58>)
20025ed8:	4c11      	ldr	r4, [pc, #68]	@ (20025f20 <mbedtls_sha256_starts+0x5c>)
20025eda:	4a12      	ldr	r2, [pc, #72]	@ (20025f24 <mbedtls_sha256_starts+0x60>)
20025edc:	4b12      	ldr	r3, [pc, #72]	@ (20025f28 <mbedtls_sha256_starts+0x64>)
20025ede:	f04f 0800 	mov.w	r8, #0
20025ee2:	e9c0 ec02 	strd	lr, ip, [r0, #8]
20025ee6:	e9c0 8800 	strd	r8, r8, [r0]
20025eea:	e9c0 7604 	strd	r7, r6, [r0, #16]
20025eee:	e9c0 5406 	strd	r5, r4, [r0, #24]
20025ef2:	e9c0 2308 	strd	r2, r3, [r0, #32]
20025ef6:	6681      	str	r1, [r0, #104]	@ 0x68
20025ef8:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
20025efc:	f8df e04c 	ldr.w	lr, [pc, #76]	@ 20025f4c <mbedtls_sha256_starts+0x88>
20025f00:	f8df c04c 	ldr.w	ip, [pc, #76]	@ 20025f50 <mbedtls_sha256_starts+0x8c>
20025f04:	4f09      	ldr	r7, [pc, #36]	@ (20025f2c <mbedtls_sha256_starts+0x68>)
20025f06:	4e0a      	ldr	r6, [pc, #40]	@ (20025f30 <mbedtls_sha256_starts+0x6c>)
20025f08:	4d0a      	ldr	r5, [pc, #40]	@ (20025f34 <mbedtls_sha256_starts+0x70>)
20025f0a:	4c0b      	ldr	r4, [pc, #44]	@ (20025f38 <mbedtls_sha256_starts+0x74>)
20025f0c:	4a0b      	ldr	r2, [pc, #44]	@ (20025f3c <mbedtls_sha256_starts+0x78>)
20025f0e:	4b0c      	ldr	r3, [pc, #48]	@ (20025f40 <mbedtls_sha256_starts+0x7c>)
20025f10:	e7e5      	b.n	20025ede <mbedtls_sha256_starts+0x1a>
20025f12:	bf00      	nop
20025f14:	3070dd17 	.word	0x3070dd17
20025f18:	f70e5939 	.word	0xf70e5939
20025f1c:	ffc00b31 	.word	0xffc00b31
20025f20:	68581511 	.word	0x68581511
20025f24:	64f98fa7 	.word	0x64f98fa7
20025f28:	befa4fa4 	.word	0xbefa4fa4
20025f2c:	3c6ef372 	.word	0x3c6ef372
20025f30:	a54ff53a 	.word	0xa54ff53a
20025f34:	510e527f 	.word	0x510e527f
20025f38:	9b05688c 	.word	0x9b05688c
20025f3c:	1f83d9ab 	.word	0x1f83d9ab
20025f40:	5be0cd19 	.word	0x5be0cd19
20025f44:	c1059ed8 	.word	0xc1059ed8
20025f48:	367cd507 	.word	0x367cd507
20025f4c:	6a09e667 	.word	0x6a09e667
20025f50:	bb67ae85 	.word	0xbb67ae85

20025f54 <mbedtls_sha256_process>:
20025f54:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20025f58:	b0cf      	sub	sp, #316	@ 0x13c
20025f5a:	aa06      	add	r2, sp, #24
20025f5c:	460b      	mov	r3, r1
20025f5e:	4616      	mov	r6, r2
20025f60:	9004      	str	r0, [sp, #16]
20025f62:	f100 0408 	add.w	r4, r0, #8
20025f66:	f100 0728 	add.w	r7, r0, #40	@ 0x28
20025f6a:	4635      	mov	r5, r6
20025f6c:	6820      	ldr	r0, [r4, #0]
20025f6e:	6861      	ldr	r1, [r4, #4]
20025f70:	3408      	adds	r4, #8
20025f72:	c503      	stmia	r5!, {r0, r1}
20025f74:	42bc      	cmp	r4, r7
20025f76:	462e      	mov	r6, r5
20025f78:	d1f7      	bne.n	20025f6a <mbedtls_sha256_process+0x16>
20025f7a:	f10d 0a38 	add.w	sl, sp, #56	@ 0x38
20025f7e:	4619      	mov	r1, r3
20025f80:	4650      	mov	r0, sl
20025f82:	f103 0440 	add.w	r4, r3, #64	@ 0x40
20025f86:	784b      	ldrb	r3, [r1, #1]
20025f88:	780d      	ldrb	r5, [r1, #0]
20025f8a:	041b      	lsls	r3, r3, #16
20025f8c:	ea43 6305 	orr.w	r3, r3, r5, lsl #24
20025f90:	78cd      	ldrb	r5, [r1, #3]
20025f92:	3104      	adds	r1, #4
20025f94:	432b      	orrs	r3, r5
20025f96:	f811 5c02 	ldrb.w	r5, [r1, #-2]
20025f9a:	428c      	cmp	r4, r1
20025f9c:	ea43 2305 	orr.w	r3, r3, r5, lsl #8
20025fa0:	f840 3b04 	str.w	r3, [r0], #4
20025fa4:	d1ef      	bne.n	20025f86 <mbedtls_sha256_process+0x32>
20025fa6:	4996      	ldr	r1, [pc, #600]	@ (20026200 <mbedtls_sha256_process+0x2ac>)
20025fa8:	46d4      	mov	ip, sl
20025faa:	e9d2 e705 	ldrd	lr, r7, [r2, #20]
20025fae:	e9d2 9600 	ldrd	r9, r6, [r2]
20025fb2:	460d      	mov	r5, r1
20025fb4:	9100      	str	r1, [sp, #0]
20025fb6:	f8d2 801c 	ldr.w	r8, [r2, #28]
20025fba:	f8d2 b010 	ldr.w	fp, [r2, #16]
20025fbe:	e9d2 3202 	ldrd	r3, r2, [r2, #8]
20025fc2:	6829      	ldr	r1, [r5, #0]
20025fc4:	f8dc 0000 	ldr.w	r0, [ip]
20025fc8:	ea4f 24fb 	mov.w	r4, fp, ror #11
20025fcc:	ea84 14bb 	eor.w	r4, r4, fp, ror #6
20025fd0:	4401      	add	r1, r0
20025fd2:	ea87 000e 	eor.w	r0, r7, lr
20025fd6:	ea84 647b 	eor.w	r4, r4, fp, ror #25
20025fda:	ea00 000b 	and.w	r0, r0, fp
20025fde:	4078      	eors	r0, r7
20025fe0:	4421      	add	r1, r4
20025fe2:	4401      	add	r1, r0
20025fe4:	4441      	add	r1, r8
20025fe6:	ea4f 3879 	mov.w	r8, r9, ror #13
20025fea:	ea88 08b9 	eor.w	r8, r8, r9, ror #2
20025fee:	ea88 58b9 	eor.w	r8, r8, r9, ror #22
20025ff2:	440a      	add	r2, r1
20025ff4:	4488      	add	r8, r1
20025ff6:	ea49 0106 	orr.w	r1, r9, r6
20025ffa:	ea09 0006 	and.w	r0, r9, r6
20025ffe:	4019      	ands	r1, r3
20026000:	4301      	orrs	r1, r0
20026002:	4488      	add	r8, r1
20026004:	f8dc 0004 	ldr.w	r0, [ip, #4]
20026008:	6869      	ldr	r1, [r5, #4]
2002600a:	ea4f 3478 	mov.w	r4, r8, ror #13
2002600e:	4401      	add	r1, r0
20026010:	ea8b 000e 	eor.w	r0, fp, lr
20026014:	4010      	ands	r0, r2
20026016:	ea80 000e 	eor.w	r0, r0, lr
2002601a:	4439      	add	r1, r7
2002601c:	4401      	add	r1, r0
2002601e:	ea4f 20f2 	mov.w	r0, r2, ror #11
20026022:	ea80 10b2 	eor.w	r0, r0, r2, ror #6
20026026:	ea80 6072 	eor.w	r0, r0, r2, ror #25
2002602a:	ea84 04b8 	eor.w	r4, r4, r8, ror #2
2002602e:	4401      	add	r1, r0
20026030:	ea84 54b8 	eor.w	r4, r4, r8, ror #22
20026034:	440b      	add	r3, r1
20026036:	440c      	add	r4, r1
20026038:	ea48 0109 	orr.w	r1, r8, r9
2002603c:	ea08 0009 	and.w	r0, r8, r9
20026040:	4031      	ands	r1, r6
20026042:	4301      	orrs	r1, r0
20026044:	440c      	add	r4, r1
20026046:	f8dc 0008 	ldr.w	r0, [ip, #8]
2002604a:	68a9      	ldr	r1, [r5, #8]
2002604c:	ea82 0703 	eor.w	r7, r2, r3
20026050:	4401      	add	r1, r0
20026052:	ea82 000b 	eor.w	r0, r2, fp
20026056:	4018      	ands	r0, r3
20026058:	ea80 000b 	eor.w	r0, r0, fp
2002605c:	4471      	add	r1, lr
2002605e:	4401      	add	r1, r0
20026060:	ea4f 20f3 	mov.w	r0, r3, ror #11
20026064:	ea80 10b3 	eor.w	r0, r0, r3, ror #6
20026068:	ea80 6073 	eor.w	r0, r0, r3, ror #25
2002606c:	4401      	add	r1, r0
2002606e:	ea4f 3074 	mov.w	r0, r4, ror #13
20026072:	ea80 00b4 	eor.w	r0, r0, r4, ror #2
20026076:	ea80 50b4 	eor.w	r0, r0, r4, ror #22
2002607a:	eb06 0e01 	add.w	lr, r6, r1
2002607e:	4408      	add	r0, r1
20026080:	ea48 0104 	orr.w	r1, r8, r4
20026084:	ea08 0604 	and.w	r6, r8, r4
20026088:	ea01 0109 	and.w	r1, r1, r9
2002608c:	4331      	orrs	r1, r6
2002608e:	4408      	add	r0, r1
20026090:	f8dc 600c 	ldr.w	r6, [ip, #12]
20026094:	68e9      	ldr	r1, [r5, #12]
20026096:	ea07 070e 	and.w	r7, r7, lr
2002609a:	440e      	add	r6, r1
2002609c:	ea4f 21fe 	mov.w	r1, lr, ror #11
200260a0:	4057      	eors	r7, r2
200260a2:	445e      	add	r6, fp
200260a4:	ea81 11be 	eor.w	r1, r1, lr, ror #6
200260a8:	ea81 617e 	eor.w	r1, r1, lr, ror #25
200260ac:	443e      	add	r6, r7
200260ae:	440e      	add	r6, r1
200260b0:	ea4f 3170 	mov.w	r1, r0, ror #13
200260b4:	ea81 01b0 	eor.w	r1, r1, r0, ror #2
200260b8:	ea81 51b0 	eor.w	r1, r1, r0, ror #22
200260bc:	44b1      	add	r9, r6
200260be:	4431      	add	r1, r6
200260c0:	ea44 0600 	orr.w	r6, r4, r0
200260c4:	ea04 0700 	and.w	r7, r4, r0
200260c8:	ea06 0608 	and.w	r6, r6, r8
200260cc:	433e      	orrs	r6, r7
200260ce:	4431      	add	r1, r6
200260d0:	f8dc 7010 	ldr.w	r7, [ip, #16]
200260d4:	692e      	ldr	r6, [r5, #16]
200260d6:	3520      	adds	r5, #32
200260d8:	443e      	add	r6, r7
200260da:	4416      	add	r6, r2
200260dc:	ea83 020e 	eor.w	r2, r3, lr
200260e0:	ea02 0209 	and.w	r2, r2, r9
200260e4:	405a      	eors	r2, r3
200260e6:	4416      	add	r6, r2
200260e8:	ea4f 22f9 	mov.w	r2, r9, ror #11
200260ec:	ea82 12b9 	eor.w	r2, r2, r9, ror #6
200260f0:	ea82 6279 	eor.w	r2, r2, r9, ror #25
200260f4:	4416      	add	r6, r2
200260f6:	ea4f 3271 	mov.w	r2, r1, ror #13
200260fa:	ea82 02b1 	eor.w	r2, r2, r1, ror #2
200260fe:	ea82 52b1 	eor.w	r2, r2, r1, ror #22
20026102:	44b0      	add	r8, r6
20026104:	4432      	add	r2, r6
20026106:	ea40 0601 	orr.w	r6, r0, r1
2002610a:	ea00 0701 	and.w	r7, r0, r1
2002610e:	4026      	ands	r6, r4
20026110:	433e      	orrs	r6, r7
20026112:	4432      	add	r2, r6
20026114:	f8dc 7014 	ldr.w	r7, [ip, #20]
20026118:	f855 6c0c 	ldr.w	r6, [r5, #-12]
2002611c:	f10c 0c20 	add.w	ip, ip, #32
20026120:	443e      	add	r6, r7
20026122:	441e      	add	r6, r3
20026124:	ea8e 0309 	eor.w	r3, lr, r9
20026128:	ea03 0308 	and.w	r3, r3, r8
2002612c:	ea83 030e 	eor.w	r3, r3, lr
20026130:	441e      	add	r6, r3
20026132:	ea4f 23f8 	mov.w	r3, r8, ror #11
20026136:	ea83 13b8 	eor.w	r3, r3, r8, ror #6
2002613a:	ea83 6378 	eor.w	r3, r3, r8, ror #25
2002613e:	441e      	add	r6, r3
20026140:	ea4f 3372 	mov.w	r3, r2, ror #13
20026144:	ea83 03b2 	eor.w	r3, r3, r2, ror #2
20026148:	19a7      	adds	r7, r4, r6
2002614a:	ea83 53b2 	eor.w	r3, r3, r2, ror #22
2002614e:	ea41 0402 	orr.w	r4, r1, r2
20026152:	4433      	add	r3, r6
20026154:	4004      	ands	r4, r0
20026156:	ea01 0602 	and.w	r6, r1, r2
2002615a:	4334      	orrs	r4, r6
2002615c:	4423      	add	r3, r4
2002615e:	f85c 6c08 	ldr.w	r6, [ip, #-8]
20026162:	f855 4c08 	ldr.w	r4, [r5, #-8]
20026166:	4434      	add	r4, r6
20026168:	ea89 0608 	eor.w	r6, r9, r8
2002616c:	403e      	ands	r6, r7
2002616e:	ea86 0609 	eor.w	r6, r6, r9
20026172:	4474      	add	r4, lr
20026174:	4434      	add	r4, r6
20026176:	ea4f 26f7 	mov.w	r6, r7, ror #11
2002617a:	ea86 16b7 	eor.w	r6, r6, r7, ror #6
2002617e:	ea86 6677 	eor.w	r6, r6, r7, ror #25
20026182:	4434      	add	r4, r6
20026184:	eb00 0e04 	add.w	lr, r0, r4
20026188:	ea4f 3073 	mov.w	r0, r3, ror #13
2002618c:	ea80 00b3 	eor.w	r0, r0, r3, ror #2
20026190:	ea80 50b3 	eor.w	r0, r0, r3, ror #22
20026194:	4420      	add	r0, r4
20026196:	ea42 0403 	orr.w	r4, r2, r3
2002619a:	400c      	ands	r4, r1
2002619c:	ea02 0603 	and.w	r6, r2, r3
200261a0:	4334      	orrs	r4, r6
200261a2:	1906      	adds	r6, r0, r4
200261a4:	f855 0c04 	ldr.w	r0, [r5, #-4]
200261a8:	f85c 4c04 	ldr.w	r4, [ip, #-4]
200261ac:	4420      	add	r0, r4
200261ae:	ea88 0407 	eor.w	r4, r8, r7
200261b2:	ea04 040e 	and.w	r4, r4, lr
200261b6:	4448      	add	r0, r9
200261b8:	ea84 0408 	eor.w	r4, r4, r8
200261bc:	4420      	add	r0, r4
200261be:	ea4f 24fe 	mov.w	r4, lr, ror #11
200261c2:	ea84 14be 	eor.w	r4, r4, lr, ror #6
200261c6:	ea84 647e 	eor.w	r4, r4, lr, ror #25
200261ca:	4420      	add	r0, r4
200261cc:	eb01 0b00 	add.w	fp, r1, r0
200261d0:	ea4f 3176 	mov.w	r1, r6, ror #13
200261d4:	ea81 01b6 	eor.w	r1, r1, r6, ror #2
200261d8:	ea81 51b6 	eor.w	r1, r1, r6, ror #22
200261dc:	4401      	add	r1, r0
200261de:	ea43 0006 	orr.w	r0, r3, r6
200261e2:	4010      	ands	r0, r2
200261e4:	ea03 0406 	and.w	r4, r3, r6
200261e8:	4320      	orrs	r0, r4
200261ea:	eb01 0900 	add.w	r9, r1, r0
200261ee:	4905      	ldr	r1, [pc, #20]	@ (20026204 <mbedtls_sha256_process+0x2b0>)
200261f0:	42a9      	cmp	r1, r5
200261f2:	f47f aee6 	bne.w	20025fc2 <mbedtls_sha256_process+0x6e>
200261f6:	f10a 01c0 	add.w	r1, sl, #192	@ 0xc0
200261fa:	9105      	str	r1, [sp, #20]
200261fc:	e004      	b.n	20026208 <mbedtls_sha256_process+0x2b4>
200261fe:	bf00      	nop
20026200:	2002bd74 	.word	0x2002bd74
20026204:	2002bdb4 	.word	0x2002bdb4
20026208:	f8da 1038 	ldr.w	r1, [sl, #56]	@ 0x38
2002620c:	f8da 5004 	ldr.w	r5, [sl, #4]
20026210:	ea4f 44f1 	mov.w	r4, r1, ror #19
20026214:	ea84 4471 	eor.w	r4, r4, r1, ror #17
20026218:	f8da 0000 	ldr.w	r0, [sl]
2002621c:	ea84 2491 	eor.w	r4, r4, r1, lsr #10
20026220:	f8da 1024 	ldr.w	r1, [sl, #36]	@ 0x24
20026224:	f10a 0a20 	add.w	sl, sl, #32
20026228:	4401      	add	r1, r0
2002622a:	ea4f 40b5 	mov.w	r0, r5, ror #18
2002622e:	ea80 10f5 	eor.w	r0, r0, r5, ror #7
20026232:	ea80 00d5 	eor.w	r0, r0, r5, lsr #3
20026236:	4421      	add	r1, r4
20026238:	4401      	add	r1, r0
2002623a:	9103      	str	r1, [sp, #12]
2002623c:	ea87 000e 	eor.w	r0, r7, lr
20026240:	9900      	ldr	r1, [sp, #0]
20026242:	ea4f 24fb 	mov.w	r4, fp, ror #11
20026246:	ea84 14bb 	eor.w	r4, r4, fp, ror #6
2002624a:	ea00 000b 	and.w	r0, r0, fp
2002624e:	ea84 647b 	eor.w	r4, r4, fp, ror #25
20026252:	6c09      	ldr	r1, [r1, #64]	@ 0x40
20026254:	4078      	eors	r0, r7
20026256:	4420      	add	r0, r4
20026258:	4401      	add	r1, r0
2002625a:	9803      	ldr	r0, [sp, #12]
2002625c:	ea4f 3479 	mov.w	r4, r9, ror #13
20026260:	4401      	add	r1, r0
20026262:	4441      	add	r1, r8
20026264:	eb02 0801 	add.w	r8, r2, r1
20026268:	ea49 0206 	orr.w	r2, r9, r6
2002626c:	f8ca 0020 	str.w	r0, [sl, #32]
20026270:	ea84 04b9 	eor.w	r4, r4, r9, ror #2
20026274:	ea09 0006 	and.w	r0, r9, r6
20026278:	401a      	ands	r2, r3
2002627a:	4302      	orrs	r2, r0
2002627c:	ea84 54b9 	eor.w	r4, r4, r9, ror #22
20026280:	4414      	add	r4, r2
20026282:	f8da 201c 	ldr.w	r2, [sl, #28]
20026286:	440c      	add	r4, r1
20026288:	ea4f 4cf2 	mov.w	ip, r2, ror #19
2002628c:	ea8c 4c72 	eor.w	ip, ip, r2, ror #17
20026290:	f85a 1c18 	ldr.w	r1, [sl, #-24]
20026294:	ea8c 2c92 	eor.w	ip, ip, r2, lsr #10
20026298:	f8da 2008 	ldr.w	r2, [sl, #8]
2002629c:	18a8      	adds	r0, r5, r2
2002629e:	ea4f 42b1 	mov.w	r2, r1, ror #18
200262a2:	ea82 12f1 	eor.w	r2, r2, r1, ror #7
200262a6:	ea82 02d1 	eor.w	r2, r2, r1, lsr #3
200262aa:	4460      	add	r0, ip
200262ac:	4410      	add	r0, r2
200262ae:	9a00      	ldr	r2, [sp, #0]
200262b0:	ea8b 050e 	eor.w	r5, fp, lr
200262b4:	6c52      	ldr	r2, [r2, #68]	@ 0x44
200262b6:	ea05 0508 	and.w	r5, r5, r8
200262ba:	443a      	add	r2, r7
200262bc:	4402      	add	r2, r0
200262be:	ea85 050e 	eor.w	r5, r5, lr
200262c2:	4415      	add	r5, r2
200262c4:	ea4f 22f8 	mov.w	r2, r8, ror #11
200262c8:	ea82 12b8 	eor.w	r2, r2, r8, ror #6
200262cc:	ea82 6278 	eor.w	r2, r2, r8, ror #25
200262d0:	442a      	add	r2, r5
200262d2:	4413      	add	r3, r2
200262d4:	9301      	str	r3, [sp, #4]
200262d6:	ea49 0504 	orr.w	r5, r9, r4
200262da:	ea4f 3374 	mov.w	r3, r4, ror #13
200262de:	ea09 0704 	and.w	r7, r9, r4
200262e2:	ea83 03b4 	eor.w	r3, r3, r4, ror #2
200262e6:	4035      	ands	r5, r6
200262e8:	433d      	orrs	r5, r7
200262ea:	ea83 53b4 	eor.w	r3, r3, r4, ror #22
200262ee:	442b      	add	r3, r5
200262f0:	4413      	add	r3, r2
200262f2:	9a03      	ldr	r2, [sp, #12]
200262f4:	f85a 5c14 	ldr.w	r5, [sl, #-20]
200262f8:	ea4f 4cf2 	mov.w	ip, r2, ror #19
200262fc:	ea8c 4c72 	eor.w	ip, ip, r2, ror #17
20026300:	ea8c 2c92 	eor.w	ip, ip, r2, lsr #10
20026304:	f8da 200c 	ldr.w	r2, [sl, #12]
20026308:	f8ca 0024 	str.w	r0, [sl, #36]	@ 0x24
2002630c:	188f      	adds	r7, r1, r2
2002630e:	ea4f 42b5 	mov.w	r2, r5, ror #18
20026312:	ea82 12f5 	eor.w	r2, r2, r5, ror #7
20026316:	ea82 02d5 	eor.w	r2, r2, r5, lsr #3
2002631a:	4467      	add	r7, ip
2002631c:	4417      	add	r7, r2
2002631e:	9a01      	ldr	r2, [sp, #4]
20026320:	ea8b 0108 	eor.w	r1, fp, r8
20026324:	4011      	ands	r1, r2
20026326:	9a00      	ldr	r2, [sp, #0]
20026328:	ea81 010b 	eor.w	r1, r1, fp
2002632c:	6c92      	ldr	r2, [r2, #72]	@ 0x48
2002632e:	f8ca 7028 	str.w	r7, [sl, #40]	@ 0x28
20026332:	4472      	add	r2, lr
20026334:	443a      	add	r2, r7
20026336:	eb01 0c02 	add.w	ip, r1, r2
2002633a:	9a01      	ldr	r2, [sp, #4]
2002633c:	9901      	ldr	r1, [sp, #4]
2002633e:	ea4f 22f2 	mov.w	r2, r2, ror #11
20026342:	ea82 12b1 	eor.w	r2, r2, r1, ror #6
20026346:	ea82 6271 	eor.w	r2, r2, r1, ror #25
2002634a:	4462      	add	r2, ip
2002634c:	18b1      	adds	r1, r6, r2
2002634e:	9102      	str	r1, [sp, #8]
20026350:	ea44 0603 	orr.w	r6, r4, r3
20026354:	ea4f 3173 	mov.w	r1, r3, ror #13
20026358:	ea04 0c03 	and.w	ip, r4, r3
2002635c:	ea81 01b3 	eor.w	r1, r1, r3, ror #2
20026360:	ea06 0609 	and.w	r6, r6, r9
20026364:	ea46 060c 	orr.w	r6, r6, ip
20026368:	ea81 51b3 	eor.w	r1, r1, r3, ror #22
2002636c:	4431      	add	r1, r6
2002636e:	4411      	add	r1, r2
20026370:	ea4f 42f0 	mov.w	r2, r0, ror #19
20026374:	ea82 4270 	eor.w	r2, r2, r0, ror #17
20026378:	f85a 6c10 	ldr.w	r6, [sl, #-16]
2002637c:	ea82 2090 	eor.w	r0, r2, r0, lsr #10
20026380:	f8da 2010 	ldr.w	r2, [sl, #16]
20026384:	ea03 0e01 	and.w	lr, r3, r1
20026388:	4415      	add	r5, r2
2002638a:	ea4f 42b6 	mov.w	r2, r6, ror #18
2002638e:	ea82 12f6 	eor.w	r2, r2, r6, ror #7
20026392:	ea82 02d6 	eor.w	r2, r2, r6, lsr #3
20026396:	4405      	add	r5, r0
20026398:	4415      	add	r5, r2
2002639a:	9a01      	ldr	r2, [sp, #4]
2002639c:	ea88 0002 	eor.w	r0, r8, r2
200263a0:	9a02      	ldr	r2, [sp, #8]
200263a2:	4010      	ands	r0, r2
200263a4:	9a00      	ldr	r2, [sp, #0]
200263a6:	ea80 0008 	eor.w	r0, r0, r8
200263aa:	6cd2      	ldr	r2, [r2, #76]	@ 0x4c
200263ac:	f8ca 502c 	str.w	r5, [sl, #44]	@ 0x2c
200263b0:	445a      	add	r2, fp
200263b2:	442a      	add	r2, r5
200263b4:	eb00 0c02 	add.w	ip, r0, r2
200263b8:	9a02      	ldr	r2, [sp, #8]
200263ba:	9802      	ldr	r0, [sp, #8]
200263bc:	ea4f 22f2 	mov.w	r2, r2, ror #11
200263c0:	ea82 12b0 	eor.w	r2, r2, r0, ror #6
200263c4:	ea82 6270 	eor.w	r2, r2, r0, ror #25
200263c8:	4462      	add	r2, ip
200263ca:	ea4f 3071 	mov.w	r0, r1, ror #13
200263ce:	ea43 0c01 	orr.w	ip, r3, r1
200263d2:	ea80 00b1 	eor.w	r0, r0, r1, ror #2
200263d6:	ea0c 0c04 	and.w	ip, ip, r4
200263da:	ea4c 0c0e 	orr.w	ip, ip, lr
200263de:	ea80 50b1 	eor.w	r0, r0, r1, ror #22
200263e2:	4460      	add	r0, ip
200263e4:	4410      	add	r0, r2
200263e6:	4491      	add	r9, r2
200263e8:	ea4f 42f7 	mov.w	r2, r7, ror #19
200263ec:	ea82 4277 	eor.w	r2, r2, r7, ror #17
200263f0:	f85a cc0c 	ldr.w	ip, [sl, #-12]
200263f4:	ea82 2797 	eor.w	r7, r2, r7, lsr #10
200263f8:	f8da 2014 	ldr.w	r2, [sl, #20]
200263fc:	ea01 0e00 	and.w	lr, r1, r0
20026400:	4416      	add	r6, r2
20026402:	ea4f 42bc 	mov.w	r2, ip, ror #18
20026406:	ea82 12fc 	eor.w	r2, r2, ip, ror #7
2002640a:	ea82 02dc 	eor.w	r2, r2, ip, lsr #3
2002640e:	443e      	add	r6, r7
20026410:	4416      	add	r6, r2
20026412:	e9dd 2701 	ldrd	r2, r7, [sp, #4]
20026416:	4057      	eors	r7, r2
20026418:	ea07 0709 	and.w	r7, r7, r9
2002641c:	4057      	eors	r7, r2
2002641e:	9a00      	ldr	r2, [sp, #0]
20026420:	f8ca 6030 	str.w	r6, [sl, #48]	@ 0x30
20026424:	6d12      	ldr	r2, [r2, #80]	@ 0x50
20026426:	4432      	add	r2, r6
20026428:	4442      	add	r2, r8
2002642a:	443a      	add	r2, r7
2002642c:	ea4f 27f9 	mov.w	r7, r9, ror #11
20026430:	ea87 17b9 	eor.w	r7, r7, r9, ror #6
20026434:	ea87 6779 	eor.w	r7, r7, r9, ror #25
20026438:	4417      	add	r7, r2
2002643a:	eb04 0807 	add.w	r8, r4, r7
2002643e:	ea4f 3270 	mov.w	r2, r0, ror #13
20026442:	ea41 0400 	orr.w	r4, r1, r0
20026446:	ea82 02b0 	eor.w	r2, r2, r0, ror #2
2002644a:	401c      	ands	r4, r3
2002644c:	ea44 040e 	orr.w	r4, r4, lr
20026450:	ea82 52b0 	eor.w	r2, r2, r0, ror #22
20026454:	4422      	add	r2, r4
20026456:	ea4f 44f5 	mov.w	r4, r5, ror #19
2002645a:	ea84 4475 	eor.w	r4, r4, r5, ror #17
2002645e:	ea84 2495 	eor.w	r4, r4, r5, lsr #10
20026462:	f8da 5018 	ldr.w	r5, [sl, #24]
20026466:	f85a ec08 	ldr.w	lr, [sl, #-8]
2002646a:	4465      	add	r5, ip
2002646c:	4425      	add	r5, r4
2002646e:	ea4f 44be 	mov.w	r4, lr, ror #18
20026472:	ea84 14fe 	eor.w	r4, r4, lr, ror #7
20026476:	ea84 04de 	eor.w	r4, r4, lr, lsr #3
2002647a:	4425      	add	r5, r4
2002647c:	9c02      	ldr	r4, [sp, #8]
2002647e:	443a      	add	r2, r7
20026480:	ea84 0709 	eor.w	r7, r4, r9
20026484:	ea07 0708 	and.w	r7, r7, r8
20026488:	ea87 0c04 	eor.w	ip, r7, r4
2002648c:	9c00      	ldr	r4, [sp, #0]
2002648e:	9f01      	ldr	r7, [sp, #4]
20026490:	6d64      	ldr	r4, [r4, #84]	@ 0x54
20026492:	ea00 0b02 	and.w	fp, r0, r2
20026496:	442c      	add	r4, r5
20026498:	443c      	add	r4, r7
2002649a:	eb0c 0704 	add.w	r7, ip, r4
2002649e:	ea4f 24f8 	mov.w	r4, r8, ror #11
200264a2:	ea84 14b8 	eor.w	r4, r4, r8, ror #6
200264a6:	ea84 6478 	eor.w	r4, r4, r8, ror #25
200264aa:	443c      	add	r4, r7
200264ac:	191f      	adds	r7, r3, r4
200264ae:	ea40 0c02 	orr.w	ip, r0, r2
200264b2:	ea4f 3372 	mov.w	r3, r2, ror #13
200264b6:	ea0c 0c01 	and.w	ip, ip, r1
200264ba:	ea83 03b2 	eor.w	r3, r3, r2, ror #2
200264be:	ea4c 0c0b 	orr.w	ip, ip, fp
200264c2:	ea83 53b2 	eor.w	r3, r3, r2, ror #22
200264c6:	4463      	add	r3, ip
200264c8:	4423      	add	r3, r4
200264ca:	ea4f 44f6 	mov.w	r4, r6, ror #19
200264ce:	ea84 4476 	eor.w	r4, r4, r6, ror #17
200264d2:	ea84 2496 	eor.w	r4, r4, r6, lsr #10
200264d6:	f8da 601c 	ldr.w	r6, [sl, #28]
200264da:	f85a cc04 	ldr.w	ip, [sl, #-4]
200264de:	4476      	add	r6, lr
200264e0:	4426      	add	r6, r4
200264e2:	ea4f 44bc 	mov.w	r4, ip, ror #18
200264e6:	ea84 14fc 	eor.w	r4, r4, ip, ror #7
200264ea:	ea84 04dc 	eor.w	r4, r4, ip, lsr #3
200264ee:	eb06 0b04 	add.w	fp, r6, r4
200264f2:	9c00      	ldr	r4, [sp, #0]
200264f4:	9e02      	ldr	r6, [sp, #8]
200264f6:	6da4      	ldr	r4, [r4, #88]	@ 0x58
200264f8:	ea89 0e08 	eor.w	lr, r9, r8
200264fc:	445c      	add	r4, fp
200264fe:	4434      	add	r4, r6
20026500:	ea0e 0e07 	and.w	lr, lr, r7
20026504:	ea4f 26f7 	mov.w	r6, r7, ror #11
20026508:	ea8e 0e09 	eor.w	lr, lr, r9
2002650c:	ea86 16b7 	eor.w	r6, r6, r7, ror #6
20026510:	4474      	add	r4, lr
20026512:	ea86 6677 	eor.w	r6, r6, r7, ror #25
20026516:	4434      	add	r4, r6
20026518:	eb01 0e04 	add.w	lr, r1, r4
2002651c:	ea42 0603 	orr.w	r6, r2, r3
20026520:	ea4f 3173 	mov.w	r1, r3, ror #13
20026524:	f8ca b038 	str.w	fp, [sl, #56]	@ 0x38
20026528:	4006      	ands	r6, r0
2002652a:	ea02 0b03 	and.w	fp, r2, r3
2002652e:	ea81 01b3 	eor.w	r1, r1, r3, ror #2
20026532:	ea46 060b 	orr.w	r6, r6, fp
20026536:	ea81 51b3 	eor.w	r1, r1, r3, ror #22
2002653a:	4431      	add	r1, r6
2002653c:	190e      	adds	r6, r1, r4
2002653e:	ea4f 41f5 	mov.w	r1, r5, ror #19
20026542:	ea81 4175 	eor.w	r1, r1, r5, ror #17
20026546:	f8ca 5034 	str.w	r5, [sl, #52]	@ 0x34
2002654a:	ea81 2195 	eor.w	r1, r1, r5, lsr #10
2002654e:	9d03      	ldr	r5, [sp, #12]
20026550:	f8da 4000 	ldr.w	r4, [sl]
20026554:	4465      	add	r5, ip
20026556:	4429      	add	r1, r5
20026558:	ea4f 45b4 	mov.w	r5, r4, ror #18
2002655c:	ea85 15f4 	eor.w	r5, r5, r4, ror #7
20026560:	ea85 05d4 	eor.w	r5, r5, r4, lsr #3
20026564:	194c      	adds	r4, r1, r5
20026566:	9900      	ldr	r1, [sp, #0]
20026568:	ea88 0507 	eor.w	r5, r8, r7
2002656c:	6dc9      	ldr	r1, [r1, #92]	@ 0x5c
2002656e:	ea05 050e 	and.w	r5, r5, lr
20026572:	4421      	add	r1, r4
20026574:	4449      	add	r1, r9
20026576:	ea85 0508 	eor.w	r5, r5, r8
2002657a:	440d      	add	r5, r1
2002657c:	ea4f 21fe 	mov.w	r1, lr, ror #11
20026580:	ea81 11be 	eor.w	r1, r1, lr, ror #6
20026584:	ea81 617e 	eor.w	r1, r1, lr, ror #25
20026588:	4429      	add	r1, r5
2002658a:	f8ca 403c 	str.w	r4, [sl, #60]	@ 0x3c
2002658e:	eb00 0b01 	add.w	fp, r0, r1
20026592:	ea43 0406 	orr.w	r4, r3, r6
20026596:	ea4f 3076 	mov.w	r0, r6, ror #13
2002659a:	ea80 00b6 	eor.w	r0, r0, r6, ror #2
2002659e:	4014      	ands	r4, r2
200265a0:	ea03 0506 	and.w	r5, r3, r6
200265a4:	ea80 50b6 	eor.w	r0, r0, r6, ror #22
200265a8:	432c      	orrs	r4, r5
200265aa:	4420      	add	r0, r4
200265ac:	eb00 0901 	add.w	r9, r0, r1
200265b0:	9900      	ldr	r1, [sp, #0]
200265b2:	3120      	adds	r1, #32
200265b4:	9100      	str	r1, [sp, #0]
200265b6:	9905      	ldr	r1, [sp, #20]
200265b8:	4551      	cmp	r1, sl
200265ba:	f47f ae25 	bne.w	20026208 <mbedtls_sha256_process+0x2b4>
200265be:	9308      	str	r3, [sp, #32]
200265c0:	9b04      	ldr	r3, [sp, #16]
200265c2:	a906      	add	r1, sp, #24
200265c4:	60ca      	str	r2, [r1, #12]
200265c6:	f8c1 801c 	str.w	r8, [r1, #28]
200265ca:	1d1a      	adds	r2, r3, #4
200265cc:	618f      	str	r7, [r1, #24]
200265ce:	3324      	adds	r3, #36	@ 0x24
200265d0:	f8c1 e014 	str.w	lr, [r1, #20]
200265d4:	604e      	str	r6, [r1, #4]
200265d6:	f8c1 b010 	str.w	fp, [r1, #16]
200265da:	f8c1 9000 	str.w	r9, [r1]
200265de:	f852 0f04 	ldr.w	r0, [r2, #4]!
200265e2:	f851 4b04 	ldr.w	r4, [r1], #4
200265e6:	4293      	cmp	r3, r2
200265e8:	4420      	add	r0, r4
200265ea:	6010      	str	r0, [r2, #0]
200265ec:	d1f7      	bne.n	200265de <mbedtls_sha256_process+0x68a>
200265ee:	b04f      	add	sp, #316	@ 0x13c
200265f0:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}

200265f4 <mbedtls_sha256_update.part.0>:
200265f4:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
200265f8:	6803      	ldr	r3, [r0, #0]
200265fa:	4605      	mov	r5, r0
200265fc:	f003 073f 	and.w	r7, r3, #63	@ 0x3f
20026600:	189b      	adds	r3, r3, r2
20026602:	6003      	str	r3, [r0, #0]
20026604:	bf28      	it	cs
20026606:	6843      	ldrcs	r3, [r0, #4]
20026608:	460e      	mov	r6, r1
2002660a:	bf28      	it	cs
2002660c:	3301      	addcs	r3, #1
2002660e:	4614      	mov	r4, r2
20026610:	bf28      	it	cs
20026612:	6043      	strcs	r3, [r0, #4]
20026614:	b197      	cbz	r7, 2002663c <mbedtls_sha256_update.part.0+0x48>
20026616:	f1c7 0940 	rsb	r9, r7, #64	@ 0x40
2002661a:	4591      	cmp	r9, r2
2002661c:	d80e      	bhi.n	2002663c <mbedtls_sha256_update.part.0+0x48>
2002661e:	f100 0828 	add.w	r8, r0, #40	@ 0x28
20026622:	464a      	mov	r2, r9
20026624:	eb08 0007 	add.w	r0, r8, r7
20026628:	f004 f8fa 	bl	2002a820 <memcpy>
2002662c:	3c40      	subs	r4, #64	@ 0x40
2002662e:	4641      	mov	r1, r8
20026630:	4628      	mov	r0, r5
20026632:	443c      	add	r4, r7
20026634:	f7ff fc8e 	bl	20025f54 <mbedtls_sha256_process>
20026638:	2700      	movs	r7, #0
2002663a:	444e      	add	r6, r9
2002663c:	46a0      	mov	r8, r4
2002663e:	eb04 0906 	add.w	r9, r4, r6
20026642:	e004      	b.n	2002664e <mbedtls_sha256_update.part.0+0x5a>
20026644:	4628      	mov	r0, r5
20026646:	f7ff fc85 	bl	20025f54 <mbedtls_sha256_process>
2002664a:	f1a8 0840 	sub.w	r8, r8, #64	@ 0x40
2002664e:	f1b8 0f3f 	cmp.w	r8, #63	@ 0x3f
20026652:	eba9 0108 	sub.w	r1, r9, r8
20026656:	d8f5      	bhi.n	20026644 <mbedtls_sha256_update.part.0+0x50>
20026658:	f06f 033f 	mvn.w	r3, #63	@ 0x3f
2002665c:	09a1      	lsrs	r1, r4, #6
2002665e:	4359      	muls	r1, r3
20026660:	1862      	adds	r2, r4, r1
20026662:	d007      	beq.n	20026674 <mbedtls_sha256_update.part.0+0x80>
20026664:	f105 0028 	add.w	r0, r5, #40	@ 0x28
20026668:	1a71      	subs	r1, r6, r1
2002666a:	4438      	add	r0, r7
2002666c:	e8bd 43f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
20026670:	f004 b8d6 	b.w	2002a820 <memcpy>
20026674:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}

20026678 <mbedtls_sha256_update>:
20026678:	b10a      	cbz	r2, 2002667e <mbedtls_sha256_update+0x6>
2002667a:	f7ff bfbb 	b.w	200265f4 <mbedtls_sha256_update.part.0>
2002667e:	4770      	bx	lr

20026680 <mbedtls_sha256_finish>:
20026680:	b537      	push	{r0, r1, r2, r4, r5, lr}
20026682:	4604      	mov	r4, r0
20026684:	460d      	mov	r5, r1
20026686:	e9d0 2100 	ldrd	r2, r1, [r0]
2002668a:	0f53      	lsrs	r3, r2, #29
2002668c:	ea43 03c1 	orr.w	r3, r3, r1, lsl #3
20026690:	ba1b      	rev	r3, r3
20026692:	9300      	str	r3, [sp, #0]
20026694:	00d3      	lsls	r3, r2, #3
20026696:	f002 023f 	and.w	r2, r2, #63	@ 0x3f
2002669a:	2a37      	cmp	r2, #55	@ 0x37
2002669c:	ba1b      	rev	r3, r3
2002669e:	bf94      	ite	ls
200266a0:	f1c2 0238 	rsbls	r2, r2, #56	@ 0x38
200266a4:	f1c2 0278 	rsbhi	r2, r2, #120	@ 0x78
200266a8:	492b      	ldr	r1, [pc, #172]	@ (20026758 <mbedtls_sha256_finish+0xd8>)
200266aa:	9301      	str	r3, [sp, #4]
200266ac:	f7ff ffe4 	bl	20026678 <mbedtls_sha256_update>
200266b0:	2208      	movs	r2, #8
200266b2:	4669      	mov	r1, sp
200266b4:	4620      	mov	r0, r4
200266b6:	f7ff ff9d 	bl	200265f4 <mbedtls_sha256_update.part.0>
200266ba:	7ae3      	ldrb	r3, [r4, #11]
200266bc:	702b      	strb	r3, [r5, #0]
200266be:	8963      	ldrh	r3, [r4, #10]
200266c0:	706b      	strb	r3, [r5, #1]
200266c2:	68a3      	ldr	r3, [r4, #8]
200266c4:	0a1b      	lsrs	r3, r3, #8
200266c6:	70ab      	strb	r3, [r5, #2]
200266c8:	68a3      	ldr	r3, [r4, #8]
200266ca:	70eb      	strb	r3, [r5, #3]
200266cc:	7be3      	ldrb	r3, [r4, #15]
200266ce:	712b      	strb	r3, [r5, #4]
200266d0:	89e3      	ldrh	r3, [r4, #14]
200266d2:	716b      	strb	r3, [r5, #5]
200266d4:	68e3      	ldr	r3, [r4, #12]
200266d6:	0a1b      	lsrs	r3, r3, #8
200266d8:	71ab      	strb	r3, [r5, #6]
200266da:	68e3      	ldr	r3, [r4, #12]
200266dc:	71eb      	strb	r3, [r5, #7]
200266de:	7ce3      	ldrb	r3, [r4, #19]
200266e0:	722b      	strb	r3, [r5, #8]
200266e2:	8a63      	ldrh	r3, [r4, #18]
200266e4:	726b      	strb	r3, [r5, #9]
200266e6:	6923      	ldr	r3, [r4, #16]
200266e8:	0a1b      	lsrs	r3, r3, #8
200266ea:	72ab      	strb	r3, [r5, #10]
200266ec:	6923      	ldr	r3, [r4, #16]
200266ee:	72eb      	strb	r3, [r5, #11]
200266f0:	7de3      	ldrb	r3, [r4, #23]
200266f2:	732b      	strb	r3, [r5, #12]
200266f4:	8ae3      	ldrh	r3, [r4, #22]
200266f6:	736b      	strb	r3, [r5, #13]
200266f8:	6963      	ldr	r3, [r4, #20]
200266fa:	0a1b      	lsrs	r3, r3, #8
200266fc:	73ab      	strb	r3, [r5, #14]
200266fe:	6963      	ldr	r3, [r4, #20]
20026700:	73eb      	strb	r3, [r5, #15]
20026702:	7ee3      	ldrb	r3, [r4, #27]
20026704:	742b      	strb	r3, [r5, #16]
20026706:	8b63      	ldrh	r3, [r4, #26]
20026708:	746b      	strb	r3, [r5, #17]
2002670a:	69a3      	ldr	r3, [r4, #24]
2002670c:	0a1b      	lsrs	r3, r3, #8
2002670e:	74ab      	strb	r3, [r5, #18]
20026710:	69a3      	ldr	r3, [r4, #24]
20026712:	74eb      	strb	r3, [r5, #19]
20026714:	7fe3      	ldrb	r3, [r4, #31]
20026716:	752b      	strb	r3, [r5, #20]
20026718:	8be3      	ldrh	r3, [r4, #30]
2002671a:	756b      	strb	r3, [r5, #21]
2002671c:	69e3      	ldr	r3, [r4, #28]
2002671e:	0a1b      	lsrs	r3, r3, #8
20026720:	75ab      	strb	r3, [r5, #22]
20026722:	69e3      	ldr	r3, [r4, #28]
20026724:	75eb      	strb	r3, [r5, #23]
20026726:	f894 3023 	ldrb.w	r3, [r4, #35]	@ 0x23
2002672a:	762b      	strb	r3, [r5, #24]
2002672c:	8c63      	ldrh	r3, [r4, #34]	@ 0x22
2002672e:	766b      	strb	r3, [r5, #25]
20026730:	6a23      	ldr	r3, [r4, #32]
20026732:	0a1b      	lsrs	r3, r3, #8
20026734:	76ab      	strb	r3, [r5, #26]
20026736:	6a23      	ldr	r3, [r4, #32]
20026738:	76eb      	strb	r3, [r5, #27]
2002673a:	6ea3      	ldr	r3, [r4, #104]	@ 0x68
2002673c:	b94b      	cbnz	r3, 20026752 <mbedtls_sha256_finish+0xd2>
2002673e:	f894 3027 	ldrb.w	r3, [r4, #39]	@ 0x27
20026742:	772b      	strb	r3, [r5, #28]
20026744:	8ce3      	ldrh	r3, [r4, #38]	@ 0x26
20026746:	776b      	strb	r3, [r5, #29]
20026748:	6a63      	ldr	r3, [r4, #36]	@ 0x24
2002674a:	0a1b      	lsrs	r3, r3, #8
2002674c:	77ab      	strb	r3, [r5, #30]
2002674e:	6a63      	ldr	r3, [r4, #36]	@ 0x24
20026750:	77eb      	strb	r3, [r5, #31]
20026752:	b003      	add	sp, #12
20026754:	bd30      	pop	{r4, r5, pc}
20026756:	bf00      	nop
20026758:	2002bd34 	.word	0x2002bd34

2002675c <mbedtls_sha256>:
2002675c:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
20026760:	461d      	mov	r5, r3
20026762:	b09c      	sub	sp, #112	@ 0x70
20026764:	4607      	mov	r7, r0
20026766:	a801      	add	r0, sp, #4
20026768:	4688      	mov	r8, r1
2002676a:	4616      	mov	r6, r2
2002676c:	f7ff fb97 	bl	20025e9e <mbedtls_sha256_init>
20026770:	b355      	cbz	r5, 200267c8 <mbedtls_sha256+0x6c>
20026772:	f8df a090 	ldr.w	sl, [pc, #144]	@ 20026804 <mbedtls_sha256+0xa8>
20026776:	f8df 9090 	ldr.w	r9, [pc, #144]	@ 20026808 <mbedtls_sha256+0xac>
2002677a:	f8df e090 	ldr.w	lr, [pc, #144]	@ 2002680c <mbedtls_sha256+0xb0>
2002677e:	f8df c090 	ldr.w	ip, [pc, #144]	@ 20026810 <mbedtls_sha256+0xb4>
20026782:	4818      	ldr	r0, [pc, #96]	@ (200267e4 <mbedtls_sha256+0x88>)
20026784:	4918      	ldr	r1, [pc, #96]	@ (200267e8 <mbedtls_sha256+0x8c>)
20026786:	4a19      	ldr	r2, [pc, #100]	@ (200267ec <mbedtls_sha256+0x90>)
20026788:	4b19      	ldr	r3, [pc, #100]	@ (200267f0 <mbedtls_sha256+0x94>)
2002678a:	2400      	movs	r4, #0
2002678c:	e9cd 2309 	strd	r2, r3, [sp, #36]	@ 0x24
20026790:	e9cd 0107 	strd	r0, r1, [sp, #28]
20026794:	4642      	mov	r2, r8
20026796:	4639      	mov	r1, r7
20026798:	a801      	add	r0, sp, #4
2002679a:	e9cd ec05 	strd	lr, ip, [sp, #20]
2002679e:	e9cd 4401 	strd	r4, r4, [sp, #4]
200267a2:	e9cd a903 	strd	sl, r9, [sp, #12]
200267a6:	951b      	str	r5, [sp, #108]	@ 0x6c
200267a8:	f7ff ff66 	bl	20026678 <mbedtls_sha256_update>
200267ac:	4631      	mov	r1, r6
200267ae:	a801      	add	r0, sp, #4
200267b0:	f7ff ff66 	bl	20026680 <mbedtls_sha256_finish>
200267b4:	4623      	mov	r3, r4
200267b6:	4622      	mov	r2, r4
200267b8:	a901      	add	r1, sp, #4
200267ba:	54ca      	strb	r2, [r1, r3]
200267bc:	3301      	adds	r3, #1
200267be:	2b6c      	cmp	r3, #108	@ 0x6c
200267c0:	d1fa      	bne.n	200267b8 <mbedtls_sha256+0x5c>
200267c2:	b01c      	add	sp, #112	@ 0x70
200267c4:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
200267c8:	f8df a048 	ldr.w	sl, [pc, #72]	@ 20026814 <mbedtls_sha256+0xb8>
200267cc:	f8df 9048 	ldr.w	r9, [pc, #72]	@ 20026818 <mbedtls_sha256+0xbc>
200267d0:	f8df e048 	ldr.w	lr, [pc, #72]	@ 2002681c <mbedtls_sha256+0xc0>
200267d4:	f8df c048 	ldr.w	ip, [pc, #72]	@ 20026820 <mbedtls_sha256+0xc4>
200267d8:	4806      	ldr	r0, [pc, #24]	@ (200267f4 <mbedtls_sha256+0x98>)
200267da:	4907      	ldr	r1, [pc, #28]	@ (200267f8 <mbedtls_sha256+0x9c>)
200267dc:	4a07      	ldr	r2, [pc, #28]	@ (200267fc <mbedtls_sha256+0xa0>)
200267de:	4b08      	ldr	r3, [pc, #32]	@ (20026800 <mbedtls_sha256+0xa4>)
200267e0:	e7d3      	b.n	2002678a <mbedtls_sha256+0x2e>
200267e2:	bf00      	nop
200267e4:	ffc00b31 	.word	0xffc00b31
200267e8:	68581511 	.word	0x68581511
200267ec:	64f98fa7 	.word	0x64f98fa7
200267f0:	befa4fa4 	.word	0xbefa4fa4
200267f4:	510e527f 	.word	0x510e527f
200267f8:	9b05688c 	.word	0x9b05688c
200267fc:	1f83d9ab 	.word	0x1f83d9ab
20026800:	5be0cd19 	.word	0x5be0cd19
20026804:	c1059ed8 	.word	0xc1059ed8
20026808:	367cd507 	.word	0x367cd507
2002680c:	3070dd17 	.word	0x3070dd17
20026810:	f70e5939 	.word	0xf70e5939
20026814:	6a09e667 	.word	0x6a09e667
20026818:	bb67ae85 	.word	0xbb67ae85
2002681c:	3c6ef372 	.word	0x3c6ef372
20026820:	a54ff53a 	.word	0xa54ff53a

20026824 <mbedtls_sha512_init>:
20026824:	22d8      	movs	r2, #216	@ 0xd8
20026826:	2100      	movs	r1, #0
20026828:	f003 bfe0 	b.w	2002a7ec <memset>

2002682c <mbedtls_sha512_free>:
2002682c:	b138      	cbz	r0, 2002683e <mbedtls_sha512_free+0x12>
2002682e:	2100      	movs	r1, #0
20026830:	f100 03d8 	add.w	r3, r0, #216	@ 0xd8
20026834:	4602      	mov	r2, r0
20026836:	3001      	adds	r0, #1
20026838:	4298      	cmp	r0, r3
2002683a:	7011      	strb	r1, [r2, #0]
2002683c:	d1fa      	bne.n	20026834 <mbedtls_sha512_free+0x8>
2002683e:	4770      	bx	lr

20026840 <mbedtls_sha512_clone>:
20026840:	b508      	push	{r3, lr}
20026842:	22d8      	movs	r2, #216	@ 0xd8
20026844:	f003 ffec 	bl	2002a820 <memcpy>
20026848:	bd08      	pop	{r3, pc}
2002684a:	0000      	movs	r0, r0
2002684c:	0000      	movs	r0, r0
	...

20026850 <mbedtls_sha512_starts>:
20026850:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20026854:	b381      	cbz	r1, 200268b8 <mbedtls_sha512_starts+0x68>
20026856:	f20f 0bc8 	addw	fp, pc, #200	@ 0xc8
2002685a:	e9db ab00 	ldrd	sl, fp, [fp]
2002685e:	f20f 09c8 	addw	r9, pc, #200	@ 0xc8
20026862:	e9d9 8900 	ldrd	r8, r9, [r9]
20026866:	a732      	add	r7, pc, #200	@ (adr r7, 20026930 <mbedtls_sha512_starts+0xe0>)
20026868:	e9d7 6700 	ldrd	r6, r7, [r7]
2002686c:	a532      	add	r5, pc, #200	@ (adr r5, 20026938 <mbedtls_sha512_starts+0xe8>)
2002686e:	e9d5 4500 	ldrd	r4, r5, [r5]
20026872:	a333      	add	r3, pc, #204	@ (adr r3, 20026940 <mbedtls_sha512_starts+0xf0>)
20026874:	e9d3 2300 	ldrd	r2, r3, [r3]
20026878:	ed9f 5b1b 	vldr	d5, [pc, #108]	@ 200268e8 <mbedtls_sha512_starts+0x98>
2002687c:	ed9f 6b1c 	vldr	d6, [pc, #112]	@ 200268f0 <mbedtls_sha512_starts+0xa0>
20026880:	ed9f 7b1d 	vldr	d7, [pc, #116]	@ 200268f8 <mbedtls_sha512_starts+0xa8>
20026884:	ed9f 4b1e 	vldr	d4, [pc, #120]	@ 20026900 <mbedtls_sha512_starts+0xb0>
20026888:	ed80 5b04 	vstr	d5, [r0, #16]
2002688c:	ed80 4b00 	vstr	d4, [r0]
20026890:	ed80 4b02 	vstr	d4, [r0, #8]
20026894:	ed80 6b06 	vstr	d6, [r0, #24]
20026898:	ed80 7b08 	vstr	d7, [r0, #32]
2002689c:	e9c0 ab0a 	strd	sl, fp, [r0, #40]	@ 0x28
200268a0:	e9c0 890c 	strd	r8, r9, [r0, #48]	@ 0x30
200268a4:	e9c0 670e 	strd	r6, r7, [r0, #56]	@ 0x38
200268a8:	e9c0 4510 	strd	r4, r5, [r0, #64]	@ 0x40
200268ac:	e9c0 2312 	strd	r2, r3, [r0, #72]	@ 0x48
200268b0:	f8c0 10d0 	str.w	r1, [r0, #208]	@ 0xd0
200268b4:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
200268b8:	ed9f 5b13 	vldr	d5, [pc, #76]	@ 20026908 <mbedtls_sha512_starts+0xb8>
200268bc:	f20f 0b88 	addw	fp, pc, #136	@ 0x88
200268c0:	e9db ab00 	ldrd	sl, fp, [fp]
200268c4:	f20f 0988 	addw	r9, pc, #136	@ 0x88
200268c8:	e9d9 8900 	ldrd	r8, r9, [r9]
200268cc:	a722      	add	r7, pc, #136	@ (adr r7, 20026958 <mbedtls_sha512_starts+0x108>)
200268ce:	e9d7 6700 	ldrd	r6, r7, [r7]
200268d2:	a523      	add	r5, pc, #140	@ (adr r5, 20026960 <mbedtls_sha512_starts+0x110>)
200268d4:	e9d5 4500 	ldrd	r4, r5, [r5]
200268d8:	a323      	add	r3, pc, #140	@ (adr r3, 20026968 <mbedtls_sha512_starts+0x118>)
200268da:	e9d3 2300 	ldrd	r2, r3, [r3]
200268de:	ed9f 6b0c 	vldr	d6, [pc, #48]	@ 20026910 <mbedtls_sha512_starts+0xc0>
200268e2:	ed9f 7b0d 	vldr	d7, [pc, #52]	@ 20026918 <mbedtls_sha512_starts+0xc8>
200268e6:	e7cd      	b.n	20026884 <mbedtls_sha512_starts+0x34>
200268e8:	c1059ed8 	.word	0xc1059ed8
200268ec:	cbbb9d5d 	.word	0xcbbb9d5d
200268f0:	367cd507 	.word	0x367cd507
200268f4:	629a292a 	.word	0x629a292a
200268f8:	3070dd17 	.word	0x3070dd17
200268fc:	9159015a 	.word	0x9159015a
	...
20026908:	f3bcc908 	.word	0xf3bcc908
2002690c:	6a09e667 	.word	0x6a09e667
20026910:	84caa73b 	.word	0x84caa73b
20026914:	bb67ae85 	.word	0xbb67ae85
20026918:	fe94f82b 	.word	0xfe94f82b
2002691c:	3c6ef372 	.word	0x3c6ef372
20026920:	f70e5939 	.word	0xf70e5939
20026924:	152fecd8 	.word	0x152fecd8
20026928:	ffc00b31 	.word	0xffc00b31
2002692c:	67332667 	.word	0x67332667
20026930:	68581511 	.word	0x68581511
20026934:	8eb44a87 	.word	0x8eb44a87
20026938:	64f98fa7 	.word	0x64f98fa7
2002693c:	db0c2e0d 	.word	0xdb0c2e0d
20026940:	befa4fa4 	.word	0xbefa4fa4
20026944:	47b5481d 	.word	0x47b5481d
20026948:	5f1d36f1 	.word	0x5f1d36f1
2002694c:	a54ff53a 	.word	0xa54ff53a
20026950:	ade682d1 	.word	0xade682d1
20026954:	510e527f 	.word	0x510e527f
20026958:	2b3e6c1f 	.word	0x2b3e6c1f
2002695c:	9b05688c 	.word	0x9b05688c
20026960:	fb41bd6b 	.word	0xfb41bd6b
20026964:	1f83d9ab 	.word	0x1f83d9ab
20026968:	137e2179 	.word	0x137e2179
2002696c:	5be0cd19 	.word	0x5be0cd19

20026970 <mbedtls_sha512_process>:
20026970:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20026974:	f5ad 7d3f 	sub.w	sp, sp, #764	@ 0x2fc
20026978:	4682      	mov	sl, r0
2002697a:	a81e      	add	r0, sp, #120	@ 0x78
2002697c:	4604      	mov	r4, r0
2002697e:	f101 0580 	add.w	r5, r1, #128	@ 0x80
20026982:	784b      	ldrb	r3, [r1, #1]
20026984:	780a      	ldrb	r2, [r1, #0]
20026986:	041b      	lsls	r3, r3, #16
20026988:	790f      	ldrb	r7, [r1, #4]
2002698a:	ea43 6302 	orr.w	r3, r3, r2, lsl #24
2002698e:	79ca      	ldrb	r2, [r1, #7]
20026990:	788e      	ldrb	r6, [r1, #2]
20026992:	ea42 6207 	orr.w	r2, r2, r7, lsl #24
20026996:	794f      	ldrb	r7, [r1, #5]
20026998:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
2002699c:	ea42 4207 	orr.w	r2, r2, r7, lsl #16
200269a0:	78ce      	ldrb	r6, [r1, #3]
200269a2:	798f      	ldrb	r7, [r1, #6]
200269a4:	3108      	adds	r1, #8
200269a6:	ea42 2207 	orr.w	r2, r2, r7, lsl #8
200269aa:	4333      	orrs	r3, r6
200269ac:	428d      	cmp	r5, r1
200269ae:	e9c4 2300 	strd	r2, r3, [r4]
200269b2:	f104 0408 	add.w	r4, r4, #8
200269b6:	d1e4      	bne.n	20026982 <mbedtls_sha512_process+0x12>
200269b8:	4601      	mov	r1, r0
200269ba:	2610      	movs	r6, #16
200269bc:	e9d1 4c1c 	ldrd	r4, ip, [r1, #112]	@ 0x70
200269c0:	e9d1 2502 	ldrd	r2, r5, [r1, #8]
200269c4:	468e      	mov	lr, r1
200269c6:	0ce3      	lsrs	r3, r4, #19
200269c8:	ea4f 47dc 	mov.w	r7, ip, lsr #19
200269cc:	ea4f 09c4 	mov.w	r9, r4, lsl #3
200269d0:	ea4f 08cc 	mov.w	r8, ip, lsl #3
200269d4:	ea48 7854 	orr.w	r8, r8, r4, lsr #29
200269d8:	ea43 334c 	orr.w	r3, r3, ip, lsl #13
200269dc:	ea47 3744 	orr.w	r7, r7, r4, lsl #13
200269e0:	ea49 795c 	orr.w	r9, r9, ip, lsr #29
200269e4:	09a4      	lsrs	r4, r4, #6
200269e6:	ea87 0708 	eor.w	r7, r7, r8
200269ea:	ea44 648c 	orr.w	r4, r4, ip, lsl #26
200269ee:	ea83 0309 	eor.w	r3, r3, r9
200269f2:	4063      	eors	r3, r4
200269f4:	ea87 179c 	eor.w	r7, r7, ip, lsr #6
200269f8:	e9de 4c12 	ldrd	r4, ip, [lr, #72]	@ 0x48
200269fc:	e9de 8e00 	ldrd	r8, lr, [lr]
20026a00:	eb14 0408 	adds.w	r4, r4, r8
20026a04:	eb4c 0c0e 	adc.w	ip, ip, lr
20026a08:	191b      	adds	r3, r3, r4
20026a0a:	eb47 070c 	adc.w	r7, r7, ip
20026a0e:	0854      	lsrs	r4, r2, #1
20026a10:	ea4f 2812 	mov.w	r8, r2, lsr #8
20026a14:	ea4f 0c55 	mov.w	ip, r5, lsr #1
20026a18:	ea4f 2e15 	mov.w	lr, r5, lsr #8
20026a1c:	ea4c 7cc2 	orr.w	ip, ip, r2, lsl #31
20026a20:	ea4e 6e02 	orr.w	lr, lr, r2, lsl #24
20026a24:	ea44 74c5 	orr.w	r4, r4, r5, lsl #31
20026a28:	ea48 6805 	orr.w	r8, r8, r5, lsl #24
20026a2c:	09d2      	lsrs	r2, r2, #7
20026a2e:	ea84 0408 	eor.w	r4, r4, r8
20026a32:	ea42 6245 	orr.w	r2, r2, r5, lsl #25
20026a36:	4062      	eors	r2, r4
20026a38:	ea8c 0c0e 	eor.w	ip, ip, lr
20026a3c:	189b      	adds	r3, r3, r2
20026a3e:	ea8c 14d5 	eor.w	r4, ip, r5, lsr #7
20026a42:	f106 0601 	add.w	r6, r6, #1
20026a46:	eb47 0704 	adc.w	r7, r7, r4
20026a4a:	3108      	adds	r1, #8
20026a4c:	2e50      	cmp	r6, #80	@ 0x50
20026a4e:	e9c1 371e 	strd	r3, r7, [r1, #120]	@ 0x78
20026a52:	d1b3      	bne.n	200269bc <mbedtls_sha512_process+0x4c>
20026a54:	f8da 3010 	ldr.w	r3, [sl, #16]
20026a58:	930e      	str	r3, [sp, #56]	@ 0x38
20026a5a:	f8da 3014 	ldr.w	r3, [sl, #20]
20026a5e:	930f      	str	r3, [sp, #60]	@ 0x3c
20026a60:	f8da 3018 	ldr.w	r3, [sl, #24]
20026a64:	9310      	str	r3, [sp, #64]	@ 0x40
20026a66:	f8da 301c 	ldr.w	r3, [sl, #28]
20026a6a:	9311      	str	r3, [sp, #68]	@ 0x44
20026a6c:	f8da 3020 	ldr.w	r3, [sl, #32]
20026a70:	9312      	str	r3, [sp, #72]	@ 0x48
20026a72:	f8da 3024 	ldr.w	r3, [sl, #36]	@ 0x24
20026a76:	9313      	str	r3, [sp, #76]	@ 0x4c
20026a78:	f8da 3028 	ldr.w	r3, [sl, #40]	@ 0x28
20026a7c:	9314      	str	r3, [sp, #80]	@ 0x50
20026a7e:	f8da 302c 	ldr.w	r3, [sl, #44]	@ 0x2c
20026a82:	9315      	str	r3, [sp, #84]	@ 0x54
20026a84:	f8da 3030 	ldr.w	r3, [sl, #48]	@ 0x30
20026a88:	9316      	str	r3, [sp, #88]	@ 0x58
20026a8a:	f8da 3034 	ldr.w	r3, [sl, #52]	@ 0x34
20026a8e:	9317      	str	r3, [sp, #92]	@ 0x5c
20026a90:	f8da 3038 	ldr.w	r3, [sl, #56]	@ 0x38
20026a94:	9318      	str	r3, [sp, #96]	@ 0x60
20026a96:	f8da 303c 	ldr.w	r3, [sl, #60]	@ 0x3c
20026a9a:	9319      	str	r3, [sp, #100]	@ 0x64
20026a9c:	f8da 3040 	ldr.w	r3, [sl, #64]	@ 0x40
20026aa0:	931a      	str	r3, [sp, #104]	@ 0x68
20026aa2:	f8da 3044 	ldr.w	r3, [sl, #68]	@ 0x44
20026aa6:	931b      	str	r3, [sp, #108]	@ 0x6c
20026aa8:	f8da 3048 	ldr.w	r3, [sl, #72]	@ 0x48
20026aac:	931c      	str	r3, [sp, #112]	@ 0x70
20026aae:	f8da 304c 	ldr.w	r3, [sl, #76]	@ 0x4c
20026ab2:	931d      	str	r3, [sp, #116]	@ 0x74
20026ab4:	4b0f      	ldr	r3, [pc, #60]	@ (20026af4 <mbedtls_sha512_process+0x184>)
20026ab6:	9300      	str	r3, [sp, #0]
20026ab8:	9b1c      	ldr	r3, [sp, #112]	@ 0x70
20026aba:	f8dd b054 	ldr.w	fp, [sp, #84]	@ 0x54
20026abe:	930a      	str	r3, [sp, #40]	@ 0x28
20026ac0:	9b1d      	ldr	r3, [sp, #116]	@ 0x74
20026ac2:	e9dd ce10 	ldrd	ip, lr, [sp, #64]	@ 0x40
20026ac6:	930b      	str	r3, [sp, #44]	@ 0x2c
20026ac8:	9b1a      	ldr	r3, [sp, #104]	@ 0x68
20026aca:	9308      	str	r3, [sp, #32]
20026acc:	9b1b      	ldr	r3, [sp, #108]	@ 0x6c
20026ace:	9309      	str	r3, [sp, #36]	@ 0x24
20026ad0:	9b18      	ldr	r3, [sp, #96]	@ 0x60
20026ad2:	9306      	str	r3, [sp, #24]
20026ad4:	9b19      	ldr	r3, [sp, #100]	@ 0x64
20026ad6:	9307      	str	r3, [sp, #28]
20026ad8:	9b16      	ldr	r3, [sp, #88]	@ 0x58
20026ada:	9304      	str	r3, [sp, #16]
20026adc:	9b17      	ldr	r3, [sp, #92]	@ 0x5c
20026ade:	9305      	str	r3, [sp, #20]
20026ae0:	9b14      	ldr	r3, [sp, #80]	@ 0x50
20026ae2:	9303      	str	r3, [sp, #12]
20026ae4:	9b12      	ldr	r3, [sp, #72]	@ 0x48
20026ae6:	9301      	str	r3, [sp, #4]
20026ae8:	9b13      	ldr	r3, [sp, #76]	@ 0x4c
20026aea:	9302      	str	r3, [sp, #8]
20026aec:	e9dd 320e 	ldrd	r3, r2, [sp, #56]	@ 0x38
20026af0:	e002      	b.n	20026af8 <mbedtls_sha512_process+0x188>
20026af2:	bf00      	nop
20026af4:	2002bef8 	.word	0x2002bef8
20026af8:	9c04      	ldr	r4, [sp, #16]
20026afa:	9e04      	ldr	r6, [sp, #16]
20026afc:	ea4f 3894 	mov.w	r8, r4, lsr #14
20026b00:	9c05      	ldr	r4, [sp, #20]
20026b02:	9900      	ldr	r1, [sp, #0]
20026b04:	ea48 4884 	orr.w	r8, r8, r4, lsl #18
20026b08:	ea4f 3994 	mov.w	r9, r4, lsr #14
20026b0c:	9c04      	ldr	r4, [sp, #16]
20026b0e:	ea49 4984 	orr.w	r9, r9, r4, lsl #18
20026b12:	0ca5      	lsrs	r5, r4, #18
20026b14:	9c05      	ldr	r4, [sp, #20]
20026b16:	ea45 3584 	orr.w	r5, r5, r4, lsl #14
20026b1a:	0ca4      	lsrs	r4, r4, #18
20026b1c:	ea44 3486 	orr.w	r4, r4, r6, lsl #14
20026b20:	ea89 0904 	eor.w	r9, r9, r4
20026b24:	9c05      	ldr	r4, [sp, #20]
20026b26:	ea88 0805 	eor.w	r8, r8, r5
20026b2a:	05f5      	lsls	r5, r6, #23
20026b2c:	ea45 2554 	orr.w	r5, r5, r4, lsr #9
20026b30:	05e4      	lsls	r4, r4, #23
20026b32:	ea44 2456 	orr.w	r4, r4, r6, lsr #9
20026b36:	ea88 0805 	eor.w	r8, r8, r5
20026b3a:	ea89 0904 	eor.w	r9, r9, r4
20026b3e:	e9d1 5700 	ldrd	r5, r7, [r1]
20026b42:	e9d0 6400 	ldrd	r6, r4, [r0]
20026b46:	19ad      	adds	r5, r5, r6
20026b48:	eb47 0404 	adc.w	r4, r7, r4
20026b4c:	9e06      	ldr	r6, [sp, #24]
20026b4e:	9f08      	ldr	r7, [sp, #32]
20026b50:	9909      	ldr	r1, [sp, #36]	@ 0x24
20026b52:	407e      	eors	r6, r7
20026b54:	9f07      	ldr	r7, [sp, #28]
20026b56:	eb18 0505 	adds.w	r5, r8, r5
20026b5a:	ea87 0701 	eor.w	r7, r7, r1
20026b5e:	9904      	ldr	r1, [sp, #16]
20026b60:	eb49 0404 	adc.w	r4, r9, r4
20026b64:	400e      	ands	r6, r1
20026b66:	9905      	ldr	r1, [sp, #20]
20026b68:	ea4f 7813 	mov.w	r8, r3, lsr #28
20026b6c:	400f      	ands	r7, r1
20026b6e:	9908      	ldr	r1, [sp, #32]
20026b70:	ea4f 7983 	mov.w	r9, r3, lsl #30
20026b74:	404e      	eors	r6, r1
20026b76:	9909      	ldr	r1, [sp, #36]	@ 0x24
20026b78:	19ad      	adds	r5, r5, r6
20026b7a:	ea87 0701 	eor.w	r7, r7, r1
20026b7e:	990a      	ldr	r1, [sp, #40]	@ 0x28
20026b80:	eb44 0407 	adc.w	r4, r4, r7
20026b84:	186d      	adds	r5, r5, r1
20026b86:	990b      	ldr	r1, [sp, #44]	@ 0x2c
20026b88:	ea4f 7712 	mov.w	r7, r2, lsr #28
20026b8c:	eb41 0404 	adc.w	r4, r1, r4
20026b90:	9903      	ldr	r1, [sp, #12]
20026b92:	0796      	lsls	r6, r2, #30
20026b94:	1949      	adds	r1, r1, r5
20026b96:	ea46 0693 	orr.w	r6, r6, r3, lsr #2
20026b9a:	ea47 1703 	orr.w	r7, r7, r3, lsl #4
20026b9e:	910a      	str	r1, [sp, #40]	@ 0x28
20026ba0:	ea87 0706 	eor.w	r7, r7, r6
20026ba4:	eb4b 0104 	adc.w	r1, fp, r4
20026ba8:	0656      	lsls	r6, r2, #25
20026baa:	ea49 0992 	orr.w	r9, r9, r2, lsr #2
20026bae:	ea46 16d3 	orr.w	r6, r6, r3, lsr #7
20026bb2:	910b      	str	r1, [sp, #44]	@ 0x2c
20026bb4:	ea48 1802 	orr.w	r8, r8, r2, lsl #4
20026bb8:	9901      	ldr	r1, [sp, #4]
20026bba:	ea88 0809 	eor.w	r8, r8, r9
20026bbe:	4077      	eors	r7, r6
20026bc0:	ea4f 6943 	mov.w	r9, r3, lsl #25
20026bc4:	ea43 060c 	orr.w	r6, r3, ip
20026bc8:	ea49 19d2 	orr.w	r9, r9, r2, lsr #7
20026bcc:	400e      	ands	r6, r1
20026bce:	9902      	ldr	r1, [sp, #8]
20026bd0:	ea03 0b0c 	and.w	fp, r3, ip
20026bd4:	ea88 0809 	eor.w	r8, r8, r9
20026bd8:	ea42 090e 	orr.w	r9, r2, lr
20026bdc:	ea09 0901 	and.w	r9, r9, r1
20026be0:	ea46 060b 	orr.w	r6, r6, fp
20026be4:	ea02 010e 	and.w	r1, r2, lr
20026be8:	eb18 0606 	adds.w	r6, r8, r6
20026bec:	ea49 0901 	orr.w	r9, r9, r1
20026bf0:	eb47 0709 	adc.w	r7, r7, r9
20026bf4:	1971      	adds	r1, r6, r5
20026bf6:	9103      	str	r1, [sp, #12]
20026bf8:	9900      	ldr	r1, [sp, #0]
20026bfa:	eb44 0b07 	adc.w	fp, r4, r7
20026bfe:	e9d0 6702 	ldrd	r6, r7, [r0, #8]
20026c02:	e9d1 4502 	ldrd	r4, r5, [r1, #8]
20026c06:	9908      	ldr	r1, [sp, #32]
20026c08:	19a4      	adds	r4, r4, r6
20026c0a:	eb45 0507 	adc.w	r5, r5, r7
20026c0e:	1864      	adds	r4, r4, r1
20026c10:	9909      	ldr	r1, [sp, #36]	@ 0x24
20026c12:	9e06      	ldr	r6, [sp, #24]
20026c14:	eb41 0505 	adc.w	r5, r1, r5
20026c18:	9904      	ldr	r1, [sp, #16]
20026c1a:	ea81 0706 	eor.w	r7, r1, r6
20026c1e:	9905      	ldr	r1, [sp, #20]
20026c20:	9e07      	ldr	r6, [sp, #28]
20026c22:	404e      	eors	r6, r1
20026c24:	990a      	ldr	r1, [sp, #40]	@ 0x28
20026c26:	400f      	ands	r7, r1
20026c28:	990b      	ldr	r1, [sp, #44]	@ 0x2c
20026c2a:	400e      	ands	r6, r1
20026c2c:	9906      	ldr	r1, [sp, #24]
20026c2e:	404f      	eors	r7, r1
20026c30:	9907      	ldr	r1, [sp, #28]
20026c32:	19e4      	adds	r4, r4, r7
20026c34:	ea86 0601 	eor.w	r6, r6, r1
20026c38:	990a      	ldr	r1, [sp, #40]	@ 0x28
20026c3a:	eb45 0506 	adc.w	r5, r5, r6
20026c3e:	0b8f      	lsrs	r7, r1, #14
20026c40:	990b      	ldr	r1, [sp, #44]	@ 0x2c
20026c42:	ea47 4781 	orr.w	r7, r7, r1, lsl #18
20026c46:	ea4f 3891 	mov.w	r8, r1, lsr #14
20026c4a:	990a      	ldr	r1, [sp, #40]	@ 0x28
20026c4c:	ea48 4881 	orr.w	r8, r8, r1, lsl #18
20026c50:	ea4f 4991 	mov.w	r9, r1, lsr #18
20026c54:	990b      	ldr	r1, [sp, #44]	@ 0x2c
20026c56:	ea49 3981 	orr.w	r9, r9, r1, lsl #14
20026c5a:	0c8e      	lsrs	r6, r1, #18
20026c5c:	990a      	ldr	r1, [sp, #40]	@ 0x28
20026c5e:	ea87 0709 	eor.w	r7, r7, r9
20026c62:	ea46 3681 	orr.w	r6, r6, r1, lsl #14
20026c66:	ea88 0806 	eor.w	r8, r8, r6
20026c6a:	05ce      	lsls	r6, r1, #23
20026c6c:	990b      	ldr	r1, [sp, #44]	@ 0x2c
20026c6e:	ea46 2651 	orr.w	r6, r6, r1, lsr #9
20026c72:	ea4f 59c1 	mov.w	r9, r1, lsl #23
20026c76:	990a      	ldr	r1, [sp, #40]	@ 0x28
20026c78:	407e      	eors	r6, r7
20026c7a:	ea49 2951 	orr.w	r9, r9, r1, lsr #9
20026c7e:	9901      	ldr	r1, [sp, #4]
20026c80:	19a4      	adds	r4, r4, r6
20026c82:	ea88 0809 	eor.w	r8, r8, r9
20026c86:	eb45 0808 	adc.w	r8, r5, r8
20026c8a:	1909      	adds	r1, r1, r4
20026c8c:	9108      	str	r1, [sp, #32]
20026c8e:	9902      	ldr	r1, [sp, #8]
20026c90:	ea4f 761b 	mov.w	r6, fp, lsr #28
20026c94:	eb41 0108 	adc.w	r1, r1, r8
20026c98:	9109      	str	r1, [sp, #36]	@ 0x24
20026c9a:	9903      	ldr	r1, [sp, #12]
20026c9c:	ea4f 758b 	mov.w	r5, fp, lsl #30
20026ca0:	ea45 0591 	orr.w	r5, r5, r1, lsr #2
20026ca4:	0f0f      	lsrs	r7, r1, #28
20026ca6:	ea46 1601 	orr.w	r6, r6, r1, lsl #4
20026caa:	ea4f 7981 	mov.w	r9, r1, lsl #30
20026cae:	ea49 099b 	orr.w	r9, r9, fp, lsr #2
20026cb2:	ea47 170b 	orr.w	r7, r7, fp, lsl #4
20026cb6:	406e      	eors	r6, r5
20026cb8:	ea4f 654b 	mov.w	r5, fp, lsl #25
20026cbc:	ea45 15d1 	orr.w	r5, r5, r1, lsr #7
20026cc0:	ea87 0709 	eor.w	r7, r7, r9
20026cc4:	ea4f 6941 	mov.w	r9, r1, lsl #25
20026cc8:	ea49 19db 	orr.w	r9, r9, fp, lsr #7
20026ccc:	406e      	eors	r6, r5
20026cce:	ea43 0501 	orr.w	r5, r3, r1
20026cd2:	ea87 0709 	eor.w	r7, r7, r9
20026cd6:	4019      	ands	r1, r3
20026cd8:	ea42 090b 	orr.w	r9, r2, fp
20026cdc:	ea05 050c 	and.w	r5, r5, ip
20026ce0:	ea09 090e 	and.w	r9, r9, lr
20026ce4:	430d      	orrs	r5, r1
20026ce6:	ea02 010b 	and.w	r1, r2, fp
20026cea:	197d      	adds	r5, r7, r5
20026cec:	ea49 0901 	orr.w	r9, r9, r1
20026cf0:	eb46 0609 	adc.w	r6, r6, r9
20026cf4:	1929      	adds	r1, r5, r4
20026cf6:	9101      	str	r1, [sp, #4]
20026cf8:	eb48 0106 	adc.w	r1, r8, r6
20026cfc:	9102      	str	r1, [sp, #8]
20026cfe:	9900      	ldr	r1, [sp, #0]
20026d00:	e9d0 6704 	ldrd	r6, r7, [r0, #16]
20026d04:	e9d1 4504 	ldrd	r4, r5, [r1, #16]
20026d08:	9906      	ldr	r1, [sp, #24]
20026d0a:	19a4      	adds	r4, r4, r6
20026d0c:	eb45 0507 	adc.w	r5, r5, r7
20026d10:	1864      	adds	r4, r4, r1
20026d12:	9907      	ldr	r1, [sp, #28]
20026d14:	eb41 0505 	adc.w	r5, r1, r5
20026d18:	9904      	ldr	r1, [sp, #16]
20026d1a:	9e0a      	ldr	r6, [sp, #40]	@ 0x28
20026d1c:	ea81 0706 	eor.w	r7, r1, r6
20026d20:	9905      	ldr	r1, [sp, #20]
20026d22:	9e0b      	ldr	r6, [sp, #44]	@ 0x2c
20026d24:	404e      	eors	r6, r1
20026d26:	9908      	ldr	r1, [sp, #32]
20026d28:	400f      	ands	r7, r1
20026d2a:	9909      	ldr	r1, [sp, #36]	@ 0x24
20026d2c:	400e      	ands	r6, r1
20026d2e:	9904      	ldr	r1, [sp, #16]
20026d30:	404f      	eors	r7, r1
20026d32:	9905      	ldr	r1, [sp, #20]
20026d34:	19e4      	adds	r4, r4, r7
20026d36:	ea86 0601 	eor.w	r6, r6, r1
20026d3a:	9908      	ldr	r1, [sp, #32]
20026d3c:	eb45 0506 	adc.w	r5, r5, r6
20026d40:	0b8f      	lsrs	r7, r1, #14
20026d42:	9909      	ldr	r1, [sp, #36]	@ 0x24
20026d44:	ea47 4781 	orr.w	r7, r7, r1, lsl #18
20026d48:	ea4f 3891 	mov.w	r8, r1, lsr #14
20026d4c:	9908      	ldr	r1, [sp, #32]
20026d4e:	ea48 4881 	orr.w	r8, r8, r1, lsl #18
20026d52:	ea4f 4991 	mov.w	r9, r1, lsr #18
20026d56:	9909      	ldr	r1, [sp, #36]	@ 0x24
20026d58:	ea49 3981 	orr.w	r9, r9, r1, lsl #14
20026d5c:	0c8e      	lsrs	r6, r1, #18
20026d5e:	9908      	ldr	r1, [sp, #32]
20026d60:	ea87 0709 	eor.w	r7, r7, r9
20026d64:	ea46 3681 	orr.w	r6, r6, r1, lsl #14
20026d68:	ea88 0806 	eor.w	r8, r8, r6
20026d6c:	05ce      	lsls	r6, r1, #23
20026d6e:	9909      	ldr	r1, [sp, #36]	@ 0x24
20026d70:	ea46 2651 	orr.w	r6, r6, r1, lsr #9
20026d74:	ea4f 59c1 	mov.w	r9, r1, lsl #23
20026d78:	9908      	ldr	r1, [sp, #32]
20026d7a:	407e      	eors	r6, r7
20026d7c:	ea49 2951 	orr.w	r9, r9, r1, lsr #9
20026d80:	19a4      	adds	r4, r4, r6
20026d82:	ea88 0809 	eor.w	r8, r8, r9
20026d86:	eb45 0808 	adc.w	r8, r5, r8
20026d8a:	eb1c 0104 	adds.w	r1, ip, r4
20026d8e:	9106      	str	r1, [sp, #24]
20026d90:	eb4e 0108 	adc.w	r1, lr, r8
20026d94:	9107      	str	r1, [sp, #28]
20026d96:	9901      	ldr	r1, [sp, #4]
20026d98:	0f0f      	lsrs	r7, r1, #28
20026d9a:	9902      	ldr	r1, [sp, #8]
20026d9c:	ea47 1701 	orr.w	r7, r7, r1, lsl #4
20026da0:	0f0e      	lsrs	r6, r1, #28
20026da2:	9901      	ldr	r1, [sp, #4]
20026da4:	ea46 1601 	orr.w	r6, r6, r1, lsl #4
20026da8:	ea4f 7c81 	mov.w	ip, r1, lsl #30
20026dac:	9902      	ldr	r1, [sp, #8]
20026dae:	ea4c 0c91 	orr.w	ip, ip, r1, lsr #2
20026db2:	078d      	lsls	r5, r1, #30
20026db4:	9901      	ldr	r1, [sp, #4]
20026db6:	ea87 070c 	eor.w	r7, r7, ip
20026dba:	ea45 0591 	orr.w	r5, r5, r1, lsr #2
20026dbe:	ea4f 6c41 	mov.w	ip, r1, lsl #25
20026dc2:	9902      	ldr	r1, [sp, #8]
20026dc4:	406e      	eors	r6, r5
20026dc6:	ea4c 1cd1 	orr.w	ip, ip, r1, lsr #7
20026dca:	064d      	lsls	r5, r1, #25
20026dcc:	9901      	ldr	r1, [sp, #4]
20026dce:	ea87 070c 	eor.w	r7, r7, ip
20026dd2:	ea45 15d1 	orr.w	r5, r5, r1, lsr #7
20026dd6:	406e      	eors	r6, r5
20026dd8:	9903      	ldr	r1, [sp, #12]
20026dda:	9d01      	ldr	r5, [sp, #4]
20026ddc:	430d      	orrs	r5, r1
20026dde:	9902      	ldr	r1, [sp, #8]
20026de0:	ea4b 0c01 	orr.w	ip, fp, r1
20026de4:	ea05 0103 	and.w	r1, r5, r3
20026de8:	910c      	str	r1, [sp, #48]	@ 0x30
20026dea:	9d01      	ldr	r5, [sp, #4]
20026dec:	9903      	ldr	r1, [sp, #12]
20026dee:	ea0c 0c02 	and.w	ip, ip, r2
20026df2:	ea01 0905 	and.w	r9, r1, r5
20026df6:	9902      	ldr	r1, [sp, #8]
20026df8:	ea0b 0e01 	and.w	lr, fp, r1
20026dfc:	990c      	ldr	r1, [sp, #48]	@ 0x30
20026dfe:	ea4c 0c0e 	orr.w	ip, ip, lr
20026e02:	ea41 0509 	orr.w	r5, r1, r9
20026e06:	9900      	ldr	r1, [sp, #0]
20026e08:	197d      	adds	r5, r7, r5
20026e0a:	eb46 060c 	adc.w	r6, r6, ip
20026e0e:	eb15 0904 	adds.w	r9, r5, r4
20026e12:	e9d1 4506 	ldrd	r4, r5, [r1, #24]
20026e16:	9904      	ldr	r1, [sp, #16]
20026e18:	eb48 0806 	adc.w	r8, r8, r6
20026e1c:	e9d0 6706 	ldrd	r6, r7, [r0, #24]
20026e20:	19a4      	adds	r4, r4, r6
20026e22:	eb45 0507 	adc.w	r5, r5, r7
20026e26:	1864      	adds	r4, r4, r1
20026e28:	9905      	ldr	r1, [sp, #20]
20026e2a:	9e08      	ldr	r6, [sp, #32]
20026e2c:	eb41 0505 	adc.w	r5, r1, r5
20026e30:	990a      	ldr	r1, [sp, #40]	@ 0x28
20026e32:	ea81 0706 	eor.w	r7, r1, r6
20026e36:	990b      	ldr	r1, [sp, #44]	@ 0x2c
20026e38:	9e09      	ldr	r6, [sp, #36]	@ 0x24
20026e3a:	404e      	eors	r6, r1
20026e3c:	9906      	ldr	r1, [sp, #24]
20026e3e:	400f      	ands	r7, r1
20026e40:	9907      	ldr	r1, [sp, #28]
20026e42:	400e      	ands	r6, r1
20026e44:	990a      	ldr	r1, [sp, #40]	@ 0x28
20026e46:	404f      	eors	r7, r1
20026e48:	990b      	ldr	r1, [sp, #44]	@ 0x2c
20026e4a:	19e4      	adds	r4, r4, r7
20026e4c:	ea86 0601 	eor.w	r6, r6, r1
20026e50:	9906      	ldr	r1, [sp, #24]
20026e52:	eb45 0506 	adc.w	r5, r5, r6
20026e56:	ea4f 3c91 	mov.w	ip, r1, lsr #14
20026e5a:	9907      	ldr	r1, [sp, #28]
20026e5c:	ea4c 4c81 	orr.w	ip, ip, r1, lsl #18
20026e60:	0b8e      	lsrs	r6, r1, #14
20026e62:	9906      	ldr	r1, [sp, #24]
20026e64:	ea46 4681 	orr.w	r6, r6, r1, lsl #18
20026e68:	ea4f 4e91 	mov.w	lr, r1, lsr #18
20026e6c:	9907      	ldr	r1, [sp, #28]
20026e6e:	ea4e 3e81 	orr.w	lr, lr, r1, lsl #14
20026e72:	0c8f      	lsrs	r7, r1, #18
20026e74:	9906      	ldr	r1, [sp, #24]
20026e76:	ea8c 0c0e 	eor.w	ip, ip, lr
20026e7a:	ea47 3781 	orr.w	r7, r7, r1, lsl #14
20026e7e:	407e      	eors	r6, r7
20026e80:	05cf      	lsls	r7, r1, #23
20026e82:	9907      	ldr	r1, [sp, #28]
20026e84:	ea47 2751 	orr.w	r7, r7, r1, lsr #9
20026e88:	ea4f 5ec1 	mov.w	lr, r1, lsl #23
20026e8c:	9906      	ldr	r1, [sp, #24]
20026e8e:	ea8c 0707 	eor.w	r7, ip, r7
20026e92:	ea4e 2e51 	orr.w	lr, lr, r1, lsr #9
20026e96:	19e4      	adds	r4, r4, r7
20026e98:	ea86 060e 	eor.w	r6, r6, lr
20026e9c:	eb45 0606 	adc.w	r6, r5, r6
20026ea0:	191b      	adds	r3, r3, r4
20026ea2:	930c      	str	r3, [sp, #48]	@ 0x30
20026ea4:	eb42 0306 	adc.w	r3, r2, r6
20026ea8:	930d      	str	r3, [sp, #52]	@ 0x34
20026eaa:	ea4f 7218 	mov.w	r2, r8, lsr #28
20026eae:	ea4f 7388 	mov.w	r3, r8, lsl #30
20026eb2:	ea43 0399 	orr.w	r3, r3, r9, lsr #2
20026eb6:	ea4f 7519 	mov.w	r5, r9, lsr #28
20026eba:	ea42 1209 	orr.w	r2, r2, r9, lsl #4
20026ebe:	ea4f 7789 	mov.w	r7, r9, lsl #30
20026ec2:	ea47 0798 	orr.w	r7, r7, r8, lsr #2
20026ec6:	ea45 1508 	orr.w	r5, r5, r8, lsl #4
20026eca:	405a      	eors	r2, r3
20026ecc:	ea4f 6348 	mov.w	r3, r8, lsl #25
20026ed0:	9902      	ldr	r1, [sp, #8]
20026ed2:	ea43 13d9 	orr.w	r3, r3, r9, lsr #7
20026ed6:	407d      	eors	r5, r7
20026ed8:	ea4f 6749 	mov.w	r7, r9, lsl #25
20026edc:	ea47 17d8 	orr.w	r7, r7, r8, lsr #7
20026ee0:	405a      	eors	r2, r3
20026ee2:	9b01      	ldr	r3, [sp, #4]
20026ee4:	407d      	eors	r5, r7
20026ee6:	ea41 0708 	orr.w	r7, r1, r8
20026eea:	9903      	ldr	r1, [sp, #12]
20026eec:	ea43 0309 	orr.w	r3, r3, r9
20026ef0:	400b      	ands	r3, r1
20026ef2:	9901      	ldr	r1, [sp, #4]
20026ef4:	ea07 070b 	and.w	r7, r7, fp
20026ef8:	ea01 0e09 	and.w	lr, r1, r9
20026efc:	9902      	ldr	r1, [sp, #8]
20026efe:	ea43 030e 	orr.w	r3, r3, lr
20026f02:	ea01 0c08 	and.w	ip, r1, r8
20026f06:	ea47 070c 	orr.w	r7, r7, ip
20026f0a:	18eb      	adds	r3, r5, r3
20026f0c:	eb42 0207 	adc.w	r2, r2, r7
20026f10:	191b      	adds	r3, r3, r4
20026f12:	9304      	str	r3, [sp, #16]
20026f14:	eb46 0302 	adc.w	r3, r6, r2
20026f18:	9305      	str	r3, [sp, #20]
20026f1a:	9b00      	ldr	r3, [sp, #0]
20026f1c:	6a1b      	ldr	r3, [r3, #32]
20026f1e:	9a00      	ldr	r2, [sp, #0]
20026f20:	990a      	ldr	r1, [sp, #40]	@ 0x28
20026f22:	6a52      	ldr	r2, [r2, #36]	@ 0x24
20026f24:	e9d0 4508 	ldrd	r4, r5, [r0, #32]
20026f28:	191b      	adds	r3, r3, r4
20026f2a:	eb42 0205 	adc.w	r2, r2, r5
20026f2e:	185b      	adds	r3, r3, r1
20026f30:	990b      	ldr	r1, [sp, #44]	@ 0x2c
20026f32:	9c06      	ldr	r4, [sp, #24]
20026f34:	eb41 0202 	adc.w	r2, r1, r2
20026f38:	9908      	ldr	r1, [sp, #32]
20026f3a:	ea81 0504 	eor.w	r5, r1, r4
20026f3e:	9909      	ldr	r1, [sp, #36]	@ 0x24
20026f40:	9c07      	ldr	r4, [sp, #28]
20026f42:	404c      	eors	r4, r1
20026f44:	990c      	ldr	r1, [sp, #48]	@ 0x30
20026f46:	400d      	ands	r5, r1
20026f48:	990d      	ldr	r1, [sp, #52]	@ 0x34
20026f4a:	400c      	ands	r4, r1
20026f4c:	9908      	ldr	r1, [sp, #32]
20026f4e:	404d      	eors	r5, r1
20026f50:	9909      	ldr	r1, [sp, #36]	@ 0x24
20026f52:	195b      	adds	r3, r3, r5
20026f54:	ea84 0401 	eor.w	r4, r4, r1
20026f58:	990c      	ldr	r1, [sp, #48]	@ 0x30
20026f5a:	eb42 0204 	adc.w	r2, r2, r4
20026f5e:	0b8e      	lsrs	r6, r1, #14
20026f60:	990d      	ldr	r1, [sp, #52]	@ 0x34
20026f62:	ea46 4681 	orr.w	r6, r6, r1, lsl #18
20026f66:	0b8c      	lsrs	r4, r1, #14
20026f68:	990c      	ldr	r1, [sp, #48]	@ 0x30
20026f6a:	ea44 4481 	orr.w	r4, r4, r1, lsl #18
20026f6e:	0c8f      	lsrs	r7, r1, #18
20026f70:	990d      	ldr	r1, [sp, #52]	@ 0x34
20026f72:	ea47 3781 	orr.w	r7, r7, r1, lsl #14
20026f76:	0c8d      	lsrs	r5, r1, #18
20026f78:	990c      	ldr	r1, [sp, #48]	@ 0x30
20026f7a:	407e      	eors	r6, r7
20026f7c:	ea45 3581 	orr.w	r5, r5, r1, lsl #14
20026f80:	406c      	eors	r4, r5
20026f82:	05cd      	lsls	r5, r1, #23
20026f84:	990d      	ldr	r1, [sp, #52]	@ 0x34
20026f86:	ea45 2551 	orr.w	r5, r5, r1, lsr #9
20026f8a:	05cf      	lsls	r7, r1, #23
20026f8c:	990c      	ldr	r1, [sp, #48]	@ 0x30
20026f8e:	4075      	eors	r5, r6
20026f90:	ea47 2751 	orr.w	r7, r7, r1, lsr #9
20026f94:	9903      	ldr	r1, [sp, #12]
20026f96:	195b      	adds	r3, r3, r5
20026f98:	ea84 0407 	eor.w	r4, r4, r7
20026f9c:	eb42 0204 	adc.w	r2, r2, r4
20026fa0:	18c9      	adds	r1, r1, r3
20026fa2:	910a      	str	r1, [sp, #40]	@ 0x28
20026fa4:	eb4b 0102 	adc.w	r1, fp, r2
20026fa8:	910b      	str	r1, [sp, #44]	@ 0x2c
20026faa:	9904      	ldr	r1, [sp, #16]
20026fac:	0f0e      	lsrs	r6, r1, #28
20026fae:	9905      	ldr	r1, [sp, #20]
20026fb0:	ea46 1601 	orr.w	r6, r6, r1, lsl #4
20026fb4:	0f0d      	lsrs	r5, r1, #28
20026fb6:	9904      	ldr	r1, [sp, #16]
20026fb8:	ea45 1501 	orr.w	r5, r5, r1, lsl #4
20026fbc:	078f      	lsls	r7, r1, #30
20026fbe:	9905      	ldr	r1, [sp, #20]
20026fc0:	ea47 0791 	orr.w	r7, r7, r1, lsr #2
20026fc4:	078c      	lsls	r4, r1, #30
20026fc6:	9904      	ldr	r1, [sp, #16]
20026fc8:	407e      	eors	r6, r7
20026fca:	ea44 0491 	orr.w	r4, r4, r1, lsr #2
20026fce:	064f      	lsls	r7, r1, #25
20026fd0:	9905      	ldr	r1, [sp, #20]
20026fd2:	4065      	eors	r5, r4
20026fd4:	ea47 17d1 	orr.w	r7, r7, r1, lsr #7
20026fd8:	064c      	lsls	r4, r1, #25
20026fda:	9904      	ldr	r1, [sp, #16]
20026fdc:	407e      	eors	r6, r7
20026fde:	ea44 14d1 	orr.w	r4, r4, r1, lsr #7
20026fe2:	4065      	eors	r5, r4
20026fe4:	ea49 0401 	orr.w	r4, r9, r1
20026fe8:	9905      	ldr	r1, [sp, #20]
20026fea:	ea48 0701 	orr.w	r7, r8, r1
20026fee:	9901      	ldr	r1, [sp, #4]
20026ff0:	400c      	ands	r4, r1
20026ff2:	9902      	ldr	r1, [sp, #8]
20026ff4:	400f      	ands	r7, r1
20026ff6:	9904      	ldr	r1, [sp, #16]
20026ff8:	ea09 0e01 	and.w	lr, r9, r1
20026ffc:	9905      	ldr	r1, [sp, #20]
20026ffe:	ea44 040e 	orr.w	r4, r4, lr
20027002:	ea08 0c01 	and.w	ip, r8, r1
20027006:	1934      	adds	r4, r6, r4
20027008:	ea47 070c 	orr.w	r7, r7, ip
2002700c:	eb45 0507 	adc.w	r5, r5, r7
20027010:	18e3      	adds	r3, r4, r3
20027012:	9303      	str	r3, [sp, #12]
20027014:	9b00      	ldr	r3, [sp, #0]
20027016:	eb42 0b05 	adc.w	fp, r2, r5
2002701a:	9a00      	ldr	r2, [sp, #0]
2002701c:	6a9b      	ldr	r3, [r3, #40]	@ 0x28
2002701e:	9908      	ldr	r1, [sp, #32]
20027020:	6ad2      	ldr	r2, [r2, #44]	@ 0x2c
20027022:	e9d0 450a 	ldrd	r4, r5, [r0, #40]	@ 0x28
20027026:	191b      	adds	r3, r3, r4
20027028:	eb42 0205 	adc.w	r2, r2, r5
2002702c:	185b      	adds	r3, r3, r1
2002702e:	9909      	ldr	r1, [sp, #36]	@ 0x24
20027030:	9c0c      	ldr	r4, [sp, #48]	@ 0x30
20027032:	eb41 0202 	adc.w	r2, r1, r2
20027036:	9906      	ldr	r1, [sp, #24]
20027038:	ea81 0504 	eor.w	r5, r1, r4
2002703c:	9907      	ldr	r1, [sp, #28]
2002703e:	9c0d      	ldr	r4, [sp, #52]	@ 0x34
20027040:	404c      	eors	r4, r1
20027042:	990a      	ldr	r1, [sp, #40]	@ 0x28
20027044:	400d      	ands	r5, r1
20027046:	990b      	ldr	r1, [sp, #44]	@ 0x2c
20027048:	400c      	ands	r4, r1
2002704a:	9906      	ldr	r1, [sp, #24]
2002704c:	404d      	eors	r5, r1
2002704e:	9907      	ldr	r1, [sp, #28]
20027050:	195b      	adds	r3, r3, r5
20027052:	ea84 0401 	eor.w	r4, r4, r1
20027056:	990a      	ldr	r1, [sp, #40]	@ 0x28
20027058:	eb42 0204 	adc.w	r2, r2, r4
2002705c:	0b8e      	lsrs	r6, r1, #14
2002705e:	990b      	ldr	r1, [sp, #44]	@ 0x2c
20027060:	ea46 4681 	orr.w	r6, r6, r1, lsl #18
20027064:	0b8c      	lsrs	r4, r1, #14
20027066:	990a      	ldr	r1, [sp, #40]	@ 0x28
20027068:	ea44 4481 	orr.w	r4, r4, r1, lsl #18
2002706c:	0c8f      	lsrs	r7, r1, #18
2002706e:	990b      	ldr	r1, [sp, #44]	@ 0x2c
20027070:	ea47 3781 	orr.w	r7, r7, r1, lsl #14
20027074:	0c8d      	lsrs	r5, r1, #18
20027076:	990a      	ldr	r1, [sp, #40]	@ 0x28
20027078:	407e      	eors	r6, r7
2002707a:	ea45 3581 	orr.w	r5, r5, r1, lsl #14
2002707e:	406c      	eors	r4, r5
20027080:	05cd      	lsls	r5, r1, #23
20027082:	990b      	ldr	r1, [sp, #44]	@ 0x2c
20027084:	ea45 2551 	orr.w	r5, r5, r1, lsr #9
20027088:	05cf      	lsls	r7, r1, #23
2002708a:	990a      	ldr	r1, [sp, #40]	@ 0x28
2002708c:	4075      	eors	r5, r6
2002708e:	ea47 2751 	orr.w	r7, r7, r1, lsr #9
20027092:	9901      	ldr	r1, [sp, #4]
20027094:	195b      	adds	r3, r3, r5
20027096:	ea84 0407 	eor.w	r4, r4, r7
2002709a:	eb42 0204 	adc.w	r2, r2, r4
2002709e:	18c9      	adds	r1, r1, r3
200270a0:	9108      	str	r1, [sp, #32]
200270a2:	9902      	ldr	r1, [sp, #8]
200270a4:	ea4f 751b 	mov.w	r5, fp, lsr #28
200270a8:	eb41 0102 	adc.w	r1, r1, r2
200270ac:	9109      	str	r1, [sp, #36]	@ 0x24
200270ae:	9903      	ldr	r1, [sp, #12]
200270b0:	ea4f 748b 	mov.w	r4, fp, lsl #30
200270b4:	ea44 0491 	orr.w	r4, r4, r1, lsr #2
200270b8:	ea45 1501 	orr.w	r5, r5, r1, lsl #4
200270bc:	0f0e      	lsrs	r6, r1, #28
200270be:	078f      	lsls	r7, r1, #30
200270c0:	4065      	eors	r5, r4
200270c2:	ea4f 644b 	mov.w	r4, fp, lsl #25
200270c6:	ea47 079b 	orr.w	r7, r7, fp, lsr #2
200270ca:	ea44 14d1 	orr.w	r4, r4, r1, lsr #7
200270ce:	ea46 160b 	orr.w	r6, r6, fp, lsl #4
200270d2:	407e      	eors	r6, r7
200270d4:	4065      	eors	r5, r4
200270d6:	064f      	lsls	r7, r1, #25
200270d8:	e9dd 4103 	ldrd	r4, r1, [sp, #12]
200270dc:	430c      	orrs	r4, r1
200270de:	9905      	ldr	r1, [sp, #20]
200270e0:	ea47 17db 	orr.w	r7, r7, fp, lsr #7
200270e4:	407e      	eors	r6, r7
200270e6:	ea41 070b 	orr.w	r7, r1, fp
200270ea:	ea04 0109 	and.w	r1, r4, r9
200270ee:	9101      	str	r1, [sp, #4]
200270f0:	e9dd 4103 	ldrd	r4, r1, [sp, #12]
200270f4:	ea01 0e04 	and.w	lr, r1, r4
200270f8:	9905      	ldr	r1, [sp, #20]
200270fa:	ea07 0708 	and.w	r7, r7, r8
200270fe:	ea01 0c0b 	and.w	ip, r1, fp
20027102:	9901      	ldr	r1, [sp, #4]
20027104:	ea47 070c 	orr.w	r7, r7, ip
20027108:	ea41 040e 	orr.w	r4, r1, lr
2002710c:	1934      	adds	r4, r6, r4
2002710e:	eb45 0507 	adc.w	r5, r5, r7
20027112:	18e3      	adds	r3, r4, r3
20027114:	9301      	str	r3, [sp, #4]
20027116:	eb42 0305 	adc.w	r3, r2, r5
2002711a:	9302      	str	r3, [sp, #8]
2002711c:	9b00      	ldr	r3, [sp, #0]
2002711e:	9a00      	ldr	r2, [sp, #0]
20027120:	6b1b      	ldr	r3, [r3, #48]	@ 0x30
20027122:	9906      	ldr	r1, [sp, #24]
20027124:	6b52      	ldr	r2, [r2, #52]	@ 0x34
20027126:	e9d0 450c 	ldrd	r4, r5, [r0, #48]	@ 0x30
2002712a:	191b      	adds	r3, r3, r4
2002712c:	eb42 0205 	adc.w	r2, r2, r5
20027130:	185b      	adds	r3, r3, r1
20027132:	9907      	ldr	r1, [sp, #28]
20027134:	9c0a      	ldr	r4, [sp, #40]	@ 0x28
20027136:	eb41 0202 	adc.w	r2, r1, r2
2002713a:	990c      	ldr	r1, [sp, #48]	@ 0x30
2002713c:	ea81 0504 	eor.w	r5, r1, r4
20027140:	990d      	ldr	r1, [sp, #52]	@ 0x34
20027142:	9c0b      	ldr	r4, [sp, #44]	@ 0x2c
20027144:	404c      	eors	r4, r1
20027146:	9908      	ldr	r1, [sp, #32]
20027148:	400d      	ands	r5, r1
2002714a:	9909      	ldr	r1, [sp, #36]	@ 0x24
2002714c:	400c      	ands	r4, r1
2002714e:	990c      	ldr	r1, [sp, #48]	@ 0x30
20027150:	404d      	eors	r5, r1
20027152:	990d      	ldr	r1, [sp, #52]	@ 0x34
20027154:	195b      	adds	r3, r3, r5
20027156:	ea84 0401 	eor.w	r4, r4, r1
2002715a:	9908      	ldr	r1, [sp, #32]
2002715c:	eb42 0204 	adc.w	r2, r2, r4
20027160:	0b8e      	lsrs	r6, r1, #14
20027162:	9909      	ldr	r1, [sp, #36]	@ 0x24
20027164:	ea46 4681 	orr.w	r6, r6, r1, lsl #18
20027168:	0b8c      	lsrs	r4, r1, #14
2002716a:	9908      	ldr	r1, [sp, #32]
2002716c:	ea44 4481 	orr.w	r4, r4, r1, lsl #18
20027170:	0c8f      	lsrs	r7, r1, #18
20027172:	9909      	ldr	r1, [sp, #36]	@ 0x24
20027174:	ea47 3781 	orr.w	r7, r7, r1, lsl #14
20027178:	0c8d      	lsrs	r5, r1, #18
2002717a:	9908      	ldr	r1, [sp, #32]
2002717c:	407e      	eors	r6, r7
2002717e:	ea45 3581 	orr.w	r5, r5, r1, lsl #14
20027182:	406c      	eors	r4, r5
20027184:	05cd      	lsls	r5, r1, #23
20027186:	9909      	ldr	r1, [sp, #36]	@ 0x24
20027188:	ea45 2551 	orr.w	r5, r5, r1, lsr #9
2002718c:	05cf      	lsls	r7, r1, #23
2002718e:	9908      	ldr	r1, [sp, #32]
20027190:	4075      	eors	r5, r6
20027192:	ea47 2751 	orr.w	r7, r7, r1, lsr #9
20027196:	195b      	adds	r3, r3, r5
20027198:	ea84 0407 	eor.w	r4, r4, r7
2002719c:	eb42 0204 	adc.w	r2, r2, r4
200271a0:	eb19 0103 	adds.w	r1, r9, r3
200271a4:	9106      	str	r1, [sp, #24]
200271a6:	eb48 0102 	adc.w	r1, r8, r2
200271aa:	9107      	str	r1, [sp, #28]
200271ac:	9901      	ldr	r1, [sp, #4]
200271ae:	0f0e      	lsrs	r6, r1, #28
200271b0:	9902      	ldr	r1, [sp, #8]
200271b2:	ea46 1601 	orr.w	r6, r6, r1, lsl #4
200271b6:	0f0d      	lsrs	r5, r1, #28
200271b8:	9901      	ldr	r1, [sp, #4]
200271ba:	ea45 1501 	orr.w	r5, r5, r1, lsl #4
200271be:	078f      	lsls	r7, r1, #30
200271c0:	9902      	ldr	r1, [sp, #8]
200271c2:	ea47 0791 	orr.w	r7, r7, r1, lsr #2
200271c6:	078c      	lsls	r4, r1, #30
200271c8:	9901      	ldr	r1, [sp, #4]
200271ca:	407e      	eors	r6, r7
200271cc:	ea44 0491 	orr.w	r4, r4, r1, lsr #2
200271d0:	064f      	lsls	r7, r1, #25
200271d2:	9902      	ldr	r1, [sp, #8]
200271d4:	4065      	eors	r5, r4
200271d6:	ea47 17d1 	orr.w	r7, r7, r1, lsr #7
200271da:	064c      	lsls	r4, r1, #25
200271dc:	9901      	ldr	r1, [sp, #4]
200271de:	407e      	eors	r6, r7
200271e0:	ea44 14d1 	orr.w	r4, r4, r1, lsr #7
200271e4:	4065      	eors	r5, r4
200271e6:	9903      	ldr	r1, [sp, #12]
200271e8:	9c01      	ldr	r4, [sp, #4]
200271ea:	430c      	orrs	r4, r1
200271ec:	9902      	ldr	r1, [sp, #8]
200271ee:	ea4b 0701 	orr.w	r7, fp, r1
200271f2:	9904      	ldr	r1, [sp, #16]
200271f4:	ea04 0801 	and.w	r8, r4, r1
200271f8:	9905      	ldr	r1, [sp, #20]
200271fa:	9c01      	ldr	r4, [sp, #4]
200271fc:	400f      	ands	r7, r1
200271fe:	9903      	ldr	r1, [sp, #12]
20027200:	ea01 0e04 	and.w	lr, r1, r4
20027204:	9902      	ldr	r1, [sp, #8]
20027206:	ea48 040e 	orr.w	r4, r8, lr
2002720a:	ea0b 0c01 	and.w	ip, fp, r1
2002720e:	1934      	adds	r4, r6, r4
20027210:	ea47 070c 	orr.w	r7, r7, ip
20027214:	eb45 0507 	adc.w	r5, r5, r7
20027218:	eb14 0c03 	adds.w	ip, r4, r3
2002721c:	9b00      	ldr	r3, [sp, #0]
2002721e:	eb42 0e05 	adc.w	lr, r2, r5
20027222:	6b9b      	ldr	r3, [r3, #56]	@ 0x38
20027224:	9a00      	ldr	r2, [sp, #0]
20027226:	e9d0 450e 	ldrd	r4, r5, [r0, #56]	@ 0x38
2002722a:	6bd2      	ldr	r2, [r2, #60]	@ 0x3c
2002722c:	191c      	adds	r4, r3, r4
2002722e:	9b0c      	ldr	r3, [sp, #48]	@ 0x30
20027230:	eb42 0205 	adc.w	r2, r2, r5
20027234:	18e4      	adds	r4, r4, r3
20027236:	9b0d      	ldr	r3, [sp, #52]	@ 0x34
20027238:	9908      	ldr	r1, [sp, #32]
2002723a:	eb43 0202 	adc.w	r2, r3, r2
2002723e:	9b0a      	ldr	r3, [sp, #40]	@ 0x28
20027240:	3040      	adds	r0, #64	@ 0x40
20027242:	ea83 0501 	eor.w	r5, r3, r1
20027246:	9909      	ldr	r1, [sp, #36]	@ 0x24
20027248:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
2002724a:	404b      	eors	r3, r1
2002724c:	9906      	ldr	r1, [sp, #24]
2002724e:	400d      	ands	r5, r1
20027250:	9907      	ldr	r1, [sp, #28]
20027252:	400b      	ands	r3, r1
20027254:	990a      	ldr	r1, [sp, #40]	@ 0x28
20027256:	404d      	eors	r5, r1
20027258:	990b      	ldr	r1, [sp, #44]	@ 0x2c
2002725a:	1964      	adds	r4, r4, r5
2002725c:	ea83 0301 	eor.w	r3, r3, r1
20027260:	eb42 0203 	adc.w	r2, r2, r3
20027264:	9b06      	ldr	r3, [sp, #24]
20027266:	9906      	ldr	r1, [sp, #24]
20027268:	0b9e      	lsrs	r6, r3, #14
2002726a:	9b07      	ldr	r3, [sp, #28]
2002726c:	0c8f      	lsrs	r7, r1, #18
2002726e:	ea46 4683 	orr.w	r6, r6, r3, lsl #18
20027272:	0b9b      	lsrs	r3, r3, #14
20027274:	ea43 4381 	orr.w	r3, r3, r1, lsl #18
20027278:	9907      	ldr	r1, [sp, #28]
2002727a:	ea47 3781 	orr.w	r7, r7, r1, lsl #14
2002727e:	0c8d      	lsrs	r5, r1, #18
20027280:	9906      	ldr	r1, [sp, #24]
20027282:	407e      	eors	r6, r7
20027284:	ea45 3581 	orr.w	r5, r5, r1, lsl #14
20027288:	406b      	eors	r3, r5
2002728a:	05cd      	lsls	r5, r1, #23
2002728c:	9907      	ldr	r1, [sp, #28]
2002728e:	ea45 2551 	orr.w	r5, r5, r1, lsr #9
20027292:	05cf      	lsls	r7, r1, #23
20027294:	9906      	ldr	r1, [sp, #24]
20027296:	4075      	eors	r5, r6
20027298:	ea47 2751 	orr.w	r7, r7, r1, lsr #9
2002729c:	1964      	adds	r4, r4, r5
2002729e:	ea83 0307 	eor.w	r3, r3, r7
200272a2:	eb42 0203 	adc.w	r2, r2, r3
200272a6:	9b04      	ldr	r3, [sp, #16]
200272a8:	ea4f 751e 	mov.w	r5, lr, lsr #28
200272ac:	191b      	adds	r3, r3, r4
200272ae:	9304      	str	r3, [sp, #16]
200272b0:	9b05      	ldr	r3, [sp, #20]
200272b2:	ea4f 761c 	mov.w	r6, ip, lsr #28
200272b6:	eb43 0302 	adc.w	r3, r3, r2
200272ba:	9305      	str	r3, [sp, #20]
200272bc:	ea4f 738e 	mov.w	r3, lr, lsl #30
200272c0:	ea43 039c 	orr.w	r3, r3, ip, lsr #2
200272c4:	ea45 150c 	orr.w	r5, r5, ip, lsl #4
200272c8:	ea4f 778c 	mov.w	r7, ip, lsl #30
200272cc:	ea47 079e 	orr.w	r7, r7, lr, lsr #2
200272d0:	405d      	eors	r5, r3
200272d2:	ea46 160e 	orr.w	r6, r6, lr, lsl #4
200272d6:	ea4f 634e 	mov.w	r3, lr, lsl #25
200272da:	9902      	ldr	r1, [sp, #8]
200272dc:	407e      	eors	r6, r7
200272de:	ea43 13dc 	orr.w	r3, r3, ip, lsr #7
200272e2:	ea4f 674c 	mov.w	r7, ip, lsl #25
200272e6:	ea47 17de 	orr.w	r7, r7, lr, lsr #7
200272ea:	405d      	eors	r5, r3
200272ec:	9b01      	ldr	r3, [sp, #4]
200272ee:	407e      	eors	r6, r7
200272f0:	ea41 070e 	orr.w	r7, r1, lr
200272f4:	9903      	ldr	r1, [sp, #12]
200272f6:	ea43 030c 	orr.w	r3, r3, ip
200272fa:	400b      	ands	r3, r1
200272fc:	9901      	ldr	r1, [sp, #4]
200272fe:	ea07 070b 	and.w	r7, r7, fp
20027302:	ea01 090c 	and.w	r9, r1, ip
20027306:	9902      	ldr	r1, [sp, #8]
20027308:	ea43 0309 	orr.w	r3, r3, r9
2002730c:	ea01 080e 	and.w	r8, r1, lr
20027310:	9900      	ldr	r1, [sp, #0]
20027312:	18f3      	adds	r3, r6, r3
20027314:	f101 0140 	add.w	r1, r1, #64	@ 0x40
20027318:	9100      	str	r1, [sp, #0]
2002731a:	ea47 0708 	orr.w	r7, r7, r8
2002731e:	eb45 0507 	adc.w	r5, r5, r7
20027322:	4928      	ldr	r1, [pc, #160]	@ (200273c4 <mbedtls_sha512_process+0xa54>)
20027324:	191b      	adds	r3, r3, r4
20027326:	9c00      	ldr	r4, [sp, #0]
20027328:	eb42 0205 	adc.w	r2, r2, r5
2002732c:	42a1      	cmp	r1, r4
2002732e:	f47f abe3 	bne.w	20026af8 <mbedtls_sha512_process+0x188>
20027332:	990e      	ldr	r1, [sp, #56]	@ 0x38
20027334:	18cb      	adds	r3, r1, r3
20027336:	990f      	ldr	r1, [sp, #60]	@ 0x3c
20027338:	eb42 0201 	adc.w	r2, r2, r1
2002733c:	e9ca 3204 	strd	r3, r2, [sl, #16]
20027340:	9b10      	ldr	r3, [sp, #64]	@ 0x40
20027342:	9a11      	ldr	r2, [sp, #68]	@ 0x44
20027344:	eb13 030c 	adds.w	r3, r3, ip
20027348:	eb4e 0202 	adc.w	r2, lr, r2
2002734c:	e9ca 3206 	strd	r3, r2, [sl, #24]
20027350:	9a01      	ldr	r2, [sp, #4]
20027352:	9b12      	ldr	r3, [sp, #72]	@ 0x48
20027354:	9913      	ldr	r1, [sp, #76]	@ 0x4c
20027356:	189b      	adds	r3, r3, r2
20027358:	9a02      	ldr	r2, [sp, #8]
2002735a:	eb42 0201 	adc.w	r2, r2, r1
2002735e:	e9ca 3208 	strd	r3, r2, [sl, #32]
20027362:	9a03      	ldr	r2, [sp, #12]
20027364:	9b14      	ldr	r3, [sp, #80]	@ 0x50
20027366:	9917      	ldr	r1, [sp, #92]	@ 0x5c
20027368:	189b      	adds	r3, r3, r2
2002736a:	9a15      	ldr	r2, [sp, #84]	@ 0x54
2002736c:	eb4b 0202 	adc.w	r2, fp, r2
20027370:	e9ca 320a 	strd	r3, r2, [sl, #40]	@ 0x28
20027374:	9a04      	ldr	r2, [sp, #16]
20027376:	9b16      	ldr	r3, [sp, #88]	@ 0x58
20027378:	189b      	adds	r3, r3, r2
2002737a:	9a05      	ldr	r2, [sp, #20]
2002737c:	eb42 0201 	adc.w	r2, r2, r1
20027380:	e9ca 320c 	strd	r3, r2, [sl, #48]	@ 0x30
20027384:	9b18      	ldr	r3, [sp, #96]	@ 0x60
20027386:	9a06      	ldr	r2, [sp, #24]
20027388:	9919      	ldr	r1, [sp, #100]	@ 0x64
2002738a:	189a      	adds	r2, r3, r2
2002738c:	9b07      	ldr	r3, [sp, #28]
2002738e:	eb43 0301 	adc.w	r3, r3, r1
20027392:	e9ca 230e 	strd	r2, r3, [sl, #56]	@ 0x38
20027396:	9b1a      	ldr	r3, [sp, #104]	@ 0x68
20027398:	9a08      	ldr	r2, [sp, #32]
2002739a:	991b      	ldr	r1, [sp, #108]	@ 0x6c
2002739c:	189a      	adds	r2, r3, r2
2002739e:	9b09      	ldr	r3, [sp, #36]	@ 0x24
200273a0:	eb43 0301 	adc.w	r3, r3, r1
200273a4:	e9ca 2310 	strd	r2, r3, [sl, #64]	@ 0x40
200273a8:	9b1c      	ldr	r3, [sp, #112]	@ 0x70
200273aa:	9a0a      	ldr	r2, [sp, #40]	@ 0x28
200273ac:	991d      	ldr	r1, [sp, #116]	@ 0x74
200273ae:	189a      	adds	r2, r3, r2
200273b0:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
200273b2:	eb43 0301 	adc.w	r3, r3, r1
200273b6:	e9ca 2312 	strd	r2, r3, [sl, #72]	@ 0x48
200273ba:	f50d 7d3f 	add.w	sp, sp, #764	@ 0x2fc
200273be:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
200273c2:	bf00      	nop
200273c4:	2002c178 	.word	0x2002c178

200273c8 <mbedtls_sha512_update.part.0>:
200273c8:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
200273cc:	4615      	mov	r5, r2
200273ce:	e9d0 3200 	ldrd	r3, r2, [r0]
200273d2:	f003 077f 	and.w	r7, r3, #127	@ 0x7f
200273d6:	195b      	adds	r3, r3, r5
200273d8:	f152 0200 	adcs.w	r2, r2, #0
200273dc:	460e      	mov	r6, r1
200273de:	f04f 0100 	mov.w	r1, #0
200273e2:	bf28      	it	cs
200273e4:	2101      	movcs	r1, #1
200273e6:	4604      	mov	r4, r0
200273e8:	e9c0 3200 	strd	r3, r2, [r0]
200273ec:	b131      	cbz	r1, 200273fc <mbedtls_sha512_update.part.0+0x34>
200273ee:	e9d0 3202 	ldrd	r3, r2, [r0, #8]
200273f2:	3301      	adds	r3, #1
200273f4:	f142 0200 	adc.w	r2, r2, #0
200273f8:	e9c0 3202 	strd	r3, r2, [r0, #8]
200273fc:	b19f      	cbz	r7, 20027426 <mbedtls_sha512_update.part.0+0x5e>
200273fe:	f1c7 0980 	rsb	r9, r7, #128	@ 0x80
20027402:	45a9      	cmp	r9, r5
20027404:	d80f      	bhi.n	20027426 <mbedtls_sha512_update.part.0+0x5e>
20027406:	f104 0850 	add.w	r8, r4, #80	@ 0x50
2002740a:	4631      	mov	r1, r6
2002740c:	464a      	mov	r2, r9
2002740e:	eb08 0007 	add.w	r0, r8, r7
20027412:	f003 fa05 	bl	2002a820 <memcpy>
20027416:	3d80      	subs	r5, #128	@ 0x80
20027418:	4641      	mov	r1, r8
2002741a:	4620      	mov	r0, r4
2002741c:	443d      	add	r5, r7
2002741e:	f7ff faa7 	bl	20026970 <mbedtls_sha512_process>
20027422:	2700      	movs	r7, #0
20027424:	444e      	add	r6, r9
20027426:	46a8      	mov	r8, r5
20027428:	eb05 0906 	add.w	r9, r5, r6
2002742c:	e004      	b.n	20027438 <mbedtls_sha512_update.part.0+0x70>
2002742e:	4620      	mov	r0, r4
20027430:	f7ff fa9e 	bl	20026970 <mbedtls_sha512_process>
20027434:	f1a8 0880 	sub.w	r8, r8, #128	@ 0x80
20027438:	f1b8 0f7f 	cmp.w	r8, #127	@ 0x7f
2002743c:	eba9 0108 	sub.w	r1, r9, r8
20027440:	d8f5      	bhi.n	2002742e <mbedtls_sha512_update.part.0+0x66>
20027442:	f06f 037f 	mvn.w	r3, #127	@ 0x7f
20027446:	09e9      	lsrs	r1, r5, #7
20027448:	4359      	muls	r1, r3
2002744a:	186a      	adds	r2, r5, r1
2002744c:	d007      	beq.n	2002745e <mbedtls_sha512_update.part.0+0x96>
2002744e:	f104 0050 	add.w	r0, r4, #80	@ 0x50
20027452:	1a71      	subs	r1, r6, r1
20027454:	4438      	add	r0, r7
20027456:	e8bd 43f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
2002745a:	f003 b9e1 	b.w	2002a820 <memcpy>
2002745e:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}

20027462 <mbedtls_sha512_update>:
20027462:	b10a      	cbz	r2, 20027468 <mbedtls_sha512_update+0x6>
20027464:	f7ff bfb0 	b.w	200273c8 <mbedtls_sha512_update.part.0>
20027468:	4770      	bx	lr
	...

2002746c <mbedtls_sha512_finish>:
2002746c:	b5f0      	push	{r4, r5, r6, r7, lr}
2002746e:	4604      	mov	r4, r0
20027470:	e9d0 2300 	ldrd	r2, r3, [r0]
20027474:	460d      	mov	r5, r1
20027476:	e9d0 6102 	ldrd	r6, r1, [r0, #8]
2002747a:	00c9      	lsls	r1, r1, #3
2002747c:	ea41 7156 	orr.w	r1, r1, r6, lsr #29
20027480:	b085      	sub	sp, #20
20027482:	0e0f      	lsrs	r7, r1, #24
20027484:	0f58      	lsrs	r0, r3, #29
20027486:	00db      	lsls	r3, r3, #3
20027488:	ea43 7352 	orr.w	r3, r3, r2, lsr #29
2002748c:	f88d 7000 	strb.w	r7, [sp]
20027490:	0c0f      	lsrs	r7, r1, #16
20027492:	f88d 7001 	strb.w	r7, [sp, #1]
20027496:	f88d 1003 	strb.w	r1, [sp, #3]
2002749a:	0a0f      	lsrs	r7, r1, #8
2002749c:	0e19      	lsrs	r1, r3, #24
2002749e:	ea40 00c6 	orr.w	r0, r0, r6, lsl #3
200274a2:	f88d 1008 	strb.w	r1, [sp, #8]
200274a6:	00d6      	lsls	r6, r2, #3
200274a8:	0c19      	lsrs	r1, r3, #16
200274aa:	f002 027f 	and.w	r2, r2, #127	@ 0x7f
200274ae:	2a6f      	cmp	r2, #111	@ 0x6f
200274b0:	ba00      	rev	r0, r0
200274b2:	f88d 1009 	strb.w	r1, [sp, #9]
200274b6:	ea4f 2113 	mov.w	r1, r3, lsr #8
200274ba:	bf94      	ite	ls
200274bc:	f1c2 0270 	rsbls	r2, r2, #112	@ 0x70
200274c0:	f1c2 02f0 	rsbhi	r2, r2, #240	@ 0xf0
200274c4:	9001      	str	r0, [sp, #4]
200274c6:	f88d 100a 	strb.w	r1, [sp, #10]
200274ca:	4620      	mov	r0, r4
200274cc:	4969      	ldr	r1, [pc, #420]	@ (20027674 <mbedtls_sha512_finish+0x208>)
200274ce:	ba36      	rev	r6, r6
200274d0:	f88d 300b 	strb.w	r3, [sp, #11]
200274d4:	f88d 7002 	strb.w	r7, [sp, #2]
200274d8:	9603      	str	r6, [sp, #12]
200274da:	f7ff ffc2 	bl	20027462 <mbedtls_sha512_update>
200274de:	2210      	movs	r2, #16
200274e0:	4669      	mov	r1, sp
200274e2:	4620      	mov	r0, r4
200274e4:	f7ff ff70 	bl	200273c8 <mbedtls_sha512_update.part.0>
200274e8:	7de3      	ldrb	r3, [r4, #23]
200274ea:	702b      	strb	r3, [r5, #0]
200274ec:	8ae3      	ldrh	r3, [r4, #22]
200274ee:	706b      	strb	r3, [r5, #1]
200274f0:	6963      	ldr	r3, [r4, #20]
200274f2:	0a1b      	lsrs	r3, r3, #8
200274f4:	70ab      	strb	r3, [r5, #2]
200274f6:	6963      	ldr	r3, [r4, #20]
200274f8:	70eb      	strb	r3, [r5, #3]
200274fa:	7ce3      	ldrb	r3, [r4, #19]
200274fc:	712b      	strb	r3, [r5, #4]
200274fe:	8a63      	ldrh	r3, [r4, #18]
20027500:	716b      	strb	r3, [r5, #5]
20027502:	6923      	ldr	r3, [r4, #16]
20027504:	0a1b      	lsrs	r3, r3, #8
20027506:	71ab      	strb	r3, [r5, #6]
20027508:	6923      	ldr	r3, [r4, #16]
2002750a:	71eb      	strb	r3, [r5, #7]
2002750c:	7fe3      	ldrb	r3, [r4, #31]
2002750e:	722b      	strb	r3, [r5, #8]
20027510:	8be3      	ldrh	r3, [r4, #30]
20027512:	726b      	strb	r3, [r5, #9]
20027514:	69e3      	ldr	r3, [r4, #28]
20027516:	0a1b      	lsrs	r3, r3, #8
20027518:	72ab      	strb	r3, [r5, #10]
2002751a:	69e3      	ldr	r3, [r4, #28]
2002751c:	72eb      	strb	r3, [r5, #11]
2002751e:	7ee3      	ldrb	r3, [r4, #27]
20027520:	732b      	strb	r3, [r5, #12]
20027522:	8b63      	ldrh	r3, [r4, #26]
20027524:	736b      	strb	r3, [r5, #13]
20027526:	69a3      	ldr	r3, [r4, #24]
20027528:	0a1b      	lsrs	r3, r3, #8
2002752a:	73ab      	strb	r3, [r5, #14]
2002752c:	69a3      	ldr	r3, [r4, #24]
2002752e:	73eb      	strb	r3, [r5, #15]
20027530:	f894 3027 	ldrb.w	r3, [r4, #39]	@ 0x27
20027534:	742b      	strb	r3, [r5, #16]
20027536:	8ce3      	ldrh	r3, [r4, #38]	@ 0x26
20027538:	746b      	strb	r3, [r5, #17]
2002753a:	6a63      	ldr	r3, [r4, #36]	@ 0x24
2002753c:	0a1b      	lsrs	r3, r3, #8
2002753e:	74ab      	strb	r3, [r5, #18]
20027540:	6a63      	ldr	r3, [r4, #36]	@ 0x24
20027542:	74eb      	strb	r3, [r5, #19]
20027544:	f894 3023 	ldrb.w	r3, [r4, #35]	@ 0x23
20027548:	752b      	strb	r3, [r5, #20]
2002754a:	8c63      	ldrh	r3, [r4, #34]	@ 0x22
2002754c:	756b      	strb	r3, [r5, #21]
2002754e:	6a23      	ldr	r3, [r4, #32]
20027550:	0a1b      	lsrs	r3, r3, #8
20027552:	75ab      	strb	r3, [r5, #22]
20027554:	6a23      	ldr	r3, [r4, #32]
20027556:	75eb      	strb	r3, [r5, #23]
20027558:	f894 302f 	ldrb.w	r3, [r4, #47]	@ 0x2f
2002755c:	762b      	strb	r3, [r5, #24]
2002755e:	8de3      	ldrh	r3, [r4, #46]	@ 0x2e
20027560:	766b      	strb	r3, [r5, #25]
20027562:	6ae3      	ldr	r3, [r4, #44]	@ 0x2c
20027564:	0a1b      	lsrs	r3, r3, #8
20027566:	76ab      	strb	r3, [r5, #26]
20027568:	6ae3      	ldr	r3, [r4, #44]	@ 0x2c
2002756a:	76eb      	strb	r3, [r5, #27]
2002756c:	f894 302b 	ldrb.w	r3, [r4, #43]	@ 0x2b
20027570:	772b      	strb	r3, [r5, #28]
20027572:	8d63      	ldrh	r3, [r4, #42]	@ 0x2a
20027574:	776b      	strb	r3, [r5, #29]
20027576:	6aa3      	ldr	r3, [r4, #40]	@ 0x28
20027578:	0a1b      	lsrs	r3, r3, #8
2002757a:	77ab      	strb	r3, [r5, #30]
2002757c:	6aa3      	ldr	r3, [r4, #40]	@ 0x28
2002757e:	77eb      	strb	r3, [r5, #31]
20027580:	f894 3037 	ldrb.w	r3, [r4, #55]	@ 0x37
20027584:	f885 3020 	strb.w	r3, [r5, #32]
20027588:	8ee3      	ldrh	r3, [r4, #54]	@ 0x36
2002758a:	f885 3021 	strb.w	r3, [r5, #33]	@ 0x21
2002758e:	6b63      	ldr	r3, [r4, #52]	@ 0x34
20027590:	0a1b      	lsrs	r3, r3, #8
20027592:	f885 3022 	strb.w	r3, [r5, #34]	@ 0x22
20027596:	6b63      	ldr	r3, [r4, #52]	@ 0x34
20027598:	f885 3023 	strb.w	r3, [r5, #35]	@ 0x23
2002759c:	f894 3033 	ldrb.w	r3, [r4, #51]	@ 0x33
200275a0:	f885 3024 	strb.w	r3, [r5, #36]	@ 0x24
200275a4:	8e63      	ldrh	r3, [r4, #50]	@ 0x32
200275a6:	f885 3025 	strb.w	r3, [r5, #37]	@ 0x25
200275aa:	6b23      	ldr	r3, [r4, #48]	@ 0x30
200275ac:	0a1b      	lsrs	r3, r3, #8
200275ae:	f885 3026 	strb.w	r3, [r5, #38]	@ 0x26
200275b2:	6b23      	ldr	r3, [r4, #48]	@ 0x30
200275b4:	f885 3027 	strb.w	r3, [r5, #39]	@ 0x27
200275b8:	f894 303f 	ldrb.w	r3, [r4, #63]	@ 0x3f
200275bc:	f885 3028 	strb.w	r3, [r5, #40]	@ 0x28
200275c0:	8fe3      	ldrh	r3, [r4, #62]	@ 0x3e
200275c2:	f885 3029 	strb.w	r3, [r5, #41]	@ 0x29
200275c6:	6be3      	ldr	r3, [r4, #60]	@ 0x3c
200275c8:	0a1b      	lsrs	r3, r3, #8
200275ca:	f885 302a 	strb.w	r3, [r5, #42]	@ 0x2a
200275ce:	6be3      	ldr	r3, [r4, #60]	@ 0x3c
200275d0:	f885 302b 	strb.w	r3, [r5, #43]	@ 0x2b
200275d4:	f894 303b 	ldrb.w	r3, [r4, #59]	@ 0x3b
200275d8:	f885 302c 	strb.w	r3, [r5, #44]	@ 0x2c
200275dc:	8f63      	ldrh	r3, [r4, #58]	@ 0x3a
200275de:	f885 302d 	strb.w	r3, [r5, #45]	@ 0x2d
200275e2:	6ba3      	ldr	r3, [r4, #56]	@ 0x38
200275e4:	0a1b      	lsrs	r3, r3, #8
200275e6:	f885 302e 	strb.w	r3, [r5, #46]	@ 0x2e
200275ea:	6ba3      	ldr	r3, [r4, #56]	@ 0x38
200275ec:	f885 302f 	strb.w	r3, [r5, #47]	@ 0x2f
200275f0:	f8d4 30d0 	ldr.w	r3, [r4, #208]	@ 0xd0
200275f4:	2b00      	cmp	r3, #0
200275f6:	d13b      	bne.n	20027670 <mbedtls_sha512_finish+0x204>
200275f8:	f894 3047 	ldrb.w	r3, [r4, #71]	@ 0x47
200275fc:	f885 3030 	strb.w	r3, [r5, #48]	@ 0x30
20027600:	f8b4 3046 	ldrh.w	r3, [r4, #70]	@ 0x46
20027604:	f885 3031 	strb.w	r3, [r5, #49]	@ 0x31
20027608:	6c63      	ldr	r3, [r4, #68]	@ 0x44
2002760a:	0a1b      	lsrs	r3, r3, #8
2002760c:	f885 3032 	strb.w	r3, [r5, #50]	@ 0x32
20027610:	6c63      	ldr	r3, [r4, #68]	@ 0x44
20027612:	f885 3033 	strb.w	r3, [r5, #51]	@ 0x33
20027616:	f894 3043 	ldrb.w	r3, [r4, #67]	@ 0x43
2002761a:	f885 3034 	strb.w	r3, [r5, #52]	@ 0x34
2002761e:	f8b4 3042 	ldrh.w	r3, [r4, #66]	@ 0x42
20027622:	f885 3035 	strb.w	r3, [r5, #53]	@ 0x35
20027626:	6c23      	ldr	r3, [r4, #64]	@ 0x40
20027628:	0a1b      	lsrs	r3, r3, #8
2002762a:	f885 3036 	strb.w	r3, [r5, #54]	@ 0x36
2002762e:	6c23      	ldr	r3, [r4, #64]	@ 0x40
20027630:	f885 3037 	strb.w	r3, [r5, #55]	@ 0x37
20027634:	f894 304f 	ldrb.w	r3, [r4, #79]	@ 0x4f
20027638:	f885 3038 	strb.w	r3, [r5, #56]	@ 0x38
2002763c:	f8b4 304e 	ldrh.w	r3, [r4, #78]	@ 0x4e
20027640:	f885 3039 	strb.w	r3, [r5, #57]	@ 0x39
20027644:	6ce3      	ldr	r3, [r4, #76]	@ 0x4c
20027646:	0a1b      	lsrs	r3, r3, #8
20027648:	f885 303a 	strb.w	r3, [r5, #58]	@ 0x3a
2002764c:	6ce3      	ldr	r3, [r4, #76]	@ 0x4c
2002764e:	f885 303b 	strb.w	r3, [r5, #59]	@ 0x3b
20027652:	f894 304b 	ldrb.w	r3, [r4, #75]	@ 0x4b
20027656:	f885 303c 	strb.w	r3, [r5, #60]	@ 0x3c
2002765a:	f8b4 304a 	ldrh.w	r3, [r4, #74]	@ 0x4a
2002765e:	f885 303d 	strb.w	r3, [r5, #61]	@ 0x3d
20027662:	6ca3      	ldr	r3, [r4, #72]	@ 0x48
20027664:	0a1b      	lsrs	r3, r3, #8
20027666:	f885 303e 	strb.w	r3, [r5, #62]	@ 0x3e
2002766a:	6ca3      	ldr	r3, [r4, #72]	@ 0x48
2002766c:	f885 303f 	strb.w	r3, [r5, #63]	@ 0x3f
20027670:	b005      	add	sp, #20
20027672:	bdf0      	pop	{r4, r5, r6, r7, pc}
20027674:	2002be74 	.word	0x2002be74

20027678 <mbedtls_sha512>:
20027678:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
2002767c:	461c      	mov	r4, r3
2002767e:	b0b7      	sub	sp, #220	@ 0xdc
20027680:	4606      	mov	r6, r0
20027682:	4668      	mov	r0, sp
20027684:	460f      	mov	r7, r1
20027686:	4615      	mov	r5, r2
20027688:	f7ff f8cc 	bl	20026824 <mbedtls_sha512_init>
2002768c:	2c00      	cmp	r4, #0
2002768e:	d03f      	beq.n	20027710 <mbedtls_sha512+0x98>
20027690:	f20f 0bf4 	addw	fp, pc, #244	@ 0xf4
20027694:	e9db ab00 	ldrd	sl, fp, [fp]
20027698:	f20f 09f4 	addw	r9, pc, #244	@ 0xf4
2002769c:	e9d9 8900 	ldrd	r8, r9, [r9]
200276a0:	a13d      	add	r1, pc, #244	@ (adr r1, 20027798 <mbedtls_sha512+0x120>)
200276a2:	e9d1 0100 	ldrd	r0, r1, [r1]
200276a6:	a33e      	add	r3, pc, #248	@ (adr r3, 200277a0 <mbedtls_sha512+0x128>)
200276a8:	e9d3 2300 	ldrd	r2, r3, [r3]
200276ac:	ed9f 4b24 	vldr	d4, [pc, #144]	@ 20027740 <mbedtls_sha512+0xc8>
200276b0:	ed9f 5b25 	vldr	d5, [pc, #148]	@ 20027748 <mbedtls_sha512+0xd0>
200276b4:	ed9f 6b26 	vldr	d6, [pc, #152]	@ 20027750 <mbedtls_sha512+0xd8>
200276b8:	ed9f 7b27 	vldr	d7, [pc, #156]	@ 20027758 <mbedtls_sha512+0xe0>
200276bc:	ed9f 3b28 	vldr	d3, [pc, #160]	@ 20027760 <mbedtls_sha512+0xe8>
200276c0:	e9cd 2312 	strd	r2, r3, [sp, #72]	@ 0x48
200276c4:	e9cd 0110 	strd	r0, r1, [sp, #64]	@ 0x40
200276c8:	463a      	mov	r2, r7
200276ca:	4631      	mov	r1, r6
200276cc:	4668      	mov	r0, sp
200276ce:	ed8d 3b00 	vstr	d3, [sp]
200276d2:	ed8d 3b02 	vstr	d3, [sp, #8]
200276d6:	ed8d 4b04 	vstr	d4, [sp, #16]
200276da:	ed8d 5b06 	vstr	d5, [sp, #24]
200276de:	ed8d 6b08 	vstr	d6, [sp, #32]
200276e2:	ed8d 7b0a 	vstr	d7, [sp, #40]	@ 0x28
200276e6:	e9cd ab0c 	strd	sl, fp, [sp, #48]	@ 0x30
200276ea:	e9cd 890e 	strd	r8, r9, [sp, #56]	@ 0x38
200276ee:	9434      	str	r4, [sp, #208]	@ 0xd0
200276f0:	f7ff feb7 	bl	20027462 <mbedtls_sha512_update>
200276f4:	4629      	mov	r1, r5
200276f6:	4668      	mov	r0, sp
200276f8:	f7ff feb8 	bl	2002746c <mbedtls_sha512_finish>
200276fc:	2300      	movs	r3, #0
200276fe:	461a      	mov	r2, r3
20027700:	f80d 2003 	strb.w	r2, [sp, r3]
20027704:	3301      	adds	r3, #1
20027706:	2bd8      	cmp	r3, #216	@ 0xd8
20027708:	d1fa      	bne.n	20027700 <mbedtls_sha512+0x88>
2002770a:	b037      	add	sp, #220	@ 0xdc
2002770c:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
20027710:	ed9f 4b15 	vldr	d4, [pc, #84]	@ 20027768 <mbedtls_sha512+0xf0>
20027714:	f20f 0b90 	addw	fp, pc, #144	@ 0x90
20027718:	e9db ab00 	ldrd	sl, fp, [fp]
2002771c:	f20f 0990 	addw	r9, pc, #144	@ 0x90
20027720:	e9d9 8900 	ldrd	r8, r9, [r9]
20027724:	a124      	add	r1, pc, #144	@ (adr r1, 200277b8 <mbedtls_sha512+0x140>)
20027726:	e9d1 0100 	ldrd	r0, r1, [r1]
2002772a:	a325      	add	r3, pc, #148	@ (adr r3, 200277c0 <mbedtls_sha512+0x148>)
2002772c:	e9d3 2300 	ldrd	r2, r3, [r3]
20027730:	ed9f 5b0f 	vldr	d5, [pc, #60]	@ 20027770 <mbedtls_sha512+0xf8>
20027734:	ed9f 6b10 	vldr	d6, [pc, #64]	@ 20027778 <mbedtls_sha512+0x100>
20027738:	ed9f 7b11 	vldr	d7, [pc, #68]	@ 20027780 <mbedtls_sha512+0x108>
2002773c:	e7be      	b.n	200276bc <mbedtls_sha512+0x44>
2002773e:	bf00      	nop
20027740:	c1059ed8 	.word	0xc1059ed8
20027744:	cbbb9d5d 	.word	0xcbbb9d5d
20027748:	367cd507 	.word	0x367cd507
2002774c:	629a292a 	.word	0x629a292a
20027750:	3070dd17 	.word	0x3070dd17
20027754:	9159015a 	.word	0x9159015a
20027758:	f70e5939 	.word	0xf70e5939
2002775c:	152fecd8 	.word	0x152fecd8
	...
20027768:	f3bcc908 	.word	0xf3bcc908
2002776c:	6a09e667 	.word	0x6a09e667
20027770:	84caa73b 	.word	0x84caa73b
20027774:	bb67ae85 	.word	0xbb67ae85
20027778:	fe94f82b 	.word	0xfe94f82b
2002777c:	3c6ef372 	.word	0x3c6ef372
20027780:	5f1d36f1 	.word	0x5f1d36f1
20027784:	a54ff53a 	.word	0xa54ff53a
20027788:	ffc00b31 	.word	0xffc00b31
2002778c:	67332667 	.word	0x67332667
20027790:	68581511 	.word	0x68581511
20027794:	8eb44a87 	.word	0x8eb44a87
20027798:	64f98fa7 	.word	0x64f98fa7
2002779c:	db0c2e0d 	.word	0xdb0c2e0d
200277a0:	befa4fa4 	.word	0xbefa4fa4
200277a4:	47b5481d 	.word	0x47b5481d
200277a8:	ade682d1 	.word	0xade682d1
200277ac:	510e527f 	.word	0x510e527f
200277b0:	2b3e6c1f 	.word	0x2b3e6c1f
200277b4:	9b05688c 	.word	0x9b05688c
200277b8:	fb41bd6b 	.word	0xfb41bd6b
200277bc:	1f83d9ab 	.word	0x1f83d9ab
200277c0:	137e2179 	.word	0x137e2179
200277c4:	5be0cd19 	.word	0x5be0cd19

200277c8 <mbedtls_asn1_get_len>:
200277c8:	b570      	push	{r4, r5, r6, lr}
200277ca:	6803      	ldr	r3, [r0, #0]
200277cc:	1acd      	subs	r5, r1, r3
200277ce:	2d00      	cmp	r5, #0
200277d0:	dc02      	bgt.n	200277d8 <mbedtls_asn1_get_len+0x10>
200277d2:	f06f 005f 	mvn.w	r0, #95	@ 0x5f
200277d6:	bd70      	pop	{r4, r5, r6, pc}
200277d8:	f993 6000 	ldrsb.w	r6, [r3]
200277dc:	781c      	ldrb	r4, [r3, #0]
200277de:	2e00      	cmp	r6, #0
200277e0:	db0a      	blt.n	200277f8 <mbedtls_asn1_get_len+0x30>
200277e2:	1c5c      	adds	r4, r3, #1
200277e4:	6004      	str	r4, [r0, #0]
200277e6:	781b      	ldrb	r3, [r3, #0]
200277e8:	6013      	str	r3, [r2, #0]
200277ea:	6803      	ldr	r3, [r0, #0]
200277ec:	1ac9      	subs	r1, r1, r3
200277ee:	6813      	ldr	r3, [r2, #0]
200277f0:	428b      	cmp	r3, r1
200277f2:	d8ee      	bhi.n	200277d2 <mbedtls_asn1_get_len+0xa>
200277f4:	2000      	movs	r0, #0
200277f6:	e7ee      	b.n	200277d6 <mbedtls_asn1_get_len+0xe>
200277f8:	f004 047f 	and.w	r4, r4, #127	@ 0x7f
200277fc:	3c01      	subs	r4, #1
200277fe:	2c03      	cmp	r4, #3
20027800:	d82b      	bhi.n	2002785a <mbedtls_asn1_get_len+0x92>
20027802:	e8df f004 	tbb	[pc, r4]
20027806:	0a02      	.short	0x0a02
20027808:	2114      	.short	0x2114
2002780a:	2d01      	cmp	r5, #1
2002780c:	d0e1      	beq.n	200277d2 <mbedtls_asn1_get_len+0xa>
2002780e:	785b      	ldrb	r3, [r3, #1]
20027810:	6013      	str	r3, [r2, #0]
20027812:	6803      	ldr	r3, [r0, #0]
20027814:	3302      	adds	r3, #2
20027816:	6003      	str	r3, [r0, #0]
20027818:	e7e7      	b.n	200277ea <mbedtls_asn1_get_len+0x22>
2002781a:	2d02      	cmp	r5, #2
2002781c:	ddd9      	ble.n	200277d2 <mbedtls_asn1_get_len+0xa>
2002781e:	f8b3 3001 	ldrh.w	r3, [r3, #1]
20027822:	ba5b      	rev16	r3, r3
20027824:	b29b      	uxth	r3, r3
20027826:	6013      	str	r3, [r2, #0]
20027828:	6803      	ldr	r3, [r0, #0]
2002782a:	3303      	adds	r3, #3
2002782c:	e7f3      	b.n	20027816 <mbedtls_asn1_get_len+0x4e>
2002782e:	2d03      	cmp	r5, #3
20027830:	ddcf      	ble.n	200277d2 <mbedtls_asn1_get_len+0xa>
20027832:	789c      	ldrb	r4, [r3, #2]
20027834:	785d      	ldrb	r5, [r3, #1]
20027836:	0224      	lsls	r4, r4, #8
20027838:	78db      	ldrb	r3, [r3, #3]
2002783a:	ea44 4405 	orr.w	r4, r4, r5, lsl #16
2002783e:	4323      	orrs	r3, r4
20027840:	6013      	str	r3, [r2, #0]
20027842:	6803      	ldr	r3, [r0, #0]
20027844:	3304      	adds	r3, #4
20027846:	e7e6      	b.n	20027816 <mbedtls_asn1_get_len+0x4e>
20027848:	2d04      	cmp	r5, #4
2002784a:	ddc2      	ble.n	200277d2 <mbedtls_asn1_get_len+0xa>
2002784c:	f8d3 3001 	ldr.w	r3, [r3, #1]
20027850:	ba1b      	rev	r3, r3
20027852:	6013      	str	r3, [r2, #0]
20027854:	6803      	ldr	r3, [r0, #0]
20027856:	3305      	adds	r3, #5
20027858:	e7dd      	b.n	20027816 <mbedtls_asn1_get_len+0x4e>
2002785a:	f06f 0063 	mvn.w	r0, #99	@ 0x63
2002785e:	e7ba      	b.n	200277d6 <mbedtls_asn1_get_len+0xe>

20027860 <mbedtls_asn1_get_tag>:
20027860:	b470      	push	{r4, r5, r6}
20027862:	6804      	ldr	r4, [r0, #0]
20027864:	1b0e      	subs	r6, r1, r4
20027866:	2e00      	cmp	r6, #0
20027868:	dd07      	ble.n	2002787a <mbedtls_asn1_get_tag+0x1a>
2002786a:	7826      	ldrb	r6, [r4, #0]
2002786c:	429e      	cmp	r6, r3
2002786e:	d108      	bne.n	20027882 <mbedtls_asn1_get_tag+0x22>
20027870:	3401      	adds	r4, #1
20027872:	6004      	str	r4, [r0, #0]
20027874:	bc70      	pop	{r4, r5, r6}
20027876:	f7ff bfa7 	b.w	200277c8 <mbedtls_asn1_get_len>
2002787a:	f06f 005f 	mvn.w	r0, #95	@ 0x5f
2002787e:	bc70      	pop	{r4, r5, r6}
20027880:	4770      	bx	lr
20027882:	f06f 0061 	mvn.w	r0, #97	@ 0x61
20027886:	e7fa      	b.n	2002787e <mbedtls_asn1_get_tag+0x1e>

20027888 <mbedtls_asn1_get_mpi>:
20027888:	b573      	push	{r0, r1, r4, r5, r6, lr}
2002788a:	2302      	movs	r3, #2
2002788c:	4615      	mov	r5, r2
2002788e:	aa01      	add	r2, sp, #4
20027890:	4604      	mov	r4, r0
20027892:	f7ff ffe5 	bl	20027860 <mbedtls_asn1_get_tag>
20027896:	b940      	cbnz	r0, 200278aa <mbedtls_asn1_get_mpi+0x22>
20027898:	9e01      	ldr	r6, [sp, #4]
2002789a:	4628      	mov	r0, r5
2002789c:	4632      	mov	r2, r6
2002789e:	6821      	ldr	r1, [r4, #0]
200278a0:	f000 fad4 	bl	20027e4c <mbedtls_mpi_read_binary>
200278a4:	6823      	ldr	r3, [r4, #0]
200278a6:	4433      	add	r3, r6
200278a8:	6023      	str	r3, [r4, #0]
200278aa:	b002      	add	sp, #8
200278ac:	bd70      	pop	{r4, r5, r6, pc}

200278ae <mbedtls_asn1_get_bitstring_null>:
200278ae:	b538      	push	{r3, r4, r5, lr}
200278b0:	2303      	movs	r3, #3
200278b2:	4604      	mov	r4, r0
200278b4:	4615      	mov	r5, r2
200278b6:	f7ff ffd3 	bl	20027860 <mbedtls_asn1_get_tag>
200278ba:	b958      	cbnz	r0, 200278d4 <mbedtls_asn1_get_bitstring_null+0x26>
200278bc:	6813      	ldr	r3, [r2, #0]
200278be:	1e5a      	subs	r2, r3, #1
200278c0:	2b01      	cmp	r3, #1
200278c2:	602a      	str	r2, [r5, #0]
200278c4:	d904      	bls.n	200278d0 <mbedtls_asn1_get_bitstring_null+0x22>
200278c6:	6823      	ldr	r3, [r4, #0]
200278c8:	1c5a      	adds	r2, r3, #1
200278ca:	6022      	str	r2, [r4, #0]
200278cc:	781b      	ldrb	r3, [r3, #0]
200278ce:	b10b      	cbz	r3, 200278d4 <mbedtls_asn1_get_bitstring_null+0x26>
200278d0:	f06f 0067 	mvn.w	r0, #103	@ 0x67
200278d4:	bd38      	pop	{r3, r4, r5, pc}

200278d6 <mbedtls_asn1_get_alg>:
200278d6:	e92d 41f3 	stmdb	sp!, {r0, r1, r4, r5, r6, r7, r8, lr}
200278da:	4690      	mov	r8, r2
200278dc:	461e      	mov	r6, r3
200278de:	aa01      	add	r2, sp, #4
200278e0:	2330      	movs	r3, #48	@ 0x30
200278e2:	4605      	mov	r5, r0
200278e4:	460f      	mov	r7, r1
200278e6:	f7ff ffbb 	bl	20027860 <mbedtls_asn1_get_tag>
200278ea:	4604      	mov	r4, r0
200278ec:	bb10      	cbnz	r0, 20027934 <mbedtls_asn1_get_alg+0x5e>
200278ee:	682b      	ldr	r3, [r5, #0]
200278f0:	1aff      	subs	r7, r7, r3
200278f2:	2f00      	cmp	r7, #0
200278f4:	dd38      	ble.n	20027968 <mbedtls_asn1_get_alg+0x92>
200278f6:	4642      	mov	r2, r8
200278f8:	781b      	ldrb	r3, [r3, #0]
200278fa:	4628      	mov	r0, r5
200278fc:	f842 3b04 	str.w	r3, [r2], #4
20027900:	682f      	ldr	r7, [r5, #0]
20027902:	9b01      	ldr	r3, [sp, #4]
20027904:	441f      	add	r7, r3
20027906:	4639      	mov	r1, r7
20027908:	2306      	movs	r3, #6
2002790a:	f7ff ffa9 	bl	20027860 <mbedtls_asn1_get_tag>
2002790e:	4604      	mov	r4, r0
20027910:	b980      	cbnz	r0, 20027934 <mbedtls_asn1_get_alg+0x5e>
20027912:	682b      	ldr	r3, [r5, #0]
20027914:	f8d8 2004 	ldr.w	r2, [r8, #4]
20027918:	f8c8 3008 	str.w	r3, [r8, #8]
2002791c:	1899      	adds	r1, r3, r2
2002791e:	42b9      	cmp	r1, r7
20027920:	6029      	str	r1, [r5, #0]
20027922:	d10b      	bne.n	2002793c <mbedtls_asn1_get_alg+0x66>
20027924:	4601      	mov	r1, r0
20027926:	f106 030c 	add.w	r3, r6, #12
2002792a:	4632      	mov	r2, r6
2002792c:	3601      	adds	r6, #1
2002792e:	42b3      	cmp	r3, r6
20027930:	7011      	strb	r1, [r2, #0]
20027932:	d1fa      	bne.n	2002792a <mbedtls_asn1_get_alg+0x54>
20027934:	4620      	mov	r0, r4
20027936:	b002      	add	sp, #8
20027938:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
2002793c:	5c9b      	ldrb	r3, [r3, r2]
2002793e:	4632      	mov	r2, r6
20027940:	f842 3b04 	str.w	r3, [r2], #4
20027944:	682b      	ldr	r3, [r5, #0]
20027946:	4639      	mov	r1, r7
20027948:	3301      	adds	r3, #1
2002794a:	4628      	mov	r0, r5
2002794c:	602b      	str	r3, [r5, #0]
2002794e:	f7ff ff3b 	bl	200277c8 <mbedtls_asn1_get_len>
20027952:	b960      	cbnz	r0, 2002796e <mbedtls_asn1_get_alg+0x98>
20027954:	682b      	ldr	r3, [r5, #0]
20027956:	6872      	ldr	r2, [r6, #4]
20027958:	60b3      	str	r3, [r6, #8]
2002795a:	4413      	add	r3, r2
2002795c:	42bb      	cmp	r3, r7
2002795e:	bf18      	it	ne
20027960:	f06f 0465 	mvnne.w	r4, #101	@ 0x65
20027964:	602b      	str	r3, [r5, #0]
20027966:	e7e5      	b.n	20027934 <mbedtls_asn1_get_alg+0x5e>
20027968:	f06f 045f 	mvn.w	r4, #95	@ 0x5f
2002796c:	e7e2      	b.n	20027934 <mbedtls_asn1_get_alg+0x5e>
2002796e:	4604      	mov	r4, r0
20027970:	e7e0      	b.n	20027934 <mbedtls_asn1_get_alg+0x5e>

20027972 <mpi_sub_hlp>:
20027972:	2300      	movs	r3, #0
20027974:	b5f0      	push	{r4, r5, r6, r7, lr}
20027976:	461c      	mov	r4, r3
20027978:	1f16      	subs	r6, r2, #4
2002797a:	4284      	cmp	r4, r0
2002797c:	d103      	bne.n	20027986 <mpi_sub_hlp+0x14>
2002797e:	eb02 0284 	add.w	r2, r2, r4, lsl #2
20027982:	b9b3      	cbnz	r3, 200279b2 <mpi_sub_hlp+0x40>
20027984:	bdf0      	pop	{r4, r5, r6, r7, pc}
20027986:	f856 cf04 	ldr.w	ip, [r6, #4]!
2002798a:	ebac 0503 	sub.w	r5, ip, r3
2002798e:	6035      	str	r5, [r6, #0]
20027990:	f851 7024 	ldr.w	r7, [r1, r4, lsl #2]
20027994:	3401      	adds	r4, #1
20027996:	42bd      	cmp	r5, r7
20027998:	bf2c      	ite	cs
2002799a:	f04f 0e00 	movcs.w	lr, #0
2002799e:	f04f 0e01 	movcc.w	lr, #1
200279a2:	1bed      	subs	r5, r5, r7
200279a4:	459c      	cmp	ip, r3
200279a6:	bf2c      	ite	cs
200279a8:	4673      	movcs	r3, lr
200279aa:	f10e 0301 	addcc.w	r3, lr, #1
200279ae:	6035      	str	r5, [r6, #0]
200279b0:	e7e3      	b.n	2002797a <mpi_sub_hlp+0x8>
200279b2:	6811      	ldr	r1, [r2, #0]
200279b4:	1ac8      	subs	r0, r1, r3
200279b6:	4299      	cmp	r1, r3
200279b8:	bf2c      	ite	cs
200279ba:	2300      	movcs	r3, #0
200279bc:	2301      	movcc	r3, #1
200279be:	f842 0b04 	str.w	r0, [r2], #4
200279c2:	e7de      	b.n	20027982 <mpi_sub_hlp+0x10>

200279c4 <mpi_mul_hlp>:
200279c4:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
200279c8:	4694      	mov	ip, r2
200279ca:	460e      	mov	r6, r1
200279cc:	4686      	mov	lr, r0
200279ce:	2500      	movs	r5, #0
200279d0:	f102 0440 	add.w	r4, r2, #64	@ 0x40
200279d4:	f1be 0f0f 	cmp.w	lr, #15
200279d8:	f854 7c40 	ldr.w	r7, [r4, #-64]
200279dc:	f106 0640 	add.w	r6, r6, #64	@ 0x40
200279e0:	f104 0440 	add.w	r4, r4, #64	@ 0x40
200279e4:	d87c      	bhi.n	20027ae0 <mpi_mul_hlp+0x11c>
200279e6:	f06f 080f 	mvn.w	r8, #15
200279ea:	0902      	lsrs	r2, r0, #4
200279ec:	fb08 0002 	mla	r0, r8, r2, r0
200279f0:	2807      	cmp	r0, #7
200279f2:	ea4f 1e82 	mov.w	lr, r2, lsl #6
200279f6:	eb0c 1482 	add.w	r4, ip, r2, lsl #6
200279fa:	eb01 1682 	add.w	r6, r1, r2, lsl #6
200279fe:	d95b      	bls.n	20027ab8 <mpi_mul_hlp+0xf4>
20027a00:	f851 100e 	ldr.w	r1, [r1, lr]
20027a04:	3808      	subs	r0, #8
20027a06:	fba1 1203 	umull	r1, r2, r1, r3
20027a0a:	1869      	adds	r1, r5, r1
20027a0c:	f142 0200 	adc.w	r2, r2, #0
20027a10:	187f      	adds	r7, r7, r1
20027a12:	f84c 700e 	str.w	r7, [ip, lr]
20027a16:	6871      	ldr	r1, [r6, #4]
20027a18:	f142 0200 	adc.w	r2, r2, #0
20027a1c:	fba1 5103 	umull	r5, r1, r1, r3
20027a20:	1952      	adds	r2, r2, r5
20027a22:	6865      	ldr	r5, [r4, #4]
20027a24:	f141 0100 	adc.w	r1, r1, #0
20027a28:	1952      	adds	r2, r2, r5
20027a2a:	6062      	str	r2, [r4, #4]
20027a2c:	68b2      	ldr	r2, [r6, #8]
20027a2e:	f141 0100 	adc.w	r1, r1, #0
20027a32:	fba2 5203 	umull	r5, r2, r2, r3
20027a36:	1949      	adds	r1, r1, r5
20027a38:	68a5      	ldr	r5, [r4, #8]
20027a3a:	f142 0200 	adc.w	r2, r2, #0
20027a3e:	1949      	adds	r1, r1, r5
20027a40:	60a1      	str	r1, [r4, #8]
20027a42:	68f1      	ldr	r1, [r6, #12]
20027a44:	f142 0200 	adc.w	r2, r2, #0
20027a48:	fba1 5103 	umull	r5, r1, r1, r3
20027a4c:	1952      	adds	r2, r2, r5
20027a4e:	68e5      	ldr	r5, [r4, #12]
20027a50:	f141 0100 	adc.w	r1, r1, #0
20027a54:	1952      	adds	r2, r2, r5
20027a56:	60e2      	str	r2, [r4, #12]
20027a58:	6932      	ldr	r2, [r6, #16]
20027a5a:	f141 0100 	adc.w	r1, r1, #0
20027a5e:	fba2 5203 	umull	r5, r2, r2, r3
20027a62:	1949      	adds	r1, r1, r5
20027a64:	6925      	ldr	r5, [r4, #16]
20027a66:	f142 0200 	adc.w	r2, r2, #0
20027a6a:	1949      	adds	r1, r1, r5
20027a6c:	6121      	str	r1, [r4, #16]
20027a6e:	6971      	ldr	r1, [r6, #20]
20027a70:	f142 0200 	adc.w	r2, r2, #0
20027a74:	fba1 5103 	umull	r5, r1, r1, r3
20027a78:	1952      	adds	r2, r2, r5
20027a7a:	6965      	ldr	r5, [r4, #20]
20027a7c:	f141 0100 	adc.w	r1, r1, #0
20027a80:	1952      	adds	r2, r2, r5
20027a82:	6162      	str	r2, [r4, #20]
20027a84:	69b2      	ldr	r2, [r6, #24]
20027a86:	f141 0100 	adc.w	r1, r1, #0
20027a8a:	fba2 5203 	umull	r5, r2, r2, r3
20027a8e:	1949      	adds	r1, r1, r5
20027a90:	69a5      	ldr	r5, [r4, #24]
20027a92:	f142 0200 	adc.w	r2, r2, #0
20027a96:	1949      	adds	r1, r1, r5
20027a98:	61a1      	str	r1, [r4, #24]
20027a9a:	69f1      	ldr	r1, [r6, #28]
20027a9c:	f142 0200 	adc.w	r2, r2, #0
20027aa0:	fba1 1503 	umull	r1, r5, r1, r3
20027aa4:	1852      	adds	r2, r2, r1
20027aa6:	69e1      	ldr	r1, [r4, #28]
20027aa8:	f145 0500 	adc.w	r5, r5, #0
20027aac:	1852      	adds	r2, r2, r1
20027aae:	61e2      	str	r2, [r4, #28]
20027ab0:	f145 0500 	adc.w	r5, r5, #0
20027ab4:	3420      	adds	r4, #32
20027ab6:	3620      	adds	r6, #32
20027ab8:	4627      	mov	r7, r4
20027aba:	ea4f 0c80 	mov.w	ip, r0, lsl #2
20027abe:	eb06 0080 	add.w	r0, r6, r0, lsl #2
20027ac2:	42b0      	cmp	r0, r6
20027ac4:	f857 1b04 	ldr.w	r1, [r7], #4
20027ac8:	f040 80eb 	bne.w	20027ca2 <mpi_mul_hlp+0x2de>
20027acc:	4464      	add	r4, ip
20027ace:	6823      	ldr	r3, [r4, #0]
20027ad0:	195b      	adds	r3, r3, r5
20027ad2:	f844 3b04 	str.w	r3, [r4], #4
20027ad6:	f04f 0501 	mov.w	r5, #1
20027ada:	d2f8      	bcs.n	20027ace <mpi_mul_hlp+0x10a>
20027adc:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
20027ae0:	f856 2c40 	ldr.w	r2, [r6, #-64]
20027ae4:	f1ae 0e10 	sub.w	lr, lr, #16
20027ae8:	fba2 2803 	umull	r2, r8, r2, r3
20027aec:	18aa      	adds	r2, r5, r2
20027aee:	f148 0500 	adc.w	r5, r8, #0
20027af2:	18ba      	adds	r2, r7, r2
20027af4:	f844 2c80 	str.w	r2, [r4, #-128]
20027af8:	f856 2c3c 	ldr.w	r2, [r6, #-60]
20027afc:	f145 0500 	adc.w	r5, r5, #0
20027b00:	fba2 7203 	umull	r7, r2, r2, r3
20027b04:	19ef      	adds	r7, r5, r7
20027b06:	f854 5c7c 	ldr.w	r5, [r4, #-124]
20027b0a:	f142 0200 	adc.w	r2, r2, #0
20027b0e:	19ed      	adds	r5, r5, r7
20027b10:	f844 5c7c 	str.w	r5, [r4, #-124]
20027b14:	f856 5c38 	ldr.w	r5, [r6, #-56]
20027b18:	f142 0200 	adc.w	r2, r2, #0
20027b1c:	fba5 7503 	umull	r7, r5, r5, r3
20027b20:	19d7      	adds	r7, r2, r7
20027b22:	f854 2c78 	ldr.w	r2, [r4, #-120]
20027b26:	f145 0500 	adc.w	r5, r5, #0
20027b2a:	19d2      	adds	r2, r2, r7
20027b2c:	f844 2c78 	str.w	r2, [r4, #-120]
20027b30:	f856 2c34 	ldr.w	r2, [r6, #-52]
20027b34:	f145 0500 	adc.w	r5, r5, #0
20027b38:	fba2 7203 	umull	r7, r2, r2, r3
20027b3c:	19ef      	adds	r7, r5, r7
20027b3e:	f854 5c74 	ldr.w	r5, [r4, #-116]
20027b42:	f142 0200 	adc.w	r2, r2, #0
20027b46:	19ed      	adds	r5, r5, r7
20027b48:	f844 5c74 	str.w	r5, [r4, #-116]
20027b4c:	f856 5c30 	ldr.w	r5, [r6, #-48]
20027b50:	f142 0200 	adc.w	r2, r2, #0
20027b54:	fba5 7503 	umull	r7, r5, r5, r3
20027b58:	19d7      	adds	r7, r2, r7
20027b5a:	f854 2c70 	ldr.w	r2, [r4, #-112]
20027b5e:	f145 0500 	adc.w	r5, r5, #0
20027b62:	19d2      	adds	r2, r2, r7
20027b64:	f844 2c70 	str.w	r2, [r4, #-112]
20027b68:	f856 2c2c 	ldr.w	r2, [r6, #-44]
20027b6c:	f145 0500 	adc.w	r5, r5, #0
20027b70:	fba2 7203 	umull	r7, r2, r2, r3
20027b74:	19ef      	adds	r7, r5, r7
20027b76:	f854 5c6c 	ldr.w	r5, [r4, #-108]
20027b7a:	f142 0200 	adc.w	r2, r2, #0
20027b7e:	19ed      	adds	r5, r5, r7
20027b80:	f844 5c6c 	str.w	r5, [r4, #-108]
20027b84:	f856 5c28 	ldr.w	r5, [r6, #-40]
20027b88:	f142 0200 	adc.w	r2, r2, #0
20027b8c:	fba5 7503 	umull	r7, r5, r5, r3
20027b90:	19d7      	adds	r7, r2, r7
20027b92:	f854 2c68 	ldr.w	r2, [r4, #-104]
20027b96:	f145 0500 	adc.w	r5, r5, #0
20027b9a:	19d2      	adds	r2, r2, r7
20027b9c:	f844 2c68 	str.w	r2, [r4, #-104]
20027ba0:	f856 2c24 	ldr.w	r2, [r6, #-36]
20027ba4:	f145 0500 	adc.w	r5, r5, #0
20027ba8:	fba2 7203 	umull	r7, r2, r2, r3
20027bac:	19ef      	adds	r7, r5, r7
20027bae:	f854 5c64 	ldr.w	r5, [r4, #-100]
20027bb2:	f142 0200 	adc.w	r2, r2, #0
20027bb6:	19ed      	adds	r5, r5, r7
20027bb8:	f844 5c64 	str.w	r5, [r4, #-100]
20027bbc:	f856 5c20 	ldr.w	r5, [r6, #-32]
20027bc0:	f142 0200 	adc.w	r2, r2, #0
20027bc4:	fba5 7503 	umull	r7, r5, r5, r3
20027bc8:	19d7      	adds	r7, r2, r7
20027bca:	f854 2c60 	ldr.w	r2, [r4, #-96]
20027bce:	f145 0500 	adc.w	r5, r5, #0
20027bd2:	19d2      	adds	r2, r2, r7
20027bd4:	f844 2c60 	str.w	r2, [r4, #-96]
20027bd8:	f856 2c1c 	ldr.w	r2, [r6, #-28]
20027bdc:	f145 0500 	adc.w	r5, r5, #0
20027be0:	fba2 7203 	umull	r7, r2, r2, r3
20027be4:	19ef      	adds	r7, r5, r7
20027be6:	f854 5c5c 	ldr.w	r5, [r4, #-92]
20027bea:	f142 0200 	adc.w	r2, r2, #0
20027bee:	19ed      	adds	r5, r5, r7
20027bf0:	f844 5c5c 	str.w	r5, [r4, #-92]
20027bf4:	f856 5c18 	ldr.w	r5, [r6, #-24]
20027bf8:	f142 0200 	adc.w	r2, r2, #0
20027bfc:	fba5 7503 	umull	r7, r5, r5, r3
20027c00:	19d7      	adds	r7, r2, r7
20027c02:	f854 2c58 	ldr.w	r2, [r4, #-88]
20027c06:	f145 0500 	adc.w	r5, r5, #0
20027c0a:	19d2      	adds	r2, r2, r7
20027c0c:	f844 2c58 	str.w	r2, [r4, #-88]
20027c10:	f856 2c14 	ldr.w	r2, [r6, #-20]
20027c14:	f145 0500 	adc.w	r5, r5, #0
20027c18:	fba2 7203 	umull	r7, r2, r2, r3
20027c1c:	19ef      	adds	r7, r5, r7
20027c1e:	f854 5c54 	ldr.w	r5, [r4, #-84]
20027c22:	f142 0200 	adc.w	r2, r2, #0
20027c26:	19ed      	adds	r5, r5, r7
20027c28:	f844 5c54 	str.w	r5, [r4, #-84]
20027c2c:	f856 5c10 	ldr.w	r5, [r6, #-16]
20027c30:	f142 0200 	adc.w	r2, r2, #0
20027c34:	fba5 7503 	umull	r7, r5, r5, r3
20027c38:	19d7      	adds	r7, r2, r7
20027c3a:	f854 2c50 	ldr.w	r2, [r4, #-80]
20027c3e:	f145 0500 	adc.w	r5, r5, #0
20027c42:	19d2      	adds	r2, r2, r7
20027c44:	f844 2c50 	str.w	r2, [r4, #-80]
20027c48:	f856 2c0c 	ldr.w	r2, [r6, #-12]
20027c4c:	f145 0500 	adc.w	r5, r5, #0
20027c50:	fba2 7203 	umull	r7, r2, r2, r3
20027c54:	19ef      	adds	r7, r5, r7
20027c56:	f854 5c4c 	ldr.w	r5, [r4, #-76]
20027c5a:	f142 0200 	adc.w	r2, r2, #0
20027c5e:	19ed      	adds	r5, r5, r7
20027c60:	f844 5c4c 	str.w	r5, [r4, #-76]
20027c64:	f856 5c08 	ldr.w	r5, [r6, #-8]
20027c68:	f142 0200 	adc.w	r2, r2, #0
20027c6c:	fba5 5703 	umull	r5, r7, r5, r3
20027c70:	1955      	adds	r5, r2, r5
20027c72:	f854 2c48 	ldr.w	r2, [r4, #-72]
20027c76:	f147 0700 	adc.w	r7, r7, #0
20027c7a:	1952      	adds	r2, r2, r5
20027c7c:	f844 2c48 	str.w	r2, [r4, #-72]
20027c80:	f856 2c04 	ldr.w	r2, [r6, #-4]
20027c84:	f147 0700 	adc.w	r7, r7, #0
20027c88:	fba2 2503 	umull	r2, r5, r2, r3
20027c8c:	18bf      	adds	r7, r7, r2
20027c8e:	f854 2c44 	ldr.w	r2, [r4, #-68]
20027c92:	f145 0500 	adc.w	r5, r5, #0
20027c96:	19d2      	adds	r2, r2, r7
20027c98:	f145 0500 	adc.w	r5, r5, #0
20027c9c:	f844 2c44 	str.w	r2, [r4, #-68]
20027ca0:	e698      	b.n	200279d4 <mpi_mul_hlp+0x10>
20027ca2:	f856 2b04 	ldr.w	r2, [r6], #4
20027ca6:	fba2 2e03 	umull	r2, lr, r2, r3
20027caa:	18aa      	adds	r2, r5, r2
20027cac:	f14e 0500 	adc.w	r5, lr, #0
20027cb0:	1889      	adds	r1, r1, r2
20027cb2:	f145 0500 	adc.w	r5, r5, #0
20027cb6:	f847 1c04 	str.w	r1, [r7, #-4]
20027cba:	e702      	b.n	20027ac2 <mpi_mul_hlp+0xfe>

20027cbc <mbedtls_mpi_init>:
20027cbc:	b120      	cbz	r0, 20027cc8 <mbedtls_mpi_init+0xc>
20027cbe:	2300      	movs	r3, #0
20027cc0:	2201      	movs	r2, #1
20027cc2:	e9c0 2300 	strd	r2, r3, [r0]
20027cc6:	6083      	str	r3, [r0, #8]
20027cc8:	4770      	bx	lr

20027cca <mbedtls_mpi_free>:
20027cca:	b510      	push	{r4, lr}
20027ccc:	4604      	mov	r4, r0
20027cce:	b168      	cbz	r0, 20027cec <mbedtls_mpi_free+0x22>
20027cd0:	6883      	ldr	r3, [r0, #8]
20027cd2:	b133      	cbz	r3, 20027ce2 <mbedtls_mpi_free+0x18>
20027cd4:	2100      	movs	r1, #0
20027cd6:	6842      	ldr	r2, [r0, #4]
20027cd8:	3a01      	subs	r2, #1
20027cda:	d208      	bcs.n	20027cee <mbedtls_mpi_free+0x24>
20027cdc:	68a0      	ldr	r0, [r4, #8]
20027cde:	f002 fcbf 	bl	2002a660 <free>
20027ce2:	2300      	movs	r3, #0
20027ce4:	2201      	movs	r2, #1
20027ce6:	e9c4 2300 	strd	r2, r3, [r4]
20027cea:	60a3      	str	r3, [r4, #8]
20027cec:	bd10      	pop	{r4, pc}
20027cee:	f843 1b04 	str.w	r1, [r3], #4
20027cf2:	e7f1      	b.n	20027cd8 <mbedtls_mpi_free+0xe>

20027cf4 <mbedtls_mpi_grow>:
20027cf4:	f242 7310 	movw	r3, #10000	@ 0x2710
20027cf8:	4299      	cmp	r1, r3
20027cfa:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
20027cfe:	4605      	mov	r5, r0
20027d00:	460f      	mov	r7, r1
20027d02:	d903      	bls.n	20027d0c <mbedtls_mpi_grow+0x18>
20027d04:	f06f 000f 	mvn.w	r0, #15
20027d08:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
20027d0c:	6846      	ldr	r6, [r0, #4]
20027d0e:	428e      	cmp	r6, r1
20027d10:	d301      	bcc.n	20027d16 <mbedtls_mpi_grow+0x22>
20027d12:	2000      	movs	r0, #0
20027d14:	e7f8      	b.n	20027d08 <mbedtls_mpi_grow+0x14>
20027d16:	2104      	movs	r1, #4
20027d18:	4638      	mov	r0, r7
20027d1a:	f002 fc85 	bl	2002a628 <calloc>
20027d1e:	4680      	mov	r8, r0
20027d20:	2800      	cmp	r0, #0
20027d22:	d0ef      	beq.n	20027d04 <mbedtls_mpi_grow+0x10>
20027d24:	68ac      	ldr	r4, [r5, #8]
20027d26:	b15c      	cbz	r4, 20027d40 <mbedtls_mpi_grow+0x4c>
20027d28:	00b6      	lsls	r6, r6, #2
20027d2a:	4632      	mov	r2, r6
20027d2c:	4621      	mov	r1, r4
20027d2e:	f002 fd77 	bl	2002a820 <memcpy>
20027d32:	2300      	movs	r3, #0
20027d34:	4426      	add	r6, r4
20027d36:	42b4      	cmp	r4, r6
20027d38:	d105      	bne.n	20027d46 <mbedtls_mpi_grow+0x52>
20027d3a:	68a8      	ldr	r0, [r5, #8]
20027d3c:	f002 fc90 	bl	2002a660 <free>
20027d40:	e9c5 7801 	strd	r7, r8, [r5, #4]
20027d44:	e7e5      	b.n	20027d12 <mbedtls_mpi_grow+0x1e>
20027d46:	f844 3b04 	str.w	r3, [r4], #4
20027d4a:	e7f4      	b.n	20027d36 <mbedtls_mpi_grow+0x42>

20027d4c <mbedtls_mpi_copy>:
20027d4c:	4288      	cmp	r0, r1
20027d4e:	b570      	push	{r4, r5, r6, lr}
20027d50:	4605      	mov	r5, r0
20027d52:	460e      	mov	r6, r1
20027d54:	d003      	beq.n	20027d5e <mbedtls_mpi_copy+0x12>
20027d56:	688b      	ldr	r3, [r1, #8]
20027d58:	b91b      	cbnz	r3, 20027d62 <mbedtls_mpi_copy+0x16>
20027d5a:	f7ff ffb6 	bl	20027cca <mbedtls_mpi_free>
20027d5e:	2000      	movs	r0, #0
20027d60:	bd70      	pop	{r4, r5, r6, pc}
20027d62:	684a      	ldr	r2, [r1, #4]
20027d64:	3a01      	subs	r2, #1
20027d66:	b11a      	cbz	r2, 20027d70 <mbedtls_mpi_copy+0x24>
20027d68:	f853 1022 	ldr.w	r1, [r3, r2, lsl #2]
20027d6c:	2900      	cmp	r1, #0
20027d6e:	d0f9      	beq.n	20027d64 <mbedtls_mpi_copy+0x18>
20027d70:	6833      	ldr	r3, [r6, #0]
20027d72:	1c54      	adds	r4, r2, #1
20027d74:	4621      	mov	r1, r4
20027d76:	4628      	mov	r0, r5
20027d78:	602b      	str	r3, [r5, #0]
20027d7a:	f7ff ffbb 	bl	20027cf4 <mbedtls_mpi_grow>
20027d7e:	4601      	mov	r1, r0
20027d80:	b950      	cbnz	r0, 20027d98 <mbedtls_mpi_copy+0x4c>
20027d82:	686a      	ldr	r2, [r5, #4]
20027d84:	68a8      	ldr	r0, [r5, #8]
20027d86:	0092      	lsls	r2, r2, #2
20027d88:	f002 fd30 	bl	2002a7ec <memset>
20027d8c:	68b1      	ldr	r1, [r6, #8]
20027d8e:	68a8      	ldr	r0, [r5, #8]
20027d90:	00a2      	lsls	r2, r4, #2
20027d92:	f002 fd45 	bl	2002a820 <memcpy>
20027d96:	e7e2      	b.n	20027d5e <mbedtls_mpi_copy+0x12>
20027d98:	f06f 000f 	mvn.w	r0, #15
20027d9c:	e7e0      	b.n	20027d60 <mbedtls_mpi_copy+0x14>

20027d9e <mbedtls_mpi_lset>:
20027d9e:	b570      	push	{r4, r5, r6, lr}
20027da0:	460e      	mov	r6, r1
20027da2:	2101      	movs	r1, #1
20027da4:	4604      	mov	r4, r0
20027da6:	f7ff ffa5 	bl	20027cf4 <mbedtls_mpi_grow>
20027daa:	4605      	mov	r5, r0
20027dac:	b988      	cbnz	r0, 20027dd2 <mbedtls_mpi_lset+0x34>
20027dae:	6862      	ldr	r2, [r4, #4]
20027db0:	4601      	mov	r1, r0
20027db2:	0092      	lsls	r2, r2, #2
20027db4:	68a0      	ldr	r0, [r4, #8]
20027db6:	f002 fd19 	bl	2002a7ec <memset>
20027dba:	68a3      	ldr	r3, [r4, #8]
20027dbc:	ea86 72e6 	eor.w	r2, r6, r6, asr #31
20027dc0:	2e00      	cmp	r6, #0
20027dc2:	eba2 72e6 	sub.w	r2, r2, r6, asr #31
20027dc6:	601a      	str	r2, [r3, #0]
20027dc8:	bfac      	ite	ge
20027dca:	2301      	movge	r3, #1
20027dcc:	f04f 33ff 	movlt.w	r3, #4294967295
20027dd0:	6023      	str	r3, [r4, #0]
20027dd2:	4628      	mov	r0, r5
20027dd4:	bd70      	pop	{r4, r5, r6, pc}

20027dd6 <mbedtls_mpi_lsb>:
20027dd6:	2300      	movs	r3, #0
20027dd8:	4619      	mov	r1, r3
20027dda:	b570      	push	{r4, r5, r6, lr}
20027ddc:	6844      	ldr	r4, [r0, #4]
20027dde:	428c      	cmp	r4, r1
20027de0:	d101      	bne.n	20027de6 <mbedtls_mpi_lsb+0x10>
20027de2:	2000      	movs	r0, #0
20027de4:	e008      	b.n	20027df8 <mbedtls_mpi_lsb+0x22>
20027de6:	6882      	ldr	r2, [r0, #8]
20027de8:	f852 5021 	ldr.w	r5, [r2, r1, lsl #2]
20027dec:	2200      	movs	r2, #0
20027dee:	fa25 f602 	lsr.w	r6, r5, r2
20027df2:	07f6      	lsls	r6, r6, #31
20027df4:	d501      	bpl.n	20027dfa <mbedtls_mpi_lsb+0x24>
20027df6:	1898      	adds	r0, r3, r2
20027df8:	bd70      	pop	{r4, r5, r6, pc}
20027dfa:	3201      	adds	r2, #1
20027dfc:	2a20      	cmp	r2, #32
20027dfe:	d1f6      	bne.n	20027dee <mbedtls_mpi_lsb+0x18>
20027e00:	3320      	adds	r3, #32
20027e02:	3101      	adds	r1, #1
20027e04:	e7eb      	b.n	20027dde <mbedtls_mpi_lsb+0x8>

20027e06 <mbedtls_mpi_bitlen>:
20027e06:	4602      	mov	r2, r0
20027e08:	6840      	ldr	r0, [r0, #4]
20027e0a:	b188      	cbz	r0, 20027e30 <mbedtls_mpi_bitlen+0x2a>
20027e0c:	6891      	ldr	r1, [r2, #8]
20027e0e:	1e43      	subs	r3, r0, #1
20027e10:	b97b      	cbnz	r3, 20027e32 <mbedtls_mpi_bitlen+0x2c>
20027e12:	461a      	mov	r2, r3
20027e14:	5889      	ldr	r1, [r1, r2]
20027e16:	2000      	movs	r0, #0
20027e18:	f04f 4200 	mov.w	r2, #2147483648	@ 0x80000000
20027e1c:	4211      	tst	r1, r2
20027e1e:	d104      	bne.n	20027e2a <mbedtls_mpi_bitlen+0x24>
20027e20:	3001      	adds	r0, #1
20027e22:	2820      	cmp	r0, #32
20027e24:	ea4f 0252 	mov.w	r2, r2, lsr #1
20027e28:	d1f8      	bne.n	20027e1c <mbedtls_mpi_bitlen+0x16>
20027e2a:	3301      	adds	r3, #1
20027e2c:	ebc0 1043 	rsb	r0, r0, r3, lsl #5
20027e30:	4770      	bx	lr
20027e32:	f851 0023 	ldr.w	r0, [r1, r3, lsl #2]
20027e36:	009a      	lsls	r2, r3, #2
20027e38:	2800      	cmp	r0, #0
20027e3a:	d1eb      	bne.n	20027e14 <mbedtls_mpi_bitlen+0xe>
20027e3c:	3b01      	subs	r3, #1
20027e3e:	e7e7      	b.n	20027e10 <mbedtls_mpi_bitlen+0xa>

20027e40 <mbedtls_mpi_size>:
20027e40:	b508      	push	{r3, lr}
20027e42:	f7ff ffe0 	bl	20027e06 <mbedtls_mpi_bitlen>
20027e46:	3007      	adds	r0, #7
20027e48:	08c0      	lsrs	r0, r0, #3
20027e4a:	bd08      	pop	{r3, pc}

20027e4c <mbedtls_mpi_read_binary>:
20027e4c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
20027e4e:	4607      	mov	r7, r0
20027e50:	460c      	mov	r4, r1
20027e52:	4616      	mov	r6, r2
20027e54:	2500      	movs	r5, #0
20027e56:	42b5      	cmp	r5, r6
20027e58:	d001      	beq.n	20027e5e <mbedtls_mpi_read_binary+0x12>
20027e5a:	5d63      	ldrb	r3, [r4, r5]
20027e5c:	b173      	cbz	r3, 20027e7c <mbedtls_mpi_read_binary+0x30>
20027e5e:	1b71      	subs	r1, r6, r5
20027e60:	f011 0303 	ands.w	r3, r1, #3
20027e64:	bf18      	it	ne
20027e66:	2301      	movne	r3, #1
20027e68:	4638      	mov	r0, r7
20027e6a:	eb03 0191 	add.w	r1, r3, r1, lsr #2
20027e6e:	f7ff ff41 	bl	20027cf4 <mbedtls_mpi_grow>
20027e72:	4601      	mov	r1, r0
20027e74:	b120      	cbz	r0, 20027e80 <mbedtls_mpi_read_binary+0x34>
20027e76:	f06f 000f 	mvn.w	r0, #15
20027e7a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
20027e7c:	3501      	adds	r5, #1
20027e7e:	e7ea      	b.n	20027e56 <mbedtls_mpi_read_binary+0xa>
20027e80:	4638      	mov	r0, r7
20027e82:	f7ff ff8c 	bl	20027d9e <mbedtls_mpi_lset>
20027e86:	2800      	cmp	r0, #0
20027e88:	d1f5      	bne.n	20027e76 <mbedtls_mpi_read_binary+0x2a>
20027e8a:	4603      	mov	r3, r0
20027e8c:	4434      	add	r4, r6
20027e8e:	1af2      	subs	r2, r6, r3
20027e90:	4295      	cmp	r5, r2
20027e92:	d2f2      	bcs.n	20027e7a <mbedtls_mpi_read_binary+0x2e>
20027e94:	f8d7 e008 	ldr.w	lr, [r7, #8]
20027e98:	f814 1d01 	ldrb.w	r1, [r4, #-1]!
20027e9c:	00da      	lsls	r2, r3, #3
20027e9e:	f023 0c03 	bic.w	ip, r3, #3
20027ea2:	f002 0218 	and.w	r2, r2, #24
20027ea6:	4091      	lsls	r1, r2
20027ea8:	f85e 200c 	ldr.w	r2, [lr, ip]
20027eac:	3301      	adds	r3, #1
20027eae:	430a      	orrs	r2, r1
20027eb0:	f84e 200c 	str.w	r2, [lr, ip]
20027eb4:	e7eb      	b.n	20027e8e <mbedtls_mpi_read_binary+0x42>

20027eb6 <mbedtls_mpi_write_binary>:
20027eb6:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
20027eb8:	4615      	mov	r5, r2
20027eba:	4607      	mov	r7, r0
20027ebc:	460c      	mov	r4, r1
20027ebe:	f7ff ffbf 	bl	20027e40 <mbedtls_mpi_size>
20027ec2:	42a8      	cmp	r0, r5
20027ec4:	4606      	mov	r6, r0
20027ec6:	d816      	bhi.n	20027ef6 <mbedtls_mpi_write_binary+0x40>
20027ec8:	4620      	mov	r0, r4
20027eca:	462a      	mov	r2, r5
20027ecc:	2100      	movs	r1, #0
20027ece:	f002 fc8d 	bl	2002a7ec <memset>
20027ed2:	2300      	movs	r3, #0
20027ed4:	442c      	add	r4, r5
20027ed6:	42b3      	cmp	r3, r6
20027ed8:	d101      	bne.n	20027ede <mbedtls_mpi_write_binary+0x28>
20027eda:	2000      	movs	r0, #0
20027edc:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
20027ede:	68b8      	ldr	r0, [r7, #8]
20027ee0:	f023 0203 	bic.w	r2, r3, #3
20027ee4:	5882      	ldr	r2, [r0, r2]
20027ee6:	00d9      	lsls	r1, r3, #3
20027ee8:	f001 0118 	and.w	r1, r1, #24
20027eec:	40ca      	lsrs	r2, r1
20027eee:	f804 2d01 	strb.w	r2, [r4, #-1]!
20027ef2:	3301      	adds	r3, #1
20027ef4:	e7ef      	b.n	20027ed6 <mbedtls_mpi_write_binary+0x20>
20027ef6:	f06f 0007 	mvn.w	r0, #7
20027efa:	e7ef      	b.n	20027edc <mbedtls_mpi_write_binary+0x26>

20027efc <mbedtls_mpi_shift_l>:
20027efc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
20027efe:	4605      	mov	r5, r0
20027f00:	460e      	mov	r6, r1
20027f02:	094c      	lsrs	r4, r1, #5
20027f04:	f001 071f 	and.w	r7, r1, #31
20027f08:	f7ff ff7d 	bl	20027e06 <mbedtls_mpi_bitlen>
20027f0c:	686b      	ldr	r3, [r5, #4]
20027f0e:	4430      	add	r0, r6
20027f10:	ebb0 1f43 	cmp.w	r0, r3, lsl #5
20027f14:	d805      	bhi.n	20027f22 <mbedtls_mpi_shift_l+0x26>
20027f16:	2e1f      	cmp	r6, #31
20027f18:	d811      	bhi.n	20027f3e <mbedtls_mpi_shift_l+0x42>
20027f1a:	2f00      	cmp	r7, #0
20027f1c:	d143      	bne.n	20027fa6 <mbedtls_mpi_shift_l+0xaa>
20027f1e:	2000      	movs	r0, #0
20027f20:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
20027f22:	f010 011f 	ands.w	r1, r0, #31
20027f26:	bf18      	it	ne
20027f28:	2101      	movne	r1, #1
20027f2a:	eb01 1150 	add.w	r1, r1, r0, lsr #5
20027f2e:	4628      	mov	r0, r5
20027f30:	f7ff fee0 	bl	20027cf4 <mbedtls_mpi_grow>
20027f34:	2800      	cmp	r0, #0
20027f36:	d0ee      	beq.n	20027f16 <mbedtls_mpi_shift_l+0x1a>
20027f38:	f06f 000f 	mvn.w	r0, #15
20027f3c:	e7f0      	b.n	20027f20 <mbedtls_mpi_shift_l+0x24>
20027f3e:	f06f 0003 	mvn.w	r0, #3
20027f42:	686a      	ldr	r2, [r5, #4]
20027f44:	4360      	muls	r0, r4
20027f46:	4611      	mov	r1, r2
20027f48:	0093      	lsls	r3, r2, #2
20027f4a:	42a1      	cmp	r1, r4
20027f4c:	f1a3 0304 	sub.w	r3, r3, #4
20027f50:	d80c      	bhi.n	20027f6c <mbedtls_mpi_shift_l+0x70>
20027f52:	1aa3      	subs	r3, r4, r2
20027f54:	4294      	cmp	r4, r2
20027f56:	bf88      	it	hi
20027f58:	2300      	movhi	r3, #0
20027f5a:	4413      	add	r3, r2
20027f5c:	2200      	movs	r2, #0
20027f5e:	009b      	lsls	r3, r3, #2
20027f60:	3b04      	subs	r3, #4
20027f62:	1d19      	adds	r1, r3, #4
20027f64:	d0d9      	beq.n	20027f1a <mbedtls_mpi_shift_l+0x1e>
20027f66:	68a9      	ldr	r1, [r5, #8]
20027f68:	50ca      	str	r2, [r1, r3]
20027f6a:	e7f9      	b.n	20027f60 <mbedtls_mpi_shift_l+0x64>
20027f6c:	68ae      	ldr	r6, [r5, #8]
20027f6e:	3901      	subs	r1, #1
20027f70:	eb06 0c03 	add.w	ip, r6, r3
20027f74:	f85c c000 	ldr.w	ip, [ip, r0]
20027f78:	f846 c003 	str.w	ip, [r6, r3]
20027f7c:	e7e5      	b.n	20027f4a <mbedtls_mpi_shift_l+0x4e>
20027f7e:	68ab      	ldr	r3, [r5, #8]
20027f80:	f853 1024 	ldr.w	r1, [r3, r4, lsl #2]
20027f84:	fa01 f007 	lsl.w	r0, r1, r7
20027f88:	f843 0024 	str.w	r0, [r3, r4, lsl #2]
20027f8c:	68a8      	ldr	r0, [r5, #8]
20027f8e:	f850 3024 	ldr.w	r3, [r0, r4, lsl #2]
20027f92:	4313      	orrs	r3, r2
20027f94:	f840 3024 	str.w	r3, [r0, r4, lsl #2]
20027f98:	fa21 f206 	lsr.w	r2, r1, r6
20027f9c:	3401      	adds	r4, #1
20027f9e:	686b      	ldr	r3, [r5, #4]
20027fa0:	42a3      	cmp	r3, r4
20027fa2:	d8ec      	bhi.n	20027f7e <mbedtls_mpi_shift_l+0x82>
20027fa4:	e7bb      	b.n	20027f1e <mbedtls_mpi_shift_l+0x22>
20027fa6:	2200      	movs	r2, #0
20027fa8:	f1c7 0620 	rsb	r6, r7, #32
20027fac:	e7f7      	b.n	20027f9e <mbedtls_mpi_shift_l+0xa2>

20027fae <mbedtls_mpi_shift_r>:
20027fae:	b4f0      	push	{r4, r5, r6, r7}
20027fb0:	6843      	ldr	r3, [r0, #4]
20027fb2:	094c      	lsrs	r4, r1, #5
20027fb4:	42a3      	cmp	r3, r4
20027fb6:	f001 021f 	and.w	r2, r1, #31
20027fba:	d301      	bcc.n	20027fc0 <mbedtls_mpi_shift_r+0x12>
20027fbc:	d104      	bne.n	20027fc8 <mbedtls_mpi_shift_r+0x1a>
20027fbe:	b392      	cbz	r2, 20028026 <mbedtls_mpi_shift_r+0x78>
20027fc0:	bcf0      	pop	{r4, r5, r6, r7}
20027fc2:	2100      	movs	r1, #0
20027fc4:	f7ff beeb 	b.w	20027d9e <mbedtls_mpi_lset>
20027fc8:	291f      	cmp	r1, #31
20027fca:	d82e      	bhi.n	2002802a <mbedtls_mpi_shift_r+0x7c>
20027fcc:	b9aa      	cbnz	r2, 20027ffa <mbedtls_mpi_shift_r+0x4c>
20027fce:	bcf0      	pop	{r4, r5, r6, r7}
20027fd0:	2000      	movs	r0, #0
20027fd2:	4770      	bx	lr
20027fd4:	6885      	ldr	r5, [r0, #8]
20027fd6:	586e      	ldr	r6, [r5, r1]
20027fd8:	3104      	adds	r1, #4
20027fda:	f845 6023 	str.w	r6, [r5, r3, lsl #2]
20027fde:	3301      	adds	r3, #1
20027fe0:	6845      	ldr	r5, [r0, #4]
20027fe2:	1b2d      	subs	r5, r5, r4
20027fe4:	429d      	cmp	r5, r3
20027fe6:	d8f5      	bhi.n	20027fd4 <mbedtls_mpi_shift_r+0x26>
20027fe8:	2400      	movs	r4, #0
20027fea:	6841      	ldr	r1, [r0, #4]
20027fec:	4299      	cmp	r1, r3
20027fee:	d9ed      	bls.n	20027fcc <mbedtls_mpi_shift_r+0x1e>
20027ff0:	6881      	ldr	r1, [r0, #8]
20027ff2:	f841 4023 	str.w	r4, [r1, r3, lsl #2]
20027ff6:	3301      	adds	r3, #1
20027ff8:	e7f7      	b.n	20027fea <mbedtls_mpi_shift_r+0x3c>
20027ffa:	2400      	movs	r4, #0
20027ffc:	6843      	ldr	r3, [r0, #4]
20027ffe:	f1c2 0720 	rsb	r7, r2, #32
20028002:	3b01      	subs	r3, #1
20028004:	d3e3      	bcc.n	20027fce <mbedtls_mpi_shift_r+0x20>
20028006:	6881      	ldr	r1, [r0, #8]
20028008:	f851 5023 	ldr.w	r5, [r1, r3, lsl #2]
2002800c:	fa25 f602 	lsr.w	r6, r5, r2
20028010:	f841 6023 	str.w	r6, [r1, r3, lsl #2]
20028014:	6886      	ldr	r6, [r0, #8]
20028016:	f856 1023 	ldr.w	r1, [r6, r3, lsl #2]
2002801a:	4321      	orrs	r1, r4
2002801c:	f846 1023 	str.w	r1, [r6, r3, lsl #2]
20028020:	fa05 f407 	lsl.w	r4, r5, r7
20028024:	e7ed      	b.n	20028002 <mbedtls_mpi_shift_r+0x54>
20028026:	291f      	cmp	r1, #31
20028028:	d9d1      	bls.n	20027fce <mbedtls_mpi_shift_r+0x20>
2002802a:	2300      	movs	r3, #0
2002802c:	00a1      	lsls	r1, r4, #2
2002802e:	e7d7      	b.n	20027fe0 <mbedtls_mpi_shift_r+0x32>

20028030 <mbedtls_mpi_cmp_abs>:
20028030:	b530      	push	{r4, r5, lr}
20028032:	6842      	ldr	r2, [r0, #4]
20028034:	b922      	cbnz	r2, 20028040 <mbedtls_mpi_cmp_abs+0x10>
20028036:	684b      	ldr	r3, [r1, #4]
20028038:	b95b      	cbnz	r3, 20028052 <mbedtls_mpi_cmp_abs+0x22>
2002803a:	b19a      	cbz	r2, 20028064 <mbedtls_mpi_cmp_abs+0x34>
2002803c:	2001      	movs	r0, #1
2002803e:	e015      	b.n	2002806c <mbedtls_mpi_cmp_abs+0x3c>
20028040:	6883      	ldr	r3, [r0, #8]
20028042:	eb03 0382 	add.w	r3, r3, r2, lsl #2
20028046:	f853 3c04 	ldr.w	r3, [r3, #-4]
2002804a:	2b00      	cmp	r3, #0
2002804c:	d1f3      	bne.n	20028036 <mbedtls_mpi_cmp_abs+0x6>
2002804e:	3a01      	subs	r2, #1
20028050:	e7f0      	b.n	20028034 <mbedtls_mpi_cmp_abs+0x4>
20028052:	688c      	ldr	r4, [r1, #8]
20028054:	eb04 0583 	add.w	r5, r4, r3, lsl #2
20028058:	f855 5c04 	ldr.w	r5, [r5, #-4]
2002805c:	b90d      	cbnz	r5, 20028062 <mbedtls_mpi_cmp_abs+0x32>
2002805e:	3b01      	subs	r3, #1
20028060:	e7ea      	b.n	20028038 <mbedtls_mpi_cmp_abs+0x8>
20028062:	b922      	cbnz	r2, 2002806e <mbedtls_mpi_cmp_abs+0x3e>
20028064:	1e18      	subs	r0, r3, #0
20028066:	bf18      	it	ne
20028068:	2001      	movne	r0, #1
2002806a:	4240      	negs	r0, r0
2002806c:	bd30      	pop	{r4, r5, pc}
2002806e:	4293      	cmp	r3, r2
20028070:	d3e4      	bcc.n	2002803c <mbedtls_mpi_cmp_abs+0xc>
20028072:	d80e      	bhi.n	20028092 <mbedtls_mpi_cmp_abs+0x62>
20028074:	3a01      	subs	r2, #1
20028076:	6883      	ldr	r3, [r0, #8]
20028078:	f853 1022 	ldr.w	r1, [r3, r2, lsl #2]
2002807c:	f854 3022 	ldr.w	r3, [r4, r2, lsl #2]
20028080:	4299      	cmp	r1, r3
20028082:	d8db      	bhi.n	2002803c <mbedtls_mpi_cmp_abs+0xc>
20028084:	f102 32ff 	add.w	r2, r2, #4294967295
20028088:	d303      	bcc.n	20028092 <mbedtls_mpi_cmp_abs+0x62>
2002808a:	1c53      	adds	r3, r2, #1
2002808c:	d1f3      	bne.n	20028076 <mbedtls_mpi_cmp_abs+0x46>
2002808e:	2000      	movs	r0, #0
20028090:	e7ec      	b.n	2002806c <mbedtls_mpi_cmp_abs+0x3c>
20028092:	f04f 30ff 	mov.w	r0, #4294967295
20028096:	e7e9      	b.n	2002806c <mbedtls_mpi_cmp_abs+0x3c>

20028098 <mpi_montmul>:
20028098:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
2002809c:	4615      	mov	r5, r2
2002809e:	b087      	sub	sp, #28
200280a0:	9305      	str	r3, [sp, #20]
200280a2:	9b10      	ldr	r3, [sp, #64]	@ 0x40
200280a4:	4606      	mov	r6, r0
200280a6:	685a      	ldr	r2, [r3, #4]
200280a8:	686b      	ldr	r3, [r5, #4]
200280aa:	4689      	mov	r9, r1
200280ac:	3301      	adds	r3, #1
200280ae:	429a      	cmp	r2, r3
200280b0:	d359      	bcc.n	20028166 <mpi_montmul+0xce>
200280b2:	9b10      	ldr	r3, [sp, #64]	@ 0x40
200280b4:	6898      	ldr	r0, [r3, #8]
200280b6:	2800      	cmp	r0, #0
200280b8:	d055      	beq.n	20028166 <mpi_montmul+0xce>
200280ba:	0092      	lsls	r2, r2, #2
200280bc:	2100      	movs	r1, #0
200280be:	f002 fb95 	bl	2002a7ec <memset>
200280c2:	9b10      	ldr	r3, [sp, #64]	@ 0x40
200280c4:	f8d5 8004 	ldr.w	r8, [r5, #4]
200280c8:	f8d3 a008 	ldr.w	sl, [r3, #8]
200280cc:	f8d9 3004 	ldr.w	r3, [r9, #4]
200280d0:	46d3      	mov	fp, sl
200280d2:	4543      	cmp	r3, r8
200280d4:	bf28      	it	cs
200280d6:	4643      	movcs	r3, r8
200280d8:	2400      	movs	r4, #0
200280da:	9304      	str	r3, [sp, #16]
200280dc:	f108 0301 	add.w	r3, r8, #1
200280e0:	009a      	lsls	r2, r3, #2
200280e2:	eb0a 0383 	add.w	r3, sl, r3, lsl #2
200280e6:	9202      	str	r2, [sp, #8]
200280e8:	9303      	str	r3, [sp, #12]
200280ea:	4544      	cmp	r4, r8
200280ec:	68b0      	ldr	r0, [r6, #8]
200280ee:	d118      	bne.n	20028122 <mpi_montmul+0x8a>
200280f0:	9b02      	ldr	r3, [sp, #8]
200280f2:	1f19      	subs	r1, r3, #4
200280f4:	461a      	mov	r2, r3
200280f6:	4451      	add	r1, sl
200280f8:	f002 fb92 	bl	2002a820 <memcpy>
200280fc:	4629      	mov	r1, r5
200280fe:	4630      	mov	r0, r6
20028100:	f7ff ff96 	bl	20028030 <mbedtls_mpi_cmp_abs>
20028104:	3001      	adds	r0, #1
20028106:	68b1      	ldr	r1, [r6, #8]
20028108:	bf0c      	ite	eq
2002810a:	9b10      	ldreq	r3, [sp, #64]	@ 0x40
2002810c:	460a      	movne	r2, r1
2002810e:	4620      	mov	r0, r4
20028110:	bf14      	ite	ne
20028112:	68a9      	ldrne	r1, [r5, #8]
20028114:	689a      	ldreq	r2, [r3, #8]
20028116:	f7ff fc2c 	bl	20027972 <mpi_sub_hlp>
2002811a:	2000      	movs	r0, #0
2002811c:	b007      	add	sp, #28
2002811e:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
20028122:	f850 3024 	ldr.w	r3, [r0, r4, lsl #2]
20028126:	f8d9 1008 	ldr.w	r1, [r9, #8]
2002812a:	9301      	str	r3, [sp, #4]
2002812c:	9a01      	ldr	r2, [sp, #4]
2002812e:	680b      	ldr	r3, [r1, #0]
20028130:	f8db 7000 	ldr.w	r7, [fp]
20028134:	9804      	ldr	r0, [sp, #16]
20028136:	fb03 7702 	mla	r7, r3, r2, r7
2002813a:	9b05      	ldr	r3, [sp, #20]
2002813c:	3401      	adds	r4, #1
2002813e:	435f      	muls	r7, r3
20028140:	4613      	mov	r3, r2
20028142:	465a      	mov	r2, fp
20028144:	f7ff fc3e 	bl	200279c4 <mpi_mul_hlp>
20028148:	465a      	mov	r2, fp
2002814a:	463b      	mov	r3, r7
2002814c:	4640      	mov	r0, r8
2002814e:	68a9      	ldr	r1, [r5, #8]
20028150:	f7ff fc38 	bl	200279c4 <mpi_mul_hlp>
20028154:	2200      	movs	r2, #0
20028156:	9b01      	ldr	r3, [sp, #4]
20028158:	f84b 3b04 	str.w	r3, [fp], #4
2002815c:	9b03      	ldr	r3, [sp, #12]
2002815e:	f843 2f04 	str.w	r2, [r3, #4]!
20028162:	9303      	str	r3, [sp, #12]
20028164:	e7c1      	b.n	200280ea <mpi_montmul+0x52>
20028166:	f06f 0003 	mvn.w	r0, #3
2002816a:	e7d7      	b.n	2002811c <mpi_montmul+0x84>

2002816c <mbedtls_mpi_cmp_mpi>:
2002816c:	4602      	mov	r2, r0
2002816e:	b530      	push	{r4, r5, lr}
20028170:	6843      	ldr	r3, [r0, #4]
20028172:	b923      	cbnz	r3, 2002817e <mbedtls_mpi_cmp_mpi+0x12>
20028174:	6848      	ldr	r0, [r1, #4]
20028176:	b958      	cbnz	r0, 20028190 <mbedtls_mpi_cmp_mpi+0x24>
20028178:	2b00      	cmp	r3, #0
2002817a:	d136      	bne.n	200281ea <mbedtls_mpi_cmp_mpi+0x7e>
2002817c:	e02f      	b.n	200281de <mbedtls_mpi_cmp_mpi+0x72>
2002817e:	6890      	ldr	r0, [r2, #8]
20028180:	eb00 0083 	add.w	r0, r0, r3, lsl #2
20028184:	f850 0c04 	ldr.w	r0, [r0, #-4]
20028188:	2800      	cmp	r0, #0
2002818a:	d1f3      	bne.n	20028174 <mbedtls_mpi_cmp_mpi+0x8>
2002818c:	3b01      	subs	r3, #1
2002818e:	e7f0      	b.n	20028172 <mbedtls_mpi_cmp_mpi+0x6>
20028190:	688c      	ldr	r4, [r1, #8]
20028192:	eb04 0580 	add.w	r5, r4, r0, lsl #2
20028196:	f855 5c04 	ldr.w	r5, [r5, #-4]
2002819a:	bb15      	cbnz	r5, 200281e2 <mbedtls_mpi_cmp_mpi+0x76>
2002819c:	3801      	subs	r0, #1
2002819e:	e7ea      	b.n	20028176 <mbedtls_mpi_cmp_mpi+0xa>
200281a0:	680d      	ldr	r5, [r1, #0]
200281a2:	d202      	bcs.n	200281aa <mbedtls_mpi_cmp_mpi+0x3e>
200281a4:	6808      	ldr	r0, [r1, #0]
200281a6:	4240      	negs	r0, r0
200281a8:	e020      	b.n	200281ec <mbedtls_mpi_cmp_mpi+0x80>
200281aa:	6810      	ldr	r0, [r2, #0]
200281ac:	2800      	cmp	r0, #0
200281ae:	dd03      	ble.n	200281b8 <mbedtls_mpi_cmp_mpi+0x4c>
200281b0:	2d00      	cmp	r5, #0
200281b2:	da07      	bge.n	200281c4 <mbedtls_mpi_cmp_mpi+0x58>
200281b4:	2001      	movs	r0, #1
200281b6:	e019      	b.n	200281ec <mbedtls_mpi_cmp_mpi+0x80>
200281b8:	2d00      	cmp	r5, #0
200281ba:	dd03      	ble.n	200281c4 <mbedtls_mpi_cmp_mpi+0x58>
200281bc:	b110      	cbz	r0, 200281c4 <mbedtls_mpi_cmp_mpi+0x58>
200281be:	f04f 30ff 	mov.w	r0, #4294967295
200281c2:	e013      	b.n	200281ec <mbedtls_mpi_cmp_mpi+0x80>
200281c4:	3b01      	subs	r3, #1
200281c6:	6891      	ldr	r1, [r2, #8]
200281c8:	f851 5023 	ldr.w	r5, [r1, r3, lsl #2]
200281cc:	f854 1023 	ldr.w	r1, [r4, r3, lsl #2]
200281d0:	428d      	cmp	r5, r1
200281d2:	d80b      	bhi.n	200281ec <mbedtls_mpi_cmp_mpi+0x80>
200281d4:	f103 33ff 	add.w	r3, r3, #4294967295
200281d8:	d3e5      	bcc.n	200281a6 <mbedtls_mpi_cmp_mpi+0x3a>
200281da:	1c59      	adds	r1, r3, #1
200281dc:	d1f3      	bne.n	200281c6 <mbedtls_mpi_cmp_mpi+0x5a>
200281de:	2000      	movs	r0, #0
200281e0:	e004      	b.n	200281ec <mbedtls_mpi_cmp_mpi+0x80>
200281e2:	2b00      	cmp	r3, #0
200281e4:	d0de      	beq.n	200281a4 <mbedtls_mpi_cmp_mpi+0x38>
200281e6:	4283      	cmp	r3, r0
200281e8:	d9da      	bls.n	200281a0 <mbedtls_mpi_cmp_mpi+0x34>
200281ea:	6810      	ldr	r0, [r2, #0]
200281ec:	bd30      	pop	{r4, r5, pc}

200281ee <mbedtls_mpi_cmp_int>:
200281ee:	b51f      	push	{r0, r1, r2, r3, r4, lr}
200281f0:	ea81 73e1 	eor.w	r3, r1, r1, asr #31
200281f4:	eba3 73e1 	sub.w	r3, r3, r1, asr #31
200281f8:	2900      	cmp	r1, #0
200281fa:	9300      	str	r3, [sp, #0]
200281fc:	bfac      	ite	ge
200281fe:	2301      	movge	r3, #1
20028200:	f04f 33ff 	movlt.w	r3, #4294967295
20028204:	9301      	str	r3, [sp, #4]
20028206:	2301      	movs	r3, #1
20028208:	a901      	add	r1, sp, #4
2002820a:	9302      	str	r3, [sp, #8]
2002820c:	f8cd d00c 	str.w	sp, [sp, #12]
20028210:	f7ff ffac 	bl	2002816c <mbedtls_mpi_cmp_mpi>
20028214:	b005      	add	sp, #20
20028216:	f85d fb04 	ldr.w	pc, [sp], #4

2002821a <mbedtls_mpi_add_abs>:
2002821a:	4290      	cmp	r0, r2
2002821c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
20028220:	4606      	mov	r6, r0
20028222:	460c      	mov	r4, r1
20028224:	4615      	mov	r5, r2
20028226:	d002      	beq.n	2002822e <mbedtls_mpi_add_abs+0x14>
20028228:	4288      	cmp	r0, r1
2002822a:	d12c      	bne.n	20028286 <mbedtls_mpi_add_abs+0x6c>
2002822c:	462c      	mov	r4, r5
2002822e:	2301      	movs	r3, #1
20028230:	6033      	str	r3, [r6, #0]
20028232:	6865      	ldr	r5, [r4, #4]
20028234:	bb85      	cbnz	r5, 20028298 <mbedtls_mpi_add_abs+0x7e>
20028236:	4629      	mov	r1, r5
20028238:	4630      	mov	r0, r6
2002823a:	f7ff fd5b 	bl	20027cf4 <mbedtls_mpi_grow>
2002823e:	4607      	mov	r7, r0
20028240:	bb28      	cbnz	r0, 2002828e <mbedtls_mpi_add_abs+0x74>
20028242:	68b3      	ldr	r3, [r6, #8]
20028244:	68a1      	ldr	r1, [r4, #8]
20028246:	469c      	mov	ip, r3
20028248:	4604      	mov	r4, r0
2002824a:	42a8      	cmp	r0, r5
2002824c:	d12d      	bne.n	200282aa <mbedtls_mpi_add_abs+0x90>
2002824e:	eb03 0385 	add.w	r3, r3, r5, lsl #2
20028252:	b1f4      	cbz	r4, 20028292 <mbedtls_mpi_add_abs+0x78>
20028254:	6872      	ldr	r2, [r6, #4]
20028256:	f105 0801 	add.w	r8, r5, #1
2002825a:	42aa      	cmp	r2, r5
2002825c:	d807      	bhi.n	2002826e <mbedtls_mpi_add_abs+0x54>
2002825e:	4641      	mov	r1, r8
20028260:	4630      	mov	r0, r6
20028262:	f7ff fd47 	bl	20027cf4 <mbedtls_mpi_grow>
20028266:	b990      	cbnz	r0, 2002828e <mbedtls_mpi_add_abs+0x74>
20028268:	68b3      	ldr	r3, [r6, #8]
2002826a:	eb03 0385 	add.w	r3, r3, r5, lsl #2
2002826e:	681a      	ldr	r2, [r3, #0]
20028270:	4645      	mov	r5, r8
20028272:	1912      	adds	r2, r2, r4
20028274:	bf2c      	ite	cs
20028276:	2401      	movcs	r4, #1
20028278:	2400      	movcc	r4, #0
2002827a:	3c00      	subs	r4, #0
2002827c:	bf18      	it	ne
2002827e:	2401      	movne	r4, #1
20028280:	f843 2b04 	str.w	r2, [r3], #4
20028284:	e7e5      	b.n	20028252 <mbedtls_mpi_add_abs+0x38>
20028286:	f7ff fd61 	bl	20027d4c <mbedtls_mpi_copy>
2002828a:	2800      	cmp	r0, #0
2002828c:	d0ce      	beq.n	2002822c <mbedtls_mpi_add_abs+0x12>
2002828e:	f06f 070f 	mvn.w	r7, #15
20028292:	4638      	mov	r0, r7
20028294:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
20028298:	68a3      	ldr	r3, [r4, #8]
2002829a:	eb03 0385 	add.w	r3, r3, r5, lsl #2
2002829e:	f853 3c04 	ldr.w	r3, [r3, #-4]
200282a2:	2b00      	cmp	r3, #0
200282a4:	d1c7      	bne.n	20028236 <mbedtls_mpi_add_abs+0x1c>
200282a6:	3d01      	subs	r5, #1
200282a8:	e7c4      	b.n	20028234 <mbedtls_mpi_add_abs+0x1a>
200282aa:	f8dc 2000 	ldr.w	r2, [ip]
200282ae:	1912      	adds	r2, r2, r4
200282b0:	bf2c      	ite	cs
200282b2:	f04f 0e01 	movcs.w	lr, #1
200282b6:	f04f 0e00 	movcc.w	lr, #0
200282ba:	f851 4020 	ldr.w	r4, [r1, r0, lsl #2]
200282be:	3001      	adds	r0, #1
200282c0:	1912      	adds	r2, r2, r4
200282c2:	f84c 2b04 	str.w	r2, [ip], #4
200282c6:	f14e 0400 	adc.w	r4, lr, #0
200282ca:	e7be      	b.n	2002824a <mbedtls_mpi_add_abs+0x30>

200282cc <mbedtls_mpi_sub_abs>:
200282cc:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
200282ce:	460e      	mov	r6, r1
200282d0:	4605      	mov	r5, r0
200282d2:	4611      	mov	r1, r2
200282d4:	4630      	mov	r0, r6
200282d6:	4614      	mov	r4, r2
200282d8:	f7ff feaa 	bl	20028030 <mbedtls_mpi_cmp_abs>
200282dc:	3001      	adds	r0, #1
200282de:	d02f      	beq.n	20028340 <mbedtls_mpi_sub_abs+0x74>
200282e0:	2300      	movs	r3, #0
200282e2:	2201      	movs	r2, #1
200282e4:	42ac      	cmp	r4, r5
200282e6:	e9cd 2301 	strd	r2, r3, [sp, #4]
200282ea:	9303      	str	r3, [sp, #12]
200282ec:	d10d      	bne.n	2002830a <mbedtls_mpi_sub_abs+0x3e>
200282ee:	4621      	mov	r1, r4
200282f0:	a801      	add	r0, sp, #4
200282f2:	f7ff fd2b 	bl	20027d4c <mbedtls_mpi_copy>
200282f6:	b138      	cbz	r0, 20028308 <mbedtls_mpi_sub_abs+0x3c>
200282f8:	f06f 040f 	mvn.w	r4, #15
200282fc:	a801      	add	r0, sp, #4
200282fe:	f7ff fce4 	bl	20027cca <mbedtls_mpi_free>
20028302:	4620      	mov	r0, r4
20028304:	b004      	add	sp, #16
20028306:	bd70      	pop	{r4, r5, r6, pc}
20028308:	ac01      	add	r4, sp, #4
2002830a:	42ae      	cmp	r6, r5
2002830c:	d109      	bne.n	20028322 <mbedtls_mpi_sub_abs+0x56>
2002830e:	2301      	movs	r3, #1
20028310:	602b      	str	r3, [r5, #0]
20028312:	e9d4 0101 	ldrd	r0, r1, [r4, #4]
20028316:	b958      	cbnz	r0, 20028330 <mbedtls_mpi_sub_abs+0x64>
20028318:	68aa      	ldr	r2, [r5, #8]
2002831a:	f7ff fb2a 	bl	20027972 <mpi_sub_hlp>
2002831e:	2400      	movs	r4, #0
20028320:	e7ec      	b.n	200282fc <mbedtls_mpi_sub_abs+0x30>
20028322:	4631      	mov	r1, r6
20028324:	4628      	mov	r0, r5
20028326:	f7ff fd11 	bl	20027d4c <mbedtls_mpi_copy>
2002832a:	2800      	cmp	r0, #0
2002832c:	d0ef      	beq.n	2002830e <mbedtls_mpi_sub_abs+0x42>
2002832e:	e7e3      	b.n	200282f8 <mbedtls_mpi_sub_abs+0x2c>
20028330:	eb01 0380 	add.w	r3, r1, r0, lsl #2
20028334:	f853 3c04 	ldr.w	r3, [r3, #-4]
20028338:	2b00      	cmp	r3, #0
2002833a:	d1ed      	bne.n	20028318 <mbedtls_mpi_sub_abs+0x4c>
2002833c:	3801      	subs	r0, #1
2002833e:	e7ea      	b.n	20028316 <mbedtls_mpi_sub_abs+0x4a>
20028340:	f06f 0409 	mvn.w	r4, #9
20028344:	e7dd      	b.n	20028302 <mbedtls_mpi_sub_abs+0x36>

20028346 <mbedtls_mpi_add_mpi>:
20028346:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
20028348:	680d      	ldr	r5, [r1, #0]
2002834a:	6813      	ldr	r3, [r2, #0]
2002834c:	4604      	mov	r4, r0
2002834e:	436b      	muls	r3, r5
20028350:	460f      	mov	r7, r1
20028352:	4616      	mov	r6, r2
20028354:	d516      	bpl.n	20028384 <mbedtls_mpi_add_mpi+0x3e>
20028356:	4611      	mov	r1, r2
20028358:	4638      	mov	r0, r7
2002835a:	f7ff fe69 	bl	20028030 <mbedtls_mpi_cmp_abs>
2002835e:	3001      	adds	r0, #1
20028360:	d007      	beq.n	20028372 <mbedtls_mpi_add_mpi+0x2c>
20028362:	4632      	mov	r2, r6
20028364:	4639      	mov	r1, r7
20028366:	4620      	mov	r0, r4
20028368:	f7ff ffb0 	bl	200282cc <mbedtls_mpi_sub_abs>
2002836c:	b900      	cbnz	r0, 20028370 <mbedtls_mpi_add_mpi+0x2a>
2002836e:	6025      	str	r5, [r4, #0]
20028370:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
20028372:	463a      	mov	r2, r7
20028374:	4631      	mov	r1, r6
20028376:	4620      	mov	r0, r4
20028378:	f7ff ffa8 	bl	200282cc <mbedtls_mpi_sub_abs>
2002837c:	2800      	cmp	r0, #0
2002837e:	d1f7      	bne.n	20028370 <mbedtls_mpi_add_mpi+0x2a>
20028380:	426d      	negs	r5, r5
20028382:	e7f4      	b.n	2002836e <mbedtls_mpi_add_mpi+0x28>
20028384:	f7ff ff49 	bl	2002821a <mbedtls_mpi_add_abs>
20028388:	2800      	cmp	r0, #0
2002838a:	d0f0      	beq.n	2002836e <mbedtls_mpi_add_mpi+0x28>
2002838c:	f06f 000f 	mvn.w	r0, #15
20028390:	e7ee      	b.n	20028370 <mbedtls_mpi_add_mpi+0x2a>

20028392 <mbedtls_mpi_sub_mpi>:
20028392:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
20028394:	680d      	ldr	r5, [r1, #0]
20028396:	6813      	ldr	r3, [r2, #0]
20028398:	4604      	mov	r4, r0
2002839a:	436b      	muls	r3, r5
2002839c:	2b00      	cmp	r3, #0
2002839e:	460f      	mov	r7, r1
200283a0:	4616      	mov	r6, r2
200283a2:	dd16      	ble.n	200283d2 <mbedtls_mpi_sub_mpi+0x40>
200283a4:	4611      	mov	r1, r2
200283a6:	4638      	mov	r0, r7
200283a8:	f7ff fe42 	bl	20028030 <mbedtls_mpi_cmp_abs>
200283ac:	3001      	adds	r0, #1
200283ae:	d007      	beq.n	200283c0 <mbedtls_mpi_sub_mpi+0x2e>
200283b0:	4632      	mov	r2, r6
200283b2:	4639      	mov	r1, r7
200283b4:	4620      	mov	r0, r4
200283b6:	f7ff ff89 	bl	200282cc <mbedtls_mpi_sub_abs>
200283ba:	b900      	cbnz	r0, 200283be <mbedtls_mpi_sub_mpi+0x2c>
200283bc:	6025      	str	r5, [r4, #0]
200283be:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
200283c0:	463a      	mov	r2, r7
200283c2:	4631      	mov	r1, r6
200283c4:	4620      	mov	r0, r4
200283c6:	f7ff ff81 	bl	200282cc <mbedtls_mpi_sub_abs>
200283ca:	2800      	cmp	r0, #0
200283cc:	d1f7      	bne.n	200283be <mbedtls_mpi_sub_mpi+0x2c>
200283ce:	426d      	negs	r5, r5
200283d0:	e7f4      	b.n	200283bc <mbedtls_mpi_sub_mpi+0x2a>
200283d2:	f7ff ff22 	bl	2002821a <mbedtls_mpi_add_abs>
200283d6:	2800      	cmp	r0, #0
200283d8:	d0f0      	beq.n	200283bc <mbedtls_mpi_sub_mpi+0x2a>
200283da:	f06f 000f 	mvn.w	r0, #15
200283de:	e7ee      	b.n	200283be <mbedtls_mpi_sub_mpi+0x2c>

200283e0 <mbedtls_mpi_sub_int>:
200283e0:	b51f      	push	{r0, r1, r2, r3, r4, lr}
200283e2:	ea82 73e2 	eor.w	r3, r2, r2, asr #31
200283e6:	eba3 73e2 	sub.w	r3, r3, r2, asr #31
200283ea:	2a00      	cmp	r2, #0
200283ec:	9300      	str	r3, [sp, #0]
200283ee:	bfac      	ite	ge
200283f0:	2301      	movge	r3, #1
200283f2:	f04f 33ff 	movlt.w	r3, #4294967295
200283f6:	9301      	str	r3, [sp, #4]
200283f8:	2301      	movs	r3, #1
200283fa:	aa01      	add	r2, sp, #4
200283fc:	9302      	str	r3, [sp, #8]
200283fe:	f8cd d00c 	str.w	sp, [sp, #12]
20028402:	f7ff ffc6 	bl	20028392 <mbedtls_mpi_sub_mpi>
20028406:	b005      	add	sp, #20
20028408:	f85d fb04 	ldr.w	pc, [sp], #4

2002840c <mbedtls_mpi_mul_mpi>:
2002840c:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
20028410:	2300      	movs	r3, #0
20028412:	4615      	mov	r5, r2
20028414:	2201      	movs	r2, #1
20028416:	b087      	sub	sp, #28
20028418:	4288      	cmp	r0, r1
2002841a:	4607      	mov	r7, r0
2002841c:	460e      	mov	r6, r1
2002841e:	e9cd 2300 	strd	r2, r3, [sp]
20028422:	e9cd 3202 	strd	r3, r2, [sp, #8]
20028426:	e9cd 3304 	strd	r3, r3, [sp, #16]
2002842a:	d110      	bne.n	2002844e <mbedtls_mpi_mul_mpi+0x42>
2002842c:	4668      	mov	r0, sp
2002842e:	f7ff fc8d 	bl	20027d4c <mbedtls_mpi_copy>
20028432:	b158      	cbz	r0, 2002844c <mbedtls_mpi_mul_mpi+0x40>
20028434:	f06f 090f 	mvn.w	r9, #15
20028438:	a803      	add	r0, sp, #12
2002843a:	f7ff fc46 	bl	20027cca <mbedtls_mpi_free>
2002843e:	4668      	mov	r0, sp
20028440:	f7ff fc43 	bl	20027cca <mbedtls_mpi_free>
20028444:	4648      	mov	r0, r9
20028446:	b007      	add	sp, #28
20028448:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
2002844c:	466e      	mov	r6, sp
2002844e:	42af      	cmp	r7, r5
20028450:	d106      	bne.n	20028460 <mbedtls_mpi_mul_mpi+0x54>
20028452:	4639      	mov	r1, r7
20028454:	a803      	add	r0, sp, #12
20028456:	f7ff fc79 	bl	20027d4c <mbedtls_mpi_copy>
2002845a:	2800      	cmp	r0, #0
2002845c:	d1ea      	bne.n	20028434 <mbedtls_mpi_mul_mpi+0x28>
2002845e:	ad03      	add	r5, sp, #12
20028460:	f8d6 8004 	ldr.w	r8, [r6, #4]
20028464:	f1b8 0f00 	cmp.w	r8, #0
20028468:	d116      	bne.n	20028498 <mbedtls_mpi_mul_mpi+0x8c>
2002846a:	686c      	ldr	r4, [r5, #4]
2002846c:	b9f4      	cbnz	r4, 200284ac <mbedtls_mpi_mul_mpi+0xa0>
2002846e:	eb08 0104 	add.w	r1, r8, r4
20028472:	4638      	mov	r0, r7
20028474:	f7ff fc3e 	bl	20027cf4 <mbedtls_mpi_grow>
20028478:	4601      	mov	r1, r0
2002847a:	2800      	cmp	r0, #0
2002847c:	d1da      	bne.n	20028434 <mbedtls_mpi_mul_mpi+0x28>
2002847e:	4638      	mov	r0, r7
20028480:	f7ff fc8d 	bl	20027d9e <mbedtls_mpi_lset>
20028484:	4681      	mov	r9, r0
20028486:	2800      	cmp	r0, #0
20028488:	d1d4      	bne.n	20028434 <mbedtls_mpi_mul_mpi+0x28>
2002848a:	3c01      	subs	r4, #1
2002848c:	d217      	bcs.n	200284be <mbedtls_mpi_mul_mpi+0xb2>
2002848e:	6833      	ldr	r3, [r6, #0]
20028490:	682a      	ldr	r2, [r5, #0]
20028492:	4353      	muls	r3, r2
20028494:	603b      	str	r3, [r7, #0]
20028496:	e7cf      	b.n	20028438 <mbedtls_mpi_mul_mpi+0x2c>
20028498:	68b3      	ldr	r3, [r6, #8]
2002849a:	eb03 0388 	add.w	r3, r3, r8, lsl #2
2002849e:	f853 3c04 	ldr.w	r3, [r3, #-4]
200284a2:	2b00      	cmp	r3, #0
200284a4:	d1e1      	bne.n	2002846a <mbedtls_mpi_mul_mpi+0x5e>
200284a6:	f108 38ff 	add.w	r8, r8, #4294967295
200284aa:	e7db      	b.n	20028464 <mbedtls_mpi_mul_mpi+0x58>
200284ac:	68ab      	ldr	r3, [r5, #8]
200284ae:	eb03 0384 	add.w	r3, r3, r4, lsl #2
200284b2:	f853 3c04 	ldr.w	r3, [r3, #-4]
200284b6:	2b00      	cmp	r3, #0
200284b8:	d1d9      	bne.n	2002846e <mbedtls_mpi_mul_mpi+0x62>
200284ba:	3c01      	subs	r4, #1
200284bc:	e7d6      	b.n	2002846c <mbedtls_mpi_mul_mpi+0x60>
200284be:	68ab      	ldr	r3, [r5, #8]
200284c0:	68ba      	ldr	r2, [r7, #8]
200284c2:	4640      	mov	r0, r8
200284c4:	f853 3024 	ldr.w	r3, [r3, r4, lsl #2]
200284c8:	68b1      	ldr	r1, [r6, #8]
200284ca:	eb02 0284 	add.w	r2, r2, r4, lsl #2
200284ce:	f7ff fa79 	bl	200279c4 <mpi_mul_hlp>
200284d2:	e7da      	b.n	2002848a <mbedtls_mpi_mul_mpi+0x7e>

200284d4 <mbedtls_mpi_mul_int>:
200284d4:	b51f      	push	{r0, r1, r2, r3, r4, lr}
200284d6:	2301      	movs	r3, #1
200284d8:	9200      	str	r2, [sp, #0]
200284da:	aa01      	add	r2, sp, #4
200284dc:	e9cd 3301 	strd	r3, r3, [sp, #4]
200284e0:	f8cd d00c 	str.w	sp, [sp, #12]
200284e4:	f7ff ff92 	bl	2002840c <mbedtls_mpi_mul_mpi>
200284e8:	b005      	add	sp, #20
200284ea:	f85d fb04 	ldr.w	pc, [sp], #4

200284ee <mbedtls_mpi_div_mpi>:
200284ee:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
200284f2:	b09f      	sub	sp, #124	@ 0x7c
200284f4:	e9cd 1203 	strd	r1, r2, [sp, #12]
200284f8:	9005      	str	r0, [sp, #20]
200284fa:	2100      	movs	r1, #0
200284fc:	4618      	mov	r0, r3
200284fe:	9309      	str	r3, [sp, #36]	@ 0x24
20028500:	f7ff fe75 	bl	200281ee <mbedtls_mpi_cmp_int>
20028504:	2800      	cmp	r0, #0
20028506:	f000 81f3 	beq.w	200288f0 <mbedtls_mpi_div_mpi+0x402>
2002850a:	2501      	movs	r5, #1
2002850c:	2400      	movs	r4, #0
2002850e:	9909      	ldr	r1, [sp, #36]	@ 0x24
20028510:	9804      	ldr	r0, [sp, #16]
20028512:	e9cd 5418 	strd	r5, r4, [sp, #96]	@ 0x60
20028516:	e9cd 541b 	strd	r5, r4, [sp, #108]	@ 0x6c
2002851a:	950f      	str	r5, [sp, #60]	@ 0x3c
2002851c:	9512      	str	r5, [sp, #72]	@ 0x48
2002851e:	9515      	str	r5, [sp, #84]	@ 0x54
20028520:	9416      	str	r4, [sp, #88]	@ 0x58
20028522:	f7ff fd85 	bl	20028030 <mbedtls_mpi_cmp_abs>
20028526:	3001      	adds	r0, #1
20028528:	d11f      	bne.n	2002856a <mbedtls_mpi_div_mpi+0x7c>
2002852a:	9b05      	ldr	r3, [sp, #20]
2002852c:	b933      	cbnz	r3, 2002853c <mbedtls_mpi_div_mpi+0x4e>
2002852e:	9b03      	ldr	r3, [sp, #12]
20028530:	b9a3      	cbnz	r3, 2002855c <mbedtls_mpi_div_mpi+0x6e>
20028532:	2100      	movs	r1, #0
20028534:	4608      	mov	r0, r1
20028536:	b01f      	add	sp, #124	@ 0x7c
20028538:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
2002853c:	4621      	mov	r1, r4
2002853e:	9805      	ldr	r0, [sp, #20]
20028540:	f7ff fc2d 	bl	20027d9e <mbedtls_mpi_lset>
20028544:	2800      	cmp	r0, #0
20028546:	d0f2      	beq.n	2002852e <mbedtls_mpi_div_mpi+0x40>
20028548:	2400      	movs	r4, #0
2002854a:	4625      	mov	r5, r4
2002854c:	46a1      	mov	r9, r4
2002854e:	46a0      	mov	r8, r4
20028550:	4626      	mov	r6, r4
20028552:	4627      	mov	r7, r4
20028554:	9402      	str	r4, [sp, #8]
20028556:	f06f 010f 	mvn.w	r1, #15
2002855a:	e0ef      	b.n	2002873c <mbedtls_mpi_div_mpi+0x24e>
2002855c:	e9dd 0103 	ldrd	r0, r1, [sp, #12]
20028560:	f7ff fbf4 	bl	20027d4c <mbedtls_mpi_copy>
20028564:	2800      	cmp	r0, #0
20028566:	d1ef      	bne.n	20028548 <mbedtls_mpi_div_mpi+0x5a>
20028568:	e7e3      	b.n	20028532 <mbedtls_mpi_div_mpi+0x44>
2002856a:	9904      	ldr	r1, [sp, #16]
2002856c:	a80f      	add	r0, sp, #60	@ 0x3c
2002856e:	e9cd 4410 	strd	r4, r4, [sp, #64]	@ 0x40
20028572:	f7ff fbeb 	bl	20027d4c <mbedtls_mpi_copy>
20028576:	e9dd 7610 	ldrd	r7, r6, [sp, #64]	@ 0x40
2002857a:	4682      	mov	sl, r0
2002857c:	2800      	cmp	r0, #0
2002857e:	f040 81a9 	bne.w	200288d4 <mbedtls_mpi_div_mpi+0x3e6>
20028582:	e9cd 0013 	strd	r0, r0, [sp, #76]	@ 0x4c
20028586:	9909      	ldr	r1, [sp, #36]	@ 0x24
20028588:	a812      	add	r0, sp, #72	@ 0x48
2002858a:	f7ff fbdf 	bl	20027d4c <mbedtls_mpi_copy>
2002858e:	e9dd 8913 	ldrd	r8, r9, [sp, #76]	@ 0x4c
20028592:	4604      	mov	r4, r0
20028594:	2800      	cmp	r0, #0
20028596:	f040 81a2 	bne.w	200288de <mbedtls_mpi_div_mpi+0x3f0>
2002859a:	9b04      	ldr	r3, [sp, #16]
2002859c:	9017      	str	r0, [sp, #92]	@ 0x5c
2002859e:	6859      	ldr	r1, [r3, #4]
200285a0:	a815      	add	r0, sp, #84	@ 0x54
200285a2:	3102      	adds	r1, #2
200285a4:	9512      	str	r5, [sp, #72]	@ 0x48
200285a6:	950f      	str	r5, [sp, #60]	@ 0x3c
200285a8:	f7ff fba4 	bl	20027cf4 <mbedtls_mpi_grow>
200285ac:	4605      	mov	r5, r0
200285ae:	b118      	cbz	r0, 200285b8 <mbedtls_mpi_div_mpi+0xca>
200285b0:	9b17      	ldr	r3, [sp, #92]	@ 0x5c
200285b2:	9302      	str	r3, [sp, #8]
200285b4:	4625      	mov	r5, r4
200285b6:	e7ce      	b.n	20028556 <mbedtls_mpi_div_mpi+0x68>
200285b8:	4601      	mov	r1, r0
200285ba:	a815      	add	r0, sp, #84	@ 0x54
200285bc:	f7ff fbef 	bl	20027d9e <mbedtls_mpi_lset>
200285c0:	9b17      	ldr	r3, [sp, #92]	@ 0x5c
200285c2:	4604      	mov	r4, r0
200285c4:	9302      	str	r3, [sp, #8]
200285c6:	2800      	cmp	r0, #0
200285c8:	f040 818e 	bne.w	200288e8 <mbedtls_mpi_div_mpi+0x3fa>
200285cc:	901a      	str	r0, [sp, #104]	@ 0x68
200285ce:	2102      	movs	r1, #2
200285d0:	a818      	add	r0, sp, #96	@ 0x60
200285d2:	f7ff fb8f 	bl	20027cf4 <mbedtls_mpi_grow>
200285d6:	9d1a      	ldr	r5, [sp, #104]	@ 0x68
200285d8:	2800      	cmp	r0, #0
200285da:	d1bc      	bne.n	20028556 <mbedtls_mpi_div_mpi+0x68>
200285dc:	901d      	str	r0, [sp, #116]	@ 0x74
200285de:	2103      	movs	r1, #3
200285e0:	a81b      	add	r0, sp, #108	@ 0x6c
200285e2:	f7ff fb87 	bl	20027cf4 <mbedtls_mpi_grow>
200285e6:	9c1d      	ldr	r4, [sp, #116]	@ 0x74
200285e8:	4683      	mov	fp, r0
200285ea:	2800      	cmp	r0, #0
200285ec:	d1b3      	bne.n	20028556 <mbedtls_mpi_div_mpi+0x68>
200285ee:	a812      	add	r0, sp, #72	@ 0x48
200285f0:	f7ff fc09 	bl	20027e06 <mbedtls_mpi_bitlen>
200285f4:	f000 001f 	and.w	r0, r0, #31
200285f8:	281f      	cmp	r0, #31
200285fa:	f000 808a 	beq.w	20028712 <mbedtls_mpi_div_mpi+0x224>
200285fe:	f1c0 031f 	rsb	r3, r0, #31
20028602:	4619      	mov	r1, r3
20028604:	a80f      	add	r0, sp, #60	@ 0x3c
20028606:	9306      	str	r3, [sp, #24]
20028608:	f7ff fc78 	bl	20027efc <mbedtls_mpi_shift_l>
2002860c:	e9dd 7610 	ldrd	r7, r6, [sp, #64]	@ 0x40
20028610:	2800      	cmp	r0, #0
20028612:	d1a0      	bne.n	20028556 <mbedtls_mpi_div_mpi+0x68>
20028614:	9906      	ldr	r1, [sp, #24]
20028616:	a812      	add	r0, sp, #72	@ 0x48
20028618:	f7ff fc70 	bl	20027efc <mbedtls_mpi_shift_l>
2002861c:	e9dd 8913 	ldrd	r8, r9, [sp, #76]	@ 0x4c
20028620:	2800      	cmp	r0, #0
20028622:	d198      	bne.n	20028556 <mbedtls_mpi_div_mpi+0x68>
20028624:	46ba      	mov	sl, r7
20028626:	f8cd 8020 	str.w	r8, [sp, #32]
2002862a:	eba7 0b08 	sub.w	fp, r7, r8
2002862e:	ea4f 134b 	mov.w	r3, fp, lsl #5
20028632:	4619      	mov	r1, r3
20028634:	a812      	add	r0, sp, #72	@ 0x48
20028636:	e9cd 8913 	strd	r8, r9, [sp, #76]	@ 0x4c
2002863a:	9301      	str	r3, [sp, #4]
2002863c:	f7ff fc5e 	bl	20027efc <mbedtls_mpi_shift_l>
20028640:	e9dd 8913 	ldrd	r8, r9, [sp, #76]	@ 0x4c
20028644:	2800      	cmp	r0, #0
20028646:	d186      	bne.n	20028556 <mbedtls_mpi_div_mpi+0x68>
20028648:	ea4f 038b 	mov.w	r3, fp, lsl #2
2002864c:	930b      	str	r3, [sp, #44]	@ 0x2c
2002864e:	9b02      	ldr	r3, [sp, #8]
20028650:	eb03 0b8b 	add.w	fp, r3, fp, lsl #2
20028654:	a912      	add	r1, sp, #72	@ 0x48
20028656:	a80f      	add	r0, sp, #60	@ 0x3c
20028658:	e9cd 7610 	strd	r7, r6, [sp, #64]	@ 0x40
2002865c:	e9cd 8913 	strd	r8, r9, [sp, #76]	@ 0x4c
20028660:	f7ff fd84 	bl	2002816c <mbedtls_mpi_cmp_mpi>
20028664:	2800      	cmp	r0, #0
20028666:	da5a      	bge.n	2002871e <mbedtls_mpi_div_mpi+0x230>
20028668:	9901      	ldr	r1, [sp, #4]
2002866a:	a812      	add	r0, sp, #72	@ 0x48
2002866c:	f7ff fc9f 	bl	20027fae <mbedtls_mpi_shift_r>
20028670:	e9dd 8913 	ldrd	r8, r9, [sp, #76]	@ 0x4c
20028674:	2800      	cmp	r0, #0
20028676:	f47f af6e 	bne.w	20028556 <mbedtls_mpi_div_mpi+0x68>
2002867a:	f10a 33ff 	add.w	r3, sl, #4294967295
2002867e:	9301      	str	r3, [sp, #4]
20028680:	9b08      	ldr	r3, [sp, #32]
20028682:	9a02      	ldr	r2, [sp, #8]
20028684:	3b01      	subs	r3, #1
20028686:	9307      	str	r3, [sp, #28]
20028688:	eb09 0383 	add.w	r3, r9, r3, lsl #2
2002868c:	930a      	str	r3, [sp, #40]	@ 0x28
2002868e:	9b08      	ldr	r3, [sp, #32]
20028690:	f103 4380 	add.w	r3, r3, #1073741824	@ 0x40000000
20028694:	3b02      	subs	r3, #2
20028696:	eb09 0383 	add.w	r3, r9, r3, lsl #2
2002869a:	930c      	str	r3, [sp, #48]	@ 0x30
2002869c:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
2002869e:	4413      	add	r3, r2
200286a0:	469a      	mov	sl, r3
200286a2:	9b01      	ldr	r3, [sp, #4]
200286a4:	9a07      	ldr	r2, [sp, #28]
200286a6:	4293      	cmp	r3, r2
200286a8:	d862      	bhi.n	20028770 <mbedtls_mpi_div_mpi+0x282>
200286aa:	9b05      	ldr	r3, [sp, #20]
200286ac:	b16b      	cbz	r3, 200286ca <mbedtls_mpi_div_mpi+0x1dc>
200286ae:	4618      	mov	r0, r3
200286b0:	a915      	add	r1, sp, #84	@ 0x54
200286b2:	f7ff fb4b 	bl	20027d4c <mbedtls_mpi_copy>
200286b6:	2800      	cmp	r0, #0
200286b8:	f47f af4d 	bne.w	20028556 <mbedtls_mpi_div_mpi+0x68>
200286bc:	9b04      	ldr	r3, [sp, #16]
200286be:	9a09      	ldr	r2, [sp, #36]	@ 0x24
200286c0:	681b      	ldr	r3, [r3, #0]
200286c2:	6812      	ldr	r2, [r2, #0]
200286c4:	4353      	muls	r3, r2
200286c6:	9a05      	ldr	r2, [sp, #20]
200286c8:	6013      	str	r3, [r2, #0]
200286ca:	9b03      	ldr	r3, [sp, #12]
200286cc:	2b00      	cmp	r3, #0
200286ce:	f000 810d 	beq.w	200288ec <mbedtls_mpi_div_mpi+0x3fe>
200286d2:	9906      	ldr	r1, [sp, #24]
200286d4:	a80f      	add	r0, sp, #60	@ 0x3c
200286d6:	e9cd 7610 	strd	r7, r6, [sp, #64]	@ 0x40
200286da:	f7ff fc68 	bl	20027fae <mbedtls_mpi_shift_r>
200286de:	e9dd 7610 	ldrd	r7, r6, [sp, #64]	@ 0x40
200286e2:	2800      	cmp	r0, #0
200286e4:	f47f af37 	bne.w	20028556 <mbedtls_mpi_div_mpi+0x68>
200286e8:	9b04      	ldr	r3, [sp, #16]
200286ea:	a90f      	add	r1, sp, #60	@ 0x3c
200286ec:	681b      	ldr	r3, [r3, #0]
200286ee:	9803      	ldr	r0, [sp, #12]
200286f0:	930f      	str	r3, [sp, #60]	@ 0x3c
200286f2:	f7ff fb2b 	bl	20027d4c <mbedtls_mpi_copy>
200286f6:	4601      	mov	r1, r0
200286f8:	2800      	cmp	r0, #0
200286fa:	f47f af2c 	bne.w	20028556 <mbedtls_mpi_div_mpi+0x68>
200286fe:	9001      	str	r0, [sp, #4]
20028700:	9803      	ldr	r0, [sp, #12]
20028702:	f7ff fd74 	bl	200281ee <mbedtls_mpi_cmp_int>
20028706:	9901      	ldr	r1, [sp, #4]
20028708:	b9c0      	cbnz	r0, 2002873c <mbedtls_mpi_div_mpi+0x24e>
2002870a:	2301      	movs	r3, #1
2002870c:	9a03      	ldr	r2, [sp, #12]
2002870e:	6013      	str	r3, [r2, #0]
20028710:	e014      	b.n	2002873c <mbedtls_mpi_div_mpi+0x24e>
20028712:	46ba      	mov	sl, r7
20028714:	f8cd 8020 	str.w	r8, [sp, #32]
20028718:	f8cd b018 	str.w	fp, [sp, #24]
2002871c:	e785      	b.n	2002862a <mbedtls_mpi_div_mpi+0x13c>
2002871e:	f8db 2000 	ldr.w	r2, [fp]
20028722:	a90f      	add	r1, sp, #60	@ 0x3c
20028724:	3201      	adds	r2, #1
20028726:	4608      	mov	r0, r1
20028728:	f8cb 2000 	str.w	r2, [fp]
2002872c:	aa12      	add	r2, sp, #72	@ 0x48
2002872e:	f7ff fe30 	bl	20028392 <mbedtls_mpi_sub_mpi>
20028732:	e9dd 7610 	ldrd	r7, r6, [sp, #64]	@ 0x40
20028736:	4601      	mov	r1, r0
20028738:	2800      	cmp	r0, #0
2002873a:	d08b      	beq.n	20028654 <mbedtls_mpi_div_mpi+0x166>
2002873c:	a80f      	add	r0, sp, #60	@ 0x3c
2002873e:	9101      	str	r1, [sp, #4]
20028740:	e9cd 7610 	strd	r7, r6, [sp, #64]	@ 0x40
20028744:	f7ff fac1 	bl	20027cca <mbedtls_mpi_free>
20028748:	a812      	add	r0, sp, #72	@ 0x48
2002874a:	e9cd 8913 	strd	r8, r9, [sp, #76]	@ 0x4c
2002874e:	f7ff fabc 	bl	20027cca <mbedtls_mpi_free>
20028752:	9b02      	ldr	r3, [sp, #8]
20028754:	a815      	add	r0, sp, #84	@ 0x54
20028756:	9317      	str	r3, [sp, #92]	@ 0x5c
20028758:	f7ff fab7 	bl	20027cca <mbedtls_mpi_free>
2002875c:	a818      	add	r0, sp, #96	@ 0x60
2002875e:	951a      	str	r5, [sp, #104]	@ 0x68
20028760:	f7ff fab3 	bl	20027cca <mbedtls_mpi_free>
20028764:	a81b      	add	r0, sp, #108	@ 0x6c
20028766:	941d      	str	r4, [sp, #116]	@ 0x74
20028768:	f7ff faaf 	bl	20027cca <mbedtls_mpi_free>
2002876c:	9901      	ldr	r1, [sp, #4]
2002876e:	e6e1      	b.n	20028534 <mbedtls_mpi_div_mpi+0x46>
20028770:	9b01      	ldr	r3, [sp, #4]
20028772:	ea4f 0b83 	mov.w	fp, r3, lsl #2
20028776:	eb06 0383 	add.w	r3, r6, r3, lsl #2
2002877a:	930b      	str	r3, [sp, #44]	@ 0x2c
2002877c:	9b01      	ldr	r3, [sp, #4]
2002877e:	f1ab 0004 	sub.w	r0, fp, #4
20028782:	f856 1023 	ldr.w	r1, [r6, r3, lsl #2]
20028786:	9b0a      	ldr	r3, [sp, #40]	@ 0x28
20028788:	681a      	ldr	r2, [r3, #0]
2002878a:	1833      	adds	r3, r6, r0
2002878c:	4291      	cmp	r1, r2
2002878e:	930d      	str	r3, [sp, #52]	@ 0x34
20028790:	d255      	bcs.n	2002883e <mbedtls_mpi_div_mpi+0x350>
20028792:	2300      	movs	r3, #0
20028794:	5830      	ldr	r0, [r6, r0]
20028796:	f001 fd87 	bl	2002a2a8 <__aeabi_uldivmod>
2002879a:	2900      	cmp	r1, #0
2002879c:	bf14      	ite	ne
2002879e:	f04f 33ff 	movne.w	r3, #4294967295
200287a2:	4603      	moveq	r3, r0
200287a4:	3301      	adds	r3, #1
200287a6:	f1ab 0b08 	sub.w	fp, fp, #8
200287aa:	f84a 3c04 	str.w	r3, [sl, #-4]
200287ae:	44b3      	add	fp, r6
200287b0:	f85a 3c04 	ldr.w	r3, [sl, #-4]
200287b4:	2100      	movs	r1, #0
200287b6:	3b01      	subs	r3, #1
200287b8:	f84a 3c04 	str.w	r3, [sl, #-4]
200287bc:	a818      	add	r0, sp, #96	@ 0x60
200287be:	951a      	str	r5, [sp, #104]	@ 0x68
200287c0:	f7ff faed 	bl	20027d9e <mbedtls_mpi_lset>
200287c4:	9d1a      	ldr	r5, [sp, #104]	@ 0x68
200287c6:	2800      	cmp	r0, #0
200287c8:	f47f aec5 	bne.w	20028556 <mbedtls_mpi_div_mpi+0x68>
200287cc:	9b07      	ldr	r3, [sp, #28]
200287ce:	2b00      	cmp	r3, #0
200287d0:	d038      	beq.n	20028844 <mbedtls_mpi_div_mpi+0x356>
200287d2:	9b0c      	ldr	r3, [sp, #48]	@ 0x30
200287d4:	681b      	ldr	r3, [r3, #0]
200287d6:	602b      	str	r3, [r5, #0]
200287d8:	9b0a      	ldr	r3, [sp, #40]	@ 0x28
200287da:	a918      	add	r1, sp, #96	@ 0x60
200287dc:	681b      	ldr	r3, [r3, #0]
200287de:	4608      	mov	r0, r1
200287e0:	606b      	str	r3, [r5, #4]
200287e2:	f85a 2c04 	ldr.w	r2, [sl, #-4]
200287e6:	f7ff fe75 	bl	200284d4 <mbedtls_mpi_mul_int>
200287ea:	9d1a      	ldr	r5, [sp, #104]	@ 0x68
200287ec:	4601      	mov	r1, r0
200287ee:	2800      	cmp	r0, #0
200287f0:	f47f aeb1 	bne.w	20028556 <mbedtls_mpi_div_mpi+0x68>
200287f4:	a81b      	add	r0, sp, #108	@ 0x6c
200287f6:	941d      	str	r4, [sp, #116]	@ 0x74
200287f8:	f7ff fad1 	bl	20027d9e <mbedtls_mpi_lset>
200287fc:	9c1d      	ldr	r4, [sp, #116]	@ 0x74
200287fe:	2800      	cmp	r0, #0
20028800:	f47f aea9 	bne.w	20028556 <mbedtls_mpi_div_mpi+0x68>
20028804:	9b01      	ldr	r3, [sp, #4]
20028806:	a91b      	add	r1, sp, #108	@ 0x6c
20028808:	2b01      	cmp	r3, #1
2002880a:	bf18      	it	ne
2002880c:	f8db 0000 	ldrne.w	r0, [fp]
20028810:	9b0d      	ldr	r3, [sp, #52]	@ 0x34
20028812:	6020      	str	r0, [r4, #0]
20028814:	681b      	ldr	r3, [r3, #0]
20028816:	a818      	add	r0, sp, #96	@ 0x60
20028818:	6063      	str	r3, [r4, #4]
2002881a:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
2002881c:	681b      	ldr	r3, [r3, #0]
2002881e:	60a3      	str	r3, [r4, #8]
20028820:	f7ff fca4 	bl	2002816c <mbedtls_mpi_cmp_mpi>
20028824:	2800      	cmp	r0, #0
20028826:	dcc3      	bgt.n	200287b0 <mbedtls_mpi_div_mpi+0x2c2>
20028828:	f85a 2c04 	ldr.w	r2, [sl, #-4]
2002882c:	a912      	add	r1, sp, #72	@ 0x48
2002882e:	a818      	add	r0, sp, #96	@ 0x60
20028830:	e9cd 8913 	strd	r8, r9, [sp, #76]	@ 0x4c
20028834:	f7ff fe4e 	bl	200284d4 <mbedtls_mpi_mul_int>
20028838:	b130      	cbz	r0, 20028848 <mbedtls_mpi_div_mpi+0x35a>
2002883a:	9d1a      	ldr	r5, [sp, #104]	@ 0x68
2002883c:	e68b      	b.n	20028556 <mbedtls_mpi_div_mpi+0x68>
2002883e:	f04f 33ff 	mov.w	r3, #4294967295
20028842:	e7af      	b.n	200287a4 <mbedtls_mpi_div_mpi+0x2b6>
20028844:	9b07      	ldr	r3, [sp, #28]
20028846:	e7c6      	b.n	200287d6 <mbedtls_mpi_div_mpi+0x2e8>
20028848:	f06f 0b1f 	mvn.w	fp, #31
2002884c:	9b08      	ldr	r3, [sp, #32]
2002884e:	a818      	add	r0, sp, #96	@ 0x60
20028850:	fb0b fb03 	mul.w	fp, fp, r3
20028854:	9b01      	ldr	r3, [sp, #4]
20028856:	eb0b 1b43 	add.w	fp, fp, r3, lsl #5
2002885a:	4659      	mov	r1, fp
2002885c:	f7ff fb4e 	bl	20027efc <mbedtls_mpi_shift_l>
20028860:	9d1a      	ldr	r5, [sp, #104]	@ 0x68
20028862:	2800      	cmp	r0, #0
20028864:	f47f ae77 	bne.w	20028556 <mbedtls_mpi_div_mpi+0x68>
20028868:	a90f      	add	r1, sp, #60	@ 0x3c
2002886a:	4608      	mov	r0, r1
2002886c:	aa18      	add	r2, sp, #96	@ 0x60
2002886e:	e9cd 7610 	strd	r7, r6, [sp, #64]	@ 0x40
20028872:	f7ff fd8e 	bl	20028392 <mbedtls_mpi_sub_mpi>
20028876:	e9dd 7610 	ldrd	r7, r6, [sp, #64]	@ 0x40
2002887a:	4601      	mov	r1, r0
2002887c:	2800      	cmp	r0, #0
2002887e:	f47f af5d 	bne.w	2002873c <mbedtls_mpi_div_mpi+0x24e>
20028882:	a80f      	add	r0, sp, #60	@ 0x3c
20028884:	f7ff fcb3 	bl	200281ee <mbedtls_mpi_cmp_int>
20028888:	2800      	cmp	r0, #0
2002888a:	da1d      	bge.n	200288c8 <mbedtls_mpi_div_mpi+0x3da>
2002888c:	a912      	add	r1, sp, #72	@ 0x48
2002888e:	a818      	add	r0, sp, #96	@ 0x60
20028890:	f7ff fa5c 	bl	20027d4c <mbedtls_mpi_copy>
20028894:	2800      	cmp	r0, #0
20028896:	d1d0      	bne.n	2002883a <mbedtls_mpi_div_mpi+0x34c>
20028898:	4659      	mov	r1, fp
2002889a:	a818      	add	r0, sp, #96	@ 0x60
2002889c:	f7ff fb2e 	bl	20027efc <mbedtls_mpi_shift_l>
200288a0:	9d1a      	ldr	r5, [sp, #104]	@ 0x68
200288a2:	2800      	cmp	r0, #0
200288a4:	f47f ae57 	bne.w	20028556 <mbedtls_mpi_div_mpi+0x68>
200288a8:	a90f      	add	r1, sp, #60	@ 0x3c
200288aa:	4608      	mov	r0, r1
200288ac:	aa18      	add	r2, sp, #96	@ 0x60
200288ae:	f7ff fd4a 	bl	20028346 <mbedtls_mpi_add_mpi>
200288b2:	e9dd 7610 	ldrd	r7, r6, [sp, #64]	@ 0x40
200288b6:	4601      	mov	r1, r0
200288b8:	2800      	cmp	r0, #0
200288ba:	f47f af3f 	bne.w	2002873c <mbedtls_mpi_div_mpi+0x24e>
200288be:	f85a 3c04 	ldr.w	r3, [sl, #-4]
200288c2:	3b01      	subs	r3, #1
200288c4:	f84a 3c04 	str.w	r3, [sl, #-4]
200288c8:	9b01      	ldr	r3, [sp, #4]
200288ca:	f1aa 0a04 	sub.w	sl, sl, #4
200288ce:	3b01      	subs	r3, #1
200288d0:	9301      	str	r3, [sp, #4]
200288d2:	e6e6      	b.n	200286a2 <mbedtls_mpi_div_mpi+0x1b4>
200288d4:	4625      	mov	r5, r4
200288d6:	46a1      	mov	r9, r4
200288d8:	46a0      	mov	r8, r4
200288da:	9402      	str	r4, [sp, #8]
200288dc:	e63b      	b.n	20028556 <mbedtls_mpi_div_mpi+0x68>
200288de:	4654      	mov	r4, sl
200288e0:	4655      	mov	r5, sl
200288e2:	f8cd a008 	str.w	sl, [sp, #8]
200288e6:	e636      	b.n	20028556 <mbedtls_mpi_div_mpi+0x68>
200288e8:	462c      	mov	r4, r5
200288ea:	e663      	b.n	200285b4 <mbedtls_mpi_div_mpi+0xc6>
200288ec:	9903      	ldr	r1, [sp, #12]
200288ee:	e725      	b.n	2002873c <mbedtls_mpi_div_mpi+0x24e>
200288f0:	f06f 010b 	mvn.w	r1, #11
200288f4:	e61e      	b.n	20028534 <mbedtls_mpi_div_mpi+0x46>

200288f6 <mbedtls_mpi_mod_mpi>:
200288f6:	b570      	push	{r4, r5, r6, lr}
200288f8:	4604      	mov	r4, r0
200288fa:	460d      	mov	r5, r1
200288fc:	4610      	mov	r0, r2
200288fe:	2100      	movs	r1, #0
20028900:	4616      	mov	r6, r2
20028902:	f7ff fc74 	bl	200281ee <mbedtls_mpi_cmp_int>
20028906:	2800      	cmp	r0, #0
20028908:	db24      	blt.n	20028954 <mbedtls_mpi_mod_mpi+0x5e>
2002890a:	462a      	mov	r2, r5
2002890c:	4633      	mov	r3, r6
2002890e:	4621      	mov	r1, r4
20028910:	2000      	movs	r0, #0
20028912:	f7ff fdec 	bl	200284ee <mbedtls_mpi_div_mpi>
20028916:	4605      	mov	r5, r0
20028918:	b138      	cbz	r0, 2002892a <mbedtls_mpi_mod_mpi+0x34>
2002891a:	4628      	mov	r0, r5
2002891c:	bd70      	pop	{r4, r5, r6, pc}
2002891e:	4632      	mov	r2, r6
20028920:	4621      	mov	r1, r4
20028922:	4620      	mov	r0, r4
20028924:	f7ff fd0f 	bl	20028346 <mbedtls_mpi_add_mpi>
20028928:	b990      	cbnz	r0, 20028950 <mbedtls_mpi_mod_mpi+0x5a>
2002892a:	2100      	movs	r1, #0
2002892c:	4620      	mov	r0, r4
2002892e:	f7ff fc5e 	bl	200281ee <mbedtls_mpi_cmp_int>
20028932:	2800      	cmp	r0, #0
20028934:	dbf3      	blt.n	2002891e <mbedtls_mpi_mod_mpi+0x28>
20028936:	4631      	mov	r1, r6
20028938:	4620      	mov	r0, r4
2002893a:	f7ff fc17 	bl	2002816c <mbedtls_mpi_cmp_mpi>
2002893e:	2800      	cmp	r0, #0
20028940:	dbeb      	blt.n	2002891a <mbedtls_mpi_mod_mpi+0x24>
20028942:	4632      	mov	r2, r6
20028944:	4621      	mov	r1, r4
20028946:	4620      	mov	r0, r4
20028948:	f7ff fd23 	bl	20028392 <mbedtls_mpi_sub_mpi>
2002894c:	2800      	cmp	r0, #0
2002894e:	d0f2      	beq.n	20028936 <mbedtls_mpi_mod_mpi+0x40>
20028950:	4605      	mov	r5, r0
20028952:	e7e2      	b.n	2002891a <mbedtls_mpi_mod_mpi+0x24>
20028954:	f06f 0509 	mvn.w	r5, #9
20028958:	e7df      	b.n	2002891a <mbedtls_mpi_mod_mpi+0x24>

2002895a <mbedtls_mpi_exp_mod>:
2002895a:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
2002895e:	4605      	mov	r5, r0
20028960:	f2ad 6d54 	subw	sp, sp, #1620	@ 0x654
20028964:	4688      	mov	r8, r1
20028966:	4618      	mov	r0, r3
20028968:	2100      	movs	r1, #0
2002896a:	461c      	mov	r4, r3
2002896c:	9203      	str	r2, [sp, #12]
2002896e:	f7ff fc3e 	bl	200281ee <mbedtls_mpi_cmp_int>
20028972:	2800      	cmp	r0, #0
20028974:	f2c0 8202 	blt.w	20028d7c <mbedtls_mpi_exp_mod+0x422>
20028978:	68a3      	ldr	r3, [r4, #8]
2002897a:	681f      	ldr	r7, [r3, #0]
2002897c:	f017 0301 	ands.w	r3, r7, #1
20028980:	9305      	str	r3, [sp, #20]
20028982:	f000 81fb 	beq.w	20028d7c <mbedtls_mpi_exp_mod+0x422>
20028986:	2100      	movs	r1, #0
20028988:	9803      	ldr	r0, [sp, #12]
2002898a:	f7ff fc30 	bl	200281ee <mbedtls_mpi_cmp_int>
2002898e:	2800      	cmp	r0, #0
20028990:	f2c0 81f4 	blt.w	20028d7c <mbedtls_mpi_exp_mod+0x422>
20028994:	2100      	movs	r1, #0
20028996:	2301      	movs	r3, #1
20028998:	f44f 62c0 	mov.w	r2, #1536	@ 0x600
2002899c:	a814      	add	r0, sp, #80	@ 0x50
2002899e:	e9cd 3108 	strd	r3, r1, [sp, #32]
200289a2:	e9cd 130a 	strd	r1, r3, [sp, #40]	@ 0x28
200289a6:	e9cd 110c 	strd	r1, r1, [sp, #48]	@ 0x30
200289aa:	e9cd 310e 	strd	r3, r1, [sp, #56]	@ 0x38
200289ae:	9110      	str	r1, [sp, #64]	@ 0x40
200289b0:	f001 ff1c 	bl	2002a7ec <memset>
200289b4:	9803      	ldr	r0, [sp, #12]
200289b6:	f7ff fa26 	bl	20027e06 <mbedtls_mpi_bitlen>
200289ba:	f5b0 7f28 	cmp.w	r0, #672	@ 0x2a0
200289be:	d233      	bcs.n	20028a28 <mbedtls_mpi_exp_mod+0xce>
200289c0:	28ef      	cmp	r0, #239	@ 0xef
200289c2:	d833      	bhi.n	20028a2c <mbedtls_mpi_exp_mod+0xd2>
200289c4:	284f      	cmp	r0, #79	@ 0x4f
200289c6:	d833      	bhi.n	20028a30 <mbedtls_mpi_exp_mod+0xd6>
200289c8:	9b05      	ldr	r3, [sp, #20]
200289ca:	2818      	cmp	r0, #24
200289cc:	bf34      	ite	cc
200289ce:	461e      	movcc	r6, r3
200289d0:	2603      	movcs	r6, #3
200289d2:	6863      	ldr	r3, [r4, #4]
200289d4:	4628      	mov	r0, r5
200289d6:	f103 0901 	add.w	r9, r3, #1
200289da:	4649      	mov	r1, r9
200289dc:	f7ff f98a 	bl	20027cf4 <mbedtls_mpi_grow>
200289e0:	b340      	cbz	r0, 20028a34 <mbedtls_mpi_exp_mod+0xda>
200289e2:	f06f 090f 	mvn.w	r9, #15
200289e6:	2301      	movs	r3, #1
200289e8:	1e74      	subs	r4, r6, #1
200289ea:	fa03 f506 	lsl.w	r5, r3, r6
200289ee:	260c      	movs	r6, #12
200289f0:	fa03 f404 	lsl.w	r4, r3, r4
200289f4:	af14      	add	r7, sp, #80	@ 0x50
200289f6:	42a5      	cmp	r5, r4
200289f8:	f200 81ba 	bhi.w	20028d70 <mbedtls_mpi_exp_mod+0x416>
200289fc:	a817      	add	r0, sp, #92	@ 0x5c
200289fe:	f7ff f964 	bl	20027cca <mbedtls_mpi_free>
20028a02:	a80b      	add	r0, sp, #44	@ 0x2c
20028a04:	f7ff f961 	bl	20027cca <mbedtls_mpi_free>
20028a08:	a80e      	add	r0, sp, #56	@ 0x38
20028a0a:	f7ff f95e 	bl	20027cca <mbedtls_mpi_free>
20028a0e:	f8dd 3678 	ldr.w	r3, [sp, #1656]	@ 0x678
20028a12:	b10b      	cbz	r3, 20028a18 <mbedtls_mpi_exp_mod+0xbe>
20028a14:	689b      	ldr	r3, [r3, #8]
20028a16:	b913      	cbnz	r3, 20028a1e <mbedtls_mpi_exp_mod+0xc4>
20028a18:	a808      	add	r0, sp, #32
20028a1a:	f7ff f956 	bl	20027cca <mbedtls_mpi_free>
20028a1e:	4648      	mov	r0, r9
20028a20:	f20d 6d54 	addw	sp, sp, #1620	@ 0x654
20028a24:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
20028a28:	2606      	movs	r6, #6
20028a2a:	e7d2      	b.n	200289d2 <mbedtls_mpi_exp_mod+0x78>
20028a2c:	2605      	movs	r6, #5
20028a2e:	e7d0      	b.n	200289d2 <mbedtls_mpi_exp_mod+0x78>
20028a30:	2604      	movs	r6, #4
20028a32:	e7ce      	b.n	200289d2 <mbedtls_mpi_exp_mod+0x78>
20028a34:	4649      	mov	r1, r9
20028a36:	a817      	add	r0, sp, #92	@ 0x5c
20028a38:	f7ff f95c 	bl	20027cf4 <mbedtls_mpi_grow>
20028a3c:	2800      	cmp	r0, #0
20028a3e:	d1d0      	bne.n	200289e2 <mbedtls_mpi_exp_mod+0x88>
20028a40:	ea4f 0149 	mov.w	r1, r9, lsl #1
20028a44:	a80b      	add	r0, sp, #44	@ 0x2c
20028a46:	f7ff f955 	bl	20027cf4 <mbedtls_mpi_grow>
20028a4a:	2800      	cmp	r0, #0
20028a4c:	d1c9      	bne.n	200289e2 <mbedtls_mpi_exp_mod+0x88>
20028a4e:	f8d8 3000 	ldr.w	r3, [r8]
20028a52:	9304      	str	r3, [sp, #16]
20028a54:	3301      	adds	r3, #1
20028a56:	d109      	bne.n	20028a6c <mbedtls_mpi_exp_mod+0x112>
20028a58:	4641      	mov	r1, r8
20028a5a:	a80e      	add	r0, sp, #56	@ 0x38
20028a5c:	f7ff f976 	bl	20027d4c <mbedtls_mpi_copy>
20028a60:	2800      	cmp	r0, #0
20028a62:	d1be      	bne.n	200289e2 <mbedtls_mpi_exp_mod+0x88>
20028a64:	2301      	movs	r3, #1
20028a66:	f10d 0838 	add.w	r8, sp, #56	@ 0x38
20028a6a:	930e      	str	r3, [sp, #56]	@ 0x38
20028a6c:	f8dd 3678 	ldr.w	r3, [sp, #1656]	@ 0x678
20028a70:	b11b      	cbz	r3, 20028a7a <mbedtls_mpi_exp_mod+0x120>
20028a72:	689b      	ldr	r3, [r3, #8]
20028a74:	2b00      	cmp	r3, #0
20028a76:	f040 80ab 	bne.w	20028bd0 <mbedtls_mpi_exp_mod+0x276>
20028a7a:	2101      	movs	r1, #1
20028a7c:	a808      	add	r0, sp, #32
20028a7e:	f7ff f98e 	bl	20027d9e <mbedtls_mpi_lset>
20028a82:	2800      	cmp	r0, #0
20028a84:	d1ad      	bne.n	200289e2 <mbedtls_mpi_exp_mod+0x88>
20028a86:	6861      	ldr	r1, [r4, #4]
20028a88:	a808      	add	r0, sp, #32
20028a8a:	0189      	lsls	r1, r1, #6
20028a8c:	f7ff fa36 	bl	20027efc <mbedtls_mpi_shift_l>
20028a90:	2800      	cmp	r0, #0
20028a92:	d1a6      	bne.n	200289e2 <mbedtls_mpi_exp_mod+0x88>
20028a94:	a908      	add	r1, sp, #32
20028a96:	4622      	mov	r2, r4
20028a98:	4608      	mov	r0, r1
20028a9a:	f7ff ff2c 	bl	200288f6 <mbedtls_mpi_mod_mpi>
20028a9e:	4681      	mov	r9, r0
20028aa0:	2800      	cmp	r0, #0
20028aa2:	d1a0      	bne.n	200289e6 <mbedtls_mpi_exp_mod+0x8c>
20028aa4:	f8dd 3678 	ldr.w	r3, [sp, #1656]	@ 0x678
20028aa8:	b13b      	cbz	r3, 20028aba <mbedtls_mpi_exp_mod+0x160>
20028aaa:	f8dd 2678 	ldr.w	r2, [sp, #1656]	@ 0x678
20028aae:	ab08      	add	r3, sp, #32
20028ab0:	cb03      	ldmia	r3!, {r0, r1}
20028ab2:	6010      	str	r0, [r2, #0]
20028ab4:	6818      	ldr	r0, [r3, #0]
20028ab6:	6051      	str	r1, [r2, #4]
20028ab8:	6090      	str	r0, [r2, #8]
20028aba:	4621      	mov	r1, r4
20028abc:	4640      	mov	r0, r8
20028abe:	f7ff fb55 	bl	2002816c <mbedtls_mpi_cmp_mpi>
20028ac2:	2800      	cmp	r0, #0
20028ac4:	f2c0 808d 	blt.w	20028be2 <mbedtls_mpi_exp_mod+0x288>
20028ac8:	4622      	mov	r2, r4
20028aca:	4641      	mov	r1, r8
20028acc:	a817      	add	r0, sp, #92	@ 0x5c
20028ace:	f7ff ff12 	bl	200288f6 <mbedtls_mpi_mod_mpi>
20028ad2:	4681      	mov	r9, r0
20028ad4:	2800      	cmp	r0, #0
20028ad6:	d186      	bne.n	200289e6 <mbedtls_mpi_exp_mod+0x8c>
20028ad8:	1cba      	adds	r2, r7, #2
20028ada:	0052      	lsls	r2, r2, #1
20028adc:	f002 0208 	and.w	r2, r2, #8
20028ae0:	443a      	add	r2, r7
20028ae2:	fb02 f307 	mul.w	r3, r2, r7
20028ae6:	f1c3 0302 	rsb	r3, r3, #2
20028aea:	4353      	muls	r3, r2
20028aec:	fb03 f207 	mul.w	r2, r3, r7
20028af0:	f1c2 0202 	rsb	r2, r2, #2
20028af4:	4353      	muls	r3, r2
20028af6:	435f      	muls	r7, r3
20028af8:	3f02      	subs	r7, #2
20028afa:	437b      	muls	r3, r7
20028afc:	f10d 0b2c 	add.w	fp, sp, #44	@ 0x2c
20028b00:	4622      	mov	r2, r4
20028b02:	f8cd b000 	str.w	fp, [sp]
20028b06:	a908      	add	r1, sp, #32
20028b08:	a817      	add	r0, sp, #92	@ 0x5c
20028b0a:	9302      	str	r3, [sp, #8]
20028b0c:	f7ff fac4 	bl	20028098 <mpi_montmul>
20028b10:	2800      	cmp	r0, #0
20028b12:	f040 80e4 	bne.w	20028cde <mbedtls_mpi_exp_mod+0x384>
20028b16:	4628      	mov	r0, r5
20028b18:	a908      	add	r1, sp, #32
20028b1a:	f7ff f917 	bl	20027d4c <mbedtls_mpi_copy>
20028b1e:	2800      	cmp	r0, #0
20028b20:	f47f af5f 	bne.w	200289e2 <mbedtls_mpi_exp_mod+0x88>
20028b24:	2301      	movs	r3, #1
20028b26:	aa07      	add	r2, sp, #28
20028b28:	e9cd 3311 	strd	r3, r3, [sp, #68]	@ 0x44
20028b2c:	9307      	str	r3, [sp, #28]
20028b2e:	9213      	str	r2, [sp, #76]	@ 0x4c
20028b30:	4628      	mov	r0, r5
20028b32:	4622      	mov	r2, r4
20028b34:	9b02      	ldr	r3, [sp, #8]
20028b36:	f8cd b000 	str.w	fp, [sp]
20028b3a:	a911      	add	r1, sp, #68	@ 0x44
20028b3c:	f7ff faac 	bl	20028098 <mpi_montmul>
20028b40:	2800      	cmp	r0, #0
20028b42:	f040 80cc 	bne.w	20028cde <mbedtls_mpi_exp_mod+0x384>
20028b46:	2e01      	cmp	r6, #1
20028b48:	d153      	bne.n	20028bf2 <mbedtls_mpi_exp_mod+0x298>
20028b4a:	f04f 0900 	mov.w	r9, #0
20028b4e:	464f      	mov	r7, r9
20028b50:	46ca      	mov	sl, r9
20028b52:	46c8      	mov	r8, r9
20028b54:	9b03      	ldr	r3, [sp, #12]
20028b56:	f8d3 b004 	ldr.w	fp, [r3, #4]
20028b5a:	f1ba 0f00 	cmp.w	sl, #0
20028b5e:	f040 80a1 	bne.w	20028ca4 <mbedtls_mpi_exp_mod+0x34a>
20028b62:	f1bb 0f00 	cmp.w	fp, #0
20028b66:	f040 8099 	bne.w	20028c9c <mbedtls_mpi_exp_mod+0x342>
20028b6a:	f04f 0a01 	mov.w	sl, #1
20028b6e:	f10d 092c 	add.w	r9, sp, #44	@ 0x2c
20028b72:	fa0a fa06 	lsl.w	sl, sl, r6
20028b76:	45bb      	cmp	fp, r7
20028b78:	f040 80dd 	bne.w	20028d36 <mbedtls_mpi_exp_mod+0x3dc>
20028b7c:	2301      	movs	r3, #1
20028b7e:	aa07      	add	r2, sp, #28
20028b80:	e9cd 3311 	strd	r3, r3, [sp, #68]	@ 0x44
20028b84:	9307      	str	r3, [sp, #28]
20028b86:	9213      	str	r2, [sp, #76]	@ 0x4c
20028b88:	f8cd 9000 	str.w	r9, [sp]
20028b8c:	4622      	mov	r2, r4
20028b8e:	4628      	mov	r0, r5
20028b90:	9b02      	ldr	r3, [sp, #8]
20028b92:	a911      	add	r1, sp, #68	@ 0x44
20028b94:	f7ff fa80 	bl	20028098 <mpi_montmul>
20028b98:	4681      	mov	r9, r0
20028b9a:	2800      	cmp	r0, #0
20028b9c:	f040 809f 	bne.w	20028cde <mbedtls_mpi_exp_mod+0x384>
20028ba0:	9b04      	ldr	r3, [sp, #16]
20028ba2:	3301      	adds	r3, #1
20028ba4:	f47f af1f 	bne.w	200289e6 <mbedtls_mpi_exp_mod+0x8c>
20028ba8:	9b03      	ldr	r3, [sp, #12]
20028baa:	685b      	ldr	r3, [r3, #4]
20028bac:	2b00      	cmp	r3, #0
20028bae:	f43f af1a 	beq.w	200289e6 <mbedtls_mpi_exp_mod+0x8c>
20028bb2:	9b03      	ldr	r3, [sp, #12]
20028bb4:	689b      	ldr	r3, [r3, #8]
20028bb6:	681b      	ldr	r3, [r3, #0]
20028bb8:	07db      	lsls	r3, r3, #31
20028bba:	f57f af14 	bpl.w	200289e6 <mbedtls_mpi_exp_mod+0x8c>
20028bbe:	9b04      	ldr	r3, [sp, #16]
20028bc0:	462a      	mov	r2, r5
20028bc2:	4621      	mov	r1, r4
20028bc4:	4628      	mov	r0, r5
20028bc6:	602b      	str	r3, [r5, #0]
20028bc8:	f7ff fbbd 	bl	20028346 <mbedtls_mpi_add_mpi>
20028bcc:	4681      	mov	r9, r0
20028bce:	e70a      	b.n	200289e6 <mbedtls_mpi_exp_mod+0x8c>
20028bd0:	f8dd 2678 	ldr.w	r2, [sp, #1656]	@ 0x678
20028bd4:	ab08      	add	r3, sp, #32
20028bd6:	6810      	ldr	r0, [r2, #0]
20028bd8:	6851      	ldr	r1, [r2, #4]
20028bda:	c303      	stmia	r3!, {r0, r1}
20028bdc:	6890      	ldr	r0, [r2, #8]
20028bde:	6018      	str	r0, [r3, #0]
20028be0:	e76b      	b.n	20028aba <mbedtls_mpi_exp_mod+0x160>
20028be2:	4641      	mov	r1, r8
20028be4:	a817      	add	r0, sp, #92	@ 0x5c
20028be6:	f7ff f8b1 	bl	20027d4c <mbedtls_mpi_copy>
20028bea:	2800      	cmp	r0, #0
20028bec:	f43f af74 	beq.w	20028ad8 <mbedtls_mpi_exp_mod+0x17e>
20028bf0:	e6f7      	b.n	200289e2 <mbedtls_mpi_exp_mod+0x88>
20028bf2:	f04f 0a0c 	mov.w	sl, #12
20028bf6:	1e77      	subs	r7, r6, #1
20028bf8:	6861      	ldr	r1, [r4, #4]
20028bfa:	fa0a fa07 	lsl.w	sl, sl, r7
20028bfe:	f10d 0950 	add.w	r9, sp, #80	@ 0x50
20028c02:	44d1      	add	r9, sl
20028c04:	4648      	mov	r0, r9
20028c06:	3101      	adds	r1, #1
20028c08:	f7ff f874 	bl	20027cf4 <mbedtls_mpi_grow>
20028c0c:	2800      	cmp	r0, #0
20028c0e:	f47f aee8 	bne.w	200289e2 <mbedtls_mpi_exp_mod+0x88>
20028c12:	4648      	mov	r0, r9
20028c14:	a917      	add	r1, sp, #92	@ 0x5c
20028c16:	f7ff f899 	bl	20027d4c <mbedtls_mpi_copy>
20028c1a:	2800      	cmp	r0, #0
20028c1c:	f47f aee1 	bne.w	200289e2 <mbedtls_mpi_exp_mod+0x88>
20028c20:	4680      	mov	r8, r0
20028c22:	4622      	mov	r2, r4
20028c24:	4649      	mov	r1, r9
20028c26:	4648      	mov	r0, r9
20028c28:	9b02      	ldr	r3, [sp, #8]
20028c2a:	f8cd b000 	str.w	fp, [sp]
20028c2e:	f7ff fa33 	bl	20028098 <mpi_montmul>
20028c32:	2800      	cmp	r0, #0
20028c34:	d153      	bne.n	20028cde <mbedtls_mpi_exp_mod+0x384>
20028c36:	f108 0801 	add.w	r8, r8, #1
20028c3a:	45b8      	cmp	r8, r7
20028c3c:	d3f1      	bcc.n	20028c22 <mbedtls_mpi_exp_mod+0x2c8>
20028c3e:	f04f 0801 	mov.w	r8, #1
20028c42:	f10d 0b50 	add.w	fp, sp, #80	@ 0x50
20028c46:	fa08 f707 	lsl.w	r7, r8, r7
20028c4a:	4447      	add	r7, r8
20028c4c:	44d3      	add	fp, sl
20028c4e:	fa08 f806 	lsl.w	r8, r8, r6
20028c52:	f10d 0a2c 	add.w	sl, sp, #44	@ 0x2c
20028c56:	45b8      	cmp	r8, r7
20028c58:	f67f af77 	bls.w	20028b4a <mbedtls_mpi_exp_mod+0x1f0>
20028c5c:	6861      	ldr	r1, [r4, #4]
20028c5e:	f10b 090c 	add.w	r9, fp, #12
20028c62:	4648      	mov	r0, r9
20028c64:	3101      	adds	r1, #1
20028c66:	f7ff f845 	bl	20027cf4 <mbedtls_mpi_grow>
20028c6a:	2800      	cmp	r0, #0
20028c6c:	f47f aeb9 	bne.w	200289e2 <mbedtls_mpi_exp_mod+0x88>
20028c70:	4659      	mov	r1, fp
20028c72:	4648      	mov	r0, r9
20028c74:	f7ff f86a 	bl	20027d4c <mbedtls_mpi_copy>
20028c78:	2800      	cmp	r0, #0
20028c7a:	f47f aeb2 	bne.w	200289e2 <mbedtls_mpi_exp_mod+0x88>
20028c7e:	4622      	mov	r2, r4
20028c80:	4648      	mov	r0, r9
20028c82:	9b02      	ldr	r3, [sp, #8]
20028c84:	f8cd a000 	str.w	sl, [sp]
20028c88:	a917      	add	r1, sp, #92	@ 0x5c
20028c8a:	f7ff fa05 	bl	20028098 <mpi_montmul>
20028c8e:	bb30      	cbnz	r0, 20028cde <mbedtls_mpi_exp_mod+0x384>
20028c90:	46cb      	mov	fp, r9
20028c92:	3701      	adds	r7, #1
20028c94:	e7df      	b.n	20028c56 <mbedtls_mpi_exp_mod+0x2fc>
20028c96:	f04f 0902 	mov.w	r9, #2
20028c9a:	e75e      	b.n	20028b5a <mbedtls_mpi_exp_mod+0x200>
20028c9c:	f04f 0a20 	mov.w	sl, #32
20028ca0:	f10b 3bff 	add.w	fp, fp, #4294967295
20028ca4:	9b03      	ldr	r3, [sp, #12]
20028ca6:	f10a 3aff 	add.w	sl, sl, #4294967295
20028caa:	689b      	ldr	r3, [r3, #8]
20028cac:	f853 302b 	ldr.w	r3, [r3, fp, lsl #2]
20028cb0:	fa23 f30a 	lsr.w	r3, r3, sl
20028cb4:	f013 0301 	ands.w	r3, r3, #1
20028cb8:	d114      	bne.n	20028ce4 <mbedtls_mpi_exp_mod+0x38a>
20028cba:	f1b9 0f00 	cmp.w	r9, #0
20028cbe:	f43f af4c 	beq.w	20028b5a <mbedtls_mpi_exp_mod+0x200>
20028cc2:	f1b9 0f01 	cmp.w	r9, #1
20028cc6:	d10d      	bne.n	20028ce4 <mbedtls_mpi_exp_mod+0x38a>
20028cc8:	ab0b      	add	r3, sp, #44	@ 0x2c
20028cca:	9300      	str	r3, [sp, #0]
20028ccc:	4622      	mov	r2, r4
20028cce:	4629      	mov	r1, r5
20028cd0:	4628      	mov	r0, r5
20028cd2:	9b02      	ldr	r3, [sp, #8]
20028cd4:	f7ff f9e0 	bl	20028098 <mpi_montmul>
20028cd8:	2800      	cmp	r0, #0
20028cda:	f43f af3e 	beq.w	20028b5a <mbedtls_mpi_exp_mod+0x200>
20028cde:	f06f 0903 	mvn.w	r9, #3
20028ce2:	e680      	b.n	200289e6 <mbedtls_mpi_exp_mod+0x8c>
20028ce4:	3701      	adds	r7, #1
20028ce6:	1bf2      	subs	r2, r6, r7
20028ce8:	4093      	lsls	r3, r2
20028cea:	42be      	cmp	r6, r7
20028cec:	ea48 0803 	orr.w	r8, r8, r3
20028cf0:	d1d1      	bne.n	20028c96 <mbedtls_mpi_exp_mod+0x33c>
20028cf2:	f04f 0900 	mov.w	r9, #0
20028cf6:	ab0b      	add	r3, sp, #44	@ 0x2c
20028cf8:	9300      	str	r3, [sp, #0]
20028cfa:	4622      	mov	r2, r4
20028cfc:	4629      	mov	r1, r5
20028cfe:	4628      	mov	r0, r5
20028d00:	9b02      	ldr	r3, [sp, #8]
20028d02:	f7ff f9c9 	bl	20028098 <mpi_montmul>
20028d06:	2800      	cmp	r0, #0
20028d08:	d1e9      	bne.n	20028cde <mbedtls_mpi_exp_mod+0x384>
20028d0a:	f109 0901 	add.w	r9, r9, #1
20028d0e:	454f      	cmp	r7, r9
20028d10:	d8f1      	bhi.n	20028cf6 <mbedtls_mpi_exp_mod+0x39c>
20028d12:	200c      	movs	r0, #12
20028d14:	ab0b      	add	r3, sp, #44	@ 0x2c
20028d16:	a914      	add	r1, sp, #80	@ 0x50
20028d18:	fb00 1108 	mla	r1, r0, r8, r1
20028d1c:	9300      	str	r3, [sp, #0]
20028d1e:	4622      	mov	r2, r4
20028d20:	4628      	mov	r0, r5
20028d22:	9b02      	ldr	r3, [sp, #8]
20028d24:	f7ff f9b8 	bl	20028098 <mpi_montmul>
20028d28:	4607      	mov	r7, r0
20028d2a:	2800      	cmp	r0, #0
20028d2c:	d1d7      	bne.n	20028cde <mbedtls_mpi_exp_mod+0x384>
20028d2e:	4680      	mov	r8, r0
20028d30:	f8dd 9014 	ldr.w	r9, [sp, #20]
20028d34:	e711      	b.n	20028b5a <mbedtls_mpi_exp_mod+0x200>
20028d36:	4622      	mov	r2, r4
20028d38:	4629      	mov	r1, r5
20028d3a:	4628      	mov	r0, r5
20028d3c:	9b02      	ldr	r3, [sp, #8]
20028d3e:	f8cd 9000 	str.w	r9, [sp]
20028d42:	f7ff f9a9 	bl	20028098 <mpi_montmul>
20028d46:	2800      	cmp	r0, #0
20028d48:	d1c9      	bne.n	20028cde <mbedtls_mpi_exp_mod+0x384>
20028d4a:	ea4f 0848 	mov.w	r8, r8, lsl #1
20028d4e:	ea18 0f0a 	tst.w	r8, sl
20028d52:	d102      	bne.n	20028d5a <mbedtls_mpi_exp_mod+0x400>
20028d54:	f10b 0b01 	add.w	fp, fp, #1
20028d58:	e70d      	b.n	20028b76 <mbedtls_mpi_exp_mod+0x21c>
20028d5a:	4622      	mov	r2, r4
20028d5c:	4628      	mov	r0, r5
20028d5e:	9b02      	ldr	r3, [sp, #8]
20028d60:	f8cd 9000 	str.w	r9, [sp]
20028d64:	a917      	add	r1, sp, #92	@ 0x5c
20028d66:	f7ff f997 	bl	20028098 <mpi_montmul>
20028d6a:	2800      	cmp	r0, #0
20028d6c:	d0f2      	beq.n	20028d54 <mbedtls_mpi_exp_mod+0x3fa>
20028d6e:	e7b6      	b.n	20028cde <mbedtls_mpi_exp_mod+0x384>
20028d70:	fb06 7004 	mla	r0, r6, r4, r7
20028d74:	f7fe ffa9 	bl	20027cca <mbedtls_mpi_free>
20028d78:	3401      	adds	r4, #1
20028d7a:	e63c      	b.n	200289f6 <mbedtls_mpi_exp_mod+0x9c>
20028d7c:	f06f 0903 	mvn.w	r9, #3
20028d80:	e64d      	b.n	20028a1e <mbedtls_mpi_exp_mod+0xc4>

20028d82 <mbedtls_mpi_gcd>:
20028d82:	b570      	push	{r4, r5, r6, lr}
20028d84:	2300      	movs	r3, #0
20028d86:	2401      	movs	r4, #1
20028d88:	b086      	sub	sp, #24
20028d8a:	4606      	mov	r6, r0
20028d8c:	4668      	mov	r0, sp
20028d8e:	4615      	mov	r5, r2
20028d90:	e9cd 4300 	strd	r4, r3, [sp]
20028d94:	e9cd 3402 	strd	r3, r4, [sp, #8]
20028d98:	e9cd 3304 	strd	r3, r3, [sp, #16]
20028d9c:	f7fe ffd6 	bl	20027d4c <mbedtls_mpi_copy>
20028da0:	b150      	cbz	r0, 20028db8 <mbedtls_mpi_gcd+0x36>
20028da2:	f06f 040f 	mvn.w	r4, #15
20028da6:	4668      	mov	r0, sp
20028da8:	f7fe ff8f 	bl	20027cca <mbedtls_mpi_free>
20028dac:	a803      	add	r0, sp, #12
20028dae:	f7fe ff8c 	bl	20027cca <mbedtls_mpi_free>
20028db2:	4620      	mov	r0, r4
20028db4:	b006      	add	sp, #24
20028db6:	bd70      	pop	{r4, r5, r6, pc}
20028db8:	4629      	mov	r1, r5
20028dba:	a803      	add	r0, sp, #12
20028dbc:	f7fe ffc6 	bl	20027d4c <mbedtls_mpi_copy>
20028dc0:	2800      	cmp	r0, #0
20028dc2:	d1ee      	bne.n	20028da2 <mbedtls_mpi_gcd+0x20>
20028dc4:	4668      	mov	r0, sp
20028dc6:	f7ff f806 	bl	20027dd6 <mbedtls_mpi_lsb>
20028dca:	4605      	mov	r5, r0
20028dcc:	a803      	add	r0, sp, #12
20028dce:	f7ff f802 	bl	20027dd6 <mbedtls_mpi_lsb>
20028dd2:	4285      	cmp	r5, r0
20028dd4:	bf28      	it	cs
20028dd6:	4605      	movcs	r5, r0
20028dd8:	4668      	mov	r0, sp
20028dda:	4629      	mov	r1, r5
20028ddc:	f7ff f8e7 	bl	20027fae <mbedtls_mpi_shift_r>
20028de0:	2800      	cmp	r0, #0
20028de2:	d1de      	bne.n	20028da2 <mbedtls_mpi_gcd+0x20>
20028de4:	4629      	mov	r1, r5
20028de6:	a803      	add	r0, sp, #12
20028de8:	f7ff f8e1 	bl	20027fae <mbedtls_mpi_shift_r>
20028dec:	2800      	cmp	r0, #0
20028dee:	d1d8      	bne.n	20028da2 <mbedtls_mpi_gcd+0x20>
20028df0:	9403      	str	r4, [sp, #12]
20028df2:	9400      	str	r4, [sp, #0]
20028df4:	2100      	movs	r1, #0
20028df6:	4668      	mov	r0, sp
20028df8:	f7ff f9f9 	bl	200281ee <mbedtls_mpi_cmp_int>
20028dfc:	b968      	cbnz	r0, 20028e1a <mbedtls_mpi_gcd+0x98>
20028dfe:	4629      	mov	r1, r5
20028e00:	a803      	add	r0, sp, #12
20028e02:	f7ff f87b 	bl	20027efc <mbedtls_mpi_shift_l>
20028e06:	2800      	cmp	r0, #0
20028e08:	d1cb      	bne.n	20028da2 <mbedtls_mpi_gcd+0x20>
20028e0a:	4630      	mov	r0, r6
20028e0c:	a903      	add	r1, sp, #12
20028e0e:	f7fe ff9d 	bl	20027d4c <mbedtls_mpi_copy>
20028e12:	4604      	mov	r4, r0
20028e14:	2800      	cmp	r0, #0
20028e16:	d0c6      	beq.n	20028da6 <mbedtls_mpi_gcd+0x24>
20028e18:	e7c3      	b.n	20028da2 <mbedtls_mpi_gcd+0x20>
20028e1a:	4668      	mov	r0, sp
20028e1c:	f7fe ffdb 	bl	20027dd6 <mbedtls_mpi_lsb>
20028e20:	4601      	mov	r1, r0
20028e22:	4668      	mov	r0, sp
20028e24:	f7ff f8c3 	bl	20027fae <mbedtls_mpi_shift_r>
20028e28:	2800      	cmp	r0, #0
20028e2a:	d1ba      	bne.n	20028da2 <mbedtls_mpi_gcd+0x20>
20028e2c:	a803      	add	r0, sp, #12
20028e2e:	f7fe ffd2 	bl	20027dd6 <mbedtls_mpi_lsb>
20028e32:	4601      	mov	r1, r0
20028e34:	a803      	add	r0, sp, #12
20028e36:	f7ff f8ba 	bl	20027fae <mbedtls_mpi_shift_r>
20028e3a:	2800      	cmp	r0, #0
20028e3c:	d1b1      	bne.n	20028da2 <mbedtls_mpi_gcd+0x20>
20028e3e:	4668      	mov	r0, sp
20028e40:	a903      	add	r1, sp, #12
20028e42:	f7ff f993 	bl	2002816c <mbedtls_mpi_cmp_mpi>
20028e46:	2800      	cmp	r0, #0
20028e48:	db0e      	blt.n	20028e68 <mbedtls_mpi_gcd+0xe6>
20028e4a:	4669      	mov	r1, sp
20028e4c:	4668      	mov	r0, sp
20028e4e:	aa03      	add	r2, sp, #12
20028e50:	f7ff fa3c 	bl	200282cc <mbedtls_mpi_sub_abs>
20028e54:	4604      	mov	r4, r0
20028e56:	2800      	cmp	r0, #0
20028e58:	d1a5      	bne.n	20028da6 <mbedtls_mpi_gcd+0x24>
20028e5a:	2101      	movs	r1, #1
20028e5c:	4668      	mov	r0, sp
20028e5e:	f7ff f8a6 	bl	20027fae <mbedtls_mpi_shift_r>
20028e62:	2800      	cmp	r0, #0
20028e64:	d0c6      	beq.n	20028df4 <mbedtls_mpi_gcd+0x72>
20028e66:	e79c      	b.n	20028da2 <mbedtls_mpi_gcd+0x20>
20028e68:	a903      	add	r1, sp, #12
20028e6a:	466a      	mov	r2, sp
20028e6c:	4608      	mov	r0, r1
20028e6e:	f7ff fa2d 	bl	200282cc <mbedtls_mpi_sub_abs>
20028e72:	4604      	mov	r4, r0
20028e74:	2800      	cmp	r0, #0
20028e76:	d196      	bne.n	20028da6 <mbedtls_mpi_gcd+0x24>
20028e78:	2101      	movs	r1, #1
20028e7a:	a803      	add	r0, sp, #12
20028e7c:	e7ef      	b.n	20028e5e <mbedtls_mpi_gcd+0xdc>

20028e7e <mbedtls_mpi_fill_random>:
20028e7e:	b570      	push	{r4, r5, r6, lr}
20028e80:	f5b1 6f80 	cmp.w	r1, #1024	@ 0x400
20028e84:	4605      	mov	r5, r0
20028e86:	460c      	mov	r4, r1
20028e88:	4616      	mov	r6, r2
20028e8a:	4618      	mov	r0, r3
20028e8c:	f5ad 6d80 	sub.w	sp, sp, #1024	@ 0x400
20028e90:	d80f      	bhi.n	20028eb2 <mbedtls_mpi_fill_random+0x34>
20028e92:	460a      	mov	r2, r1
20028e94:	4669      	mov	r1, sp
20028e96:	47b0      	blx	r6
20028e98:	b940      	cbnz	r0, 20028eac <mbedtls_mpi_fill_random+0x2e>
20028e9a:	4622      	mov	r2, r4
20028e9c:	4669      	mov	r1, sp
20028e9e:	4628      	mov	r0, r5
20028ea0:	f7fe ffd4 	bl	20027e4c <mbedtls_mpi_read_binary>
20028ea4:	2800      	cmp	r0, #0
20028ea6:	bf18      	it	ne
20028ea8:	f06f 000f 	mvnne.w	r0, #15
20028eac:	f50d 6d80 	add.w	sp, sp, #1024	@ 0x400
20028eb0:	bd70      	pop	{r4, r5, r6, pc}
20028eb2:	f06f 0003 	mvn.w	r0, #3
20028eb6:	e7f9      	b.n	20028eac <mbedtls_mpi_fill_random+0x2e>

20028eb8 <mbedtls_mpi_inv_mod>:
20028eb8:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20028ebc:	b09f      	sub	sp, #124	@ 0x7c
20028ebe:	9001      	str	r0, [sp, #4]
20028ec0:	460f      	mov	r7, r1
20028ec2:	4610      	mov	r0, r2
20028ec4:	2101      	movs	r1, #1
20028ec6:	4692      	mov	sl, r2
20028ec8:	f7ff f991 	bl	200281ee <mbedtls_mpi_cmp_int>
20028ecc:	2800      	cmp	r0, #0
20028ece:	f340 81b5 	ble.w	2002923c <mbedtls_mpi_inv_mod+0x384>
20028ed2:	2500      	movs	r5, #0
20028ed4:	2601      	movs	r6, #1
20028ed6:	4652      	mov	r2, sl
20028ed8:	4639      	mov	r1, r7
20028eda:	a803      	add	r0, sp, #12
20028edc:	e9cd 6506 	strd	r6, r5, [sp, #24]
20028ee0:	e9cd 5608 	strd	r5, r6, [sp, #32]
20028ee4:	e9cd 650c 	strd	r6, r5, [sp, #48]	@ 0x30
20028ee8:	e9cd 650f 	strd	r6, r5, [sp, #60]	@ 0x3c
20028eec:	e9cd 6503 	strd	r6, r5, [sp, #12]
20028ef0:	e9cd 6512 	strd	r6, r5, [sp, #72]	@ 0x48
20028ef4:	e9cd 5614 	strd	r5, r6, [sp, #80]	@ 0x50
20028ef8:	e9cd 6518 	strd	r6, r5, [sp, #96]	@ 0x60
20028efc:	e9cd 651b 	strd	r6, r5, [sp, #108]	@ 0x6c
20028f00:	950a      	str	r5, [sp, #40]	@ 0x28
20028f02:	9505      	str	r5, [sp, #20]
20028f04:	9516      	str	r5, [sp, #88]	@ 0x58
20028f06:	f7ff ff3c 	bl	20028d82 <mbedtls_mpi_gcd>
20028f0a:	4604      	mov	r4, r0
20028f0c:	2800      	cmp	r0, #0
20028f0e:	f040 8182 	bne.w	20029216 <mbedtls_mpi_inv_mod+0x35e>
20028f12:	4631      	mov	r1, r6
20028f14:	a803      	add	r0, sp, #12
20028f16:	f7ff f96a 	bl	200281ee <mbedtls_mpi_cmp_int>
20028f1a:	4605      	mov	r5, r0
20028f1c:	2800      	cmp	r0, #0
20028f1e:	f040 8171 	bne.w	20029204 <mbedtls_mpi_inv_mod+0x34c>
20028f22:	4652      	mov	r2, sl
20028f24:	4639      	mov	r1, r7
20028f26:	a806      	add	r0, sp, #24
20028f28:	f7ff fce5 	bl	200288f6 <mbedtls_mpi_mod_mpi>
20028f2c:	4604      	mov	r4, r0
20028f2e:	2800      	cmp	r0, #0
20028f30:	f040 8171 	bne.w	20029216 <mbedtls_mpi_inv_mod+0x35e>
20028f34:	900b      	str	r0, [sp, #44]	@ 0x2c
20028f36:	a906      	add	r1, sp, #24
20028f38:	a809      	add	r0, sp, #36	@ 0x24
20028f3a:	f7fe ff07 	bl	20027d4c <mbedtls_mpi_copy>
20028f3e:	f8dd 902c 	ldr.w	r9, [sp, #44]	@ 0x2c
20028f42:	b920      	cbnz	r0, 20028f4e <mbedtls_mpi_inv_mod+0x96>
20028f44:	4651      	mov	r1, sl
20028f46:	a812      	add	r0, sp, #72	@ 0x48
20028f48:	f7fe ff00 	bl	20027d4c <mbedtls_mpi_copy>
20028f4c:	b130      	cbz	r0, 20028f5c <mbedtls_mpi_inv_mod+0xa4>
20028f4e:	f04f 0b00 	mov.w	fp, #0
20028f52:	465d      	mov	r5, fp
20028f54:	46d8      	mov	r8, fp
20028f56:	465e      	mov	r6, fp
20028f58:	465f      	mov	r7, fp
20028f5a:	e0f5      	b.n	20029148 <mbedtls_mpi_inv_mod+0x290>
20028f5c:	9017      	str	r0, [sp, #92]	@ 0x5c
20028f5e:	4651      	mov	r1, sl
20028f60:	a815      	add	r0, sp, #84	@ 0x54
20028f62:	f7fe fef3 	bl	20027d4c <mbedtls_mpi_copy>
20028f66:	f8dd 805c 	ldr.w	r8, [sp, #92]	@ 0x5c
20028f6a:	2800      	cmp	r0, #0
20028f6c:	f040 8159 	bne.w	20029222 <mbedtls_mpi_inv_mod+0x36a>
20028f70:	4631      	mov	r1, r6
20028f72:	900e      	str	r0, [sp, #56]	@ 0x38
20028f74:	a80c      	add	r0, sp, #48	@ 0x30
20028f76:	f7fe ff12 	bl	20027d9e <mbedtls_mpi_lset>
20028f7a:	9f0e      	ldr	r7, [sp, #56]	@ 0x38
20028f7c:	4601      	mov	r1, r0
20028f7e:	2800      	cmp	r0, #0
20028f80:	f040 8152 	bne.w	20029228 <mbedtls_mpi_inv_mod+0x370>
20028f84:	9011      	str	r0, [sp, #68]	@ 0x44
20028f86:	a80f      	add	r0, sp, #60	@ 0x3c
20028f88:	f7fe ff09 	bl	20027d9e <mbedtls_mpi_lset>
20028f8c:	9e11      	ldr	r6, [sp, #68]	@ 0x44
20028f8e:	4683      	mov	fp, r0
20028f90:	2800      	cmp	r0, #0
20028f92:	f040 814d 	bne.w	20029230 <mbedtls_mpi_inv_mod+0x378>
20028f96:	4601      	mov	r1, r0
20028f98:	901a      	str	r0, [sp, #104]	@ 0x68
20028f9a:	a818      	add	r0, sp, #96	@ 0x60
20028f9c:	f7fe feff 	bl	20027d9e <mbedtls_mpi_lset>
20028fa0:	9d1a      	ldr	r5, [sp, #104]	@ 0x68
20028fa2:	2800      	cmp	r0, #0
20028fa4:	f040 8147 	bne.w	20029236 <mbedtls_mpi_inv_mod+0x37e>
20028fa8:	2101      	movs	r1, #1
20028faa:	a81b      	add	r0, sp, #108	@ 0x6c
20028fac:	f8cd b074 	str.w	fp, [sp, #116]	@ 0x74
20028fb0:	f7fe fef5 	bl	20027d9e <mbedtls_mpi_lset>
20028fb4:	f8dd b074 	ldr.w	fp, [sp, #116]	@ 0x74
20028fb8:	2800      	cmp	r0, #0
20028fba:	f040 80c5 	bne.w	20029148 <mbedtls_mpi_inv_mod+0x290>
20028fbe:	f8d9 2000 	ldr.w	r2, [r9]
20028fc2:	07d0      	lsls	r0, r2, #31
20028fc4:	d554      	bpl.n	20029070 <mbedtls_mpi_inv_mod+0x1b8>
20028fc6:	f8d8 2000 	ldr.w	r2, [r8]
20028fca:	07d3      	lsls	r3, r2, #31
20028fcc:	f140 8083 	bpl.w	200290d6 <mbedtls_mpi_inv_mod+0x21e>
20028fd0:	a915      	add	r1, sp, #84	@ 0x54
20028fd2:	a809      	add	r0, sp, #36	@ 0x24
20028fd4:	f8cd 902c 	str.w	r9, [sp, #44]	@ 0x2c
20028fd8:	f8cd 805c 	str.w	r8, [sp, #92]	@ 0x5c
20028fdc:	f7ff f8c6 	bl	2002816c <mbedtls_mpi_cmp_mpi>
20028fe0:	2800      	cmp	r0, #0
20028fe2:	f2c0 80b4 	blt.w	2002914e <mbedtls_mpi_inv_mod+0x296>
20028fe6:	a909      	add	r1, sp, #36	@ 0x24
20028fe8:	4608      	mov	r0, r1
20028fea:	aa15      	add	r2, sp, #84	@ 0x54
20028fec:	f7ff f9d1 	bl	20028392 <mbedtls_mpi_sub_mpi>
20028ff0:	f8dd 902c 	ldr.w	r9, [sp, #44]	@ 0x2c
20028ff4:	4604      	mov	r4, r0
20028ff6:	2800      	cmp	r0, #0
20028ff8:	f040 80d1 	bne.w	2002919e <mbedtls_mpi_inv_mod+0x2e6>
20028ffc:	a90c      	add	r1, sp, #48	@ 0x30
20028ffe:	4608      	mov	r0, r1
20029000:	aa18      	add	r2, sp, #96	@ 0x60
20029002:	970e      	str	r7, [sp, #56]	@ 0x38
20029004:	951a      	str	r5, [sp, #104]	@ 0x68
20029006:	f7ff f9c4 	bl	20028392 <mbedtls_mpi_sub_mpi>
2002900a:	9f0e      	ldr	r7, [sp, #56]	@ 0x38
2002900c:	4604      	mov	r4, r0
2002900e:	2800      	cmp	r0, #0
20029010:	f040 80c5 	bne.w	2002919e <mbedtls_mpi_inv_mod+0x2e6>
20029014:	a90f      	add	r1, sp, #60	@ 0x3c
20029016:	4608      	mov	r0, r1
20029018:	aa1b      	add	r2, sp, #108	@ 0x6c
2002901a:	9611      	str	r6, [sp, #68]	@ 0x44
2002901c:	f8cd b074 	str.w	fp, [sp, #116]	@ 0x74
20029020:	f7ff f9b7 	bl	20028392 <mbedtls_mpi_sub_mpi>
20029024:	9e11      	ldr	r6, [sp, #68]	@ 0x44
20029026:	4604      	mov	r4, r0
20029028:	2800      	cmp	r0, #0
2002902a:	f040 80b8 	bne.w	2002919e <mbedtls_mpi_inv_mod+0x2e6>
2002902e:	2100      	movs	r1, #0
20029030:	a809      	add	r0, sp, #36	@ 0x24
20029032:	f8cd 902c 	str.w	r9, [sp, #44]	@ 0x2c
20029036:	f7ff f8da 	bl	200281ee <mbedtls_mpi_cmp_int>
2002903a:	2800      	cmp	r0, #0
2002903c:	d1bf      	bne.n	20028fbe <mbedtls_mpi_inv_mod+0x106>
2002903e:	2100      	movs	r1, #0
20029040:	a818      	add	r0, sp, #96	@ 0x60
20029042:	951a      	str	r5, [sp, #104]	@ 0x68
20029044:	f7ff f8d3 	bl	200281ee <mbedtls_mpi_cmp_int>
20029048:	2800      	cmp	r0, #0
2002904a:	f2c0 809e 	blt.w	2002918a <mbedtls_mpi_inv_mod+0x2d2>
2002904e:	4651      	mov	r1, sl
20029050:	a818      	add	r0, sp, #96	@ 0x60
20029052:	951a      	str	r5, [sp, #104]	@ 0x68
20029054:	f7ff f88a 	bl	2002816c <mbedtls_mpi_cmp_mpi>
20029058:	2800      	cmp	r0, #0
2002905a:	f280 80c8 	bge.w	200291ee <mbedtls_mpi_inv_mod+0x336>
2002905e:	9801      	ldr	r0, [sp, #4]
20029060:	a918      	add	r1, sp, #96	@ 0x60
20029062:	f7fe fe73 	bl	20027d4c <mbedtls_mpi_copy>
20029066:	1e04      	subs	r4, r0, #0
20029068:	bf18      	it	ne
2002906a:	f06f 040f 	mvnne.w	r4, #15
2002906e:	e096      	b.n	2002919e <mbedtls_mpi_inv_mod+0x2e6>
20029070:	2101      	movs	r1, #1
20029072:	a809      	add	r0, sp, #36	@ 0x24
20029074:	f8cd 902c 	str.w	r9, [sp, #44]	@ 0x2c
20029078:	f7fe ff99 	bl	20027fae <mbedtls_mpi_shift_r>
2002907c:	f8dd 902c 	ldr.w	r9, [sp, #44]	@ 0x2c
20029080:	2800      	cmp	r0, #0
20029082:	d161      	bne.n	20029148 <mbedtls_mpi_inv_mod+0x290>
20029084:	683a      	ldr	r2, [r7, #0]
20029086:	07d3      	lsls	r3, r2, #31
20029088:	d402      	bmi.n	20029090 <mbedtls_mpi_inv_mod+0x1d8>
2002908a:	6832      	ldr	r2, [r6, #0]
2002908c:	07d4      	lsls	r4, r2, #31
2002908e:	d513      	bpl.n	200290b8 <mbedtls_mpi_inv_mod+0x200>
20029090:	a90c      	add	r1, sp, #48	@ 0x30
20029092:	4608      	mov	r0, r1
20029094:	aa12      	add	r2, sp, #72	@ 0x48
20029096:	970e      	str	r7, [sp, #56]	@ 0x38
20029098:	f7ff f955 	bl	20028346 <mbedtls_mpi_add_mpi>
2002909c:	9f0e      	ldr	r7, [sp, #56]	@ 0x38
2002909e:	4604      	mov	r4, r0
200290a0:	2800      	cmp	r0, #0
200290a2:	d17c      	bne.n	2002919e <mbedtls_mpi_inv_mod+0x2e6>
200290a4:	a90f      	add	r1, sp, #60	@ 0x3c
200290a6:	4608      	mov	r0, r1
200290a8:	aa06      	add	r2, sp, #24
200290aa:	9611      	str	r6, [sp, #68]	@ 0x44
200290ac:	f7ff f971 	bl	20028392 <mbedtls_mpi_sub_mpi>
200290b0:	9e11      	ldr	r6, [sp, #68]	@ 0x44
200290b2:	4604      	mov	r4, r0
200290b4:	2800      	cmp	r0, #0
200290b6:	d172      	bne.n	2002919e <mbedtls_mpi_inv_mod+0x2e6>
200290b8:	2101      	movs	r1, #1
200290ba:	a80c      	add	r0, sp, #48	@ 0x30
200290bc:	970e      	str	r7, [sp, #56]	@ 0x38
200290be:	f7fe ff76 	bl	20027fae <mbedtls_mpi_shift_r>
200290c2:	9f0e      	ldr	r7, [sp, #56]	@ 0x38
200290c4:	2800      	cmp	r0, #0
200290c6:	d13f      	bne.n	20029148 <mbedtls_mpi_inv_mod+0x290>
200290c8:	2101      	movs	r1, #1
200290ca:	a80f      	add	r0, sp, #60	@ 0x3c
200290cc:	9611      	str	r6, [sp, #68]	@ 0x44
200290ce:	f7fe ff6e 	bl	20027fae <mbedtls_mpi_shift_r>
200290d2:	9e11      	ldr	r6, [sp, #68]	@ 0x44
200290d4:	e770      	b.n	20028fb8 <mbedtls_mpi_inv_mod+0x100>
200290d6:	2101      	movs	r1, #1
200290d8:	a815      	add	r0, sp, #84	@ 0x54
200290da:	f8cd 805c 	str.w	r8, [sp, #92]	@ 0x5c
200290de:	f7fe ff66 	bl	20027fae <mbedtls_mpi_shift_r>
200290e2:	f8dd 805c 	ldr.w	r8, [sp, #92]	@ 0x5c
200290e6:	2800      	cmp	r0, #0
200290e8:	d12e      	bne.n	20029148 <mbedtls_mpi_inv_mod+0x290>
200290ea:	682a      	ldr	r2, [r5, #0]
200290ec:	07d1      	lsls	r1, r2, #31
200290ee:	d403      	bmi.n	200290f8 <mbedtls_mpi_inv_mod+0x240>
200290f0:	f8db 2000 	ldr.w	r2, [fp]
200290f4:	07d2      	lsls	r2, r2, #31
200290f6:	d515      	bpl.n	20029124 <mbedtls_mpi_inv_mod+0x26c>
200290f8:	a918      	add	r1, sp, #96	@ 0x60
200290fa:	4608      	mov	r0, r1
200290fc:	aa12      	add	r2, sp, #72	@ 0x48
200290fe:	951a      	str	r5, [sp, #104]	@ 0x68
20029100:	f7ff f921 	bl	20028346 <mbedtls_mpi_add_mpi>
20029104:	9d1a      	ldr	r5, [sp, #104]	@ 0x68
20029106:	4604      	mov	r4, r0
20029108:	2800      	cmp	r0, #0
2002910a:	d148      	bne.n	2002919e <mbedtls_mpi_inv_mod+0x2e6>
2002910c:	a91b      	add	r1, sp, #108	@ 0x6c
2002910e:	4608      	mov	r0, r1
20029110:	aa06      	add	r2, sp, #24
20029112:	f8cd b074 	str.w	fp, [sp, #116]	@ 0x74
20029116:	f7ff f93c 	bl	20028392 <mbedtls_mpi_sub_mpi>
2002911a:	f8dd b074 	ldr.w	fp, [sp, #116]	@ 0x74
2002911e:	4604      	mov	r4, r0
20029120:	2800      	cmp	r0, #0
20029122:	d13c      	bne.n	2002919e <mbedtls_mpi_inv_mod+0x2e6>
20029124:	2101      	movs	r1, #1
20029126:	a818      	add	r0, sp, #96	@ 0x60
20029128:	951a      	str	r5, [sp, #104]	@ 0x68
2002912a:	f7fe ff40 	bl	20027fae <mbedtls_mpi_shift_r>
2002912e:	9d1a      	ldr	r5, [sp, #104]	@ 0x68
20029130:	b950      	cbnz	r0, 20029148 <mbedtls_mpi_inv_mod+0x290>
20029132:	2101      	movs	r1, #1
20029134:	a81b      	add	r0, sp, #108	@ 0x6c
20029136:	f8cd b074 	str.w	fp, [sp, #116]	@ 0x74
2002913a:	f7fe ff38 	bl	20027fae <mbedtls_mpi_shift_r>
2002913e:	f8dd b074 	ldr.w	fp, [sp, #116]	@ 0x74
20029142:	2800      	cmp	r0, #0
20029144:	f43f af3f 	beq.w	20028fc6 <mbedtls_mpi_inv_mod+0x10e>
20029148:	f06f 040f 	mvn.w	r4, #15
2002914c:	e027      	b.n	2002919e <mbedtls_mpi_inv_mod+0x2e6>
2002914e:	a915      	add	r1, sp, #84	@ 0x54
20029150:	4608      	mov	r0, r1
20029152:	aa09      	add	r2, sp, #36	@ 0x24
20029154:	f7ff f91d 	bl	20028392 <mbedtls_mpi_sub_mpi>
20029158:	f8dd 805c 	ldr.w	r8, [sp, #92]	@ 0x5c
2002915c:	4604      	mov	r4, r0
2002915e:	b9f0      	cbnz	r0, 2002919e <mbedtls_mpi_inv_mod+0x2e6>
20029160:	a918      	add	r1, sp, #96	@ 0x60
20029162:	4608      	mov	r0, r1
20029164:	aa0c      	add	r2, sp, #48	@ 0x30
20029166:	951a      	str	r5, [sp, #104]	@ 0x68
20029168:	970e      	str	r7, [sp, #56]	@ 0x38
2002916a:	f7ff f912 	bl	20028392 <mbedtls_mpi_sub_mpi>
2002916e:	9d1a      	ldr	r5, [sp, #104]	@ 0x68
20029170:	4604      	mov	r4, r0
20029172:	b9a0      	cbnz	r0, 2002919e <mbedtls_mpi_inv_mod+0x2e6>
20029174:	a91b      	add	r1, sp, #108	@ 0x6c
20029176:	4608      	mov	r0, r1
20029178:	aa0f      	add	r2, sp, #60	@ 0x3c
2002917a:	f8cd b074 	str.w	fp, [sp, #116]	@ 0x74
2002917e:	9611      	str	r6, [sp, #68]	@ 0x44
20029180:	f7ff f907 	bl	20028392 <mbedtls_mpi_sub_mpi>
20029184:	f8dd b074 	ldr.w	fp, [sp, #116]	@ 0x74
20029188:	e74d      	b.n	20029026 <mbedtls_mpi_inv_mod+0x16e>
2002918a:	a918      	add	r1, sp, #96	@ 0x60
2002918c:	4652      	mov	r2, sl
2002918e:	4608      	mov	r0, r1
20029190:	f7ff f8d9 	bl	20028346 <mbedtls_mpi_add_mpi>
20029194:	9d1a      	ldr	r5, [sp, #104]	@ 0x68
20029196:	4604      	mov	r4, r0
20029198:	2800      	cmp	r0, #0
2002919a:	f43f af50 	beq.w	2002903e <mbedtls_mpi_inv_mod+0x186>
2002919e:	a806      	add	r0, sp, #24
200291a0:	f7fe fd93 	bl	20027cca <mbedtls_mpi_free>
200291a4:	a809      	add	r0, sp, #36	@ 0x24
200291a6:	f8cd 902c 	str.w	r9, [sp, #44]	@ 0x2c
200291aa:	f7fe fd8e 	bl	20027cca <mbedtls_mpi_free>
200291ae:	a80c      	add	r0, sp, #48	@ 0x30
200291b0:	970e      	str	r7, [sp, #56]	@ 0x38
200291b2:	f7fe fd8a 	bl	20027cca <mbedtls_mpi_free>
200291b6:	a80f      	add	r0, sp, #60	@ 0x3c
200291b8:	9611      	str	r6, [sp, #68]	@ 0x44
200291ba:	f7fe fd86 	bl	20027cca <mbedtls_mpi_free>
200291be:	a803      	add	r0, sp, #12
200291c0:	f7fe fd83 	bl	20027cca <mbedtls_mpi_free>
200291c4:	a812      	add	r0, sp, #72	@ 0x48
200291c6:	f7fe fd80 	bl	20027cca <mbedtls_mpi_free>
200291ca:	a815      	add	r0, sp, #84	@ 0x54
200291cc:	f8cd 805c 	str.w	r8, [sp, #92]	@ 0x5c
200291d0:	f7fe fd7b 	bl	20027cca <mbedtls_mpi_free>
200291d4:	a818      	add	r0, sp, #96	@ 0x60
200291d6:	951a      	str	r5, [sp, #104]	@ 0x68
200291d8:	f7fe fd77 	bl	20027cca <mbedtls_mpi_free>
200291dc:	a81b      	add	r0, sp, #108	@ 0x6c
200291de:	f8cd b074 	str.w	fp, [sp, #116]	@ 0x74
200291e2:	f7fe fd72 	bl	20027cca <mbedtls_mpi_free>
200291e6:	4620      	mov	r0, r4
200291e8:	b01f      	add	sp, #124	@ 0x7c
200291ea:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
200291ee:	a918      	add	r1, sp, #96	@ 0x60
200291f0:	4652      	mov	r2, sl
200291f2:	4608      	mov	r0, r1
200291f4:	f7ff f8cd 	bl	20028392 <mbedtls_mpi_sub_mpi>
200291f8:	9d1a      	ldr	r5, [sp, #104]	@ 0x68
200291fa:	4604      	mov	r4, r0
200291fc:	2800      	cmp	r0, #0
200291fe:	f43f af26 	beq.w	2002904e <mbedtls_mpi_inv_mod+0x196>
20029202:	e7cc      	b.n	2002919e <mbedtls_mpi_inv_mod+0x2e6>
20029204:	46a3      	mov	fp, r4
20029206:	4625      	mov	r5, r4
20029208:	46a0      	mov	r8, r4
2002920a:	4626      	mov	r6, r4
2002920c:	4627      	mov	r7, r4
2002920e:	46a1      	mov	r9, r4
20029210:	f06f 040d 	mvn.w	r4, #13
20029214:	e7c3      	b.n	2002919e <mbedtls_mpi_inv_mod+0x2e6>
20029216:	46ab      	mov	fp, r5
20029218:	46a8      	mov	r8, r5
2002921a:	462e      	mov	r6, r5
2002921c:	462f      	mov	r7, r5
2002921e:	46a9      	mov	r9, r5
20029220:	e7bd      	b.n	2002919e <mbedtls_mpi_inv_mod+0x2e6>
20029222:	46a3      	mov	fp, r4
20029224:	4625      	mov	r5, r4
20029226:	e696      	b.n	20028f56 <mbedtls_mpi_inv_mod+0x9e>
20029228:	46a3      	mov	fp, r4
2002922a:	4625      	mov	r5, r4
2002922c:	4626      	mov	r6, r4
2002922e:	e78b      	b.n	20029148 <mbedtls_mpi_inv_mod+0x290>
20029230:	46a3      	mov	fp, r4
20029232:	4625      	mov	r5, r4
20029234:	e788      	b.n	20029148 <mbedtls_mpi_inv_mod+0x290>
20029236:	f04f 0b00 	mov.w	fp, #0
2002923a:	e785      	b.n	20029148 <mbedtls_mpi_inv_mod+0x290>
2002923c:	f06f 0403 	mvn.w	r4, #3
20029240:	e7d1      	b.n	200291e6 <mbedtls_mpi_inv_mod+0x32e>
	...

20029244 <mbedtls_oid_get_pk_alg>:
20029244:	b570      	push	{r4, r5, r6, lr}
20029246:	460e      	mov	r6, r1
20029248:	4605      	mov	r5, r0
2002924a:	b110      	cbz	r0, 20029252 <mbedtls_oid_get_pk_alg+0xe>
2002924c:	4c09      	ldr	r4, [pc, #36]	@ (20029274 <mbedtls_oid_get_pk_alg+0x30>)
2002924e:	6820      	ldr	r0, [r4, #0]
20029250:	b910      	cbnz	r0, 20029258 <mbedtls_oid_get_pk_alg+0x14>
20029252:	f06f 002d 	mvn.w	r0, #45	@ 0x2d
20029256:	bd70      	pop	{r4, r5, r6, pc}
20029258:	686b      	ldr	r3, [r5, #4]
2002925a:	6862      	ldr	r2, [r4, #4]
2002925c:	429a      	cmp	r2, r3
2002925e:	d103      	bne.n	20029268 <mbedtls_oid_get_pk_alg+0x24>
20029260:	68a9      	ldr	r1, [r5, #8]
20029262:	f001 fab3 	bl	2002a7cc <memcmp>
20029266:	b108      	cbz	r0, 2002926c <mbedtls_oid_get_pk_alg+0x28>
20029268:	3414      	adds	r4, #20
2002926a:	e7f0      	b.n	2002924e <mbedtls_oid_get_pk_alg+0xa>
2002926c:	7c23      	ldrb	r3, [r4, #16]
2002926e:	7033      	strb	r3, [r6, #0]
20029270:	e7f1      	b.n	20029256 <mbedtls_oid_get_pk_alg+0x12>
20029272:	bf00      	nop
20029274:	2002c1dc 	.word	0x2002c1dc

20029278 <mbedtls_oid_get_md_alg>:
20029278:	b570      	push	{r4, r5, r6, lr}
2002927a:	460e      	mov	r6, r1
2002927c:	4605      	mov	r5, r0
2002927e:	b110      	cbz	r0, 20029286 <mbedtls_oid_get_md_alg+0xe>
20029280:	4c09      	ldr	r4, [pc, #36]	@ (200292a8 <mbedtls_oid_get_md_alg+0x30>)
20029282:	6820      	ldr	r0, [r4, #0]
20029284:	b910      	cbnz	r0, 2002928c <mbedtls_oid_get_md_alg+0x14>
20029286:	f06f 002d 	mvn.w	r0, #45	@ 0x2d
2002928a:	bd70      	pop	{r4, r5, r6, pc}
2002928c:	686b      	ldr	r3, [r5, #4]
2002928e:	6862      	ldr	r2, [r4, #4]
20029290:	429a      	cmp	r2, r3
20029292:	d103      	bne.n	2002929c <mbedtls_oid_get_md_alg+0x24>
20029294:	68a9      	ldr	r1, [r5, #8]
20029296:	f001 fa99 	bl	2002a7cc <memcmp>
2002929a:	b108      	cbz	r0, 200292a0 <mbedtls_oid_get_md_alg+0x28>
2002929c:	3414      	adds	r4, #20
2002929e:	e7f0      	b.n	20029282 <mbedtls_oid_get_md_alg+0xa>
200292a0:	7c23      	ldrb	r3, [r4, #16]
200292a2:	7033      	strb	r3, [r6, #0]
200292a4:	e7f1      	b.n	2002928a <mbedtls_oid_get_md_alg+0x12>
200292a6:	bf00      	nop
200292a8:	2002c178 	.word	0x2002c178

200292ac <mbedtls_oid_get_oid_by_md>:
200292ac:	b530      	push	{r4, r5, lr}
200292ae:	4b08      	ldr	r3, [pc, #32]	@ (200292d0 <mbedtls_oid_get_oid_by_md+0x24>)
200292b0:	681c      	ldr	r4, [r3, #0]
200292b2:	b914      	cbnz	r4, 200292ba <mbedtls_oid_get_oid_by_md+0xe>
200292b4:	f06f 002d 	mvn.w	r0, #45	@ 0x2d
200292b8:	e006      	b.n	200292c8 <mbedtls_oid_get_oid_by_md+0x1c>
200292ba:	7c1d      	ldrb	r5, [r3, #16]
200292bc:	4285      	cmp	r5, r0
200292be:	d104      	bne.n	200292ca <mbedtls_oid_get_oid_by_md+0x1e>
200292c0:	2000      	movs	r0, #0
200292c2:	600c      	str	r4, [r1, #0]
200292c4:	685b      	ldr	r3, [r3, #4]
200292c6:	6013      	str	r3, [r2, #0]
200292c8:	bd30      	pop	{r4, r5, pc}
200292ca:	3314      	adds	r3, #20
200292cc:	e7f0      	b.n	200292b0 <mbedtls_oid_get_oid_by_md+0x4>
200292ce:	bf00      	nop
200292d0:	2002c178 	.word	0x2002c178

200292d4 <mbedtls_pk_init>:
200292d4:	b110      	cbz	r0, 200292dc <mbedtls_pk_init+0x8>
200292d6:	2300      	movs	r3, #0
200292d8:	e9c0 3300 	strd	r3, r3, [r0]
200292dc:	4770      	bx	lr

200292de <mbedtls_pk_free>:
200292de:	b510      	push	{r4, lr}
200292e0:	4604      	mov	r4, r0
200292e2:	b160      	cbz	r0, 200292fe <mbedtls_pk_free+0x20>
200292e4:	6803      	ldr	r3, [r0, #0]
200292e6:	b153      	cbz	r3, 200292fe <mbedtls_pk_free+0x20>
200292e8:	6a9b      	ldr	r3, [r3, #40]	@ 0x28
200292ea:	6840      	ldr	r0, [r0, #4]
200292ec:	4798      	blx	r3
200292ee:	2100      	movs	r1, #0
200292f0:	f104 0308 	add.w	r3, r4, #8
200292f4:	4622      	mov	r2, r4
200292f6:	3401      	adds	r4, #1
200292f8:	429c      	cmp	r4, r3
200292fa:	7011      	strb	r1, [r2, #0]
200292fc:	d1fa      	bne.n	200292f4 <mbedtls_pk_free+0x16>
200292fe:	bd10      	pop	{r4, pc}

20029300 <mbedtls_pk_info_from_type>:
20029300:	2801      	cmp	r0, #1
20029302:	4802      	ldr	r0, [pc, #8]	@ (2002930c <mbedtls_pk_info_from_type+0xc>)
20029304:	bf18      	it	ne
20029306:	2000      	movne	r0, #0
20029308:	4770      	bx	lr
2002930a:	bf00      	nop
2002930c:	2002c22c 	.word	0x2002c22c

20029310 <mbedtls_pk_setup>:
20029310:	b570      	push	{r4, r5, r6, lr}
20029312:	460e      	mov	r6, r1
20029314:	4605      	mov	r5, r0
20029316:	b148      	cbz	r0, 2002932c <mbedtls_pk_setup+0x1c>
20029318:	b141      	cbz	r1, 2002932c <mbedtls_pk_setup+0x1c>
2002931a:	6804      	ldr	r4, [r0, #0]
2002931c:	b934      	cbnz	r4, 2002932c <mbedtls_pk_setup+0x1c>
2002931e:	6a4b      	ldr	r3, [r1, #36]	@ 0x24
20029320:	4798      	blx	r3
20029322:	6068      	str	r0, [r5, #4]
20029324:	b120      	cbz	r0, 20029330 <mbedtls_pk_setup+0x20>
20029326:	4620      	mov	r0, r4
20029328:	602e      	str	r6, [r5, #0]
2002932a:	bd70      	pop	{r4, r5, r6, pc}
2002932c:	4801      	ldr	r0, [pc, #4]	@ (20029334 <mbedtls_pk_setup+0x24>)
2002932e:	e7fc      	b.n	2002932a <mbedtls_pk_setup+0x1a>
20029330:	4801      	ldr	r0, [pc, #4]	@ (20029338 <mbedtls_pk_setup+0x28>)
20029332:	e7fa      	b.n	2002932a <mbedtls_pk_setup+0x1a>
20029334:	ffffc180 	.word	0xffffc180
20029338:	ffffc080 	.word	0xffffc080

2002933c <mbedtls_pk_verify>:
2002933c:	e92d 47f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
20029340:	460d      	mov	r5, r1
20029342:	e9dd 8908 	ldrd	r8, r9, [sp, #32]
20029346:	4616      	mov	r6, r2
20029348:	4604      	mov	r4, r0
2002934a:	b910      	cbnz	r0, 20029352 <mbedtls_pk_verify+0x16>
2002934c:	480e      	ldr	r0, [pc, #56]	@ (20029388 <mbedtls_pk_verify+0x4c>)
2002934e:	e8bd 87f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
20029352:	6802      	ldr	r2, [r0, #0]
20029354:	2a00      	cmp	r2, #0
20029356:	d0f9      	beq.n	2002934c <mbedtls_pk_verify+0x10>
20029358:	b93b      	cbnz	r3, 2002936a <mbedtls_pk_verify+0x2e>
2002935a:	4608      	mov	r0, r1
2002935c:	f7fc fd40 	bl	20025de0 <mbedtls_md_info_from_type>
20029360:	2800      	cmp	r0, #0
20029362:	d0f3      	beq.n	2002934c <mbedtls_pk_verify+0x10>
20029364:	f7fc fd48 	bl	20025df8 <mbedtls_md_get_size>
20029368:	4603      	mov	r3, r0
2002936a:	6822      	ldr	r2, [r4, #0]
2002936c:	6917      	ldr	r7, [r2, #16]
2002936e:	b147      	cbz	r7, 20029382 <mbedtls_pk_verify+0x46>
20029370:	e9cd 8908 	strd	r8, r9, [sp, #32]
20029374:	4632      	mov	r2, r6
20029376:	4629      	mov	r1, r5
20029378:	46bc      	mov	ip, r7
2002937a:	6860      	ldr	r0, [r4, #4]
2002937c:	e8bd 47f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
20029380:	4760      	bx	ip
20029382:	4802      	ldr	r0, [pc, #8]	@ (2002938c <mbedtls_pk_verify+0x50>)
20029384:	e7e3      	b.n	2002934e <mbedtls_pk_verify+0x12>
20029386:	bf00      	nop
20029388:	ffffc180 	.word	0xffffc180
2002938c:	ffffc100 	.word	0xffffc100

20029390 <pk_get_pk_alg>:
20029390:	b530      	push	{r4, r5, lr}
20029392:	4615      	mov	r5, r2
20029394:	2200      	movs	r2, #0
20029396:	b085      	sub	sp, #20
20029398:	e9c3 2200 	strd	r2, r2, [r3]
2002939c:	609a      	str	r2, [r3, #8]
2002939e:	aa01      	add	r2, sp, #4
200293a0:	461c      	mov	r4, r3
200293a2:	f7fe fa98 	bl	200278d6 <mbedtls_asn1_get_alg>
200293a6:	b118      	cbz	r0, 200293b0 <pk_get_pk_alg+0x20>
200293a8:	f5a0 506a 	sub.w	r0, r0, #14976	@ 0x3a80
200293ac:	b005      	add	sp, #20
200293ae:	bd30      	pop	{r4, r5, pc}
200293b0:	4629      	mov	r1, r5
200293b2:	a801      	add	r0, sp, #4
200293b4:	f7ff ff46 	bl	20029244 <mbedtls_oid_get_pk_alg>
200293b8:	b960      	cbnz	r0, 200293d4 <pk_get_pk_alg+0x44>
200293ba:	782b      	ldrb	r3, [r5, #0]
200293bc:	2b01      	cmp	r3, #1
200293be:	d1f5      	bne.n	200293ac <pk_get_pk_alg+0x1c>
200293c0:	6823      	ldr	r3, [r4, #0]
200293c2:	2b05      	cmp	r3, #5
200293c4:	d000      	beq.n	200293c8 <pk_get_pk_alg+0x38>
200293c6:	b93b      	cbnz	r3, 200293d8 <pk_get_pk_alg+0x48>
200293c8:	6862      	ldr	r2, [r4, #4]
200293ca:	4b04      	ldr	r3, [pc, #16]	@ (200293dc <pk_get_pk_alg+0x4c>)
200293cc:	2a00      	cmp	r2, #0
200293ce:	bf18      	it	ne
200293d0:	4618      	movne	r0, r3
200293d2:	e7eb      	b.n	200293ac <pk_get_pk_alg+0x1c>
200293d4:	4802      	ldr	r0, [pc, #8]	@ (200293e0 <pk_get_pk_alg+0x50>)
200293d6:	e7e9      	b.n	200293ac <pk_get_pk_alg+0x1c>
200293d8:	4800      	ldr	r0, [pc, #0]	@ (200293dc <pk_get_pk_alg+0x4c>)
200293da:	e7e7      	b.n	200293ac <pk_get_pk_alg+0x1c>
200293dc:	ffffc580 	.word	0xffffc580
200293e0:	ffffc380 	.word	0xffffc380

200293e4 <mbedtls_pk_parse_subpubkey>:
200293e4:	2300      	movs	r3, #0
200293e6:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
200293ea:	b087      	sub	sp, #28
200293ec:	4690      	mov	r8, r2
200293ee:	f88d 3003 	strb.w	r3, [sp, #3]
200293f2:	aa01      	add	r2, sp, #4
200293f4:	2330      	movs	r3, #48	@ 0x30
200293f6:	4606      	mov	r6, r0
200293f8:	f7fe fa32 	bl	20027860 <mbedtls_asn1_get_tag>
200293fc:	b128      	cbz	r0, 2002940a <mbedtls_pk_parse_subpubkey+0x26>
200293fe:	f5a0 5474 	sub.w	r4, r0, #15616	@ 0x3d00
20029402:	4620      	mov	r0, r4
20029404:	b007      	add	sp, #28
20029406:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
2002940a:	9b01      	ldr	r3, [sp, #4]
2002940c:	6837      	ldr	r7, [r6, #0]
2002940e:	4630      	mov	r0, r6
20029410:	441f      	add	r7, r3
20029412:	4639      	mov	r1, r7
20029414:	ab03      	add	r3, sp, #12
20029416:	f10d 0203 	add.w	r2, sp, #3
2002941a:	f7ff ffb9 	bl	20029390 <pk_get_pk_alg>
2002941e:	4604      	mov	r4, r0
20029420:	2800      	cmp	r0, #0
20029422:	d1ee      	bne.n	20029402 <mbedtls_pk_parse_subpubkey+0x1e>
20029424:	4639      	mov	r1, r7
20029426:	4630      	mov	r0, r6
20029428:	aa01      	add	r2, sp, #4
2002942a:	f7fe fa40 	bl	200278ae <mbedtls_asn1_get_bitstring_null>
2002942e:	b110      	cbz	r0, 20029436 <mbedtls_pk_parse_subpubkey+0x52>
20029430:	f5a0 546c 	sub.w	r4, r0, #15104	@ 0x3b00
20029434:	e7e5      	b.n	20029402 <mbedtls_pk_parse_subpubkey+0x1e>
20029436:	6833      	ldr	r3, [r6, #0]
20029438:	9a01      	ldr	r2, [sp, #4]
2002943a:	4413      	add	r3, r2
2002943c:	429f      	cmp	r7, r3
2002943e:	d14b      	bne.n	200294d8 <mbedtls_pk_parse_subpubkey+0xf4>
20029440:	f89d 0003 	ldrb.w	r0, [sp, #3]
20029444:	f7ff ff5c 	bl	20029300 <mbedtls_pk_info_from_type>
20029448:	4601      	mov	r1, r0
2002944a:	2800      	cmp	r0, #0
2002944c:	d046      	beq.n	200294dc <mbedtls_pk_parse_subpubkey+0xf8>
2002944e:	4640      	mov	r0, r8
20029450:	f7ff ff5e 	bl	20029310 <mbedtls_pk_setup>
20029454:	4604      	mov	r4, r0
20029456:	2800      	cmp	r0, #0
20029458:	d1d3      	bne.n	20029402 <mbedtls_pk_parse_subpubkey+0x1e>
2002945a:	f89d 3003 	ldrb.w	r3, [sp, #3]
2002945e:	2b01      	cmp	r3, #1
20029460:	d138      	bne.n	200294d4 <mbedtls_pk_parse_subpubkey+0xf0>
20029462:	2330      	movs	r3, #48	@ 0x30
20029464:	4639      	mov	r1, r7
20029466:	4630      	mov	r0, r6
20029468:	aa02      	add	r2, sp, #8
2002946a:	f8d8 5004 	ldr.w	r5, [r8, #4]
2002946e:	f7fe f9f7 	bl	20027860 <mbedtls_asn1_get_tag>
20029472:	b138      	cbz	r0, 20029484 <mbedtls_pk_parse_subpubkey+0xa0>
20029474:	f5a0 556c 	sub.w	r5, r0, #15104	@ 0x3b00
20029478:	bb3d      	cbnz	r5, 200294ca <mbedtls_pk_parse_subpubkey+0xe6>
2002947a:	6833      	ldr	r3, [r6, #0]
2002947c:	42bb      	cmp	r3, r7
2002947e:	d0c0      	beq.n	20029402 <mbedtls_pk_parse_subpubkey+0x1e>
20029480:	4d17      	ldr	r5, [pc, #92]	@ (200294e0 <mbedtls_pk_parse_subpubkey+0xfc>)
20029482:	e022      	b.n	200294ca <mbedtls_pk_parse_subpubkey+0xe6>
20029484:	6833      	ldr	r3, [r6, #0]
20029486:	9a02      	ldr	r2, [sp, #8]
20029488:	4413      	add	r3, r2
2002948a:	429f      	cmp	r7, r3
2002948c:	d1f8      	bne.n	20029480 <mbedtls_pk_parse_subpubkey+0x9c>
2002948e:	f105 0a08 	add.w	sl, r5, #8
20029492:	4652      	mov	r2, sl
20029494:	4639      	mov	r1, r7
20029496:	4630      	mov	r0, r6
20029498:	f7fe f9f6 	bl	20027888 <mbedtls_asn1_get_mpi>
2002949c:	2800      	cmp	r0, #0
2002949e:	d1e9      	bne.n	20029474 <mbedtls_pk_parse_subpubkey+0x90>
200294a0:	4639      	mov	r1, r7
200294a2:	4630      	mov	r0, r6
200294a4:	f105 0214 	add.w	r2, r5, #20
200294a8:	f7fe f9ee 	bl	20027888 <mbedtls_asn1_get_mpi>
200294ac:	2800      	cmp	r0, #0
200294ae:	d1e1      	bne.n	20029474 <mbedtls_pk_parse_subpubkey+0x90>
200294b0:	6833      	ldr	r3, [r6, #0]
200294b2:	429f      	cmp	r7, r3
200294b4:	d1e4      	bne.n	20029480 <mbedtls_pk_parse_subpubkey+0x9c>
200294b6:	4628      	mov	r0, r5
200294b8:	f000 f8c2 	bl	20029640 <mbedtls_rsa_check_pubkey>
200294bc:	b920      	cbnz	r0, 200294c8 <mbedtls_pk_parse_subpubkey+0xe4>
200294be:	4650      	mov	r0, sl
200294c0:	f7fe fcbe 	bl	20027e40 <mbedtls_mpi_size>
200294c4:	6068      	str	r0, [r5, #4]
200294c6:	e7d8      	b.n	2002947a <mbedtls_pk_parse_subpubkey+0x96>
200294c8:	4d06      	ldr	r5, [pc, #24]	@ (200294e4 <mbedtls_pk_parse_subpubkey+0x100>)
200294ca:	4640      	mov	r0, r8
200294cc:	f7ff ff07 	bl	200292de <mbedtls_pk_free>
200294d0:	462c      	mov	r4, r5
200294d2:	e796      	b.n	20029402 <mbedtls_pk_parse_subpubkey+0x1e>
200294d4:	4d04      	ldr	r5, [pc, #16]	@ (200294e8 <mbedtls_pk_parse_subpubkey+0x104>)
200294d6:	e7f8      	b.n	200294ca <mbedtls_pk_parse_subpubkey+0xe6>
200294d8:	4c01      	ldr	r4, [pc, #4]	@ (200294e0 <mbedtls_pk_parse_subpubkey+0xfc>)
200294da:	e792      	b.n	20029402 <mbedtls_pk_parse_subpubkey+0x1e>
200294dc:	4c02      	ldr	r4, [pc, #8]	@ (200294e8 <mbedtls_pk_parse_subpubkey+0x104>)
200294de:	e790      	b.n	20029402 <mbedtls_pk_parse_subpubkey+0x1e>
200294e0:	ffffc49a 	.word	0xffffc49a
200294e4:	ffffc500 	.word	0xffffc500
200294e8:	ffffc380 	.word	0xffffc380

200294ec <mbedtls_pk_parse_public_key>:
200294ec:	4613      	mov	r3, r2
200294ee:	b507      	push	{r0, r1, r2, lr}
200294f0:	4602      	mov	r2, r0
200294f2:	9101      	str	r1, [sp, #4]
200294f4:	a801      	add	r0, sp, #4
200294f6:	4419      	add	r1, r3
200294f8:	f7ff ff74 	bl	200293e4 <mbedtls_pk_parse_subpubkey>
200294fc:	b003      	add	sp, #12
200294fe:	f85d fb04 	ldr.w	pc, [sp], #4

20029502 <rsa_can_do>:
20029502:	2801      	cmp	r0, #1
20029504:	d002      	beq.n	2002950c <rsa_can_do+0xa>
20029506:	1f83      	subs	r3, r0, #6
20029508:	4258      	negs	r0, r3
2002950a:	4158      	adcs	r0, r3
2002950c:	4770      	bx	lr

2002950e <rsa_get_bitlen>:
2002950e:	6840      	ldr	r0, [r0, #4]
20029510:	00c0      	lsls	r0, r0, #3
20029512:	4770      	bx	lr

20029514 <rsa_debug>:
20029514:	2301      	movs	r3, #1
20029516:	4a06      	ldr	r2, [pc, #24]	@ (20029530 <rsa_debug+0x1c>)
20029518:	700b      	strb	r3, [r1, #0]
2002951a:	730b      	strb	r3, [r1, #12]
2002951c:	4b05      	ldr	r3, [pc, #20]	@ (20029534 <rsa_debug+0x20>)
2002951e:	604a      	str	r2, [r1, #4]
20029520:	f100 0208 	add.w	r2, r0, #8
20029524:	3014      	adds	r0, #20
20029526:	608a      	str	r2, [r1, #8]
20029528:	610b      	str	r3, [r1, #16]
2002952a:	6148      	str	r0, [r1, #20]
2002952c:	4770      	bx	lr
2002952e:	bf00      	nop
20029530:	2002b008 	.word	0x2002b008
20029534:	2002b00e 	.word	0x2002b00e

20029538 <rsa_free_wrap>:
20029538:	b510      	push	{r4, lr}
2002953a:	4604      	mov	r4, r0
2002953c:	f000 fe7c 	bl	2002a238 <mbedtls_rsa_free>
20029540:	4620      	mov	r0, r4
20029542:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
20029546:	f001 b88b 	b.w	2002a660 <free>

2002954a <rsa_alloc_wrap>:
2002954a:	b510      	push	{r4, lr}
2002954c:	21ac      	movs	r1, #172	@ 0xac
2002954e:	2001      	movs	r0, #1
20029550:	f001 f86a 	bl	2002a628 <calloc>
20029554:	4604      	mov	r4, r0
20029556:	b118      	cbz	r0, 20029560 <rsa_alloc_wrap+0x16>
20029558:	2200      	movs	r2, #0
2002955a:	4611      	mov	r1, r2
2002955c:	f000 f862 	bl	20029624 <mbedtls_rsa_init>
20029560:	4620      	mov	r0, r4
20029562:	bd10      	pop	{r4, pc}

20029564 <rsa_check_pair_wrap>:
20029564:	f000 b99c 	b.w	200298a0 <mbedtls_rsa_check_pub_priv>

20029568 <rsa_encrypt_wrap>:
20029568:	b4f0      	push	{r4, r5, r6, r7}
2002956a:	9f04      	ldr	r7, [sp, #16]
2002956c:	6846      	ldr	r6, [r0, #4]
2002956e:	460d      	mov	r5, r1
20029570:	603e      	str	r6, [r7, #0]
20029572:	9f05      	ldr	r7, [sp, #20]
20029574:	4614      	mov	r4, r2
20029576:	e9dd 1206 	ldrd	r1, r2, [sp, #24]
2002957a:	42be      	cmp	r6, r7
2002957c:	d806      	bhi.n	2002958c <rsa_encrypt_wrap+0x24>
2002957e:	e9cd 5305 	strd	r5, r3, [sp, #20]
20029582:	9404      	str	r4, [sp, #16]
20029584:	2300      	movs	r3, #0
20029586:	bcf0      	pop	{r4, r5, r6, r7}
20029588:	f000 bbe2 	b.w	20029d50 <mbedtls_rsa_pkcs1_encrypt>
2002958c:	4801      	ldr	r0, [pc, #4]	@ (20029594 <rsa_encrypt_wrap+0x2c>)
2002958e:	bcf0      	pop	{r4, r5, r6, r7}
20029590:	4770      	bx	lr
20029592:	bf00      	nop
20029594:	ffffbc00 	.word	0xffffbc00

20029598 <rsa_decrypt_wrap>:
20029598:	b4f0      	push	{r4, r5, r6, r7}
2002959a:	4616      	mov	r6, r2
2002959c:	6847      	ldr	r7, [r0, #4]
2002959e:	460c      	mov	r4, r1
200295a0:	e9dd 5105 	ldrd	r5, r1, [sp, #20]
200295a4:	42b7      	cmp	r7, r6
200295a6:	9a07      	ldr	r2, [sp, #28]
200295a8:	d106      	bne.n	200295b8 <rsa_decrypt_wrap+0x20>
200295aa:	e9cd 3506 	strd	r3, r5, [sp, #24]
200295ae:	9405      	str	r4, [sp, #20]
200295b0:	2301      	movs	r3, #1
200295b2:	bcf0      	pop	{r4, r5, r6, r7}
200295b4:	f000 bc6e 	b.w	20029e94 <mbedtls_rsa_pkcs1_decrypt>
200295b8:	4801      	ldr	r0, [pc, #4]	@ (200295c0 <rsa_decrypt_wrap+0x28>)
200295ba:	bcf0      	pop	{r4, r5, r6, r7}
200295bc:	4770      	bx	lr
200295be:	bf00      	nop
200295c0:	ffffbf80 	.word	0xffffbf80

200295c4 <rsa_sign_wrap>:
200295c4:	b4f0      	push	{r4, r5, r6, r7}
200295c6:	460c      	mov	r4, r1
200295c8:	4615      	mov	r5, r2
200295ca:	e9dd 1206 	ldrd	r1, r2, [sp, #24]
200295ce:	6847      	ldr	r7, [r0, #4]
200295d0:	9e05      	ldr	r6, [sp, #20]
200295d2:	6037      	str	r7, [r6, #0]
200295d4:	9e04      	ldr	r6, [sp, #16]
200295d6:	e9cd 4304 	strd	r4, r3, [sp, #16]
200295da:	e9cd 5606 	strd	r5, r6, [sp, #24]
200295de:	bcf0      	pop	{r4, r5, r6, r7}
200295e0:	2301      	movs	r3, #1
200295e2:	f000 bd31 	b.w	2002a048 <mbedtls_rsa_pkcs1_sign>
	...

200295e8 <rsa_verify_wrap>:
200295e8:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
200295ea:	9d09      	ldr	r5, [sp, #36]	@ 0x24
200295ec:	6846      	ldr	r6, [r0, #4]
200295ee:	4604      	mov	r4, r0
200295f0:	42ae      	cmp	r6, r5
200295f2:	d811      	bhi.n	20029618 <rsa_verify_wrap+0x30>
200295f4:	e9cd 1300 	strd	r1, r3, [sp]
200295f8:	2300      	movs	r3, #0
200295fa:	9e08      	ldr	r6, [sp, #32]
200295fc:	4619      	mov	r1, r3
200295fe:	e9cd 2602 	strd	r2, r6, [sp, #8]
20029602:	461a      	mov	r2, r3
20029604:	f000 fe08 	bl	2002a218 <mbedtls_rsa_pkcs1_verify>
20029608:	b920      	cbnz	r0, 20029614 <rsa_verify_wrap+0x2c>
2002960a:	6862      	ldr	r2, [r4, #4]
2002960c:	4b03      	ldr	r3, [pc, #12]	@ (2002961c <rsa_verify_wrap+0x34>)
2002960e:	42aa      	cmp	r2, r5
20029610:	bf38      	it	cc
20029612:	4618      	movcc	r0, r3
20029614:	b004      	add	sp, #16
20029616:	bd70      	pop	{r4, r5, r6, pc}
20029618:	4801      	ldr	r0, [pc, #4]	@ (20029620 <rsa_verify_wrap+0x38>)
2002961a:	e7fb      	b.n	20029614 <rsa_verify_wrap+0x2c>
2002961c:	ffffc700 	.word	0xffffc700
20029620:	ffffbc80 	.word	0xffffbc80

20029624 <mbedtls_rsa_init>:
20029624:	b570      	push	{r4, r5, r6, lr}
20029626:	4604      	mov	r4, r0
20029628:	460e      	mov	r6, r1
2002962a:	4615      	mov	r5, r2
2002962c:	2100      	movs	r1, #0
2002962e:	22ac      	movs	r2, #172	@ 0xac
20029630:	f001 f8dc 	bl	2002a7ec <memset>
20029634:	e9c4 6529 	strd	r6, r5, [r4, #164]	@ 0xa4
20029638:	bd70      	pop	{r4, r5, r6, pc}

2002963a <mbedtls_rsa_set_padding>:
2002963a:	e9c0 1229 	strd	r1, r2, [r0, #164]	@ 0xa4
2002963e:	4770      	bx	lr

20029640 <mbedtls_rsa_check_pubkey>:
20029640:	b538      	push	{r3, r4, r5, lr}
20029642:	6902      	ldr	r2, [r0, #16]
20029644:	4604      	mov	r4, r0
20029646:	b10a      	cbz	r2, 2002964c <mbedtls_rsa_check_pubkey+0xc>
20029648:	69c3      	ldr	r3, [r0, #28]
2002964a:	b90b      	cbnz	r3, 20029650 <mbedtls_rsa_check_pubkey+0x10>
2002964c:	4811      	ldr	r0, [pc, #68]	@ (20029694 <mbedtls_rsa_check_pubkey+0x54>)
2002964e:	bd38      	pop	{r3, r4, r5, pc}
20029650:	6812      	ldr	r2, [r2, #0]
20029652:	07d2      	lsls	r2, r2, #31
20029654:	d5fa      	bpl.n	2002964c <mbedtls_rsa_check_pubkey+0xc>
20029656:	681b      	ldr	r3, [r3, #0]
20029658:	07db      	lsls	r3, r3, #31
2002965a:	d5f7      	bpl.n	2002964c <mbedtls_rsa_check_pubkey+0xc>
2002965c:	f100 0508 	add.w	r5, r0, #8
20029660:	4628      	mov	r0, r5
20029662:	f7fe fbd0 	bl	20027e06 <mbedtls_mpi_bitlen>
20029666:	287f      	cmp	r0, #127	@ 0x7f
20029668:	d9f0      	bls.n	2002964c <mbedtls_rsa_check_pubkey+0xc>
2002966a:	4628      	mov	r0, r5
2002966c:	f7fe fbcb 	bl	20027e06 <mbedtls_mpi_bitlen>
20029670:	f5b0 5f00 	cmp.w	r0, #8192	@ 0x2000
20029674:	d8ea      	bhi.n	2002964c <mbedtls_rsa_check_pubkey+0xc>
20029676:	3414      	adds	r4, #20
20029678:	4620      	mov	r0, r4
2002967a:	f7fe fbc4 	bl	20027e06 <mbedtls_mpi_bitlen>
2002967e:	2801      	cmp	r0, #1
20029680:	d9e4      	bls.n	2002964c <mbedtls_rsa_check_pubkey+0xc>
20029682:	4629      	mov	r1, r5
20029684:	4620      	mov	r0, r4
20029686:	f7fe fd71 	bl	2002816c <mbedtls_mpi_cmp_mpi>
2002968a:	2800      	cmp	r0, #0
2002968c:	dade      	bge.n	2002964c <mbedtls_rsa_check_pubkey+0xc>
2002968e:	2000      	movs	r0, #0
20029690:	e7dd      	b.n	2002964e <mbedtls_rsa_check_pubkey+0xe>
20029692:	bf00      	nop
20029694:	ffffbe00 	.word	0xffffbe00

20029698 <mbedtls_rsa_check_privkey>:
20029698:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
2002969c:	b0a9      	sub	sp, #164	@ 0xa4
2002969e:	4605      	mov	r5, r0
200296a0:	f7ff ffce 	bl	20029640 <mbedtls_rsa_check_pubkey>
200296a4:	b120      	cbz	r0, 200296b0 <mbedtls_rsa_check_privkey+0x18>
200296a6:	4c7d      	ldr	r4, [pc, #500]	@ (2002989c <mbedtls_rsa_check_privkey+0x204>)
200296a8:	4620      	mov	r0, r4
200296aa:	b029      	add	sp, #164	@ 0xa4
200296ac:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
200296b0:	6b6b      	ldr	r3, [r5, #52]	@ 0x34
200296b2:	2b00      	cmp	r3, #0
200296b4:	d0f7      	beq.n	200296a6 <mbedtls_rsa_check_privkey+0xe>
200296b6:	6c2b      	ldr	r3, [r5, #64]	@ 0x40
200296b8:	2b00      	cmp	r3, #0
200296ba:	d0f4      	beq.n	200296a6 <mbedtls_rsa_check_privkey+0xe>
200296bc:	6aab      	ldr	r3, [r5, #40]	@ 0x28
200296be:	2b00      	cmp	r3, #0
200296c0:	d0f1      	beq.n	200296a6 <mbedtls_rsa_check_privkey+0xe>
200296c2:	a801      	add	r0, sp, #4
200296c4:	f7fe fafa 	bl	20027cbc <mbedtls_mpi_init>
200296c8:	a804      	add	r0, sp, #16
200296ca:	f7fe faf7 	bl	20027cbc <mbedtls_mpi_init>
200296ce:	a807      	add	r0, sp, #28
200296d0:	f7fe faf4 	bl	20027cbc <mbedtls_mpi_init>
200296d4:	a80a      	add	r0, sp, #40	@ 0x28
200296d6:	f7fe faf1 	bl	20027cbc <mbedtls_mpi_init>
200296da:	a80d      	add	r0, sp, #52	@ 0x34
200296dc:	f7fe faee 	bl	20027cbc <mbedtls_mpi_init>
200296e0:	a810      	add	r0, sp, #64	@ 0x40
200296e2:	f7fe faeb 	bl	20027cbc <mbedtls_mpi_init>
200296e6:	a813      	add	r0, sp, #76	@ 0x4c
200296e8:	f7fe fae8 	bl	20027cbc <mbedtls_mpi_init>
200296ec:	a816      	add	r0, sp, #88	@ 0x58
200296ee:	f7fe fae5 	bl	20027cbc <mbedtls_mpi_init>
200296f2:	a819      	add	r0, sp, #100	@ 0x64
200296f4:	f7fe fae2 	bl	20027cbc <mbedtls_mpi_init>
200296f8:	a81c      	add	r0, sp, #112	@ 0x70
200296fa:	f7fe fadf 	bl	20027cbc <mbedtls_mpi_init>
200296fe:	a81f      	add	r0, sp, #124	@ 0x7c
20029700:	f7fe fadc 	bl	20027cbc <mbedtls_mpi_init>
20029704:	a822      	add	r0, sp, #136	@ 0x88
20029706:	f7fe fad9 	bl	20027cbc <mbedtls_mpi_init>
2002970a:	f105 072c 	add.w	r7, r5, #44	@ 0x2c
2002970e:	a825      	add	r0, sp, #148	@ 0x94
20029710:	f105 0638 	add.w	r6, r5, #56	@ 0x38
20029714:	f7fe fad2 	bl	20027cbc <mbedtls_mpi_init>
20029718:	4632      	mov	r2, r6
2002971a:	4639      	mov	r1, r7
2002971c:	a801      	add	r0, sp, #4
2002971e:	f7fe fe75 	bl	2002840c <mbedtls_mpi_mul_mpi>
20029722:	4604      	mov	r4, r0
20029724:	2800      	cmp	r0, #0
20029726:	d15e      	bne.n	200297e6 <mbedtls_rsa_check_privkey+0x14e>
20029728:	f105 0820 	add.w	r8, r5, #32
2002972c:	f105 0914 	add.w	r9, r5, #20
20029730:	464a      	mov	r2, r9
20029732:	4641      	mov	r1, r8
20029734:	a804      	add	r0, sp, #16
20029736:	f7fe fe69 	bl	2002840c <mbedtls_mpi_mul_mpi>
2002973a:	4604      	mov	r4, r0
2002973c:	2800      	cmp	r0, #0
2002973e:	d152      	bne.n	200297e6 <mbedtls_rsa_check_privkey+0x14e>
20029740:	2201      	movs	r2, #1
20029742:	4639      	mov	r1, r7
20029744:	a807      	add	r0, sp, #28
20029746:	f7fe fe4b 	bl	200283e0 <mbedtls_mpi_sub_int>
2002974a:	4604      	mov	r4, r0
2002974c:	2800      	cmp	r0, #0
2002974e:	d14a      	bne.n	200297e6 <mbedtls_rsa_check_privkey+0x14e>
20029750:	2201      	movs	r2, #1
20029752:	4631      	mov	r1, r6
20029754:	a80a      	add	r0, sp, #40	@ 0x28
20029756:	f7fe fe43 	bl	200283e0 <mbedtls_mpi_sub_int>
2002975a:	4604      	mov	r4, r0
2002975c:	2800      	cmp	r0, #0
2002975e:	d142      	bne.n	200297e6 <mbedtls_rsa_check_privkey+0x14e>
20029760:	aa0a      	add	r2, sp, #40	@ 0x28
20029762:	a907      	add	r1, sp, #28
20029764:	a80d      	add	r0, sp, #52	@ 0x34
20029766:	f7fe fe51 	bl	2002840c <mbedtls_mpi_mul_mpi>
2002976a:	4604      	mov	r4, r0
2002976c:	2800      	cmp	r0, #0
2002976e:	d13a      	bne.n	200297e6 <mbedtls_rsa_check_privkey+0x14e>
20029770:	4649      	mov	r1, r9
20029772:	aa0d      	add	r2, sp, #52	@ 0x34
20029774:	a813      	add	r0, sp, #76	@ 0x4c
20029776:	f7ff fb04 	bl	20028d82 <mbedtls_mpi_gcd>
2002977a:	4604      	mov	r4, r0
2002977c:	2800      	cmp	r0, #0
2002977e:	d132      	bne.n	200297e6 <mbedtls_rsa_check_privkey+0x14e>
20029780:	aa0a      	add	r2, sp, #40	@ 0x28
20029782:	a907      	add	r1, sp, #28
20029784:	a816      	add	r0, sp, #88	@ 0x58
20029786:	f7ff fafc 	bl	20028d82 <mbedtls_mpi_gcd>
2002978a:	4604      	mov	r4, r0
2002978c:	bb58      	cbnz	r0, 200297e6 <mbedtls_rsa_check_privkey+0x14e>
2002978e:	ab16      	add	r3, sp, #88	@ 0x58
20029790:	aa0d      	add	r2, sp, #52	@ 0x34
20029792:	a91c      	add	r1, sp, #112	@ 0x70
20029794:	a819      	add	r0, sp, #100	@ 0x64
20029796:	f7fe feaa 	bl	200284ee <mbedtls_mpi_div_mpi>
2002979a:	4604      	mov	r4, r0
2002979c:	bb18      	cbnz	r0, 200297e6 <mbedtls_rsa_check_privkey+0x14e>
2002979e:	aa19      	add	r2, sp, #100	@ 0x64
200297a0:	a904      	add	r1, sp, #16
200297a2:	a810      	add	r0, sp, #64	@ 0x40
200297a4:	f7ff f8a7 	bl	200288f6 <mbedtls_mpi_mod_mpi>
200297a8:	4604      	mov	r4, r0
200297aa:	b9e0      	cbnz	r0, 200297e6 <mbedtls_rsa_check_privkey+0x14e>
200297ac:	4641      	mov	r1, r8
200297ae:	aa07      	add	r2, sp, #28
200297b0:	a81f      	add	r0, sp, #124	@ 0x7c
200297b2:	f7ff f8a0 	bl	200288f6 <mbedtls_mpi_mod_mpi>
200297b6:	4604      	mov	r4, r0
200297b8:	b9a8      	cbnz	r0, 200297e6 <mbedtls_rsa_check_privkey+0x14e>
200297ba:	4641      	mov	r1, r8
200297bc:	aa0a      	add	r2, sp, #40	@ 0x28
200297be:	a822      	add	r0, sp, #136	@ 0x88
200297c0:	f7ff f899 	bl	200288f6 <mbedtls_mpi_mod_mpi>
200297c4:	4604      	mov	r4, r0
200297c6:	b970      	cbnz	r0, 200297e6 <mbedtls_rsa_check_privkey+0x14e>
200297c8:	463a      	mov	r2, r7
200297ca:	4631      	mov	r1, r6
200297cc:	a825      	add	r0, sp, #148	@ 0x94
200297ce:	f7ff fb73 	bl	20028eb8 <mbedtls_mpi_inv_mod>
200297d2:	4604      	mov	r4, r0
200297d4:	b938      	cbnz	r0, 200297e6 <mbedtls_rsa_check_privkey+0x14e>
200297d6:	f105 0108 	add.w	r1, r5, #8
200297da:	a801      	add	r0, sp, #4
200297dc:	f7fe fcc6 	bl	2002816c <mbedtls_mpi_cmp_mpi>
200297e0:	2800      	cmp	r0, #0
200297e2:	d031      	beq.n	20029848 <mbedtls_rsa_check_privkey+0x1b0>
200297e4:	4c2d      	ldr	r4, [pc, #180]	@ (2002989c <mbedtls_rsa_check_privkey+0x204>)
200297e6:	a801      	add	r0, sp, #4
200297e8:	f7fe fa6f 	bl	20027cca <mbedtls_mpi_free>
200297ec:	a804      	add	r0, sp, #16
200297ee:	f7fe fa6c 	bl	20027cca <mbedtls_mpi_free>
200297f2:	a807      	add	r0, sp, #28
200297f4:	f7fe fa69 	bl	20027cca <mbedtls_mpi_free>
200297f8:	a80a      	add	r0, sp, #40	@ 0x28
200297fa:	f7fe fa66 	bl	20027cca <mbedtls_mpi_free>
200297fe:	a80d      	add	r0, sp, #52	@ 0x34
20029800:	f7fe fa63 	bl	20027cca <mbedtls_mpi_free>
20029804:	a810      	add	r0, sp, #64	@ 0x40
20029806:	f7fe fa60 	bl	20027cca <mbedtls_mpi_free>
2002980a:	a813      	add	r0, sp, #76	@ 0x4c
2002980c:	f7fe fa5d 	bl	20027cca <mbedtls_mpi_free>
20029810:	a816      	add	r0, sp, #88	@ 0x58
20029812:	f7fe fa5a 	bl	20027cca <mbedtls_mpi_free>
20029816:	a819      	add	r0, sp, #100	@ 0x64
20029818:	f7fe fa57 	bl	20027cca <mbedtls_mpi_free>
2002981c:	a81c      	add	r0, sp, #112	@ 0x70
2002981e:	f7fe fa54 	bl	20027cca <mbedtls_mpi_free>
20029822:	a81f      	add	r0, sp, #124	@ 0x7c
20029824:	f7fe fa51 	bl	20027cca <mbedtls_mpi_free>
20029828:	a822      	add	r0, sp, #136	@ 0x88
2002982a:	f7fe fa4e 	bl	20027cca <mbedtls_mpi_free>
2002982e:	a825      	add	r0, sp, #148	@ 0x94
20029830:	f7fe fa4b 	bl	20027cca <mbedtls_mpi_free>
20029834:	f514 4f84 	cmn.w	r4, #16896	@ 0x4200
20029838:	f43f af35 	beq.w	200296a6 <mbedtls_rsa_check_privkey+0xe>
2002983c:	2c00      	cmp	r4, #0
2002983e:	f43f af33 	beq.w	200296a8 <mbedtls_rsa_check_privkey+0x10>
20029842:	f5a4 4484 	sub.w	r4, r4, #16896	@ 0x4200
20029846:	e72f      	b.n	200296a8 <mbedtls_rsa_check_privkey+0x10>
20029848:	f105 0144 	add.w	r1, r5, #68	@ 0x44
2002984c:	a81f      	add	r0, sp, #124	@ 0x7c
2002984e:	f7fe fc8d 	bl	2002816c <mbedtls_mpi_cmp_mpi>
20029852:	2800      	cmp	r0, #0
20029854:	d1c6      	bne.n	200297e4 <mbedtls_rsa_check_privkey+0x14c>
20029856:	f105 0150 	add.w	r1, r5, #80	@ 0x50
2002985a:	a822      	add	r0, sp, #136	@ 0x88
2002985c:	f7fe fc86 	bl	2002816c <mbedtls_mpi_cmp_mpi>
20029860:	2800      	cmp	r0, #0
20029862:	d1bf      	bne.n	200297e4 <mbedtls_rsa_check_privkey+0x14c>
20029864:	f105 015c 	add.w	r1, r5, #92	@ 0x5c
20029868:	a825      	add	r0, sp, #148	@ 0x94
2002986a:	f7fe fc7f 	bl	2002816c <mbedtls_mpi_cmp_mpi>
2002986e:	2800      	cmp	r0, #0
20029870:	d1b8      	bne.n	200297e4 <mbedtls_rsa_check_privkey+0x14c>
20029872:	2100      	movs	r1, #0
20029874:	a81c      	add	r0, sp, #112	@ 0x70
20029876:	f7fe fcba 	bl	200281ee <mbedtls_mpi_cmp_int>
2002987a:	2800      	cmp	r0, #0
2002987c:	d1b2      	bne.n	200297e4 <mbedtls_rsa_check_privkey+0x14c>
2002987e:	2101      	movs	r1, #1
20029880:	a810      	add	r0, sp, #64	@ 0x40
20029882:	f7fe fcb4 	bl	200281ee <mbedtls_mpi_cmp_int>
20029886:	2800      	cmp	r0, #0
20029888:	d1ac      	bne.n	200297e4 <mbedtls_rsa_check_privkey+0x14c>
2002988a:	2101      	movs	r1, #1
2002988c:	a813      	add	r0, sp, #76	@ 0x4c
2002988e:	f7fe fcae 	bl	200281ee <mbedtls_mpi_cmp_int>
20029892:	4604      	mov	r4, r0
20029894:	2800      	cmp	r0, #0
20029896:	d1a5      	bne.n	200297e4 <mbedtls_rsa_check_privkey+0x14c>
20029898:	e7a5      	b.n	200297e6 <mbedtls_rsa_check_privkey+0x14e>
2002989a:	bf00      	nop
2002989c:	ffffbe00 	.word	0xffffbe00

200298a0 <mbedtls_rsa_check_pub_priv>:
200298a0:	b538      	push	{r3, r4, r5, lr}
200298a2:	4605      	mov	r5, r0
200298a4:	460c      	mov	r4, r1
200298a6:	f7ff fecb 	bl	20029640 <mbedtls_rsa_check_pubkey>
200298aa:	b918      	cbnz	r0, 200298b4 <mbedtls_rsa_check_pub_priv+0x14>
200298ac:	4620      	mov	r0, r4
200298ae:	f7ff fef3 	bl	20029698 <mbedtls_rsa_check_privkey>
200298b2:	b108      	cbz	r0, 200298b8 <mbedtls_rsa_check_pub_priv+0x18>
200298b4:	4809      	ldr	r0, [pc, #36]	@ (200298dc <mbedtls_rsa_check_pub_priv+0x3c>)
200298b6:	bd38      	pop	{r3, r4, r5, pc}
200298b8:	f104 0108 	add.w	r1, r4, #8
200298bc:	f105 0008 	add.w	r0, r5, #8
200298c0:	f7fe fc54 	bl	2002816c <mbedtls_mpi_cmp_mpi>
200298c4:	2800      	cmp	r0, #0
200298c6:	d1f5      	bne.n	200298b4 <mbedtls_rsa_check_pub_priv+0x14>
200298c8:	f104 0114 	add.w	r1, r4, #20
200298cc:	f105 0014 	add.w	r0, r5, #20
200298d0:	f7fe fc4c 	bl	2002816c <mbedtls_mpi_cmp_mpi>
200298d4:	2800      	cmp	r0, #0
200298d6:	d0ee      	beq.n	200298b6 <mbedtls_rsa_check_pub_priv+0x16>
200298d8:	e7ec      	b.n	200298b4 <mbedtls_rsa_check_pub_priv+0x14>
200298da:	bf00      	nop
200298dc:	ffffbe00 	.word	0xffffbe00

200298e0 <mbedtls_rsa_public>:
200298e0:	b5f0      	push	{r4, r5, r6, r7, lr}
200298e2:	460c      	mov	r4, r1
200298e4:	4605      	mov	r5, r0
200298e6:	b087      	sub	sp, #28
200298e8:	a803      	add	r0, sp, #12
200298ea:	4616      	mov	r6, r2
200298ec:	f7fe f9e6 	bl	20027cbc <mbedtls_mpi_init>
200298f0:	4621      	mov	r1, r4
200298f2:	686a      	ldr	r2, [r5, #4]
200298f4:	a803      	add	r0, sp, #12
200298f6:	f7fe faa9 	bl	20027e4c <mbedtls_mpi_read_binary>
200298fa:	4604      	mov	r4, r0
200298fc:	b9d0      	cbnz	r0, 20029934 <mbedtls_rsa_public+0x54>
200298fe:	f105 0408 	add.w	r4, r5, #8
20029902:	4621      	mov	r1, r4
20029904:	a803      	add	r0, sp, #12
20029906:	f7fe fc31 	bl	2002816c <mbedtls_mpi_cmp_mpi>
2002990a:	2800      	cmp	r0, #0
2002990c:	da1b      	bge.n	20029946 <mbedtls_rsa_public+0x66>
2002990e:	f105 0368 	add.w	r3, r5, #104	@ 0x68
20029912:	a903      	add	r1, sp, #12
20029914:	686f      	ldr	r7, [r5, #4]
20029916:	4608      	mov	r0, r1
20029918:	9300      	str	r3, [sp, #0]
2002991a:	f105 0214 	add.w	r2, r5, #20
2002991e:	4623      	mov	r3, r4
20029920:	f7ff f81b 	bl	2002895a <mbedtls_mpi_exp_mod>
20029924:	4604      	mov	r4, r0
20029926:	b928      	cbnz	r0, 20029934 <mbedtls_rsa_public+0x54>
20029928:	463a      	mov	r2, r7
2002992a:	4631      	mov	r1, r6
2002992c:	a803      	add	r0, sp, #12
2002992e:	f7fe fac2 	bl	20027eb6 <mbedtls_mpi_write_binary>
20029932:	4604      	mov	r4, r0
20029934:	a803      	add	r0, sp, #12
20029936:	f7fe f9c8 	bl	20027cca <mbedtls_mpi_free>
2002993a:	b10c      	cbz	r4, 20029940 <mbedtls_rsa_public+0x60>
2002993c:	f5a4 4485 	sub.w	r4, r4, #17024	@ 0x4280
20029940:	4620      	mov	r0, r4
20029942:	b007      	add	sp, #28
20029944:	bdf0      	pop	{r4, r5, r6, r7, pc}
20029946:	f06f 0403 	mvn.w	r4, #3
2002994a:	e7f3      	b.n	20029934 <mbedtls_rsa_public+0x54>

2002994c <mbedtls_rsa_private>:
2002994c:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20029950:	461e      	mov	r6, r3
20029952:	6b43      	ldr	r3, [r0, #52]	@ 0x34
20029954:	4604      	mov	r4, r0
20029956:	460d      	mov	r5, r1
20029958:	4617      	mov	r7, r2
2002995a:	b09d      	sub	sp, #116	@ 0x74
2002995c:	2b00      	cmp	r3, #0
2002995e:	f000 8179 	beq.w	20029c54 <mbedtls_rsa_private+0x308>
20029962:	6c03      	ldr	r3, [r0, #64]	@ 0x40
20029964:	2b00      	cmp	r3, #0
20029966:	f000 8175 	beq.w	20029c54 <mbedtls_rsa_private+0x308>
2002996a:	6a83      	ldr	r3, [r0, #40]	@ 0x28
2002996c:	2b00      	cmp	r3, #0
2002996e:	f000 8171 	beq.w	20029c54 <mbedtls_rsa_private+0x308>
20029972:	a804      	add	r0, sp, #16
20029974:	f7fe f9a2 	bl	20027cbc <mbedtls_mpi_init>
20029978:	a807      	add	r0, sp, #28
2002997a:	f7fe f99f 	bl	20027cbc <mbedtls_mpi_init>
2002997e:	a80a      	add	r0, sp, #40	@ 0x28
20029980:	f7fe f99c 	bl	20027cbc <mbedtls_mpi_init>
20029984:	a80d      	add	r0, sp, #52	@ 0x34
20029986:	f7fe f999 	bl	20027cbc <mbedtls_mpi_init>
2002998a:	a810      	add	r0, sp, #64	@ 0x40
2002998c:	f7fe f996 	bl	20027cbc <mbedtls_mpi_init>
20029990:	a813      	add	r0, sp, #76	@ 0x4c
20029992:	f7fe f993 	bl	20027cbc <mbedtls_mpi_init>
20029996:	b12d      	cbz	r5, 200299a4 <mbedtls_rsa_private+0x58>
20029998:	a816      	add	r0, sp, #88	@ 0x58
2002999a:	f7fe f98f 	bl	20027cbc <mbedtls_mpi_init>
2002999e:	a819      	add	r0, sp, #100	@ 0x64
200299a0:	f7fe f98c 	bl	20027cbc <mbedtls_mpi_init>
200299a4:	4631      	mov	r1, r6
200299a6:	6862      	ldr	r2, [r4, #4]
200299a8:	a804      	add	r0, sp, #16
200299aa:	f7fe fa4f 	bl	20027e4c <mbedtls_mpi_read_binary>
200299ae:	4603      	mov	r3, r0
200299b0:	2800      	cmp	r0, #0
200299b2:	f040 80e0 	bne.w	20029b76 <mbedtls_rsa_private+0x22a>
200299b6:	f104 0608 	add.w	r6, r4, #8
200299ba:	4631      	mov	r1, r6
200299bc:	a804      	add	r0, sp, #16
200299be:	f7fe fbd5 	bl	2002816c <mbedtls_mpi_cmp_mpi>
200299c2:	2800      	cmp	r0, #0
200299c4:	f280 8143 	bge.w	20029c4e <mbedtls_rsa_private+0x302>
200299c8:	f104 0a44 	add.w	sl, r4, #68	@ 0x44
200299cc:	f104 0950 	add.w	r9, r4, #80	@ 0x50
200299d0:	2d00      	cmp	r5, #0
200299d2:	f000 8089 	beq.w	20029ae8 <mbedtls_rsa_private+0x19c>
200299d6:	f8d4 30a0 	ldr.w	r3, [r4, #160]	@ 0xa0
200299da:	2b00      	cmp	r3, #0
200299dc:	f000 80f4 	beq.w	20029bc8 <mbedtls_rsa_private+0x27c>
200299e0:	f104 088c 	add.w	r8, r4, #140	@ 0x8c
200299e4:	4642      	mov	r2, r8
200299e6:	4641      	mov	r1, r8
200299e8:	4640      	mov	r0, r8
200299ea:	f7fe fd0f 	bl	2002840c <mbedtls_mpi_mul_mpi>
200299ee:	4603      	mov	r3, r0
200299f0:	2800      	cmp	r0, #0
200299f2:	f040 80c0 	bne.w	20029b76 <mbedtls_rsa_private+0x22a>
200299f6:	4632      	mov	r2, r6
200299f8:	4641      	mov	r1, r8
200299fa:	4640      	mov	r0, r8
200299fc:	f7fe ff7b 	bl	200288f6 <mbedtls_mpi_mod_mpi>
20029a00:	4603      	mov	r3, r0
20029a02:	2800      	cmp	r0, #0
20029a04:	f040 80b7 	bne.w	20029b76 <mbedtls_rsa_private+0x22a>
20029a08:	f104 0898 	add.w	r8, r4, #152	@ 0x98
20029a0c:	4642      	mov	r2, r8
20029a0e:	4641      	mov	r1, r8
20029a10:	4640      	mov	r0, r8
20029a12:	f7fe fcfb 	bl	2002840c <mbedtls_mpi_mul_mpi>
20029a16:	4603      	mov	r3, r0
20029a18:	2800      	cmp	r0, #0
20029a1a:	f040 80ac 	bne.w	20029b76 <mbedtls_rsa_private+0x22a>
20029a1e:	4632      	mov	r2, r6
20029a20:	4641      	mov	r1, r8
20029a22:	4640      	mov	r0, r8
20029a24:	f7fe ff67 	bl	200288f6 <mbedtls_mpi_mod_mpi>
20029a28:	4603      	mov	r3, r0
20029a2a:	2800      	cmp	r0, #0
20029a2c:	f040 80a3 	bne.w	20029b76 <mbedtls_rsa_private+0x22a>
20029a30:	a904      	add	r1, sp, #16
20029a32:	4608      	mov	r0, r1
20029a34:	f104 028c 	add.w	r2, r4, #140	@ 0x8c
20029a38:	f7fe fce8 	bl	2002840c <mbedtls_mpi_mul_mpi>
20029a3c:	4603      	mov	r3, r0
20029a3e:	2800      	cmp	r0, #0
20029a40:	f040 8099 	bne.w	20029b76 <mbedtls_rsa_private+0x22a>
20029a44:	a904      	add	r1, sp, #16
20029a46:	4632      	mov	r2, r6
20029a48:	4608      	mov	r0, r1
20029a4a:	f7fe ff54 	bl	200288f6 <mbedtls_mpi_mod_mpi>
20029a4e:	4603      	mov	r3, r0
20029a50:	2800      	cmp	r0, #0
20029a52:	f040 8090 	bne.w	20029b76 <mbedtls_rsa_private+0x22a>
20029a56:	2201      	movs	r2, #1
20029a58:	f104 012c 	add.w	r1, r4, #44	@ 0x2c
20029a5c:	a80d      	add	r0, sp, #52	@ 0x34
20029a5e:	f7fe fcbf 	bl	200283e0 <mbedtls_mpi_sub_int>
20029a62:	4603      	mov	r3, r0
20029a64:	2800      	cmp	r0, #0
20029a66:	f040 8086 	bne.w	20029b76 <mbedtls_rsa_private+0x22a>
20029a6a:	2201      	movs	r2, #1
20029a6c:	f104 0138 	add.w	r1, r4, #56	@ 0x38
20029a70:	a810      	add	r0, sp, #64	@ 0x40
20029a72:	f7fe fcb5 	bl	200283e0 <mbedtls_mpi_sub_int>
20029a76:	4603      	mov	r3, r0
20029a78:	2800      	cmp	r0, #0
20029a7a:	d17c      	bne.n	20029b76 <mbedtls_rsa_private+0x22a>
20029a7c:	463b      	mov	r3, r7
20029a7e:	462a      	mov	r2, r5
20029a80:	211c      	movs	r1, #28
20029a82:	a813      	add	r0, sp, #76	@ 0x4c
20029a84:	f7ff f9fb 	bl	20028e7e <mbedtls_mpi_fill_random>
20029a88:	4603      	mov	r3, r0
20029a8a:	2800      	cmp	r0, #0
20029a8c:	d173      	bne.n	20029b76 <mbedtls_rsa_private+0x22a>
20029a8e:	aa13      	add	r2, sp, #76	@ 0x4c
20029a90:	a90d      	add	r1, sp, #52	@ 0x34
20029a92:	a816      	add	r0, sp, #88	@ 0x58
20029a94:	f7fe fcba 	bl	2002840c <mbedtls_mpi_mul_mpi>
20029a98:	4603      	mov	r3, r0
20029a9a:	2800      	cmp	r0, #0
20029a9c:	d16b      	bne.n	20029b76 <mbedtls_rsa_private+0x22a>
20029a9e:	a916      	add	r1, sp, #88	@ 0x58
20029aa0:	4652      	mov	r2, sl
20029aa2:	4608      	mov	r0, r1
20029aa4:	f7fe fc4f 	bl	20028346 <mbedtls_mpi_add_mpi>
20029aa8:	4603      	mov	r3, r0
20029aaa:	2800      	cmp	r0, #0
20029aac:	d163      	bne.n	20029b76 <mbedtls_rsa_private+0x22a>
20029aae:	463b      	mov	r3, r7
20029ab0:	462a      	mov	r2, r5
20029ab2:	211c      	movs	r1, #28
20029ab4:	a813      	add	r0, sp, #76	@ 0x4c
20029ab6:	f7ff f9e2 	bl	20028e7e <mbedtls_mpi_fill_random>
20029aba:	4603      	mov	r3, r0
20029abc:	2800      	cmp	r0, #0
20029abe:	d15a      	bne.n	20029b76 <mbedtls_rsa_private+0x22a>
20029ac0:	aa13      	add	r2, sp, #76	@ 0x4c
20029ac2:	a910      	add	r1, sp, #64	@ 0x40
20029ac4:	a819      	add	r0, sp, #100	@ 0x64
20029ac6:	f7fe fca1 	bl	2002840c <mbedtls_mpi_mul_mpi>
20029aca:	4603      	mov	r3, r0
20029acc:	2800      	cmp	r0, #0
20029ace:	d152      	bne.n	20029b76 <mbedtls_rsa_private+0x22a>
20029ad0:	a919      	add	r1, sp, #100	@ 0x64
20029ad2:	464a      	mov	r2, r9
20029ad4:	4608      	mov	r0, r1
20029ad6:	f7fe fc36 	bl	20028346 <mbedtls_mpi_add_mpi>
20029ada:	4603      	mov	r3, r0
20029adc:	2800      	cmp	r0, #0
20029ade:	d14a      	bne.n	20029b76 <mbedtls_rsa_private+0x22a>
20029ae0:	f10d 0964 	add.w	r9, sp, #100	@ 0x64
20029ae4:	f10d 0a58 	add.w	sl, sp, #88	@ 0x58
20029ae8:	f104 0374 	add.w	r3, r4, #116	@ 0x74
20029aec:	f104 082c 	add.w	r8, r4, #44	@ 0x2c
20029af0:	9300      	str	r3, [sp, #0]
20029af2:	4652      	mov	r2, sl
20029af4:	4643      	mov	r3, r8
20029af6:	a904      	add	r1, sp, #16
20029af8:	a807      	add	r0, sp, #28
20029afa:	f7fe ff2e 	bl	2002895a <mbedtls_mpi_exp_mod>
20029afe:	4603      	mov	r3, r0
20029b00:	2800      	cmp	r0, #0
20029b02:	d138      	bne.n	20029b76 <mbedtls_rsa_private+0x22a>
20029b04:	f104 0380 	add.w	r3, r4, #128	@ 0x80
20029b08:	f104 0738 	add.w	r7, r4, #56	@ 0x38
20029b0c:	9300      	str	r3, [sp, #0]
20029b0e:	464a      	mov	r2, r9
20029b10:	463b      	mov	r3, r7
20029b12:	a904      	add	r1, sp, #16
20029b14:	a80a      	add	r0, sp, #40	@ 0x28
20029b16:	f7fe ff20 	bl	2002895a <mbedtls_mpi_exp_mod>
20029b1a:	4603      	mov	r3, r0
20029b1c:	bb58      	cbnz	r0, 20029b76 <mbedtls_rsa_private+0x22a>
20029b1e:	aa0a      	add	r2, sp, #40	@ 0x28
20029b20:	a907      	add	r1, sp, #28
20029b22:	a804      	add	r0, sp, #16
20029b24:	f7fe fc35 	bl	20028392 <mbedtls_mpi_sub_mpi>
20029b28:	4603      	mov	r3, r0
20029b2a:	bb20      	cbnz	r0, 20029b76 <mbedtls_rsa_private+0x22a>
20029b2c:	f104 025c 	add.w	r2, r4, #92	@ 0x5c
20029b30:	a904      	add	r1, sp, #16
20029b32:	a807      	add	r0, sp, #28
20029b34:	f7fe fc6a 	bl	2002840c <mbedtls_mpi_mul_mpi>
20029b38:	4603      	mov	r3, r0
20029b3a:	b9e0      	cbnz	r0, 20029b76 <mbedtls_rsa_private+0x22a>
20029b3c:	4642      	mov	r2, r8
20029b3e:	a907      	add	r1, sp, #28
20029b40:	a804      	add	r0, sp, #16
20029b42:	f7fe fed8 	bl	200288f6 <mbedtls_mpi_mod_mpi>
20029b46:	4603      	mov	r3, r0
20029b48:	b9a8      	cbnz	r0, 20029b76 <mbedtls_rsa_private+0x22a>
20029b4a:	463a      	mov	r2, r7
20029b4c:	a904      	add	r1, sp, #16
20029b4e:	a807      	add	r0, sp, #28
20029b50:	f7fe fc5c 	bl	2002840c <mbedtls_mpi_mul_mpi>
20029b54:	4603      	mov	r3, r0
20029b56:	b970      	cbnz	r0, 20029b76 <mbedtls_rsa_private+0x22a>
20029b58:	aa07      	add	r2, sp, #28
20029b5a:	a90a      	add	r1, sp, #40	@ 0x28
20029b5c:	a804      	add	r0, sp, #16
20029b5e:	f7fe fbf2 	bl	20028346 <mbedtls_mpi_add_mpi>
20029b62:	4603      	mov	r3, r0
20029b64:	b938      	cbnz	r0, 20029b76 <mbedtls_rsa_private+0x22a>
20029b66:	2d00      	cmp	r5, #0
20029b68:	d15f      	bne.n	20029c2a <mbedtls_rsa_private+0x2de>
20029b6a:	6862      	ldr	r2, [r4, #4]
20029b6c:	9926      	ldr	r1, [sp, #152]	@ 0x98
20029b6e:	a804      	add	r0, sp, #16
20029b70:	f7fe f9a1 	bl	20027eb6 <mbedtls_mpi_write_binary>
20029b74:	4603      	mov	r3, r0
20029b76:	a804      	add	r0, sp, #16
20029b78:	9303      	str	r3, [sp, #12]
20029b7a:	f7fe f8a6 	bl	20027cca <mbedtls_mpi_free>
20029b7e:	a807      	add	r0, sp, #28
20029b80:	f7fe f8a3 	bl	20027cca <mbedtls_mpi_free>
20029b84:	a80a      	add	r0, sp, #40	@ 0x28
20029b86:	f7fe f8a0 	bl	20027cca <mbedtls_mpi_free>
20029b8a:	a80d      	add	r0, sp, #52	@ 0x34
20029b8c:	f7fe f89d 	bl	20027cca <mbedtls_mpi_free>
20029b90:	a810      	add	r0, sp, #64	@ 0x40
20029b92:	f7fe f89a 	bl	20027cca <mbedtls_mpi_free>
20029b96:	a813      	add	r0, sp, #76	@ 0x4c
20029b98:	f7fe f897 	bl	20027cca <mbedtls_mpi_free>
20029b9c:	9b03      	ldr	r3, [sp, #12]
20029b9e:	b135      	cbz	r5, 20029bae <mbedtls_rsa_private+0x262>
20029ba0:	a816      	add	r0, sp, #88	@ 0x58
20029ba2:	f7fe f892 	bl	20027cca <mbedtls_mpi_free>
20029ba6:	a819      	add	r0, sp, #100	@ 0x64
20029ba8:	f7fe f88f 	bl	20027cca <mbedtls_mpi_free>
20029bac:	9b03      	ldr	r3, [sp, #12]
20029bae:	b10b      	cbz	r3, 20029bb4 <mbedtls_rsa_private+0x268>
20029bb0:	f5a3 4386 	sub.w	r3, r3, #17152	@ 0x4300
20029bb4:	4618      	mov	r0, r3
20029bb6:	b01d      	add	sp, #116	@ 0x74
20029bb8:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
20029bbc:	9b03      	ldr	r3, [sp, #12]
20029bbe:	3b01      	subs	r3, #1
20029bc0:	9303      	str	r3, [sp, #12]
20029bc2:	d107      	bne.n	20029bd4 <mbedtls_rsa_private+0x288>
20029bc4:	4b24      	ldr	r3, [pc, #144]	@ (20029c58 <mbedtls_rsa_private+0x30c>)
20029bc6:	e7d6      	b.n	20029b76 <mbedtls_rsa_private+0x22a>
20029bc8:	230b      	movs	r3, #11
20029bca:	f104 0b98 	add.w	fp, r4, #152	@ 0x98
20029bce:	9303      	str	r3, [sp, #12]
20029bd0:	f104 088c 	add.w	r8, r4, #140	@ 0x8c
20029bd4:	6861      	ldr	r1, [r4, #4]
20029bd6:	463b      	mov	r3, r7
20029bd8:	462a      	mov	r2, r5
20029bda:	4658      	mov	r0, fp
20029bdc:	3901      	subs	r1, #1
20029bde:	f7ff f94e 	bl	20028e7e <mbedtls_mpi_fill_random>
20029be2:	4603      	mov	r3, r0
20029be4:	2800      	cmp	r0, #0
20029be6:	d1c6      	bne.n	20029b76 <mbedtls_rsa_private+0x22a>
20029be8:	4632      	mov	r2, r6
20029bea:	4659      	mov	r1, fp
20029bec:	4640      	mov	r0, r8
20029bee:	f7ff f8c8 	bl	20028d82 <mbedtls_mpi_gcd>
20029bf2:	4603      	mov	r3, r0
20029bf4:	2800      	cmp	r0, #0
20029bf6:	d1be      	bne.n	20029b76 <mbedtls_rsa_private+0x22a>
20029bf8:	2101      	movs	r1, #1
20029bfa:	4640      	mov	r0, r8
20029bfc:	f7fe faf7 	bl	200281ee <mbedtls_mpi_cmp_int>
20029c00:	2800      	cmp	r0, #0
20029c02:	d1db      	bne.n	20029bbc <mbedtls_rsa_private+0x270>
20029c04:	4632      	mov	r2, r6
20029c06:	4659      	mov	r1, fp
20029c08:	4640      	mov	r0, r8
20029c0a:	f7ff f955 	bl	20028eb8 <mbedtls_mpi_inv_mod>
20029c0e:	4603      	mov	r3, r0
20029c10:	2800      	cmp	r0, #0
20029c12:	d1b0      	bne.n	20029b76 <mbedtls_rsa_private+0x22a>
20029c14:	f104 0368 	add.w	r3, r4, #104	@ 0x68
20029c18:	9300      	str	r3, [sp, #0]
20029c1a:	4641      	mov	r1, r8
20029c1c:	4633      	mov	r3, r6
20029c1e:	4640      	mov	r0, r8
20029c20:	f104 0214 	add.w	r2, r4, #20
20029c24:	f7fe fe99 	bl	2002895a <mbedtls_mpi_exp_mod>
20029c28:	e6fe      	b.n	20029a28 <mbedtls_rsa_private+0xdc>
20029c2a:	a904      	add	r1, sp, #16
20029c2c:	4608      	mov	r0, r1
20029c2e:	f104 0298 	add.w	r2, r4, #152	@ 0x98
20029c32:	f7fe fbeb 	bl	2002840c <mbedtls_mpi_mul_mpi>
20029c36:	4603      	mov	r3, r0
20029c38:	2800      	cmp	r0, #0
20029c3a:	d19c      	bne.n	20029b76 <mbedtls_rsa_private+0x22a>
20029c3c:	a904      	add	r1, sp, #16
20029c3e:	4632      	mov	r2, r6
20029c40:	4608      	mov	r0, r1
20029c42:	f7fe fe58 	bl	200288f6 <mbedtls_mpi_mod_mpi>
20029c46:	4603      	mov	r3, r0
20029c48:	2800      	cmp	r0, #0
20029c4a:	d08e      	beq.n	20029b6a <mbedtls_rsa_private+0x21e>
20029c4c:	e793      	b.n	20029b76 <mbedtls_rsa_private+0x22a>
20029c4e:	f06f 0303 	mvn.w	r3, #3
20029c52:	e790      	b.n	20029b76 <mbedtls_rsa_private+0x22a>
20029c54:	4b01      	ldr	r3, [pc, #4]	@ (20029c5c <mbedtls_rsa_private+0x310>)
20029c56:	e7ad      	b.n	20029bb4 <mbedtls_rsa_private+0x268>
20029c58:	ffffbb80 	.word	0xffffbb80
20029c5c:	ffffbf80 	.word	0xffffbf80

20029c60 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt>:
20029c60:	e92d 4ff7 	stmdb	sp!, {r0, r1, r2, r4, r5, r6, r7, r8, r9, sl, fp, lr}
20029c64:	4698      	mov	r8, r3
20029c66:	e9dd a30c 	ldrd	sl, r3, [sp, #48]	@ 0x30
20029c6a:	f1b8 0f01 	cmp.w	r8, #1
20029c6e:	4606      	mov	r6, r0
20029c70:	460f      	mov	r7, r1
20029c72:	4691      	mov	r9, r2
20029c74:	9d0e      	ldr	r5, [sp, #56]	@ 0x38
20029c76:	d103      	bne.n	20029c80 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0x20>
20029c78:	f8d0 20a4 	ldr.w	r2, [r0, #164]	@ 0xa4
20029c7c:	2a00      	cmp	r2, #0
20029c7e:	d162      	bne.n	20029d46 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xe6>
20029c80:	2f00      	cmp	r7, #0
20029c82:	d060      	beq.n	20029d46 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xe6>
20029c84:	2b00      	cmp	r3, #0
20029c86:	d05e      	beq.n	20029d46 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xe6>
20029c88:	2d00      	cmp	r5, #0
20029c8a:	d05c      	beq.n	20029d46 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xe6>
20029c8c:	f11a 0f0c 	cmn.w	sl, #12
20029c90:	6874      	ldr	r4, [r6, #4]
20029c92:	d858      	bhi.n	20029d46 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xe6>
20029c94:	f10a 020b 	add.w	r2, sl, #11
20029c98:	42a2      	cmp	r2, r4
20029c9a:	d854      	bhi.n	20029d46 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xe6>
20029c9c:	4629      	mov	r1, r5
20029c9e:	2200      	movs	r2, #0
20029ca0:	eba4 040a 	sub.w	r4, r4, sl
20029ca4:	3c03      	subs	r4, #3
20029ca6:	f801 2b02 	strb.w	r2, [r1], #2
20029caa:	f1b8 0f00 	cmp.w	r8, #0
20029cae:	d131      	bne.n	20029d14 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xb4>
20029cb0:	2202      	movs	r2, #2
20029cb2:	4414      	add	r4, r2
20029cb4:	706a      	strb	r2, [r5, #1]
20029cb6:	442c      	add	r4, r5
20029cb8:	42a1      	cmp	r1, r4
20029cba:	d112      	bne.n	20029ce2 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0x82>
20029cbc:	2200      	movs	r2, #0
20029cbe:	4620      	mov	r0, r4
20029cc0:	4619      	mov	r1, r3
20029cc2:	f800 2b01 	strb.w	r2, [r0], #1
20029cc6:	4652      	mov	r2, sl
20029cc8:	f000 fdaa 	bl	2002a820 <memcpy>
20029ccc:	f1b8 0f00 	cmp.w	r8, #0
20029cd0:	d12f      	bne.n	20029d32 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xd2>
20029cd2:	462a      	mov	r2, r5
20029cd4:	4629      	mov	r1, r5
20029cd6:	4630      	mov	r0, r6
20029cd8:	b003      	add	sp, #12
20029cda:	e8bd 4ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20029cde:	f7ff bdff 	b.w	200298e0 <mbedtls_rsa_public>
20029ce2:	f04f 0b64 	mov.w	fp, #100	@ 0x64
20029ce6:	2201      	movs	r2, #1
20029ce8:	4648      	mov	r0, r9
20029cea:	9301      	str	r3, [sp, #4]
20029cec:	9100      	str	r1, [sp, #0]
20029cee:	47b8      	blx	r7
20029cf0:	9900      	ldr	r1, [sp, #0]
20029cf2:	9b01      	ldr	r3, [sp, #4]
20029cf4:	780a      	ldrb	r2, [r1, #0]
20029cf6:	b94a      	cbnz	r2, 20029d0c <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xac>
20029cf8:	f1bb 0b01 	subs.w	fp, fp, #1
20029cfc:	d001      	beq.n	20029d02 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xa2>
20029cfe:	2800      	cmp	r0, #0
20029d00:	d0f1      	beq.n	20029ce6 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0x86>
20029d02:	f5a0 4089 	sub.w	r0, r0, #17536	@ 0x4480
20029d06:	b003      	add	sp, #12
20029d08:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
20029d0c:	2800      	cmp	r0, #0
20029d0e:	d1f8      	bne.n	20029d02 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xa2>
20029d10:	3101      	adds	r1, #1
20029d12:	e7d1      	b.n	20029cb8 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0x58>
20029d14:	2001      	movs	r0, #1
20029d16:	462a      	mov	r2, r5
20029d18:	f04f 0cff 	mov.w	ip, #255	@ 0xff
20029d1c:	f802 0f01 	strb.w	r0, [r2, #1]!
20029d20:	1820      	adds	r0, r4, r0
20029d22:	4428      	add	r0, r5
20029d24:	4282      	cmp	r2, r0
20029d26:	d101      	bne.n	20029d2c <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xcc>
20029d28:	440c      	add	r4, r1
20029d2a:	e7c7      	b.n	20029cbc <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0x5c>
20029d2c:	f802 cf01 	strb.w	ip, [r2, #1]!
20029d30:	e7f8      	b.n	20029d24 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xc4>
20029d32:	462b      	mov	r3, r5
20029d34:	464a      	mov	r2, r9
20029d36:	4639      	mov	r1, r7
20029d38:	4630      	mov	r0, r6
20029d3a:	950c      	str	r5, [sp, #48]	@ 0x30
20029d3c:	b003      	add	sp, #12
20029d3e:	e8bd 4ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20029d42:	f7ff be03 	b.w	2002994c <mbedtls_rsa_private>
20029d46:	4801      	ldr	r0, [pc, #4]	@ (20029d4c <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xec>)
20029d48:	e7dd      	b.n	20029d06 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt+0xa6>
20029d4a:	bf00      	nop
20029d4c:	ffffbf80 	.word	0xffffbf80

20029d50 <mbedtls_rsa_pkcs1_encrypt>:
20029d50:	b410      	push	{r4}
20029d52:	f8d0 40a4 	ldr.w	r4, [r0, #164]	@ 0xa4
20029d56:	b91c      	cbnz	r4, 20029d60 <mbedtls_rsa_pkcs1_encrypt+0x10>
20029d58:	f85d 4b04 	ldr.w	r4, [sp], #4
20029d5c:	f7ff bf80 	b.w	20029c60 <mbedtls_rsa_rsaes_pkcs1_v15_encrypt>
20029d60:	4801      	ldr	r0, [pc, #4]	@ (20029d68 <mbedtls_rsa_pkcs1_encrypt+0x18>)
20029d62:	f85d 4b04 	ldr.w	r4, [sp], #4
20029d66:	4770      	bx	lr
20029d68:	ffffbf00 	.word	0xffffbf00

20029d6c <mbedtls_rsa_rsaes_pkcs1_v15_decrypt>:
20029d6c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
20029d70:	4698      	mov	r8, r3
20029d72:	f5ad 6d81 	sub.w	sp, sp, #1032	@ 0x408
20029d76:	f1b8 0f01 	cmp.w	r8, #1
20029d7a:	f8dd 3424 	ldr.w	r3, [sp, #1060]	@ 0x424
20029d7e:	d103      	bne.n	20029d88 <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0x1c>
20029d80:	f8d0 40a4 	ldr.w	r4, [r0, #164]	@ 0xa4
20029d84:	2c00      	cmp	r4, #0
20029d86:	d17c      	bne.n	20029e82 <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0x116>
20029d88:	6845      	ldr	r5, [r0, #4]
20029d8a:	f1a5 0410 	sub.w	r4, r5, #16
20029d8e:	f5b4 7f7c 	cmp.w	r4, #1008	@ 0x3f0
20029d92:	d876      	bhi.n	20029e82 <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0x116>
20029d94:	ae02      	add	r6, sp, #8
20029d96:	f1b8 0f00 	cmp.w	r8, #0
20029d9a:	d153      	bne.n	20029e44 <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0xd8>
20029d9c:	4632      	mov	r2, r6
20029d9e:	4619      	mov	r1, r3
20029da0:	f7ff fd9e 	bl	200298e0 <mbedtls_rsa_public>
20029da4:	4604      	mov	r4, r0
20029da6:	2800      	cmp	r0, #0
20029da8:	d140      	bne.n	20029e2c <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0xc0>
20029daa:	f1b8 0f01 	cmp.w	r8, #1
20029dae:	7831      	ldrb	r1, [r6, #0]
20029db0:	7872      	ldrb	r2, [r6, #1]
20029db2:	f1a5 0703 	sub.w	r7, r5, #3
20029db6:	d149      	bne.n	20029e4c <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0xe0>
20029db8:	f082 0202 	eor.w	r2, r2, #2
20029dbc:	ea41 0302 	orr.w	r3, r1, r2
20029dc0:	4684      	mov	ip, r0
20029dc2:	4686      	mov	lr, r0
20029dc4:	4602      	mov	r2, r0
20029dc6:	f10d 0109 	add.w	r1, sp, #9
20029dca:	f811 0f01 	ldrb.w	r0, [r1, #1]!
20029dce:	f10e 0e01 	add.w	lr, lr, #1
20029dd2:	f1c0 0800 	rsb	r8, r0, #0
20029dd6:	ea40 0008 	orr.w	r0, r0, r8
20029dda:	f3c0 10c0 	ubfx	r0, r0, #7, #1
20029dde:	f080 0001 	eor.w	r0, r0, #1
20029de2:	ea4c 0c00 	orr.w	ip, ip, r0
20029de6:	f1cc 0000 	rsb	r0, ip, #0
20029dea:	ea4c 0000 	orr.w	r0, ip, r0
20029dee:	f3c0 10c0 	ubfx	r0, r0, #7, #1
20029df2:	f080 0001 	eor.w	r0, r0, #1
20029df6:	45be      	cmp	lr, r7
20029df8:	4402      	add	r2, r0
20029dfa:	d3e6      	bcc.n	20029dca <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0x5e>
20029dfc:	f10d 000a 	add.w	r0, sp, #10
20029e00:	1881      	adds	r1, r0, r2
20029e02:	5c80      	ldrb	r0, [r0, r2]
20029e04:	3101      	adds	r1, #1
20029e06:	4303      	orrs	r3, r0
20029e08:	2a07      	cmp	r2, #7
20029e0a:	bf98      	it	ls
20029e0c:	f043 0301 	orrls.w	r3, r3, #1
20029e10:	bb9b      	cbnz	r3, 20029e7a <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0x10e>
20029e12:	1b8b      	subs	r3, r1, r6
20029e14:	1aea      	subs	r2, r5, r3
20029e16:	f8dd 342c 	ldr.w	r3, [sp, #1068]	@ 0x42c
20029e1a:	429a      	cmp	r2, r3
20029e1c:	d82f      	bhi.n	20029e7e <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0x112>
20029e1e:	f8dd 3420 	ldr.w	r3, [sp, #1056]	@ 0x420
20029e22:	f8dd 0428 	ldr.w	r0, [sp, #1064]	@ 0x428
20029e26:	601a      	str	r2, [r3, #0]
20029e28:	f000 fcfa 	bl	2002a820 <memcpy>
20029e2c:	2300      	movs	r3, #0
20029e2e:	461a      	mov	r2, r3
20029e30:	54f2      	strb	r2, [r6, r3]
20029e32:	3301      	adds	r3, #1
20029e34:	f5b3 6f80 	cmp.w	r3, #1024	@ 0x400
20029e38:	d1fa      	bne.n	20029e30 <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0xc4>
20029e3a:	4620      	mov	r0, r4
20029e3c:	f50d 6d81 	add.w	sp, sp, #1032	@ 0x408
20029e40:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
20029e44:	9600      	str	r6, [sp, #0]
20029e46:	f7ff fd81 	bl	2002994c <mbedtls_rsa_private>
20029e4a:	e7ab      	b.n	20029da4 <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0x38>
20029e4c:	f082 0201 	eor.w	r2, r2, #1
20029e50:	ea41 0302 	orr.w	r3, r1, r2
20029e54:	4684      	mov	ip, r0
20029e56:	4602      	mov	r2, r0
20029e58:	f10d 0109 	add.w	r1, sp, #9
20029e5c:	f811 ef01 	ldrb.w	lr, [r1, #1]!
20029e60:	3001      	adds	r0, #1
20029e62:	f1be 0fff 	cmp.w	lr, #255	@ 0xff
20029e66:	bf18      	it	ne
20029e68:	f04c 0c01 	orrne.w	ip, ip, #1
20029e6c:	42b8      	cmp	r0, r7
20029e6e:	f08c 0e01 	eor.w	lr, ip, #1
20029e72:	fa52 f28e 	uxtab	r2, r2, lr
20029e76:	d3f1      	bcc.n	20029e5c <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0xf0>
20029e78:	e7c0      	b.n	20029dfc <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0x90>
20029e7a:	4c03      	ldr	r4, [pc, #12]	@ (20029e88 <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0x11c>)
20029e7c:	e7d6      	b.n	20029e2c <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0xc0>
20029e7e:	4c03      	ldr	r4, [pc, #12]	@ (20029e8c <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0x120>)
20029e80:	e7d4      	b.n	20029e2c <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0xc0>
20029e82:	4c03      	ldr	r4, [pc, #12]	@ (20029e90 <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0x124>)
20029e84:	e7d9      	b.n	20029e3a <mbedtls_rsa_rsaes_pkcs1_v15_decrypt+0xce>
20029e86:	bf00      	nop
20029e88:	ffffbf00 	.word	0xffffbf00
20029e8c:	ffffbc00 	.word	0xffffbc00
20029e90:	ffffbf80 	.word	0xffffbf80

20029e94 <mbedtls_rsa_pkcs1_decrypt>:
20029e94:	b410      	push	{r4}
20029e96:	f8d0 40a4 	ldr.w	r4, [r0, #164]	@ 0xa4
20029e9a:	b91c      	cbnz	r4, 20029ea4 <mbedtls_rsa_pkcs1_decrypt+0x10>
20029e9c:	f85d 4b04 	ldr.w	r4, [sp], #4
20029ea0:	f7ff bf64 	b.w	20029d6c <mbedtls_rsa_rsaes_pkcs1_v15_decrypt>
20029ea4:	4801      	ldr	r0, [pc, #4]	@ (20029eac <mbedtls_rsa_pkcs1_decrypt+0x18>)
20029ea6:	f85d 4b04 	ldr.w	r4, [sp], #4
20029eaa:	4770      	bx	lr
20029eac:	ffffbf00 	.word	0xffffbf00

20029eb0 <mbedtls_rsa_rsassa_pkcs1_v15_sign>:
20029eb0:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
20029eb4:	4692      	mov	sl, r2
20029eb6:	2200      	movs	r2, #0
20029eb8:	b089      	sub	sp, #36	@ 0x24
20029eba:	2b01      	cmp	r3, #1
20029ebc:	4604      	mov	r4, r0
20029ebe:	461f      	mov	r7, r3
20029ec0:	e9cd 2206 	strd	r2, r2, [sp, #24]
20029ec4:	f89d 8048 	ldrb.w	r8, [sp, #72]	@ 0x48
20029ec8:	f8dd 904c 	ldr.w	r9, [sp, #76]	@ 0x4c
20029ecc:	9e15      	ldr	r6, [sp, #84]	@ 0x54
20029ece:	9102      	str	r1, [sp, #8]
20029ed0:	d107      	bne.n	20029ee2 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x32>
20029ed2:	f8d0 20a4 	ldr.w	r2, [r0, #164]	@ 0xa4
20029ed6:	b122      	cbz	r2, 20029ee2 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x32>
20029ed8:	4d59      	ldr	r5, [pc, #356]	@ (2002a040 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x190>)
20029eda:	4628      	mov	r0, r5
20029edc:	b009      	add	sp, #36	@ 0x24
20029ede:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
20029ee2:	f8d4 b004 	ldr.w	fp, [r4, #4]
20029ee6:	f1ab 0503 	sub.w	r5, fp, #3
20029eea:	f1b8 0f00 	cmp.w	r8, #0
20029eee:	d014      	beq.n	20029f1a <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x6a>
20029ef0:	4640      	mov	r0, r8
20029ef2:	f7fb ff75 	bl	20025de0 <mbedtls_md_info_from_type>
20029ef6:	4681      	mov	r9, r0
20029ef8:	2800      	cmp	r0, #0
20029efa:	d0ed      	beq.n	20029ed8 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x28>
20029efc:	4640      	mov	r0, r8
20029efe:	aa06      	add	r2, sp, #24
20029f00:	a907      	add	r1, sp, #28
20029f02:	f7ff f9d3 	bl	200292ac <mbedtls_oid_get_oid_by_md>
20029f06:	2800      	cmp	r0, #0
20029f08:	d1e6      	bne.n	20029ed8 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x28>
20029f0a:	9a06      	ldr	r2, [sp, #24]
20029f0c:	4648      	mov	r0, r9
20029f0e:	1aaa      	subs	r2, r5, r2
20029f10:	f1a2 050a 	sub.w	r5, r2, #10
20029f14:	f7fb ff70 	bl	20025df8 <mbedtls_md_get_size>
20029f18:	4681      	mov	r9, r0
20029f1a:	eba5 0209 	sub.w	r2, r5, r9
20029f1e:	2a07      	cmp	r2, #7
20029f20:	d9da      	bls.n	20029ed8 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x28>
20029f22:	4593      	cmp	fp, r2
20029f24:	d3d8      	bcc.n	20029ed8 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x28>
20029f26:	46b3      	mov	fp, r6
20029f28:	2500      	movs	r5, #0
20029f2a:	2101      	movs	r1, #1
20029f2c:	f80b 5b02 	strb.w	r5, [fp], #2
20029f30:	4658      	mov	r0, fp
20029f32:	7071      	strb	r1, [r6, #1]
20029f34:	21ff      	movs	r1, #255	@ 0xff
20029f36:	9203      	str	r2, [sp, #12]
20029f38:	f000 fc58 	bl	2002a7ec <memset>
20029f3c:	9a03      	ldr	r2, [sp, #12]
20029f3e:	eb0b 0002 	add.w	r0, fp, r2
20029f42:	f80b 5002 	strb.w	r5, [fp, r2]
20029f46:	f1b8 0f00 	cmp.w	r8, #0
20029f4a:	d10c      	bne.n	20029f66 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0xb6>
20029f4c:	464a      	mov	r2, r9
20029f4e:	9914      	ldr	r1, [sp, #80]	@ 0x50
20029f50:	3001      	adds	r0, #1
20029f52:	f000 fc65 	bl	2002a820 <memcpy>
20029f56:	bb8f      	cbnz	r7, 20029fbc <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x10c>
20029f58:	4632      	mov	r2, r6
20029f5a:	4631      	mov	r1, r6
20029f5c:	4620      	mov	r0, r4
20029f5e:	f7ff fcbf 	bl	200298e0 <mbedtls_rsa_public>
20029f62:	4605      	mov	r5, r0
20029f64:	e7b9      	b.n	20029eda <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x2a>
20029f66:	2130      	movs	r1, #48	@ 0x30
20029f68:	7041      	strb	r1, [r0, #1]
20029f6a:	9a06      	ldr	r2, [sp, #24]
20029f6c:	70c1      	strb	r1, [r0, #3]
20029f6e:	3208      	adds	r2, #8
20029f70:	fa52 f289 	uxtab	r2, r2, r9
20029f74:	7082      	strb	r2, [r0, #2]
20029f76:	9a06      	ldr	r2, [sp, #24]
20029f78:	f100 0807 	add.w	r8, r0, #7
20029f7c:	b2d1      	uxtb	r1, r2
20029f7e:	f101 0c04 	add.w	ip, r1, #4
20029f82:	f880 c004 	strb.w	ip, [r0, #4]
20029f86:	f04f 0c06 	mov.w	ip, #6
20029f8a:	7181      	strb	r1, [r0, #6]
20029f8c:	f880 c005 	strb.w	ip, [r0, #5]
20029f90:	9907      	ldr	r1, [sp, #28]
20029f92:	4640      	mov	r0, r8
20029f94:	9203      	str	r2, [sp, #12]
20029f96:	f000 fc43 	bl	2002a820 <memcpy>
20029f9a:	2105      	movs	r1, #5
20029f9c:	9a03      	ldr	r2, [sp, #12]
20029f9e:	fa5f fb89 	uxtb.w	fp, r9
20029fa2:	eb08 0002 	add.w	r0, r8, r2
20029fa6:	f808 1002 	strb.w	r1, [r8, r2]
20029faa:	2204      	movs	r2, #4
20029fac:	7045      	strb	r5, [r0, #1]
20029fae:	7082      	strb	r2, [r0, #2]
20029fb0:	f880 b003 	strb.w	fp, [r0, #3]
20029fb4:	464a      	mov	r2, r9
20029fb6:	9914      	ldr	r1, [sp, #80]	@ 0x50
20029fb8:	3004      	adds	r0, #4
20029fba:	e7ca      	b.n	20029f52 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0xa2>
20029fbc:	6865      	ldr	r5, [r4, #4]
20029fbe:	2001      	movs	r0, #1
20029fc0:	4629      	mov	r1, r5
20029fc2:	f000 fb31 	bl	2002a628 <calloc>
20029fc6:	4607      	mov	r7, r0
20029fc8:	b140      	cbz	r0, 20029fdc <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x12c>
20029fca:	4629      	mov	r1, r5
20029fcc:	2001      	movs	r0, #1
20029fce:	f000 fb2b 	bl	2002a628 <calloc>
20029fd2:	4680      	mov	r8, r0
20029fd4:	b928      	cbnz	r0, 20029fe2 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x132>
20029fd6:	4638      	mov	r0, r7
20029fd8:	f000 fb42 	bl	2002a660 <free>
20029fdc:	f06f 050f 	mvn.w	r5, #15
20029fe0:	e77b      	b.n	20029eda <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x2a>
20029fe2:	4633      	mov	r3, r6
20029fe4:	4652      	mov	r2, sl
20029fe6:	4620      	mov	r0, r4
20029fe8:	9902      	ldr	r1, [sp, #8]
20029fea:	9700      	str	r7, [sp, #0]
20029fec:	f7ff fcae 	bl	2002994c <mbedtls_rsa_private>
20029ff0:	4605      	mov	r5, r0
20029ff2:	b9a0      	cbnz	r0, 2002a01e <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x16e>
20029ff4:	4642      	mov	r2, r8
20029ff6:	4639      	mov	r1, r7
20029ff8:	4620      	mov	r0, r4
20029ffa:	f7ff fc71 	bl	200298e0 <mbedtls_rsa_public>
20029ffe:	4605      	mov	r5, r0
2002a000:	b968      	cbnz	r0, 2002a01e <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x16e>
2002a002:	4601      	mov	r1, r0
2002a004:	4603      	mov	r3, r0
2002a006:	6862      	ldr	r2, [r4, #4]
2002a008:	429a      	cmp	r2, r3
2002a00a:	d10f      	bne.n	2002a02c <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x17c>
2002a00c:	f88d 1017 	strb.w	r1, [sp, #23]
2002a010:	f89d 3017 	ldrb.w	r3, [sp, #23]
2002a014:	b98b      	cbnz	r3, 2002a03a <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x18a>
2002a016:	4639      	mov	r1, r7
2002a018:	4630      	mov	r0, r6
2002a01a:	f000 fc01 	bl	2002a820 <memcpy>
2002a01e:	4638      	mov	r0, r7
2002a020:	f000 fb1e 	bl	2002a660 <free>
2002a024:	4640      	mov	r0, r8
2002a026:	f000 fb1b 	bl	2002a660 <free>
2002a02a:	e756      	b.n	20029eda <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x2a>
2002a02c:	f818 0003 	ldrb.w	r0, [r8, r3]
2002a030:	5cf4      	ldrb	r4, [r6, r3]
2002a032:	3301      	adds	r3, #1
2002a034:	4060      	eors	r0, r4
2002a036:	4301      	orrs	r1, r0
2002a038:	e7e6      	b.n	2002a008 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x158>
2002a03a:	4d02      	ldr	r5, [pc, #8]	@ (2002a044 <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x194>)
2002a03c:	e7ef      	b.n	2002a01e <mbedtls_rsa_rsassa_pkcs1_v15_sign+0x16e>
2002a03e:	bf00      	nop
2002a040:	ffffbf80 	.word	0xffffbf80
2002a044:	ffffbd00 	.word	0xffffbd00

2002a048 <mbedtls_rsa_pkcs1_sign>:
2002a048:	b430      	push	{r4, r5}
2002a04a:	f8d0 50a4 	ldr.w	r5, [r0, #164]	@ 0xa4
2002a04e:	f89d 4008 	ldrb.w	r4, [sp, #8]
2002a052:	b91d      	cbnz	r5, 2002a05c <mbedtls_rsa_pkcs1_sign+0x14>
2002a054:	9402      	str	r4, [sp, #8]
2002a056:	bc30      	pop	{r4, r5}
2002a058:	f7ff bf2a 	b.w	20029eb0 <mbedtls_rsa_rsassa_pkcs1_v15_sign>
2002a05c:	4801      	ldr	r0, [pc, #4]	@ (2002a064 <mbedtls_rsa_pkcs1_sign+0x1c>)
2002a05e:	bc30      	pop	{r4, r5}
2002a060:	4770      	bx	lr
2002a062:	bf00      	nop
2002a064:	ffffbf00 	.word	0xffffbf00

2002a068 <mbedtls_rsa_rsassa_pkcs1_v15_verify>:
2002a068:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
2002a06c:	461c      	mov	r4, r3
2002a06e:	f2ad 4d2c 	subw	sp, sp, #1068	@ 0x42c
2002a072:	f89d 3450 	ldrb.w	r3, [sp, #1104]	@ 0x450
2002a076:	2c01      	cmp	r4, #1
2002a078:	9303      	str	r3, [sp, #12]
2002a07a:	f8dd 8454 	ldr.w	r8, [sp, #1108]	@ 0x454
2002a07e:	f8dd 345c 	ldr.w	r3, [sp, #1116]	@ 0x45c
2002a082:	d108      	bne.n	2002a096 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x2e>
2002a084:	f8d0 50a4 	ldr.w	r5, [r0, #164]	@ 0xa4
2002a088:	b12d      	cbz	r5, 2002a096 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x2e>
2002a08a:	4d60      	ldr	r5, [pc, #384]	@ (2002a20c <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x1a4>)
2002a08c:	4628      	mov	r0, r5
2002a08e:	f20d 4d2c 	addw	sp, sp, #1068	@ 0x42c
2002a092:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
2002a096:	6846      	ldr	r6, [r0, #4]
2002a098:	f1a6 0510 	sub.w	r5, r6, #16
2002a09c:	f5b5 7f7c 	cmp.w	r5, #1008	@ 0x3f0
2002a0a0:	d8f3      	bhi.n	2002a08a <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x22>
2002a0a2:	af0a      	add	r7, sp, #40	@ 0x28
2002a0a4:	b954      	cbnz	r4, 2002a0bc <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x54>
2002a0a6:	463a      	mov	r2, r7
2002a0a8:	4619      	mov	r1, r3
2002a0aa:	f7ff fc19 	bl	200298e0 <mbedtls_rsa_public>
2002a0ae:	4605      	mov	r5, r0
2002a0b0:	2800      	cmp	r0, #0
2002a0b2:	d1eb      	bne.n	2002a08c <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x24>
2002a0b4:	783b      	ldrb	r3, [r7, #0]
2002a0b6:	b12b      	cbz	r3, 2002a0c4 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x5c>
2002a0b8:	4d55      	ldr	r5, [pc, #340]	@ (2002a210 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x1a8>)
2002a0ba:	e7e7      	b.n	2002a08c <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x24>
2002a0bc:	9700      	str	r7, [sp, #0]
2002a0be:	f7ff fc45 	bl	2002994c <mbedtls_rsa_private>
2002a0c2:	e7f4      	b.n	2002a0ae <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x46>
2002a0c4:	787b      	ldrb	r3, [r7, #1]
2002a0c6:	ac06      	add	r4, sp, #24
2002a0c8:	f10d 002a 	add.w	r0, sp, #42	@ 0x2a
2002a0cc:	2b01      	cmp	r3, #1
2002a0ce:	6020      	str	r0, [r4, #0]
2002a0d0:	d1f2      	bne.n	2002a0b8 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x50>
2002a0d2:	1e73      	subs	r3, r6, #1
2002a0d4:	443b      	add	r3, r7
2002a0d6:	7802      	ldrb	r2, [r0, #0]
2002a0d8:	b992      	cbnz	r2, 2002a100 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x98>
2002a0da:	3001      	adds	r0, #1
2002a0dc:	1bc7      	subs	r7, r0, r7
2002a0de:	2f0a      	cmp	r7, #10
2002a0e0:	6020      	str	r0, [r4, #0]
2002a0e2:	dde9      	ble.n	2002a0b8 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x50>
2002a0e4:	1bf6      	subs	r6, r6, r7
2002a0e6:	4546      	cmp	r6, r8
2002a0e8:	d112      	bne.n	2002a110 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0xa8>
2002a0ea:	9b03      	ldr	r3, [sp, #12]
2002a0ec:	b983      	cbnz	r3, 2002a110 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0xa8>
2002a0ee:	4642      	mov	r2, r8
2002a0f0:	f8dd 1458 	ldr.w	r1, [sp, #1112]	@ 0x458
2002a0f4:	f000 fb6a 	bl	2002a7cc <memcmp>
2002a0f8:	2800      	cmp	r0, #0
2002a0fa:	d0c7      	beq.n	2002a08c <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x24>
2002a0fc:	4d45      	ldr	r5, [pc, #276]	@ (2002a214 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x1ac>)
2002a0fe:	e7c5      	b.n	2002a08c <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x24>
2002a100:	4298      	cmp	r0, r3
2002a102:	d2d9      	bcs.n	2002a0b8 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x50>
2002a104:	2aff      	cmp	r2, #255	@ 0xff
2002a106:	f100 0001 	add.w	r0, r0, #1
2002a10a:	d1d5      	bne.n	2002a0b8 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x50>
2002a10c:	6020      	str	r0, [r4, #0]
2002a10e:	e7e2      	b.n	2002a0d6 <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x6e>
2002a110:	9803      	ldr	r0, [sp, #12]
2002a112:	f7fb fe65 	bl	20025de0 <mbedtls_md_info_from_type>
2002a116:	2800      	cmp	r0, #0
2002a118:	d0b7      	beq.n	2002a08a <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x22>
2002a11a:	f7fb fe6d 	bl	20025df8 <mbedtls_md_get_size>
2002a11e:	f8d4 a000 	ldr.w	sl, [r4]
2002a122:	af05      	add	r7, sp, #20
2002a124:	eb0a 0806 	add.w	r8, sl, r6
2002a128:	4681      	mov	r9, r0
2002a12a:	2330      	movs	r3, #48	@ 0x30
2002a12c:	463a      	mov	r2, r7
2002a12e:	4641      	mov	r1, r8
2002a130:	4620      	mov	r0, r4
2002a132:	f7fd fb95 	bl	20027860 <mbedtls_asn1_get_tag>
2002a136:	2800      	cmp	r0, #0
2002a138:	d1e0      	bne.n	2002a0fc <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a13a:	f8d4 b000 	ldr.w	fp, [r4]
2002a13e:	f10a 0a02 	add.w	sl, sl, #2
2002a142:	45d3      	cmp	fp, sl
2002a144:	d1da      	bne.n	2002a0fc <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a146:	683b      	ldr	r3, [r7, #0]
2002a148:	3302      	adds	r3, #2
2002a14a:	42b3      	cmp	r3, r6
2002a14c:	d1d6      	bne.n	2002a0fc <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a14e:	2330      	movs	r3, #48	@ 0x30
2002a150:	463a      	mov	r2, r7
2002a152:	4641      	mov	r1, r8
2002a154:	4620      	mov	r0, r4
2002a156:	f7fd fb83 	bl	20027860 <mbedtls_asn1_get_tag>
2002a15a:	2800      	cmp	r0, #0
2002a15c:	d1ce      	bne.n	2002a0fc <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a15e:	f8d4 a000 	ldr.w	sl, [r4]
2002a162:	f10b 0b02 	add.w	fp, fp, #2
2002a166:	45da      	cmp	sl, fp
2002a168:	d1c8      	bne.n	2002a0fc <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a16a:	683b      	ldr	r3, [r7, #0]
2002a16c:	3306      	adds	r3, #6
2002a16e:	444b      	add	r3, r9
2002a170:	42b3      	cmp	r3, r6
2002a172:	d1c3      	bne.n	2002a0fc <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a174:	2306      	movs	r3, #6
2002a176:	4641      	mov	r1, r8
2002a178:	4620      	mov	r0, r4
2002a17a:	aa08      	add	r2, sp, #32
2002a17c:	ae07      	add	r6, sp, #28
2002a17e:	f7fd fb6f 	bl	20027860 <mbedtls_asn1_get_tag>
2002a182:	2800      	cmp	r0, #0
2002a184:	d1ba      	bne.n	2002a0fc <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a186:	6823      	ldr	r3, [r4, #0]
2002a188:	f10a 0a02 	add.w	sl, sl, #2
2002a18c:	4553      	cmp	r3, sl
2002a18e:	d1b5      	bne.n	2002a0fc <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a190:	9a08      	ldr	r2, [sp, #32]
2002a192:	f10d 0a13 	add.w	sl, sp, #19
2002a196:	9309      	str	r3, [sp, #36]	@ 0x24
2002a198:	4651      	mov	r1, sl
2002a19a:	4413      	add	r3, r2
2002a19c:	4630      	mov	r0, r6
2002a19e:	6023      	str	r3, [r4, #0]
2002a1a0:	f7ff f86a 	bl	20029278 <mbedtls_oid_get_md_alg>
2002a1a4:	2800      	cmp	r0, #0
2002a1a6:	d1a9      	bne.n	2002a0fc <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a1a8:	f89d 3013 	ldrb.w	r3, [sp, #19]
2002a1ac:	9a03      	ldr	r2, [sp, #12]
2002a1ae:	4293      	cmp	r3, r2
2002a1b0:	d1a4      	bne.n	2002a0fc <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a1b2:	2305      	movs	r3, #5
2002a1b4:	463a      	mov	r2, r7
2002a1b6:	4641      	mov	r1, r8
2002a1b8:	4620      	mov	r0, r4
2002a1ba:	f8d4 a000 	ldr.w	sl, [r4]
2002a1be:	f7fd fb4f 	bl	20027860 <mbedtls_asn1_get_tag>
2002a1c2:	2800      	cmp	r0, #0
2002a1c4:	d19a      	bne.n	2002a0fc <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a1c6:	6826      	ldr	r6, [r4, #0]
2002a1c8:	f10a 0a02 	add.w	sl, sl, #2
2002a1cc:	4556      	cmp	r6, sl
2002a1ce:	d195      	bne.n	2002a0fc <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a1d0:	2304      	movs	r3, #4
2002a1d2:	463a      	mov	r2, r7
2002a1d4:	4641      	mov	r1, r8
2002a1d6:	4620      	mov	r0, r4
2002a1d8:	f7fd fb42 	bl	20027860 <mbedtls_asn1_get_tag>
2002a1dc:	2800      	cmp	r0, #0
2002a1de:	d18d      	bne.n	2002a0fc <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a1e0:	6824      	ldr	r4, [r4, #0]
2002a1e2:	3602      	adds	r6, #2
2002a1e4:	42b4      	cmp	r4, r6
2002a1e6:	d189      	bne.n	2002a0fc <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a1e8:	683b      	ldr	r3, [r7, #0]
2002a1ea:	454b      	cmp	r3, r9
2002a1ec:	d186      	bne.n	2002a0fc <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a1ee:	464a      	mov	r2, r9
2002a1f0:	4620      	mov	r0, r4
2002a1f2:	f8dd 1458 	ldr.w	r1, [sp, #1112]	@ 0x458
2002a1f6:	f000 fae9 	bl	2002a7cc <memcmp>
2002a1fa:	2800      	cmp	r0, #0
2002a1fc:	f47f af7e 	bne.w	2002a0fc <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a200:	444c      	add	r4, r9
2002a202:	45a0      	cmp	r8, r4
2002a204:	f43f af42 	beq.w	2002a08c <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x24>
2002a208:	e778      	b.n	2002a0fc <mbedtls_rsa_rsassa_pkcs1_v15_verify+0x94>
2002a20a:	bf00      	nop
2002a20c:	ffffbf80 	.word	0xffffbf80
2002a210:	ffffbf00 	.word	0xffffbf00
2002a214:	ffffbc80 	.word	0xffffbc80

2002a218 <mbedtls_rsa_pkcs1_verify>:
2002a218:	b430      	push	{r4, r5}
2002a21a:	f8d0 50a4 	ldr.w	r5, [r0, #164]	@ 0xa4
2002a21e:	f89d 4008 	ldrb.w	r4, [sp, #8]
2002a222:	b91d      	cbnz	r5, 2002a22c <mbedtls_rsa_pkcs1_verify+0x14>
2002a224:	9402      	str	r4, [sp, #8]
2002a226:	bc30      	pop	{r4, r5}
2002a228:	f7ff bf1e 	b.w	2002a068 <mbedtls_rsa_rsassa_pkcs1_v15_verify>
2002a22c:	4801      	ldr	r0, [pc, #4]	@ (2002a234 <mbedtls_rsa_pkcs1_verify+0x1c>)
2002a22e:	bc30      	pop	{r4, r5}
2002a230:	4770      	bx	lr
2002a232:	bf00      	nop
2002a234:	ffffbf00 	.word	0xffffbf00

2002a238 <mbedtls_rsa_free>:
2002a238:	b510      	push	{r4, lr}
2002a23a:	4604      	mov	r4, r0
2002a23c:	308c      	adds	r0, #140	@ 0x8c
2002a23e:	f7fd fd44 	bl	20027cca <mbedtls_mpi_free>
2002a242:	f104 0098 	add.w	r0, r4, #152	@ 0x98
2002a246:	f7fd fd40 	bl	20027cca <mbedtls_mpi_free>
2002a24a:	f104 0080 	add.w	r0, r4, #128	@ 0x80
2002a24e:	f7fd fd3c 	bl	20027cca <mbedtls_mpi_free>
2002a252:	f104 0074 	add.w	r0, r4, #116	@ 0x74
2002a256:	f7fd fd38 	bl	20027cca <mbedtls_mpi_free>
2002a25a:	f104 0068 	add.w	r0, r4, #104	@ 0x68
2002a25e:	f7fd fd34 	bl	20027cca <mbedtls_mpi_free>
2002a262:	f104 005c 	add.w	r0, r4, #92	@ 0x5c
2002a266:	f7fd fd30 	bl	20027cca <mbedtls_mpi_free>
2002a26a:	f104 0050 	add.w	r0, r4, #80	@ 0x50
2002a26e:	f7fd fd2c 	bl	20027cca <mbedtls_mpi_free>
2002a272:	f104 0044 	add.w	r0, r4, #68	@ 0x44
2002a276:	f7fd fd28 	bl	20027cca <mbedtls_mpi_free>
2002a27a:	f104 0038 	add.w	r0, r4, #56	@ 0x38
2002a27e:	f7fd fd24 	bl	20027cca <mbedtls_mpi_free>
2002a282:	f104 002c 	add.w	r0, r4, #44	@ 0x2c
2002a286:	f7fd fd20 	bl	20027cca <mbedtls_mpi_free>
2002a28a:	f104 0020 	add.w	r0, r4, #32
2002a28e:	f7fd fd1c 	bl	20027cca <mbedtls_mpi_free>
2002a292:	f104 0014 	add.w	r0, r4, #20
2002a296:	f7fd fd18 	bl	20027cca <mbedtls_mpi_free>
2002a29a:	f104 0008 	add.w	r0, r4, #8
2002a29e:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
2002a2a2:	f7fd bd12 	b.w	20027cca <mbedtls_mpi_free>
	...

2002a2a8 <__aeabi_uldivmod>:
2002a2a8:	b953      	cbnz	r3, 2002a2c0 <__aeabi_uldivmod+0x18>
2002a2aa:	b94a      	cbnz	r2, 2002a2c0 <__aeabi_uldivmod+0x18>
2002a2ac:	2900      	cmp	r1, #0
2002a2ae:	bf08      	it	eq
2002a2b0:	2800      	cmpeq	r0, #0
2002a2b2:	bf1c      	itt	ne
2002a2b4:	f04f 31ff 	movne.w	r1, #4294967295
2002a2b8:	f04f 30ff 	movne.w	r0, #4294967295
2002a2bc:	f000 b9b2 	b.w	2002a624 <__aeabi_idiv0>
2002a2c0:	f1ad 0c08 	sub.w	ip, sp, #8
2002a2c4:	e96d ce04 	strd	ip, lr, [sp, #-16]!
2002a2c8:	f000 f806 	bl	2002a2d8 <__udivmoddi4>
2002a2cc:	f8dd e004 	ldr.w	lr, [sp, #4]
2002a2d0:	e9dd 2302 	ldrd	r2, r3, [sp, #8]
2002a2d4:	b004      	add	sp, #16
2002a2d6:	4770      	bx	lr

2002a2d8 <__udivmoddi4>:
2002a2d8:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
2002a2dc:	468c      	mov	ip, r1
2002a2de:	9e09      	ldr	r6, [sp, #36]	@ 0x24
2002a2e0:	4604      	mov	r4, r0
2002a2e2:	460f      	mov	r7, r1
2002a2e4:	2b00      	cmp	r3, #0
2002a2e6:	d148      	bne.n	2002a37a <__udivmoddi4+0xa2>
2002a2e8:	428a      	cmp	r2, r1
2002a2ea:	4615      	mov	r5, r2
2002a2ec:	d95e      	bls.n	2002a3ac <__udivmoddi4+0xd4>
2002a2ee:	fab2 f382 	clz	r3, r2
2002a2f2:	b13b      	cbz	r3, 2002a304 <__udivmoddi4+0x2c>
2002a2f4:	f1c3 0220 	rsb	r2, r3, #32
2002a2f8:	409f      	lsls	r7, r3
2002a2fa:	409d      	lsls	r5, r3
2002a2fc:	409c      	lsls	r4, r3
2002a2fe:	fa20 f202 	lsr.w	r2, r0, r2
2002a302:	4317      	orrs	r7, r2
2002a304:	ea4f 4e15 	mov.w	lr, r5, lsr #16
2002a308:	fa1f fc85 	uxth.w	ip, r5
2002a30c:	0c22      	lsrs	r2, r4, #16
2002a30e:	fbb7 f1fe 	udiv	r1, r7, lr
2002a312:	fb0e 7711 	mls	r7, lr, r1, r7
2002a316:	fb01 f00c 	mul.w	r0, r1, ip
2002a31a:	ea42 4207 	orr.w	r2, r2, r7, lsl #16
2002a31e:	4290      	cmp	r0, r2
2002a320:	d907      	bls.n	2002a332 <__udivmoddi4+0x5a>
2002a322:	18aa      	adds	r2, r5, r2
2002a324:	f101 37ff 	add.w	r7, r1, #4294967295
2002a328:	d202      	bcs.n	2002a330 <__udivmoddi4+0x58>
2002a32a:	4290      	cmp	r0, r2
2002a32c:	f200 8158 	bhi.w	2002a5e0 <__udivmoddi4+0x308>
2002a330:	4639      	mov	r1, r7
2002a332:	1a12      	subs	r2, r2, r0
2002a334:	b2a4      	uxth	r4, r4
2002a336:	fbb2 f0fe 	udiv	r0, r2, lr
2002a33a:	fb0e 2210 	mls	r2, lr, r0, r2
2002a33e:	fb00 fc0c 	mul.w	ip, r0, ip
2002a342:	ea44 4402 	orr.w	r4, r4, r2, lsl #16
2002a346:	45a4      	cmp	ip, r4
2002a348:	d90b      	bls.n	2002a362 <__udivmoddi4+0x8a>
2002a34a:	192c      	adds	r4, r5, r4
2002a34c:	f100 32ff 	add.w	r2, r0, #4294967295
2002a350:	bf2c      	ite	cs
2002a352:	2701      	movcs	r7, #1
2002a354:	2700      	movcc	r7, #0
2002a356:	45a4      	cmp	ip, r4
2002a358:	d902      	bls.n	2002a360 <__udivmoddi4+0x88>
2002a35a:	2f00      	cmp	r7, #0
2002a35c:	f000 8143 	beq.w	2002a5e6 <__udivmoddi4+0x30e>
2002a360:	4610      	mov	r0, r2
2002a362:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
2002a366:	eba4 040c 	sub.w	r4, r4, ip
2002a36a:	2100      	movs	r1, #0
2002a36c:	b11e      	cbz	r6, 2002a376 <__udivmoddi4+0x9e>
2002a36e:	40dc      	lsrs	r4, r3
2002a370:	2300      	movs	r3, #0
2002a372:	e9c6 4300 	strd	r4, r3, [r6]
2002a376:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
2002a37a:	428b      	cmp	r3, r1
2002a37c:	d906      	bls.n	2002a38c <__udivmoddi4+0xb4>
2002a37e:	b10e      	cbz	r6, 2002a384 <__udivmoddi4+0xac>
2002a380:	e9c6 0100 	strd	r0, r1, [r6]
2002a384:	2100      	movs	r1, #0
2002a386:	4608      	mov	r0, r1
2002a388:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
2002a38c:	fab3 f183 	clz	r1, r3
2002a390:	2900      	cmp	r1, #0
2002a392:	d151      	bne.n	2002a438 <__udivmoddi4+0x160>
2002a394:	4563      	cmp	r3, ip
2002a396:	f0c0 8116 	bcc.w	2002a5c6 <__udivmoddi4+0x2ee>
2002a39a:	4282      	cmp	r2, r0
2002a39c:	f240 8113 	bls.w	2002a5c6 <__udivmoddi4+0x2ee>
2002a3a0:	4608      	mov	r0, r1
2002a3a2:	2e00      	cmp	r6, #0
2002a3a4:	d0e7      	beq.n	2002a376 <__udivmoddi4+0x9e>
2002a3a6:	e9c6 4700 	strd	r4, r7, [r6]
2002a3aa:	e7e4      	b.n	2002a376 <__udivmoddi4+0x9e>
2002a3ac:	2a00      	cmp	r2, #0
2002a3ae:	f000 80af 	beq.w	2002a510 <__udivmoddi4+0x238>
2002a3b2:	fab2 f382 	clz	r3, r2
2002a3b6:	2b00      	cmp	r3, #0
2002a3b8:	f040 80c2 	bne.w	2002a540 <__udivmoddi4+0x268>
2002a3bc:	1a8a      	subs	r2, r1, r2
2002a3be:	ea4f 4e15 	mov.w	lr, r5, lsr #16
2002a3c2:	b2af      	uxth	r7, r5
2002a3c4:	2101      	movs	r1, #1
2002a3c6:	0c20      	lsrs	r0, r4, #16
2002a3c8:	fbb2 fcfe 	udiv	ip, r2, lr
2002a3cc:	fb0e 221c 	mls	r2, lr, ip, r2
2002a3d0:	ea40 4202 	orr.w	r2, r0, r2, lsl #16
2002a3d4:	fb07 f00c 	mul.w	r0, r7, ip
2002a3d8:	4290      	cmp	r0, r2
2002a3da:	d90e      	bls.n	2002a3fa <__udivmoddi4+0x122>
2002a3dc:	18aa      	adds	r2, r5, r2
2002a3de:	f10c 38ff 	add.w	r8, ip, #4294967295
2002a3e2:	bf2c      	ite	cs
2002a3e4:	f04f 0901 	movcs.w	r9, #1
2002a3e8:	f04f 0900 	movcc.w	r9, #0
2002a3ec:	4290      	cmp	r0, r2
2002a3ee:	d903      	bls.n	2002a3f8 <__udivmoddi4+0x120>
2002a3f0:	f1b9 0f00 	cmp.w	r9, #0
2002a3f4:	f000 80f0 	beq.w	2002a5d8 <__udivmoddi4+0x300>
2002a3f8:	46c4      	mov	ip, r8
2002a3fa:	1a12      	subs	r2, r2, r0
2002a3fc:	b2a4      	uxth	r4, r4
2002a3fe:	fbb2 f0fe 	udiv	r0, r2, lr
2002a402:	fb0e 2210 	mls	r2, lr, r0, r2
2002a406:	fb00 f707 	mul.w	r7, r0, r7
2002a40a:	ea44 4402 	orr.w	r4, r4, r2, lsl #16
2002a40e:	42a7      	cmp	r7, r4
2002a410:	d90e      	bls.n	2002a430 <__udivmoddi4+0x158>
2002a412:	192c      	adds	r4, r5, r4
2002a414:	f100 32ff 	add.w	r2, r0, #4294967295
2002a418:	bf2c      	ite	cs
2002a41a:	f04f 0e01 	movcs.w	lr, #1
2002a41e:	f04f 0e00 	movcc.w	lr, #0
2002a422:	42a7      	cmp	r7, r4
2002a424:	d903      	bls.n	2002a42e <__udivmoddi4+0x156>
2002a426:	f1be 0f00 	cmp.w	lr, #0
2002a42a:	f000 80d2 	beq.w	2002a5d2 <__udivmoddi4+0x2fa>
2002a42e:	4610      	mov	r0, r2
2002a430:	1be4      	subs	r4, r4, r7
2002a432:	ea40 400c 	orr.w	r0, r0, ip, lsl #16
2002a436:	e799      	b.n	2002a36c <__udivmoddi4+0x94>
2002a438:	f1c1 0520 	rsb	r5, r1, #32
2002a43c:	408b      	lsls	r3, r1
2002a43e:	fa0c f401 	lsl.w	r4, ip, r1
2002a442:	fa00 f901 	lsl.w	r9, r0, r1
2002a446:	fa22 f705 	lsr.w	r7, r2, r5
2002a44a:	fa2c fc05 	lsr.w	ip, ip, r5
2002a44e:	408a      	lsls	r2, r1
2002a450:	431f      	orrs	r7, r3
2002a452:	fa20 f305 	lsr.w	r3, r0, r5
2002a456:	0c38      	lsrs	r0, r7, #16
2002a458:	4323      	orrs	r3, r4
2002a45a:	fa1f fe87 	uxth.w	lr, r7
2002a45e:	0c1c      	lsrs	r4, r3, #16
2002a460:	fbbc f8f0 	udiv	r8, ip, r0
2002a464:	fb00 cc18 	mls	ip, r0, r8, ip
2002a468:	ea44 440c 	orr.w	r4, r4, ip, lsl #16
2002a46c:	fb08 fc0e 	mul.w	ip, r8, lr
2002a470:	45a4      	cmp	ip, r4
2002a472:	d90e      	bls.n	2002a492 <__udivmoddi4+0x1ba>
2002a474:	193c      	adds	r4, r7, r4
2002a476:	f108 3aff 	add.w	sl, r8, #4294967295
2002a47a:	bf2c      	ite	cs
2002a47c:	f04f 0b01 	movcs.w	fp, #1
2002a480:	f04f 0b00 	movcc.w	fp, #0
2002a484:	45a4      	cmp	ip, r4
2002a486:	d903      	bls.n	2002a490 <__udivmoddi4+0x1b8>
2002a488:	f1bb 0f00 	cmp.w	fp, #0
2002a48c:	f000 80b8 	beq.w	2002a600 <__udivmoddi4+0x328>
2002a490:	46d0      	mov	r8, sl
2002a492:	eba4 040c 	sub.w	r4, r4, ip
2002a496:	fa1f fc83 	uxth.w	ip, r3
2002a49a:	fbb4 f3f0 	udiv	r3, r4, r0
2002a49e:	fb00 4413 	mls	r4, r0, r3, r4
2002a4a2:	fb03 fe0e 	mul.w	lr, r3, lr
2002a4a6:	ea4c 4404 	orr.w	r4, ip, r4, lsl #16
2002a4aa:	45a6      	cmp	lr, r4
2002a4ac:	d90e      	bls.n	2002a4cc <__udivmoddi4+0x1f4>
2002a4ae:	193c      	adds	r4, r7, r4
2002a4b0:	f103 30ff 	add.w	r0, r3, #4294967295
2002a4b4:	bf2c      	ite	cs
2002a4b6:	f04f 0c01 	movcs.w	ip, #1
2002a4ba:	f04f 0c00 	movcc.w	ip, #0
2002a4be:	45a6      	cmp	lr, r4
2002a4c0:	d903      	bls.n	2002a4ca <__udivmoddi4+0x1f2>
2002a4c2:	f1bc 0f00 	cmp.w	ip, #0
2002a4c6:	f000 809f 	beq.w	2002a608 <__udivmoddi4+0x330>
2002a4ca:	4603      	mov	r3, r0
2002a4cc:	ea43 4008 	orr.w	r0, r3, r8, lsl #16
2002a4d0:	eba4 040e 	sub.w	r4, r4, lr
2002a4d4:	fba0 ec02 	umull	lr, ip, r0, r2
2002a4d8:	4564      	cmp	r4, ip
2002a4da:	4673      	mov	r3, lr
2002a4dc:	46e0      	mov	r8, ip
2002a4de:	d302      	bcc.n	2002a4e6 <__udivmoddi4+0x20e>
2002a4e0:	d107      	bne.n	2002a4f2 <__udivmoddi4+0x21a>
2002a4e2:	45f1      	cmp	r9, lr
2002a4e4:	d205      	bcs.n	2002a4f2 <__udivmoddi4+0x21a>
2002a4e6:	ebbe 0302 	subs.w	r3, lr, r2
2002a4ea:	eb6c 0c07 	sbc.w	ip, ip, r7
2002a4ee:	3801      	subs	r0, #1
2002a4f0:	46e0      	mov	r8, ip
2002a4f2:	b15e      	cbz	r6, 2002a50c <__udivmoddi4+0x234>
2002a4f4:	ebb9 0203 	subs.w	r2, r9, r3
2002a4f8:	eb64 0408 	sbc.w	r4, r4, r8
2002a4fc:	fa04 f505 	lsl.w	r5, r4, r5
2002a500:	fa22 f301 	lsr.w	r3, r2, r1
2002a504:	40cc      	lsrs	r4, r1
2002a506:	431d      	orrs	r5, r3
2002a508:	e9c6 5400 	strd	r5, r4, [r6]
2002a50c:	2100      	movs	r1, #0
2002a50e:	e732      	b.n	2002a376 <__udivmoddi4+0x9e>
2002a510:	0842      	lsrs	r2, r0, #1
2002a512:	462f      	mov	r7, r5
2002a514:	084b      	lsrs	r3, r1, #1
2002a516:	46ac      	mov	ip, r5
2002a518:	ea42 72c1 	orr.w	r2, r2, r1, lsl #31
2002a51c:	46ae      	mov	lr, r5
2002a51e:	07c4      	lsls	r4, r0, #31
2002a520:	0c11      	lsrs	r1, r2, #16
2002a522:	b292      	uxth	r2, r2
2002a524:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
2002a528:	ea42 4201 	orr.w	r2, r2, r1, lsl #16
2002a52c:	fbb1 f1f5 	udiv	r1, r1, r5
2002a530:	fbb3 f0f5 	udiv	r0, r3, r5
2002a534:	231f      	movs	r3, #31
2002a536:	eba2 020c 	sub.w	r2, r2, ip
2002a53a:	ea41 4100 	orr.w	r1, r1, r0, lsl #16
2002a53e:	e742      	b.n	2002a3c6 <__udivmoddi4+0xee>
2002a540:	409d      	lsls	r5, r3
2002a542:	f1c3 0220 	rsb	r2, r3, #32
2002a546:	4099      	lsls	r1, r3
2002a548:	409c      	lsls	r4, r3
2002a54a:	fa2c fc02 	lsr.w	ip, ip, r2
2002a54e:	ea4f 4e15 	mov.w	lr, r5, lsr #16
2002a552:	fa20 f202 	lsr.w	r2, r0, r2
2002a556:	b2af      	uxth	r7, r5
2002a558:	fbbc f8fe 	udiv	r8, ip, lr
2002a55c:	430a      	orrs	r2, r1
2002a55e:	fb0e cc18 	mls	ip, lr, r8, ip
2002a562:	0c11      	lsrs	r1, r2, #16
2002a564:	ea41 410c 	orr.w	r1, r1, ip, lsl #16
2002a568:	fb08 fc07 	mul.w	ip, r8, r7
2002a56c:	458c      	cmp	ip, r1
2002a56e:	d950      	bls.n	2002a612 <__udivmoddi4+0x33a>
2002a570:	1869      	adds	r1, r5, r1
2002a572:	f108 30ff 	add.w	r0, r8, #4294967295
2002a576:	bf2c      	ite	cs
2002a578:	f04f 0901 	movcs.w	r9, #1
2002a57c:	f04f 0900 	movcc.w	r9, #0
2002a580:	458c      	cmp	ip, r1
2002a582:	d902      	bls.n	2002a58a <__udivmoddi4+0x2b2>
2002a584:	f1b9 0f00 	cmp.w	r9, #0
2002a588:	d030      	beq.n	2002a5ec <__udivmoddi4+0x314>
2002a58a:	eba1 010c 	sub.w	r1, r1, ip
2002a58e:	fbb1 f8fe 	udiv	r8, r1, lr
2002a592:	fb08 fc07 	mul.w	ip, r8, r7
2002a596:	fb0e 1118 	mls	r1, lr, r8, r1
2002a59a:	b292      	uxth	r2, r2
2002a59c:	ea42 4201 	orr.w	r2, r2, r1, lsl #16
2002a5a0:	4562      	cmp	r2, ip
2002a5a2:	d234      	bcs.n	2002a60e <__udivmoddi4+0x336>
2002a5a4:	18aa      	adds	r2, r5, r2
2002a5a6:	f108 31ff 	add.w	r1, r8, #4294967295
2002a5aa:	bf2c      	ite	cs
2002a5ac:	f04f 0901 	movcs.w	r9, #1
2002a5b0:	f04f 0900 	movcc.w	r9, #0
2002a5b4:	4562      	cmp	r2, ip
2002a5b6:	d2be      	bcs.n	2002a536 <__udivmoddi4+0x25e>
2002a5b8:	f1b9 0f00 	cmp.w	r9, #0
2002a5bc:	d1bb      	bne.n	2002a536 <__udivmoddi4+0x25e>
2002a5be:	f1a8 0102 	sub.w	r1, r8, #2
2002a5c2:	442a      	add	r2, r5
2002a5c4:	e7b7      	b.n	2002a536 <__udivmoddi4+0x25e>
2002a5c6:	1a84      	subs	r4, r0, r2
2002a5c8:	eb6c 0203 	sbc.w	r2, ip, r3
2002a5cc:	2001      	movs	r0, #1
2002a5ce:	4617      	mov	r7, r2
2002a5d0:	e6e7      	b.n	2002a3a2 <__udivmoddi4+0xca>
2002a5d2:	442c      	add	r4, r5
2002a5d4:	3802      	subs	r0, #2
2002a5d6:	e72b      	b.n	2002a430 <__udivmoddi4+0x158>
2002a5d8:	f1ac 0c02 	sub.w	ip, ip, #2
2002a5dc:	442a      	add	r2, r5
2002a5de:	e70c      	b.n	2002a3fa <__udivmoddi4+0x122>
2002a5e0:	3902      	subs	r1, #2
2002a5e2:	442a      	add	r2, r5
2002a5e4:	e6a5      	b.n	2002a332 <__udivmoddi4+0x5a>
2002a5e6:	442c      	add	r4, r5
2002a5e8:	3802      	subs	r0, #2
2002a5ea:	e6ba      	b.n	2002a362 <__udivmoddi4+0x8a>
2002a5ec:	eba5 0c0c 	sub.w	ip, r5, ip
2002a5f0:	f1a8 0002 	sub.w	r0, r8, #2
2002a5f4:	4461      	add	r1, ip
2002a5f6:	fbb1 f8fe 	udiv	r8, r1, lr
2002a5fa:	fb08 fc07 	mul.w	ip, r8, r7
2002a5fe:	e7ca      	b.n	2002a596 <__udivmoddi4+0x2be>
2002a600:	f1a8 0802 	sub.w	r8, r8, #2
2002a604:	443c      	add	r4, r7
2002a606:	e744      	b.n	2002a492 <__udivmoddi4+0x1ba>
2002a608:	3b02      	subs	r3, #2
2002a60a:	443c      	add	r4, r7
2002a60c:	e75e      	b.n	2002a4cc <__udivmoddi4+0x1f4>
2002a60e:	4641      	mov	r1, r8
2002a610:	e791      	b.n	2002a536 <__udivmoddi4+0x25e>
2002a612:	eba1 010c 	sub.w	r1, r1, ip
2002a616:	4640      	mov	r0, r8
2002a618:	fbb1 f8fe 	udiv	r8, r1, lr
2002a61c:	fb08 fc07 	mul.w	ip, r8, r7
2002a620:	e7b9      	b.n	2002a596 <__udivmoddi4+0x2be>
2002a622:	bf00      	nop

2002a624 <__aeabi_idiv0>:
2002a624:	4770      	bx	lr
2002a626:	bf00      	nop

2002a628 <calloc>:
2002a628:	4b02      	ldr	r3, [pc, #8]	@ (2002a634 <calloc+0xc>)
2002a62a:	460a      	mov	r2, r1
2002a62c:	4601      	mov	r1, r0
2002a62e:	6818      	ldr	r0, [r3, #0]
2002a630:	f000 b802 	b.w	2002a638 <_calloc_r>
2002a634:	20044960 	.word	0x20044960

2002a638 <_calloc_r>:
2002a638:	b570      	push	{r4, r5, r6, lr}
2002a63a:	fba1 5402 	umull	r5, r4, r1, r2
2002a63e:	b934      	cbnz	r4, 2002a64e <_calloc_r+0x16>
2002a640:	4629      	mov	r1, r5
2002a642:	f000 f837 	bl	2002a6b4 <_malloc_r>
2002a646:	4606      	mov	r6, r0
2002a648:	b928      	cbnz	r0, 2002a656 <_calloc_r+0x1e>
2002a64a:	4630      	mov	r0, r6
2002a64c:	bd70      	pop	{r4, r5, r6, pc}
2002a64e:	220c      	movs	r2, #12
2002a650:	2600      	movs	r6, #0
2002a652:	6002      	str	r2, [r0, #0]
2002a654:	e7f9      	b.n	2002a64a <_calloc_r+0x12>
2002a656:	462a      	mov	r2, r5
2002a658:	4621      	mov	r1, r4
2002a65a:	f000 f8c7 	bl	2002a7ec <memset>
2002a65e:	e7f4      	b.n	2002a64a <_calloc_r+0x12>

2002a660 <free>:
2002a660:	4b02      	ldr	r3, [pc, #8]	@ (2002a66c <free+0xc>)
2002a662:	4601      	mov	r1, r0
2002a664:	6818      	ldr	r0, [r3, #0]
2002a666:	f000 b8e9 	b.w	2002a83c <_free_r>
2002a66a:	bf00      	nop
2002a66c:	20044960 	.word	0x20044960

2002a670 <sbrk_aligned>:
2002a670:	b570      	push	{r4, r5, r6, lr}
2002a672:	4e0f      	ldr	r6, [pc, #60]	@ (2002a6b0 <sbrk_aligned+0x40>)
2002a674:	460c      	mov	r4, r1
2002a676:	4605      	mov	r5, r0
2002a678:	6831      	ldr	r1, [r6, #0]
2002a67a:	b911      	cbnz	r1, 2002a682 <sbrk_aligned+0x12>
2002a67c:	f000 f8be 	bl	2002a7fc <_sbrk_r>
2002a680:	6030      	str	r0, [r6, #0]
2002a682:	4621      	mov	r1, r4
2002a684:	4628      	mov	r0, r5
2002a686:	f000 f8b9 	bl	2002a7fc <_sbrk_r>
2002a68a:	1c43      	adds	r3, r0, #1
2002a68c:	d103      	bne.n	2002a696 <sbrk_aligned+0x26>
2002a68e:	f04f 34ff 	mov.w	r4, #4294967295
2002a692:	4620      	mov	r0, r4
2002a694:	bd70      	pop	{r4, r5, r6, pc}
2002a696:	1cc4      	adds	r4, r0, #3
2002a698:	f024 0403 	bic.w	r4, r4, #3
2002a69c:	42a0      	cmp	r0, r4
2002a69e:	d0f8      	beq.n	2002a692 <sbrk_aligned+0x22>
2002a6a0:	1a21      	subs	r1, r4, r0
2002a6a2:	4628      	mov	r0, r5
2002a6a4:	f000 f8aa 	bl	2002a7fc <_sbrk_r>
2002a6a8:	3001      	adds	r0, #1
2002a6aa:	d1f2      	bne.n	2002a692 <sbrk_aligned+0x22>
2002a6ac:	e7ef      	b.n	2002a68e <sbrk_aligned+0x1e>
2002a6ae:	bf00      	nop
2002a6b0:	2004d020 	.word	0x2004d020

2002a6b4 <_malloc_r>:
2002a6b4:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
2002a6b8:	1ccd      	adds	r5, r1, #3
2002a6ba:	4606      	mov	r6, r0
2002a6bc:	f025 0503 	bic.w	r5, r5, #3
2002a6c0:	3508      	adds	r5, #8
2002a6c2:	2d0c      	cmp	r5, #12
2002a6c4:	bf38      	it	cc
2002a6c6:	250c      	movcc	r5, #12
2002a6c8:	2d00      	cmp	r5, #0
2002a6ca:	db01      	blt.n	2002a6d0 <_malloc_r+0x1c>
2002a6cc:	42a9      	cmp	r1, r5
2002a6ce:	d904      	bls.n	2002a6da <_malloc_r+0x26>
2002a6d0:	230c      	movs	r3, #12
2002a6d2:	6033      	str	r3, [r6, #0]
2002a6d4:	2000      	movs	r0, #0
2002a6d6:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
2002a6da:	f8df 80d4 	ldr.w	r8, [pc, #212]	@ 2002a7b0 <_malloc_r+0xfc>
2002a6de:	f000 f869 	bl	2002a7b4 <__malloc_lock>
2002a6e2:	f8d8 3000 	ldr.w	r3, [r8]
2002a6e6:	461c      	mov	r4, r3
2002a6e8:	bb44      	cbnz	r4, 2002a73c <_malloc_r+0x88>
2002a6ea:	4629      	mov	r1, r5
2002a6ec:	4630      	mov	r0, r6
2002a6ee:	f7ff ffbf 	bl	2002a670 <sbrk_aligned>
2002a6f2:	1c43      	adds	r3, r0, #1
2002a6f4:	4604      	mov	r4, r0
2002a6f6:	d158      	bne.n	2002a7aa <_malloc_r+0xf6>
2002a6f8:	f8d8 4000 	ldr.w	r4, [r8]
2002a6fc:	4627      	mov	r7, r4
2002a6fe:	2f00      	cmp	r7, #0
2002a700:	d143      	bne.n	2002a78a <_malloc_r+0xd6>
2002a702:	2c00      	cmp	r4, #0
2002a704:	d04b      	beq.n	2002a79e <_malloc_r+0xea>
2002a706:	6823      	ldr	r3, [r4, #0]
2002a708:	4639      	mov	r1, r7
2002a70a:	4630      	mov	r0, r6
2002a70c:	eb04 0903 	add.w	r9, r4, r3
2002a710:	f000 f874 	bl	2002a7fc <_sbrk_r>
2002a714:	4581      	cmp	r9, r0
2002a716:	d142      	bne.n	2002a79e <_malloc_r+0xea>
2002a718:	6821      	ldr	r1, [r4, #0]
2002a71a:	4630      	mov	r0, r6
2002a71c:	1a6d      	subs	r5, r5, r1
2002a71e:	4629      	mov	r1, r5
2002a720:	f7ff ffa6 	bl	2002a670 <sbrk_aligned>
2002a724:	3001      	adds	r0, #1
2002a726:	d03a      	beq.n	2002a79e <_malloc_r+0xea>
2002a728:	6823      	ldr	r3, [r4, #0]
2002a72a:	442b      	add	r3, r5
2002a72c:	6023      	str	r3, [r4, #0]
2002a72e:	f8d8 3000 	ldr.w	r3, [r8]
2002a732:	685a      	ldr	r2, [r3, #4]
2002a734:	bb62      	cbnz	r2, 2002a790 <_malloc_r+0xdc>
2002a736:	f8c8 7000 	str.w	r7, [r8]
2002a73a:	e00f      	b.n	2002a75c <_malloc_r+0xa8>
2002a73c:	6822      	ldr	r2, [r4, #0]
2002a73e:	1b52      	subs	r2, r2, r5
2002a740:	d420      	bmi.n	2002a784 <_malloc_r+0xd0>
2002a742:	2a0b      	cmp	r2, #11
2002a744:	d917      	bls.n	2002a776 <_malloc_r+0xc2>
2002a746:	1961      	adds	r1, r4, r5
2002a748:	42a3      	cmp	r3, r4
2002a74a:	6025      	str	r5, [r4, #0]
2002a74c:	bf18      	it	ne
2002a74e:	6059      	strne	r1, [r3, #4]
2002a750:	6863      	ldr	r3, [r4, #4]
2002a752:	bf08      	it	eq
2002a754:	f8c8 1000 	streq.w	r1, [r8]
2002a758:	5162      	str	r2, [r4, r5]
2002a75a:	604b      	str	r3, [r1, #4]
2002a75c:	4630      	mov	r0, r6
2002a75e:	f000 f82f 	bl	2002a7c0 <__malloc_unlock>
2002a762:	f104 000b 	add.w	r0, r4, #11
2002a766:	1d23      	adds	r3, r4, #4
2002a768:	f020 0007 	bic.w	r0, r0, #7
2002a76c:	1ac2      	subs	r2, r0, r3
2002a76e:	bf1c      	itt	ne
2002a770:	1a1b      	subne	r3, r3, r0
2002a772:	50a3      	strne	r3, [r4, r2]
2002a774:	e7af      	b.n	2002a6d6 <_malloc_r+0x22>
2002a776:	6862      	ldr	r2, [r4, #4]
2002a778:	42a3      	cmp	r3, r4
2002a77a:	bf0c      	ite	eq
2002a77c:	f8c8 2000 	streq.w	r2, [r8]
2002a780:	605a      	strne	r2, [r3, #4]
2002a782:	e7eb      	b.n	2002a75c <_malloc_r+0xa8>
2002a784:	4623      	mov	r3, r4
2002a786:	6864      	ldr	r4, [r4, #4]
2002a788:	e7ae      	b.n	2002a6e8 <_malloc_r+0x34>
2002a78a:	463c      	mov	r4, r7
2002a78c:	687f      	ldr	r7, [r7, #4]
2002a78e:	e7b6      	b.n	2002a6fe <_malloc_r+0x4a>
2002a790:	461a      	mov	r2, r3
2002a792:	685b      	ldr	r3, [r3, #4]
2002a794:	42a3      	cmp	r3, r4
2002a796:	d1fb      	bne.n	2002a790 <_malloc_r+0xdc>
2002a798:	2300      	movs	r3, #0
2002a79a:	6053      	str	r3, [r2, #4]
2002a79c:	e7de      	b.n	2002a75c <_malloc_r+0xa8>
2002a79e:	230c      	movs	r3, #12
2002a7a0:	4630      	mov	r0, r6
2002a7a2:	6033      	str	r3, [r6, #0]
2002a7a4:	f000 f80c 	bl	2002a7c0 <__malloc_unlock>
2002a7a8:	e794      	b.n	2002a6d4 <_malloc_r+0x20>
2002a7aa:	6005      	str	r5, [r0, #0]
2002a7ac:	e7d6      	b.n	2002a75c <_malloc_r+0xa8>
2002a7ae:	bf00      	nop
2002a7b0:	2004d024 	.word	0x2004d024

2002a7b4 <__malloc_lock>:
2002a7b4:	4801      	ldr	r0, [pc, #4]	@ (2002a7bc <__malloc_lock+0x8>)
2002a7b6:	f000 b831 	b.w	2002a81c <__retarget_lock_acquire_recursive>
2002a7ba:	bf00      	nop
2002a7bc:	2004d164 	.word	0x2004d164

2002a7c0 <__malloc_unlock>:
2002a7c0:	4801      	ldr	r0, [pc, #4]	@ (2002a7c8 <__malloc_unlock+0x8>)
2002a7c2:	f000 b82c 	b.w	2002a81e <__retarget_lock_release_recursive>
2002a7c6:	bf00      	nop
2002a7c8:	2004d164 	.word	0x2004d164

2002a7cc <memcmp>:
2002a7cc:	3901      	subs	r1, #1
2002a7ce:	4402      	add	r2, r0
2002a7d0:	b510      	push	{r4, lr}
2002a7d2:	4290      	cmp	r0, r2
2002a7d4:	d101      	bne.n	2002a7da <memcmp+0xe>
2002a7d6:	2000      	movs	r0, #0
2002a7d8:	e005      	b.n	2002a7e6 <memcmp+0x1a>
2002a7da:	7803      	ldrb	r3, [r0, #0]
2002a7dc:	f811 4f01 	ldrb.w	r4, [r1, #1]!
2002a7e0:	42a3      	cmp	r3, r4
2002a7e2:	d001      	beq.n	2002a7e8 <memcmp+0x1c>
2002a7e4:	1b18      	subs	r0, r3, r4
2002a7e6:	bd10      	pop	{r4, pc}
2002a7e8:	3001      	adds	r0, #1
2002a7ea:	e7f2      	b.n	2002a7d2 <memcmp+0x6>

2002a7ec <memset>:
2002a7ec:	4402      	add	r2, r0
2002a7ee:	4603      	mov	r3, r0
2002a7f0:	4293      	cmp	r3, r2
2002a7f2:	d100      	bne.n	2002a7f6 <memset+0xa>
2002a7f4:	4770      	bx	lr
2002a7f6:	f803 1b01 	strb.w	r1, [r3], #1
2002a7fa:	e7f9      	b.n	2002a7f0 <memset+0x4>

2002a7fc <_sbrk_r>:
2002a7fc:	b538      	push	{r3, r4, r5, lr}
2002a7fe:	2300      	movs	r3, #0
2002a800:	4d05      	ldr	r5, [pc, #20]	@ (2002a818 <_sbrk_r+0x1c>)
2002a802:	4604      	mov	r4, r0
2002a804:	4608      	mov	r0, r1
2002a806:	602b      	str	r3, [r5, #0]
2002a808:	f000 f862 	bl	2002a8d0 <_sbrk>
2002a80c:	1c43      	adds	r3, r0, #1
2002a80e:	d102      	bne.n	2002a816 <_sbrk_r+0x1a>
2002a810:	682b      	ldr	r3, [r5, #0]
2002a812:	b103      	cbz	r3, 2002a816 <_sbrk_r+0x1a>
2002a814:	6023      	str	r3, [r4, #0]
2002a816:	bd38      	pop	{r3, r4, r5, pc}
2002a818:	2004d160 	.word	0x2004d160

2002a81c <__retarget_lock_acquire_recursive>:
2002a81c:	4770      	bx	lr

2002a81e <__retarget_lock_release_recursive>:
2002a81e:	4770      	bx	lr

2002a820 <memcpy>:
2002a820:	440a      	add	r2, r1
2002a822:	1e43      	subs	r3, r0, #1
2002a824:	4291      	cmp	r1, r2
2002a826:	d100      	bne.n	2002a82a <memcpy+0xa>
2002a828:	4770      	bx	lr
2002a82a:	b510      	push	{r4, lr}
2002a82c:	f811 4b01 	ldrb.w	r4, [r1], #1
2002a830:	4291      	cmp	r1, r2
2002a832:	f803 4f01 	strb.w	r4, [r3, #1]!
2002a836:	d1f9      	bne.n	2002a82c <memcpy+0xc>
2002a838:	bd10      	pop	{r4, pc}
	...

2002a83c <_free_r>:
2002a83c:	b538      	push	{r3, r4, r5, lr}
2002a83e:	4605      	mov	r5, r0
2002a840:	2900      	cmp	r1, #0
2002a842:	d041      	beq.n	2002a8c8 <_free_r+0x8c>
2002a844:	f851 3c04 	ldr.w	r3, [r1, #-4]
2002a848:	1f0c      	subs	r4, r1, #4
2002a84a:	2b00      	cmp	r3, #0
2002a84c:	bfb8      	it	lt
2002a84e:	18e4      	addlt	r4, r4, r3
2002a850:	f7ff ffb0 	bl	2002a7b4 <__malloc_lock>
2002a854:	4a1d      	ldr	r2, [pc, #116]	@ (2002a8cc <_free_r+0x90>)
2002a856:	6813      	ldr	r3, [r2, #0]
2002a858:	b933      	cbnz	r3, 2002a868 <_free_r+0x2c>
2002a85a:	6063      	str	r3, [r4, #4]
2002a85c:	6014      	str	r4, [r2, #0]
2002a85e:	4628      	mov	r0, r5
2002a860:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
2002a864:	f7ff bfac 	b.w	2002a7c0 <__malloc_unlock>
2002a868:	42a3      	cmp	r3, r4
2002a86a:	d908      	bls.n	2002a87e <_free_r+0x42>
2002a86c:	6820      	ldr	r0, [r4, #0]
2002a86e:	1821      	adds	r1, r4, r0
2002a870:	428b      	cmp	r3, r1
2002a872:	bf01      	itttt	eq
2002a874:	6819      	ldreq	r1, [r3, #0]
2002a876:	685b      	ldreq	r3, [r3, #4]
2002a878:	1809      	addeq	r1, r1, r0
2002a87a:	6021      	streq	r1, [r4, #0]
2002a87c:	e7ed      	b.n	2002a85a <_free_r+0x1e>
2002a87e:	461a      	mov	r2, r3
2002a880:	685b      	ldr	r3, [r3, #4]
2002a882:	b10b      	cbz	r3, 2002a888 <_free_r+0x4c>
2002a884:	42a3      	cmp	r3, r4
2002a886:	d9fa      	bls.n	2002a87e <_free_r+0x42>
2002a888:	6811      	ldr	r1, [r2, #0]
2002a88a:	1850      	adds	r0, r2, r1
2002a88c:	42a0      	cmp	r0, r4
2002a88e:	d10b      	bne.n	2002a8a8 <_free_r+0x6c>
2002a890:	6820      	ldr	r0, [r4, #0]
2002a892:	4401      	add	r1, r0
2002a894:	1850      	adds	r0, r2, r1
2002a896:	6011      	str	r1, [r2, #0]
2002a898:	4283      	cmp	r3, r0
2002a89a:	d1e0      	bne.n	2002a85e <_free_r+0x22>
2002a89c:	6818      	ldr	r0, [r3, #0]
2002a89e:	685b      	ldr	r3, [r3, #4]
2002a8a0:	4408      	add	r0, r1
2002a8a2:	6053      	str	r3, [r2, #4]
2002a8a4:	6010      	str	r0, [r2, #0]
2002a8a6:	e7da      	b.n	2002a85e <_free_r+0x22>
2002a8a8:	d902      	bls.n	2002a8b0 <_free_r+0x74>
2002a8aa:	230c      	movs	r3, #12
2002a8ac:	602b      	str	r3, [r5, #0]
2002a8ae:	e7d6      	b.n	2002a85e <_free_r+0x22>
2002a8b0:	6820      	ldr	r0, [r4, #0]
2002a8b2:	1821      	adds	r1, r4, r0
2002a8b4:	428b      	cmp	r3, r1
2002a8b6:	bf02      	ittt	eq
2002a8b8:	6819      	ldreq	r1, [r3, #0]
2002a8ba:	685b      	ldreq	r3, [r3, #4]
2002a8bc:	1809      	addeq	r1, r1, r0
2002a8be:	6063      	str	r3, [r4, #4]
2002a8c0:	bf08      	it	eq
2002a8c2:	6021      	streq	r1, [r4, #0]
2002a8c4:	6054      	str	r4, [r2, #4]
2002a8c6:	e7ca      	b.n	2002a85e <_free_r+0x22>
2002a8c8:	bd38      	pop	{r3, r4, r5, pc}
2002a8ca:	bf00      	nop
2002a8cc:	2004d024 	.word	0x2004d024

2002a8d0 <_sbrk>:
2002a8d0:	4a05      	ldr	r2, [pc, #20]	@ (2002a8e8 <_sbrk+0x18>)
2002a8d2:	4603      	mov	r3, r0
2002a8d4:	6810      	ldr	r0, [r2, #0]
2002a8d6:	b110      	cbz	r0, 2002a8de <_sbrk+0xe>
2002a8d8:	4403      	add	r3, r0
2002a8da:	6013      	str	r3, [r2, #0]
2002a8dc:	4770      	bx	lr
2002a8de:	4803      	ldr	r0, [pc, #12]	@ (2002a8ec <_sbrk+0x1c>)
2002a8e0:	4403      	add	r3, r0
2002a8e2:	6013      	str	r3, [r2, #0]
2002a8e4:	4770      	bx	lr
2002a8e6:	bf00      	nop
2002a8e8:	2004d168 	.word	0x2004d168
2002a8ec:	20042000 	.word	0x20042000
2002a8f0:	50041000 	.word	0x50041000
2002a8f4:	00000002 	.word	0x00000002
2002a8f8:	10000000 	.word	0x10000000
2002a8fc:	00000004 	.word	0x00000004
2002a900:	00000000 	.word	0x00000000
2002a904:	50081008 	.word	0x50081008
2002a908:	00000000 	.word	0x00000000
2002a90c:	00000032 	.word	0x00000032
2002a910:	00000000 	.word	0x00000000
2002a914:	50042000 	.word	0x50042000
2002a918:	00000002 	.word	0x00000002
2002a91c:	12000000 	.word	0x12000000
2002a920:	00000004 	.word	0x00000004
2002a924:	00000000 	.word	0x00000000
2002a928:	5008101c 	.word	0x5008101c
2002a92c:	00000000 	.word	0x00000000
2002a930:	00000033 	.word	0x00000033
2002a934:	00000001 	.word	0x00000001
2002a938:	62636573 	.word	0x62636573
2002a93c:	20746f6f 	.word	0x20746f6f
2002a940:	6b676973 	.word	0x6b676973
2002a944:	70207965 	.word	0x70207965
2002a948:	65206275 	.word	0x65206275
2002a94c:	00217272 	.word	0x00217272
2002a950:	62636573 	.word	0x62636573
2002a954:	20746f6f 	.word	0x20746f6f
2002a958:	20676d69 	.word	0x20676d69
2002a95c:	68736168 	.word	0x68736168
2002a960:	67697320 	.word	0x67697320
2002a964:	72726520 	.word	0x72726520
2002a968:	65730021 	.word	0x65730021
2002a96c:	6f6f6263 	.word	0x6f6f6263
2002a970:	78652074 	.word	0x78652074
2002a974:	20747063 	.word	0x20747063
2002a978:	6c6c756e 	.word	0x6c6c756e
2002a97c:	41480021 	.word	0x41480021
2002a980:	535f4853 	.word	0x535f4853
2002a984:	49545445 	.word	0x49545445
2002a988:	253d474e 	.word	0x253d474e
2002a98c:	0a583830 	.word	0x0a583830
2002a990:	616f4c00 	.word	0x616f4c00
2002a994:	56492064 	.word	0x56492064
2002a998:	646e6120 	.word	0x646e6120
2002a99c:	6e656c20 	.word	0x6e656c20
2002a9a0:	20687467 	.word	0x20687467
2002a9a4:	48534148 	.word	0x48534148
2002a9a8:	5445535f 	.word	0x5445535f
2002a9ac:	474e4954 	.word	0x474e4954
2002a9b0:	3830253d 	.word	0x3830253d
2002a9b4:	69202c58 	.word	0x69202c58
2002a9b8:	656c2076 	.word	0x656c2076
2002a9bc:	6874676e 	.word	0x6874676e
2002a9c0:	0a64253d 	.word	0x0a64253d
2002a9c4:	73655200 	.word	0x73655200
2002a9c8:	20746c75 	.word	0x20746c75
2002a9cc:	3d6e656c 	.word	0x3d6e656c
2002a9d0:	000a6425 	.word	0x000a6425
2002a9d4:	2070614d 	.word	0x2070614d
2002a9d8:	6f727265 	.word	0x6f727265
2002a9dc:	6c203a72 	.word	0x6c203a72
2002a9e0:	6369676f 	.word	0x6369676f
2002a9e4:	2c642520 	.word	0x2c642520
2002a9e8:	79687020 	.word	0x79687020
2002a9ec:	0a642520 	.word	0x0a642520
2002a9f0:	52524500 	.word	0x52524500
2002a9f4:	2032203a 	.word	0x2032203a
2002a9f8:	69676f6c 	.word	0x69676f6c
2002a9fc:	6c622063 	.word	0x6c622063
2002aa00:	736b636f 	.word	0x736b636f
2002aa04:	70616d20 	.word	0x70616d20
2002aa08:	206f7420 	.word	0x206f7420
2002aa0c:	656d6173 	.word	0x656d6173
2002aa10:	6b6c6220 	.word	0x6b6c6220
2002aa14:	6f6c203a 	.word	0x6f6c203a
2002aa18:	30636967 	.word	0x30636967
2002aa1c:	2c642520 	.word	0x2c642520
2002aa20:	79687020 	.word	0x79687020
2002aa24:	64252030 	.word	0x64252030
2002aa28:	6f6c202c 	.word	0x6f6c202c
2002aa2c:	31636967 	.word	0x31636967
2002aa30:	2c642520 	.word	0x2c642520
2002aa34:	79687020 	.word	0x79687020
2002aa38:	64252031 	.word	0x64252031
2002aa3c:	614d000a 	.word	0x614d000a
2002aa40:	72652070 	.word	0x72652070
2002aa44:	30726f72 	.word	0x30726f72
2002aa48:	6f6c203a 	.word	0x6f6c203a
2002aa4c:	20636967 	.word	0x20636967
2002aa50:	202c6425 	.word	0x202c6425
2002aa54:	20796870 	.word	0x20796870
2002aa58:	000a6425 	.word	0x000a6425
2002aa5c:	20746547 	.word	0x20746547
2002aa60:	2070616d 	.word	0x2070616d
2002aa64:	636f6c62 	.word	0x636f6c62
2002aa68:	7265206b 	.word	0x7265206b
2002aa6c:	20726f72 	.word	0x20726f72
2002aa70:	2d206425 	.word	0x2d206425
2002aa74:	25203e2d 	.word	0x25203e2d
2002aa78:	42000a64 	.word	0x42000a64
2002aa7c:	76204d42 	.word	0x76204d42
2002aa80:	69737265 	.word	0x69737265
2002aa84:	6e206e6f 	.word	0x6e206e6f
2002aa88:	6920746f 	.word	0x6920746f
2002aa8c:	6572636e 	.word	0x6572636e
2002aa90:	64657361 	.word	0x64657361
2002aa94:	7270203a 	.word	0x7270203a
2002aa98:	25207665 	.word	0x25207665
2002aa9c:	63202c64 	.word	0x63202c64
2002aaa0:	20727275 	.word	0x20727275
2002aaa4:	000a6425 	.word	0x000a6425
2002aaa8:	41544144 	.word	0x41544144
2002aaac:	746f6e20 	.word	0x746f6e20
2002aab0:	61657220 	.word	0x61657220
2002aab4:	616e6f73 	.word	0x616e6f73
2002aab8:	20656c62 	.word	0x20656c62
2002aabc:	42206e69 	.word	0x42206e69
2002aac0:	62204d42 	.word	0x62204d42
2002aac4:	25206b6c 	.word	0x25206b6c
2002aac8:	61702064 	.word	0x61702064
2002aacc:	25206567 	.word	0x25206567
2002aad0:	30203a64 	.word	0x30203a64
2002aad4:	0a782578 	.word	0x0a782578
2002aad8:	61655200 	.word	0x61655200
2002aadc:	62622064 	.word	0x62622064
2002aae0:	6c62206d 	.word	0x6c62206d
2002aae4:	6425206b 	.word	0x6425206b
2002aae8:	67617020 	.word	0x67617020
2002aaec:	64252065 	.word	0x64252065
2002aaf0:	69616620 	.word	0x69616620
2002aaf4:	49000a6c 	.word	0x49000a6c
2002aaf8:	6c61766e 	.word	0x6c61766e
2002aafc:	42206469 	.word	0x42206469
2002ab00:	49204d42 	.word	0x49204d42
2002ab04:	25205844 	.word	0x25205844
2002ab08:	56000a64 	.word	0x56000a64
2002ab0c:	64252031 	.word	0x64252031
2002ab10:	206e6920 	.word	0x206e6920
2002ab14:	636f6c62 	.word	0x636f6c62
2002ab18:	6425206b 	.word	0x6425206b
2002ab1c:	3256202c 	.word	0x3256202c
2002ab20:	20642520 	.word	0x20642520
2002ab24:	62206e69 	.word	0x62206e69
2002ab28:	6b636f6c 	.word	0x6b636f6c
2002ab2c:	0a642520 	.word	0x0a642520
2002ab30:	6d615300 	.word	0x6d615300
2002ab34:	69687465 	.word	0x69687465
2002ab38:	6d20676e 	.word	0x6d20676e
2002ab3c:	20747375 	.word	0x20747375
2002ab40:	77206562 	.word	0x77206562
2002ab44:	676e6f72 	.word	0x676e6f72
2002ab48:	6567202c 	.word	0x6567202c
2002ab4c:	656e2074 	.word	0x656e2074
2002ab50:	65762077 	.word	0x65762077
2002ab54:	6f697372 	.word	0x6f697372
2002ab58:	6425206e 	.word	0x6425206e
2002ab5c:	206f6420 	.word	0x206f6420
2002ab60:	20746f6e 	.word	0x20746f6e
2002ab64:	656d6173 	.word	0x656d6173
2002ab68:	206f7420 	.word	0x206f7420
2002ab6c:	76657270 	.word	0x76657270
2002ab70:	65686320 	.word	0x65686320
2002ab74:	25206b63 	.word	0x25206b63
2002ab78:	43000a64 	.word	0x43000a64
2002ab7c:	63204352 	.word	0x63204352
2002ab80:	6b636568 	.word	0x6b636568
2002ab84:	72726520 	.word	0x72726520
2002ab88:	0a20726f 	.word	0x0a20726f
2002ab8c:	61655200 	.word	0x61655200
2002ab90:	62622064 	.word	0x62622064
2002ab94:	6c62206d 	.word	0x6c62206d
2002ab98:	6425206b 	.word	0x6425206b
2002ab9c:	67617020 	.word	0x67617020
2002aba0:	64252065 	.word	0x64252065
2002aba4:	74616420 	.word	0x74616420
2002aba8:	6f6e2061 	.word	0x6f6e2061
2002abac:	72772074 	.word	0x72772074
2002abb0:	20657469 	.word	0x20657469
2002abb4:	20726f66 	.word	0x20726f66
2002abb8:	20646e32 	.word	0x20646e32
2002abbc:	656d6974 	.word	0x656d6974
2002abc0:	6552000a 	.word	0x6552000a
2002abc4:	62206461 	.word	0x62206461
2002abc8:	62206d62 	.word	0x62206d62
2002abcc:	25206b6c 	.word	0x25206b6c
2002abd0:	61702064 	.word	0x61702064
2002abd4:	25206567 	.word	0x25206567
2002abd8:	61662064 	.word	0x61662064
2002abdc:	66206c69 	.word	0x66206c69
2002abe0:	3220726f 	.word	0x3220726f
2002abe4:	7420646e 	.word	0x7420646e
2002abe8:	3f656d69 	.word	0x3f656d69
2002abec:	614c000a 	.word	0x614c000a
2002abf0:	74736574 	.word	0x74736574
2002abf4:	72657620 	.word	0x72657620
2002abf8:	6e6f6973 	.word	0x6e6f6973
2002abfc:	0a642520 	.word	0x0a642520
2002ac00:	74654700 	.word	0x74654700
2002ac04:	79687020 	.word	0x79687020
2002ac08:	6b6c6220 	.word	0x6b6c6220
2002ac0c:	726f6620 	.word	0x726f6620
2002ac10:	20642520 	.word	0x20642520
2002ac14:	6c696166 	.word	0x6c696166
2002ac18:	65687720 	.word	0x65687720
2002ac1c:	6572206e 	.word	0x6572206e
2002ac20:	000a6461 	.word	0x000a6461
2002ac24:	636f6c42 	.word	0x636f6c42
2002ac28:	6425206b 	.word	0x6425206b
2002ac2c:	61726520 	.word	0x61726520
2002ac30:	66206573 	.word	0x66206573
2002ac34:	2c6c6961 	.word	0x2c6c6961
2002ac38:	72616d20 	.word	0x72616d20
2002ac3c:	7361206b 	.word	0x7361206b
2002ac40:	64616220 	.word	0x64616220
2002ac44:	6c42000a 	.word	0x6c42000a
2002ac48:	206b636f 	.word	0x206b636f
2002ac4c:	63206425 	.word	0x63206425
2002ac50:	6b636568 	.word	0x6b636568
2002ac54:	20736120 	.word	0x20736120
2002ac58:	20646162 	.word	0x20646162
2002ac5c:	636f6c62 	.word	0x636f6c62
2002ac60:	42000a6b 	.word	0x42000a6b
2002ac64:	6b636f6c 	.word	0x6b636f6c
2002ac68:	20642520 	.word	0x20642520
2002ac6c:	62207369 	.word	0x62207369
2002ac70:	69206461 	.word	0x69206461
2002ac74:	7375206e 	.word	0x7375206e
2002ac78:	62207265 	.word	0x62207265
2002ac7c:	6b636f6c 	.word	0x6b636f6c
2002ac80:	6162000a 	.word	0x6162000a
2002ac84:	64252064 	.word	0x64252064
2002ac88:	6572202c 	.word	0x6572202c
2002ac8c:	63616c70 	.word	0x63616c70
2002ac90:	64252065 	.word	0x64252065
2002ac94:	6f4e000a 	.word	0x6f4e000a
2002ac98:	63616220 	.word	0x63616220
2002ac9c:	2070756b 	.word	0x2070756b
2002aca0:	636f6c62 	.word	0x636f6c62
2002aca4:	6e61206b 	.word	0x6e61206b
2002aca8:	6f6d2079 	.word	0x6f6d2079
2002acac:	000a6572 	.word	0x000a6572
2002acb0:	74706d65 	.word	0x74706d65
2002acb4:	61742079 	.word	0x61742079
2002acb8:	20656c62 	.word	0x20656c62
2002acbc:	6e206425 	.word	0x6e206425
2002acc0:	6520746f 	.word	0x6520746f
2002acc4:	67756f6e 	.word	0x67756f6e
2002acc8:	6f662068 	.word	0x6f662068
2002accc:	6e692072 	.word	0x6e692072
2002acd0:	61697469 	.word	0x61697469
2002acd4:	55000a6c 	.word	0x55000a6c
2002acd8:	74616470 	.word	0x74616470
2002acdc:	61742065 	.word	0x61742065
2002ace0:	20656c62 	.word	0x20656c62
2002ace4:	66206f74 	.word	0x66206f74
2002ace8:	6873616c 	.word	0x6873616c
2002acec:	6e6f6420 	.word	0x6e6f6420
2002acf0:	49000a65 	.word	0x49000a65
2002acf4:	6974696e 	.word	0x6974696e
2002acf8:	74206c61 	.word	0x74206c61
2002acfc:	656c6261 	.word	0x656c6261
2002ad00:	69616620 	.word	0x69616620
2002ad04:	42000a6c 	.word	0x42000a6c
2002ad08:	69204d42 	.word	0x69204d42
2002ad0c:	6974696e 	.word	0x6974696e
2002ad10:	7a696c61 	.word	0x7a696c61
2002ad14:	62206465 	.word	0x62206465
2002ad18:	726f6665 	.word	0x726f6665
2002ad1c:	64202c65 	.word	0x64202c65
2002ad20:	6f6e206f 	.word	0x6f6e206f
2002ad24:	6e692074 	.word	0x6e692074
2002ad28:	61207469 	.word	0x61207469
2002ad2c:	6d20796e 	.word	0x6d20796e
2002ad30:	0a65726f 	.word	0x0a65726f
2002ad34:	54454400 	.word	0x54454400
2002ad38:	20642520 	.word	0x20642520
2002ad3c:	0a646162 	.word	0x0a646162
2002ad40:	4b4c4200 	.word	0x4b4c4200
2002ad44:	20642520 	.word	0x20642520
2002ad48:	64616572 	.word	0x64616572
2002ad4c:	69616620 	.word	0x69616620
2002ad50:	6d202c6c 	.word	0x6d202c6c
2002ad54:	206b7261 	.word	0x206b7261
2002ad58:	62207361 	.word	0x62207361
2002ad5c:	000a6461 	.word	0x000a6461
2002ad60:	20746564 	.word	0x20746564
2002ad64:	206d6262 	.word	0x206d6262
2002ad68:	6c626174 	.word	0x6c626174
2002ad6c:	69772065 	.word	0x69772065
2002ad70:	25206874 	.word	0x25206874
2002ad74:	25202c64 	.word	0x25202c64
2002ad78:	25202c64 	.word	0x25202c64
2002ad7c:	64000a64 	.word	0x64000a64
2002ad80:	63657465 	.word	0x63657465
2002ad84:	65722074 	.word	0x65722074
2002ad88:	746c7573 	.word	0x746c7573
2002ad8c:	0a642520 	.word	0x0a642520
2002ad90:	20317600 	.word	0x20317600
2002ad94:	69206425 	.word	0x69206425
2002ad98:	6c62206e 	.word	0x6c62206e
2002ad9c:	6425206b 	.word	0x6425206b
2002ada0:	3276202c 	.word	0x3276202c
2002ada4:	20642520 	.word	0x20642520
2002ada8:	62206e69 	.word	0x62206e69
2002adac:	6b636f6c 	.word	0x6b636f6c
2002adb0:	0a642520 	.word	0x0a642520
2002adb4:	65684300 	.word	0x65684300
2002adb8:	62206b63 	.word	0x62206b63
2002adbc:	74206d62 	.word	0x74206d62
2002adc0:	656c6261 	.word	0x656c6261
2002adc4:	69616620 	.word	0x69616620
2002adc8:	64000a6c 	.word	0x64000a6c
2002adcc:	63657465 	.word	0x63657465
2002add0:	65722074 	.word	0x65722074
2002add4:	746c7573 	.word	0x746c7573
2002add8:	20642520 	.word	0x20642520
2002addc:	20746f6e 	.word	0x20746f6e
2002ade0:	73616572 	.word	0x73616572
2002ade4:	62616e6f 	.word	0x62616e6f
2002ade8:	000a656c 	.word	0x000a656c
2002adec:	204d4242 	.word	0x204d4242
2002adf0:	3a4d454d 	.word	0x3a4d454d
2002adf4:	78746320 	.word	0x78746320
2002adf8:	2c702520 	.word	0x2c702520
2002adfc:	70616d20 	.word	0x70616d20
2002ae00:	70252031 	.word	0x70252031
2002ae04:	616d202c 	.word	0x616d202c
2002ae08:	25203270 	.word	0x25203270
2002ae0c:	000a2070 	.word	0x000a2070
2002ae10:	5f666973 	.word	0x5f666973
2002ae14:	5f6d6262 	.word	0x5f6d6262
2002ae18:	74696e69 	.word	0x74696e69
2002ae1c:	6e6f6420 	.word	0x6e6f6420
2002ae20:	53000a65 	.word	0x53000a65
2002ae24:	31354148 	.word	0x31354148
2002ae28:	48530032 	.word	0x48530032
2002ae2c:	34383341 	.word	0x34383341
2002ae30:	41485300 	.word	0x41485300
2002ae34:	00363532 	.word	0x00363532
2002ae38:	32414853 	.word	0x32414853
2002ae3c:	60003432 	.word	0x60003432
2002ae40:	65014886 	.word	0x65014886
2002ae44:	04020403 	.word	0x04020403
2002ae48:	2d646900 	.word	0x2d646900
2002ae4c:	32616873 	.word	0x32616873
2002ae50:	60003432 	.word	0x60003432
2002ae54:	65014886 	.word	0x65014886
2002ae58:	01020403 	.word	0x01020403
2002ae5c:	2d646900 	.word	0x2d646900
2002ae60:	32616873 	.word	0x32616873
2002ae64:	60003635 	.word	0x60003635
2002ae68:	65014886 	.word	0x65014886
2002ae6c:	02020403 	.word	0x02020403
2002ae70:	2d646900 	.word	0x2d646900
2002ae74:	33616873 	.word	0x33616873
2002ae78:	60003438 	.word	0x60003438
2002ae7c:	65014886 	.word	0x65014886
2002ae80:	03020403 	.word	0x03020403
2002ae84:	2d646900 	.word	0x2d646900
2002ae88:	35616873 	.word	0x35616873
2002ae8c:	2b003231 	.word	0x2b003231
2002ae90:	0702030e 	.word	0x0702030e
2002ae94:	73656400 	.word	0x73656400
2002ae98:	00434243 	.word	0x00434243
2002ae9c:	2d534544 	.word	0x2d534544
2002aea0:	00434243 	.word	0x00434243
2002aea4:	8648862a 	.word	0x8648862a
2002aea8:	07030df7 	.word	0x07030df7
2002aeac:	73656400 	.word	0x73656400
2002aeb0:	6564652d 	.word	0x6564652d
2002aeb4:	62632d33 	.word	0x62632d33
2002aeb8:	45440063 	.word	0x45440063
2002aebc:	44452d53 	.word	0x44452d53
2002aec0:	432d3345 	.word	0x432d3345
2002aec4:	2a004342 	.word	0x2a004342
2002aec8:	f7864886 	.word	0xf7864886
2002aecc:	0101010d 	.word	0x0101010d
2002aed0:	61737200 	.word	0x61737200
2002aed4:	72636e45 	.word	0x72636e45
2002aed8:	69747079 	.word	0x69747079
2002aedc:	52006e6f 	.word	0x52006e6f
2002aee0:	2a004153 	.word	0x2a004153
2002aee4:	3dce4886 	.word	0x3dce4886
2002aee8:	69000102 	.word	0x69000102
2002aeec:	63652d64 	.word	0x63652d64
2002aef0:	6c627550 	.word	0x6c627550
2002aef4:	654b6369 	.word	0x654b6369
2002aef8:	65470079 	.word	0x65470079
2002aefc:	6972656e 	.word	0x6972656e
2002af00:	43452063 	.word	0x43452063
2002af04:	79656b20 	.word	0x79656b20
2002af08:	04812b00 	.word	0x04812b00
2002af0c:	69000c01 	.word	0x69000c01
2002af10:	63652d64 	.word	0x63652d64
2002af14:	45004844 	.word	0x45004844
2002af18:	656b2043 	.word	0x656b2043
2002af1c:	6f662079 	.word	0x6f662079
2002af20:	43452072 	.word	0x43452072
2002af24:	2a004844 	.word	0x2a004844
2002af28:	f7864886 	.word	0xf7864886
2002af2c:	0e01010d 	.word	0x0e01010d
2002af30:	61687300 	.word	0x61687300
2002af34:	57343232 	.word	0x57343232
2002af38:	52687469 	.word	0x52687469
2002af3c:	6e454153 	.word	0x6e454153
2002af40:	70797263 	.word	0x70797263
2002af44:	6e6f6974 	.word	0x6e6f6974
2002af48:	41535200 	.word	0x41535200
2002af4c:	74697720 	.word	0x74697720
2002af50:	48532068 	.word	0x48532068
2002af54:	32322d41 	.word	0x32322d41
2002af58:	862a0034 	.word	0x862a0034
2002af5c:	0df78648 	.word	0x0df78648
2002af60:	000b0101 	.word	0x000b0101
2002af64:	32616873 	.word	0x32616873
2002af68:	69573635 	.word	0x69573635
2002af6c:	53526874 	.word	0x53526874
2002af70:	636e4541 	.word	0x636e4541
2002af74:	74707972 	.word	0x74707972
2002af78:	006e6f69 	.word	0x006e6f69
2002af7c:	20415352 	.word	0x20415352
2002af80:	68746977 	.word	0x68746977
2002af84:	41485320 	.word	0x41485320
2002af88:	3635322d 	.word	0x3635322d
2002af8c:	48862a00 	.word	0x48862a00
2002af90:	010df786 	.word	0x010df786
2002af94:	73000c01 	.word	0x73000c01
2002af98:	38336168 	.word	0x38336168
2002af9c:	74695734 	.word	0x74695734
2002afa0:	41535268 	.word	0x41535268
2002afa4:	72636e45 	.word	0x72636e45
2002afa8:	69747079 	.word	0x69747079
2002afac:	52006e6f 	.word	0x52006e6f
2002afb0:	77204153 	.word	0x77204153
2002afb4:	20687469 	.word	0x20687469
2002afb8:	2d414853 	.word	0x2d414853
2002afbc:	00343833 	.word	0x00343833
2002afc0:	8648862a 	.word	0x8648862a
2002afc4:	01010df7 	.word	0x01010df7
2002afc8:	6873000d 	.word	0x6873000d
2002afcc:	32313561 	.word	0x32313561
2002afd0:	68746957 	.word	0x68746957
2002afd4:	45415352 	.word	0x45415352
2002afd8:	7972636e 	.word	0x7972636e
2002afdc:	6f697470 	.word	0x6f697470
2002afe0:	5352006e 	.word	0x5352006e
2002afe4:	69772041 	.word	0x69772041
2002afe8:	53206874 	.word	0x53206874
2002afec:	352d4148 	.word	0x352d4148
2002aff0:	2a003231 	.word	0x2a003231
2002aff4:	f7864886 	.word	0xf7864886
2002aff8:	0a01010d 	.word	0x0a01010d
2002affc:	41535200 	.word	0x41535200
2002b000:	2d415353 	.word	0x2d415353
2002b004:	00535350 	.word	0x00535350
2002b008:	2e617372 	.word	0x2e617372
2002b00c:	7372004e 	.word	0x7372004e
2002b010:	00452e61 	.word	0x00452e61

2002b014 <pin_pad_func_lcpu>:
	...
2002b034:	032100b2 00000301 00000000 024b023b     ..!.........;.K.
2002b044:	00000237 00000000 00000000 00000000     7...............
2002b054:	032200b3 00000302 00000000 024b023c     ..".........<.K.
2002b064:	00000238 00000000 00000000 00000000     8...............
2002b074:	032300b4 00000303 00000000 024b023d     ..#.........=.K.
2002b084:	0000023a 00000000 00000000 00000000     :...............
2002b094:	032400b5 00000304 00000000 024b023e     ..$.........>.K.
2002b0a4:	00000239 00000000 00000000 00000000     9...............

2002b0b4 <pin_pad_func_hcpu>:
	...
2002b0d4:	000400f2 00000000 000b0000 00000000     ................
	...
2002b0f4:	000900f3 00000000 00030000 00000000     ................
	...
2002b114:	000a00f4 00000000 000a0000 00000000     ................
	...
2002b134:	000b00f5 00000000 000b0000 00000000     ................
	...
2002b154:	000c00f6 00000000 00030000 00000000     ................
	...
2002b174:	000300f7 000d0000 00000009 00000000     ................
	...
2002b194:	000200f8 000e0000 0000000b 00000000     ................
	...
2002b1b4:	000100f9 000f0000 0009000a 00000000     ................
	...
2002b1d4:	000d00fa 00100000 000c0003 00000000     ................
	...
2002b1f4:	000e00fb 00060000 00010001 00000000     ................
	...
2002b214:	000f00fc 00010000 000c000c 00000000     ................
	...
2002b234:	001000fd 00030000 00090000 00000000     ................
	...
2002b254:	000500fe 00000006 00000000 00000000     ................
	...
2002b274:	01540052 00000000 026302b2 016a0000     R.T.......c...j.
	...
2002b294:	00000053 00000000 026402b3 00000000     S.........d.....
	...
2002b2b4:	01550054 01c60000 026502b4 016b019a     T.U.......e...k.
2002b2c4:	023b0000 02270000 00000000 00000000     ..;...'.........
2002b2d4:	014e0055 01c80000 026602b5 015f0199     U.N.......f..._.
2002b2e4:	023c0000 02280000 00000000 00000000     ..<...(.........
2002b2f4:	014f0056 01c70000 026702b6 015e0197     V.O.......g...^.
2002b304:	023d0000 02290000 00000000 00000000     ..=...).........
2002b314:	01500057 01c40000 026802b7 01680195     W.P.......h...h.
2002b324:	023e0000 022a0000 00000000 00000000     ..>...*.........
2002b334:	01510058 01c50000 026902b8 01690194     X.Q.......i...i.
2002b344:	023f0000 022b0000 00000000 00000000     ..?...+.........
2002b354:	01520059 01d40000 026a02b9 01600192     Y.R.......j...`.
2002b364:	02400000 022c0000 00000000 00000000     ..@...,.........
2002b374:	0153005a 01d50000 026b02ba 01610191     Z.S.......k...a.
2002b384:	02410000 0000023a 00000000 00000000     ..A.:...........
2002b394:	0000005b 00000000 026c02bb 00000000     [.........l.....
2002b3a4:	02420000 00000239 00000000 00000000     ..B.9...........
2002b3b4:	0000005c 00000000 026d02bc 00000000     \.........m.....
	...
2002b3d4:	0000005d 00000000 026e02bd 00000000     ].........n.....
2002b3e4:	01d30000 02210237 00000000 00000000     ....7.!.........
2002b3f4:	001b005e 000001b7 026f02be 00000000     ^.........o.....
2002b404:	00000000 02220238 00000000 00000000     ....8.".........
2002b414:	0022005f 000001b8 027002bf 00000000     _.".......p.....
2002b424:	00000000 02230000 00000000 00000000     ......#.........
2002b434:	00230060 000001b2 027102c0 00000000     `.#.......q.....
2002b444:	00000000 02240000 00000000 00000000     ......$.........
2002b454:	00210061 000001b4 027202c1 00000000     a.!.......r.....
2002b464:	00000000 02250000 00000000 00000000     ......%.........
2002b474:	00190062 000001b5 027302c2 00000000     b.........s.....
2002b484:	00000000 02260000 00000000 00000000     ......&.........
2002b494:	00240063 000001b6 027402c3 00000000     c.$.......t.....
	...
2002b4b4:	00000064 0000021a 027502c4 00000000     d.........u.....
	...
2002b4d4:	00000065 00000219 027602c5 00000000     e.........v.....
	...
2002b4f4:	00000066 00000000 027702c6 00000000     f.........w.....
2002b504:	024b0000 00000000 00000000 00000000     ..K.............
2002b514:	00000067 00000000 027802c7 00000000     g.........x.....
	...
2002b534:	00000068 01d40000 027902c8 00000000     h.........y.....
	...
2002b554:	00000069 01d50000 027a02c9 00000000     i.........z.....
	...
2002b574:	0000006a 01c60149 027b02ca 03620361     j...I.....{.a.b.
2002b584:	03640363 03660365 00000000 00000000     c.d.e.f.........
2002b594:	0000006b 01c80148 027c02cb 03620361     k...H.....|.a.b.
2002b5a4:	03640363 03660365 00000000 00000000     c.d.e.f.........
2002b5b4:	0000006c 00000000 027d02cc 03620361     l.........}.a.b.
2002b5c4:	03640363 03660365 00000000 00000000     c.d.e.f.........
2002b5d4:	0000006d 00000000 027e02cd 03620361     m.........~.a.b.
2002b5e4:	03640363 03660365 00000000 00000000     c.d.e.f.........
2002b5f4:	0000006e 01c70146 027f02ce 00000000     n...F...........
	...
2002b614:	0000006f 01c40147 028002cf 00000000     o...G...........
	...
2002b634:	00000070 01c50000 028102d0 00000000     p...............
	...
2002b654:	00000071 00000000 028202d1 00000000     q...............
2002b664:	02430000 00000000 00000000 00000000     ..C.............
2002b674:	00000072 00000000 028302d2 00000000     r...............
	...
2002b694:	00000073 00000000 028402d3 00000000     s...............
	...
2002b6b4:	00000074 00000000 028502d4 00000000     t...............
	...
2002b6d4:	00000075 00000000 028602d5 00000000     u...............
	...
2002b6f4:	00000076 00000000 028702d6 00000000     v...............
	...
2002b714:	00000077 0000014d 028802d7 01620000     w...M.........b.
2002b724:	02440000 00000000 00000000 00000000     ..D.............
2002b734:	00000078 0000014c 028902d8 00000000     x...L...........
	...
2002b754:	00000079 0000014a 028a02d9 01630190     y...J.........c.
2002b764:	02450000 022f0000 00000000 00000000     ..E.../.........
2002b774:	0000007a 0000014b 028b02da 0164018f     z...K.........d.
2002b784:	02460000 02300000 00000000 00000000     ..F...0.........
2002b794:	0000007b 00000000 028c02db 01650193     {.............e.
2002b7a4:	02470000 02310000 00000000 00000000     ..G...1.........
2002b7b4:	0000007c 00000000 028d02dc 01660196     |.............f.
2002b7c4:	02480000 02320000 00000000 00000000     ..H...2.........
2002b7d4:	0000007d 00000000 028e02dd 01670198     }.............g.
2002b7e4:	02490000 02330000 00000000 00000000     ..I...3.........
2002b7f4:	0000007e 00000000 028f02de 00000000     ~...............
2002b804:	024a0000 02340000 00000000 00000000     ..J...4.........

2002b814 <HASH_SIZE>:
2002b814:	20202014 00000000 04030201 00000000     .   ............
2002b824:	01060204                                ....

2002b828 <CSWTCH.52>:
2002b828:	0000003f 00003f00 003f0000              ?....?....?.

2002b834 <hpsys_dll2_limit>:
	...
2002b83c:	112a8800 112a8800                       ..*...*.

2002b844 <hpsys_dvfs_config>:
2002b844:	000906fb 00100330 000a08fd 00110331     ....0.......1...
2002b854:	000d0b00 00130213 000f0d02 00130213     ................

2002b864 <crc32tab>:
2002b864:	00000000 77073096 ee0e612c 990951ba     .....0.w,a...Q..
2002b874:	076dc419 706af48f e963a535 9e6495a3     ..m...jp5.c...d.
2002b884:	0edb8832 79dcb8a4 e0d5e91e 97d2d988     2......y........
2002b894:	09b64c2b 7eb17cbd e7b82d07 90bf1d91     +L...|.~.-......
2002b8a4:	1db71064 6ab020f2 f3b97148 84be41de     d.... .jHq...A..
2002b8b4:	1adad47d 6ddde4eb f4d4b551 83d385c7     }......mQ.......
2002b8c4:	136c9856 646ba8c0 fd62f97a 8a65c9ec     V.l...kdz.b...e.
2002b8d4:	14015c4f 63066cd9 fa0f3d63 8d080df5     O\...l.cc=......
2002b8e4:	3b6e20c8 4c69105e d56041e4 a2677172     . n;^.iL.A`.rqg.
2002b8f4:	3c03e4d1 4b04d447 d20d85fd a50ab56b     ...<G..K....k...
2002b904:	35b5a8fa 42b2986c dbbbc9d6 acbcf940     ...5l..B....@...
2002b914:	32d86ce3 45df5c75 dcd60dcf abd13d59     .l.2u\.E....Y=..
2002b924:	26d930ac 51de003a c8d75180 bfd06116     .0.&:..Q.Q...a..
2002b934:	21b4f4b5 56b3c423 cfba9599 b8bda50f     ...!#..V........
2002b944:	2802b89e 5f058808 c60cd9b2 b10be924     ...(..._....$...
2002b954:	2f6f7c87 58684c11 c1611dab b6662d3d     .|o/.LhX..a.=-f.
2002b964:	76dc4190 01db7106 98d220bc efd5102a     .A.v.q... ..*...
2002b974:	71b18589 06b6b51f 9fbfe4a5 e8b8d433     ...q........3...
2002b984:	7807c9a2 0f00f934 9609a88e e10e9818     ...x4...........
2002b994:	7f6a0dbb 086d3d2d 91646c97 e6635c01     ..j.-=m..ld..\c.
2002b9a4:	6b6b51f4 1c6c6162 856530d8 f262004e     .Qkkbal..0e.N.b.
2002b9b4:	6c0695ed 1b01a57b 8208f4c1 f50fc457     ...l{.......W...
2002b9c4:	65b0d9c6 12b7e950 8bbeb8ea fcb9887c     ...eP.......|...
2002b9d4:	62dd1ddf 15da2d49 8cd37cf3 fbd44c65     ...bI-...|..eL..
2002b9e4:	4db26158 3ab551ce a3bc0074 d4bb30e2     Xa.M.Q.:t....0..
2002b9f4:	4adfa541 3dd895d7 a4d1c46d d3d6f4fb     A..J...=m.......
2002ba04:	4369e96a 346ed9fc ad678846 da60b8d0     j.iC..n4F.g...`.
2002ba14:	44042d73 33031de5 aa0a4c5f dd0d7cc9     s-.D...3_L...|..
2002ba24:	5005713c 270241aa be0b1010 c90c2086     <q.P.A.'..... ..
2002ba34:	5768b525 206f85b3 b966d409 ce61e49f     %.hW..o ..f...a.
2002ba44:	5edef90e 29d9c998 b0d09822 c7d7a8b4     ...^...)".......
2002ba54:	59b33d17 2eb40d81 b7bd5c3b c0ba6cad     .=.Y....;\...l..
2002ba64:	edb88320 9abfb3b6 03b6e20c 74b1d29a      ..............t
2002ba74:	ead54739 9dd277af 04db2615 73dc1683     9G...w...&.....s
2002ba84:	e3630b12 94643b84 0d6d6a3e 7a6a5aa8     ..c..;d.>jm..Zjz
2002ba94:	e40ecf0b 9309ff9d 0a00ae27 7d079eb1     ........'......}
2002baa4:	f00f9344 8708a3d2 1e01f268 6906c2fe     D.......h......i
2002bab4:	f762575d 806567cb 196c3671 6e6b06e7     ]Wb..ge.q6l...kn
2002bac4:	fed41b76 89d32be0 10da7a5a 67dd4acc     v....+..Zz...J.g
2002bad4:	f9b9df6f 8ebeeff9 17b7be43 60b08ed5     o.......C......`
2002bae4:	d6d6a3e8 a1d1937e 38d8c2c4 4fdff252     ....~......8R..O
2002baf4:	d1bb67f1 a6bc5767 3fb506dd 48b2364b     .g..gW.....?K6.H
2002bb04:	d80d2bda af0a1b4c 36034af6 41047a60     .+..L....J.6`z.A
2002bb14:	df60efc3 a867df55 316e8eef 4669be79     ..`.U.g...n1y.iF
2002bb24:	cb61b38c bc66831a 256fd2a0 5268e236     ..a...f...o%6.hR
2002bb34:	cc0c7795 bb0b4703 220216b9 5505262f     .w...G....."/&.U
2002bb44:	c5ba3bbe b2bd0b28 2bb45a92 5cb36a04     .;..(....Z.+.j.\
2002bb54:	c2d7ffa7 b5d0cf31 2cd99e8b 5bdeae1d     ....1......,...[
2002bb64:	9b64c2b0 ec63f226 756aa39c 026d930a     ..d.&.c...ju..m.
2002bb74:	9c0906a9 eb0e363f 72076785 05005713     ....?6...g.r.W..
2002bb84:	95bf4a82 e2b87a14 7bb12bae 0cb61b38     .J...z...+.{8...
2002bb94:	92d28e9b e5d5be0d 7cdcefb7 0bdbdf21     ...........|!...
2002bba4:	86d3d2d4 f1d4e242 68ddb3f8 1fda836e     ....B......hn...
2002bbb4:	81be16cd f6b9265b 6fb077e1 18b74777     ....[&...w.owG..
2002bbc4:	88085ae6 ff0f6a70 66063bca 11010b5c     .Z..pj...;.f\...
2002bbd4:	8f659eff f862ae69 616bffd3 166ccf45     ..e.i.b...kaE.l.
2002bbe4:	a00ae278 d70dd2ee 4e048354 3903b3c2     x.......T..N...9
2002bbf4:	a7672661 d06016f7 4969474d 3e6e77db     a&g...`.MGiI.wn>
2002bc04:	aed16a4a d9d65adc 40df0b66 37d83bf0     Jj...Z..f..@.;.7
2002bc14:	a9bcae53 debb9ec5 47b2cf7f 30b5ffe9     S..........G...0
2002bc24:	bdbdf21c cabac28a 53b39330 24b4a3a6     ........0..S...$
2002bc34:	bad03605 cdd70693 54de5729 23d967bf     .6......)W.T.g.#
2002bc44:	b3667a2e c4614ab8 5d681b02 2a6f2b94     .zf..Ja...h].+o*
2002bc54:	b40bbe37 c30c8ea1 5a05df1b 2d02ef8d     7..........Z...-

2002bc64 <CSWTCH.5>:
2002bc64:	2002bd04 2002bcd4 2002bca4 2002bc74     ... ... ... t.. 

2002bc74 <mbedtls_sha512_info>:
2002bc74:	00000008 2002ae23 00000040 00000080     ....#.. @.......
2002bc84:	20025e99 20025e8f 20025e8b 20025e85     .^. .^. .^. .^. 
2002bc94:	20025e69 20025e57 20025e53 20025e4f     i^. W^. S^. O^. 

2002bca4 <mbedtls_sha384_info>:
2002bca4:	00000007 2002ae2a 00000030 00000080     ....*.. 0.......
2002bcb4:	20025e93 20025e8f 20025e8b 20025e7f     .^. .^. .^. .^. 
2002bcc4:	20025e69 20025e57 20025e53 20025e4f     i^. W^. S^. O^. 

2002bcd4 <mbedtls_sha256_info>:
2002bcd4:	00000006 2002ae31 00000020 00000040     ....1..  ...@...
2002bce4:	20025e49 20025e3f 20025e3b 20025e35     I^. ?^. ;^. 5^. 
2002bcf4:	20025e19 20025e07 20025e03 20025dff     .^. .^. .^. .]. 

2002bd04 <mbedtls_sha224_info>:
2002bd04:	00000005 2002ae38 0000001c 00000040     ....8.. ....@...
2002bd14:	20025e43 20025e3f 20025e3b 20025e2f     C^. ?^. ;^. /^. 
2002bd24:	20025e19 20025e07 20025e03 20025dff     .^. .^. .^. .]. 

2002bd34 <sha256_padding>:
2002bd34:	00000080 00000000 00000000 00000000     ................
	...

2002bd74 <K>:
2002bd74:	428a2f98 71374491 b5c0fbcf e9b5dba5     ./.B.D7q........
2002bd84:	3956c25b 59f111f1 923f82a4 ab1c5ed5     [.V9...Y..?..^..
2002bd94:	d807aa98 12835b01 243185be 550c7dc3     .....[....1$.}.U
2002bda4:	72be5d74 80deb1fe 9bdc06a7 c19bf174     t].r........t...
2002bdb4:	e49b69c1 efbe4786 0fc19dc6 240ca1cc     .i...G.........$
2002bdc4:	2de92c6f 4a7484aa 5cb0a9dc 76f988da     o,.-..tJ...\...v
2002bdd4:	983e5152 a831c66d b00327c8 bf597fc7     RQ>.m.1..'....Y.
2002bde4:	c6e00bf3 d5a79147 06ca6351 14292967     ....G...Qc..g)).
2002bdf4:	27b70a85 2e1b2138 4d2c6dfc 53380d13     ...'8!...m,M..8S
2002be04:	650a7354 766a0abb 81c2c92e 92722c85     Ts.e..jv.....,r.
2002be14:	a2bfe8a1 a81a664b c24b8b70 c76c51a3     ....Kf..p.K..Ql.
2002be24:	d192e819 d6990624 f40e3585 106aa070     ....$....5..p.j.
2002be34:	19a4c116 1e376c08 2748774c 34b0bcb5     .....l7.LwH'...4
2002be44:	391c0cb3 4ed8aa4a 5b9cca4f 682e6ff3     ...9J..NO..[.o.h
2002be54:	748f82ee 78a5636f 84c87814 8cc70208     ...toc.x.x......
2002be64:	90befffa a4506ceb bef9a3f7 c67178f2     .....lP......xq.

2002be74 <sha512_padding>:
2002be74:	00000080 00000000 00000000 00000000     ................
	...

2002bef8 <K>:
2002bef8:	d728ae22 428a2f98 23ef65cd 71374491     ".(../.B.e.#.D7q
2002bf08:	ec4d3b2f b5c0fbcf 8189dbbc e9b5dba5     /;M.............
2002bf18:	f348b538 3956c25b b605d019 59f111f1     8.H.[.V9.......Y
2002bf28:	af194f9b 923f82a4 da6d8118 ab1c5ed5     .O....?...m..^..
2002bf38:	a3030242 d807aa98 45706fbe 12835b01     B........opE.[..
2002bf48:	4ee4b28c 243185be d5ffb4e2 550c7dc3     ...N..1$.....}.U
2002bf58:	f27b896f 72be5d74 3b1696b1 80deb1fe     o.{.t].r...;....
2002bf68:	25c71235 9bdc06a7 cf692694 c19bf174     5..%.....&i.t...
2002bf78:	9ef14ad2 e49b69c1 384f25e3 efbe4786     .J...i...%O8.G..
2002bf88:	8b8cd5b5 0fc19dc6 77ac9c65 240ca1cc     ........e..w...$
2002bf98:	592b0275 2de92c6f 6ea6e483 4a7484aa     u.+Yo,.-...n..tJ
2002bfa8:	bd41fbd4 5cb0a9dc 831153b5 76f988da     ..A....\.S.....v
2002bfb8:	ee66dfab 983e5152 2db43210 a831c66d     ..f.RQ>..2.-m.1.
2002bfc8:	98fb213f b00327c8 beef0ee4 bf597fc7     ?!...'........Y.
2002bfd8:	3da88fc2 c6e00bf3 930aa725 d5a79147     ...=....%...G...
2002bfe8:	e003826f 06ca6351 0a0e6e70 14292967     o...Qc..pn..g)).
2002bff8:	46d22ffc 27b70a85 5c26c926 2e1b2138     ./.F...'&.&\8!..
2002c008:	5ac42aed 4d2c6dfc 9d95b3df 53380d13     .*.Z.m,M......8S
2002c018:	8baf63de 650a7354 3c77b2a8 766a0abb     .c..Ts.e..w<..jv
2002c028:	47edaee6 81c2c92e 1482353b 92722c85     ...G....;5...,r.
2002c038:	4cf10364 a2bfe8a1 bc423001 a81a664b     d..L.....0B.Kf..
2002c048:	d0f89791 c24b8b70 0654be30 c76c51a3     ....p.K.0.T..Ql.
2002c058:	d6ef5218 d192e819 5565a910 d6990624     .R........eU$...
2002c068:	5771202a f40e3585 32bbd1b8 106aa070     * qW.5.....2p.j.
2002c078:	b8d2d0c8 19a4c116 5141ab53 1e376c08     ........S.AQ.l7.
2002c088:	df8eeb99 2748774c e19b48a8 34b0bcb5     ....LwH'.H.....4
2002c098:	c5c95a63 391c0cb3 e3418acb 4ed8aa4a     cZ.....9..A.J..N
2002c0a8:	7763e373 5b9cca4f d6b2b8a3 682e6ff3     s.cwO..[.....o.h
2002c0b8:	5defb2fc 748f82ee 43172f60 78a5636f     ...]...t`/.Coc.x
2002c0c8:	a1f0ab72 84c87814 1a6439ec 8cc70208     r....x...9d.....
2002c0d8:	23631e28 90befffa de82bde9 a4506ceb     (.c#.........lP.
2002c0e8:	b2c67915 bef9a3f7 e372532b c67178f2     .y......+Sr..xq.
2002c0f8:	ea26619c ca273ece 21c0c207 d186b8c7     .a&..>'....!....
2002c108:	cde0eb1e eada7dd6 ee6ed178 f57d4f7f     .....}..x.n..O}.
2002c118:	72176fba 06f067aa a2c898a6 0a637dc5     .o.r.g.......}c.
2002c128:	bef90dae 113f9804 131c471b 1b710b35     ......?..G..5.q.
2002c138:	23047d84 28db77f5 40c72493 32caab7b     .}.#.w.(.$.@{..2
2002c148:	15c9bebc 3c9ebe0a 9c100d4c 431d67c4     .......<L....g.C
2002c158:	cb3e42b6 4cc5d4be fc657e2a 597f299c     .B>....L*~e..).Y
2002c168:	3ad6faec 5fcb6fab 4a475817 6c44198c     ...:.o._.XGJ..Dl

2002c178 <oid_md_alg>:
2002c178:	2002ae3f 00000009 2002ae49 2002af52     ?.. ....I.. R.. 
2002c188:	00000005 2002ae53 00000009 2002ae5d     ....S.. ....].. 
2002c198:	2002af85 00000006 2002ae67 00000009     ... ....g.. ....
2002c1a8:	2002ae71 2002afb8 00000007 2002ae7b     q.. ... ....{.. 
2002c1b8:	00000009 2002ae85 2002afeb 00000008     ....... ... ....
	...

2002c1dc <oid_pk_alg>:
2002c1dc:	2002aec7 00000009 2002aed1 2002aedf     ... ....... ... 
2002c1ec:	00000001 2002aee3 00000007 2002aeeb     ....... ....... 
2002c1fc:	2002aefa 00000002 2002af09 00000005     ... ....... ....
2002c20c:	2002af0f 2002af17 00000003 00000000     ... ... ........
	...

2002c22c <mbedtls_rsa_info>:
2002c22c:	00000001 2002aedf 2002950f 20029503     ....... ... ... 
2002c23c:	200295e9 200295c5 20029599 20029569     ... ... ... i.. 
2002c24c:	20029565 2002954b 20029539 20029515     e.. K.. 9.. ... 

2002c25c <_init>:
2002c25c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
2002c25e:	bf00      	nop
2002c260:	bcf8      	pop	{r3, r4, r5, r6, r7}
2002c262:	bc08      	pop	{r3}
2002c264:	469e      	mov	lr, r3
2002c266:	4770      	bx	lr

2002c268 <_fini>:
2002c268:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
2002c26a:	bf00      	nop
2002c26c:	bcf8      	pop	{r3, r4, r5, r6, r7}
2002c26e:	bc08      	pop	{r3}
2002c270:	469e      	mov	lr, r3
2002c272:	4770      	bx	lr

2002c274 <__EH_FRAME_BEGIN__>:
2002c274:	0000 0000                                   ....

Disassembly of section .l1_ret_text_HAL_Set_backup:

2002c278 <HAL_Set_backup>:
2002c278:	4b01      	ldr	r3, [pc, #4]	@ (2002c280 <HAL_Set_backup+0x8>)
2002c27a:	f843 1020 	str.w	r1, [r3, r0, lsl #2]
2002c27e:	4770      	bx	lr
2002c280:	500cb030 	.word	0x500cb030

Disassembly of section .l1_ret_text_HAL_Get_backup:

2002c284 <HAL_Get_backup>:
2002c284:	4b01      	ldr	r3, [pc, #4]	@ (2002c28c <HAL_Get_backup+0x8>)
2002c286:	f853 0020 	ldr.w	r0, [r3, r0, lsl #2]
2002c28a:	4770      	bx	lr
2002c28c:	500cb030 	.word	0x500cb030

Disassembly of section .l1_ret_text_HAL_PMU_ConfigPeriLdo:

2002c290 <HAL_PMU_ConfigPeriLdo>:
2002c290:	b538      	push	{r3, r4, r5, lr}
2002c292:	b160      	cbz	r0, 2002c2ae <HAL_PMU_ConfigPeriLdo+0x1e>
2002c294:	4c11      	ldr	r4, [pc, #68]	@ (2002c2dc <HAL_PMU_ConfigPeriLdo+0x4c>)
2002c296:	6863      	ldr	r3, [r4, #4]
2002c298:	b2db      	uxtb	r3, r3
2002c29a:	2b07      	cmp	r3, #7
2002c29c:	d01a      	beq.n	2002c2d4 <HAL_PMU_ConfigPeriLdo+0x44>
2002c29e:	6863      	ldr	r3, [r4, #4]
2002c2a0:	b2db      	uxtb	r3, r3
2002c2a2:	2b0f      	cmp	r3, #15
2002c2a4:	d016      	beq.n	2002c2d4 <HAL_PMU_ConfigPeriLdo+0x44>
2002c2a6:	2808      	cmp	r0, #8
2002c2a8:	d001      	beq.n	2002c2ae <HAL_PMU_ConfigPeriLdo+0x1e>
2002c2aa:	2810      	cmp	r0, #16
2002c2ac:	d114      	bne.n	2002c2d8 <HAL_PMU_ConfigPeriLdo+0x48>
2002c2ae:	2900      	cmp	r1, #0
2002c2b0:	f04f 0421 	mov.w	r4, #33	@ 0x21
2002c2b4:	bf0c      	ite	eq
2002c2b6:	2120      	moveq	r1, #32
2002c2b8:	2101      	movne	r1, #1
2002c2ba:	4d09      	ldr	r5, [pc, #36]	@ (2002c2e0 <HAL_PMU_ConfigPeriLdo+0x50>)
2002c2bc:	4084      	lsls	r4, r0
2002c2be:	6deb      	ldr	r3, [r5, #92]	@ 0x5c
2002c2c0:	4081      	lsls	r1, r0
2002c2c2:	ea23 0304 	bic.w	r3, r3, r4
2002c2c6:	430b      	orrs	r3, r1
2002c2c8:	65eb      	str	r3, [r5, #92]	@ 0x5c
2002c2ca:	b11a      	cbz	r2, 2002c2d4 <HAL_PMU_ConfigPeriLdo+0x44>
2002c2cc:	f241 3088 	movw	r0, #5000	@ 0x1388
2002c2d0:	f7f5 fe93 	bl	20021ffa <HAL_Delay_us>
2002c2d4:	2000      	movs	r0, #0
2002c2d6:	bd38      	pop	{r3, r4, r5, pc}
2002c2d8:	2001      	movs	r0, #1
2002c2da:	e7fc      	b.n	2002c2d6 <HAL_PMU_ConfigPeriLdo+0x46>
2002c2dc:	5000b000 	.word	0x5000b000
2002c2e0:	500ca000 	.word	0x500ca000

Disassembly of section .l1_ret_text_HAL_PMU_Reboot:

2002c2e4 <HAL_PMU_Reboot>:
2002c2e4:	b538      	push	{r3, r4, r5, lr}
2002c2e6:	f3ef 8310 	mrs	r3, PRIMASK
2002c2ea:	2501      	movs	r5, #1
2002c2ec:	f385 8810 	msr	PRIMASK, r5
2002c2f0:	2002      	movs	r0, #2
2002c2f2:	f7f6 fb93 	bl	20022a1c <HAL_HPAON_WakeCore>
2002c2f6:	4628      	mov	r0, r5
2002c2f8:	f7f8 ffa0 	bl	2002523c <HAL_RCC_Reset_and_Halt_LCPU>
2002c2fc:	462a      	mov	r2, r5
2002c2fe:	2100      	movs	r1, #0
2002c300:	2008      	movs	r0, #8
2002c302:	f7ff ffc5 	bl	2002c290 <HAL_PMU_ConfigPeriLdo>
2002c306:	f44f 50fa 	mov.w	r0, #8000	@ 0x1f40
2002c30a:	f7f5 fe17 	bl	20021f3c <HAL_Delay_us_>
2002c30e:	2000      	movs	r0, #0
2002c310:	f7f8 fd94 	bl	20024e3c <HAL_RCC_HCPU_GetClockSrc>
2002c314:	4604      	mov	r4, r0
2002c316:	b928      	cbnz	r0, 2002c324 <HAL_PMU_Reboot+0x40>
2002c318:	f7f6 fbaa 	bl	20022a70 <HAL_HPAON_EnableXT48>
2002c31c:	4629      	mov	r1, r5
2002c31e:	4620      	mov	r0, r4
2002c320:	f7f8 fe54 	bl	20024fcc <HAL_RCC_HCPU_ClockSelect>
2002c324:	4b10      	ldr	r3, [pc, #64]	@ (2002c368 <HAL_PMU_Reboot+0x84>)
2002c326:	4c11      	ldr	r4, [pc, #68]	@ (2002c36c <HAL_PMU_Reboot+0x88>)
2002c328:	2000      	movs	r0, #0
2002c32a:	6763      	str	r3, [r4, #116]	@ 0x74
2002c32c:	f7ff ffaa 	bl	2002c284 <HAL_Get_backup>
2002c330:	4601      	mov	r1, r0
2002c332:	f020 407f 	bic.w	r0, r0, #4278190080	@ 0xff000000
2002c336:	f020 000f 	bic.w	r0, r0, #15
2002c33a:	b928      	cbnz	r0, 2002c348 <HAL_PMU_Reboot+0x64>
2002c33c:	f441 41a0 	orr.w	r1, r1, #20480	@ 0x5000
2002c340:	f041 0150 	orr.w	r1, r1, #80	@ 0x50
2002c344:	f7ff ff98 	bl	2002c278 <HAL_Set_backup>
2002c348:	6823      	ldr	r3, [r4, #0]
2002c34a:	075b      	lsls	r3, r3, #29
2002c34c:	d506      	bpl.n	2002c35c <HAL_PMU_Reboot+0x78>
2002c34e:	6823      	ldr	r3, [r4, #0]
2002c350:	4807      	ldr	r0, [pc, #28]	@ (2002c370 <HAL_PMU_Reboot+0x8c>)
2002c352:	f023 0304 	bic.w	r3, r3, #4
2002c356:	6023      	str	r3, [r4, #0]
2002c358:	f7f5 fe4f 	bl	20021ffa <HAL_Delay_us>
2002c35c:	4a03      	ldr	r2, [pc, #12]	@ (2002c36c <HAL_PMU_Reboot+0x88>)
2002c35e:	6813      	ldr	r3, [r2, #0]
2002c360:	f043 0304 	orr.w	r3, r3, #4
2002c364:	6013      	str	r3, [r2, #0]
2002c366:	e7fe      	b.n	2002c366 <HAL_PMU_Reboot+0x82>
2002c368:	0a50c015 	.word	0x0a50c015
2002c36c:	500ca000 	.word	0x500ca000
2002c370:	000186a0 	.word	0x000186a0

Disassembly of section .l1_ret_text_HAL_PMU_GetHpsysVoutRef:

2002c374 <HAL_PMU_GetHpsysVoutRef>:
2002c374:	4b04      	ldr	r3, [pc, #16]	@ (2002c388 <HAL_PMU_GetHpsysVoutRef+0x14>)
2002c376:	781a      	ldrb	r2, [r3, #0]
2002c378:	b122      	cbz	r2, 2002c384 <HAL_PMU_GetHpsysVoutRef+0x10>
2002c37a:	b118      	cbz	r0, 2002c384 <HAL_PMU_GetHpsysVoutRef+0x10>
2002c37c:	78db      	ldrb	r3, [r3, #3]
2002c37e:	7003      	strb	r3, [r0, #0]
2002c380:	2000      	movs	r0, #0
2002c382:	4770      	bx	lr
2002c384:	2001      	movs	r0, #1
2002c386:	4770      	bx	lr
2002c388:	2004cbd0 	.word	0x2004cbd0

Disassembly of section .l1_ret_text_HAL_PMU_GetHpsysVoutRef2:

2002c38c <HAL_PMU_GetHpsysVoutRef2>:
2002c38c:	4b04      	ldr	r3, [pc, #16]	@ (2002c3a0 <HAL_PMU_GetHpsysVoutRef2+0x14>)
2002c38e:	781a      	ldrb	r2, [r3, #0]
2002c390:	b122      	cbz	r2, 2002c39c <HAL_PMU_GetHpsysVoutRef2+0x10>
2002c392:	b118      	cbz	r0, 2002c39c <HAL_PMU_GetHpsysVoutRef2+0x10>
2002c394:	7b5b      	ldrb	r3, [r3, #13]
2002c396:	7003      	strb	r3, [r0, #0]
2002c398:	2000      	movs	r0, #0
2002c39a:	4770      	bx	lr
2002c39c:	2001      	movs	r0, #1
2002c39e:	4770      	bx	lr
2002c3a0:	2004cbd0 	.word	0x2004cbd0

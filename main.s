	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	mov	r3, #5568
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L4+24
	ldr	r1, .L4+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r2, #67108864
	ldr	r1, .L4+32
	strh	r3, [r2, #16]	@ movhi
	pop	{r4, lr}
	strh	r3, [r2, #18]	@ movhi
	str	r3, [r1]
	bx	lr
.L5:
	.align	2
.L4:
	.word	waitForVBlank
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	titlePal
	.word	titleTiles
	.word	100712448
	.word	titleMap
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #4864
	mov	ip, #22528
	mov	r1, #0
	ldr	r0, .L8
	push	{r4, lr}
	strh	r2, [r3]	@ movhi
	strh	ip, [r3, #8]	@ movhi
	ldr	r2, .L8+4
	strh	r0, [r3, #10]	@ movhi
	ldr	r0, .L8+8
	ldrh	ip, [r2, #48]
	ldr	r2, .L8+12
	ldr	r3, .L8+16
	strh	ip, [r0]	@ movhi
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+24
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L8+28
	ldr	r3, .L8+32
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	24068
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	setupSounds
	.word	setupInterrupts
	.word	aerate_length
	.word	aerate_data
	.word	playSoundA
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause.part.0, %function
pause.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L12
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L12+4
	ldr	r3, .L12+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L13:
	.align	2
.L12:
	.word	aerate_length
	.word	aerate_data
	.word	playSoundA
	.size	pause.part.0, .-pause.part.0
	.set	lose.part.0,pause.part.0
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L16
	mov	lr, pc
	bx	r3
	ldr	r3, .L16+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L16+8
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L16+12
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L16+16
	ldr	r1, .L16+20
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L16+24
	mov	r0, #3
	ldr	r1, .L16+28
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L16+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L17:
	.align	2
.L16:
	.word	waitForVBlank
	.word	hideSprites
	.word	DMANow
	.word	instructionsPal
	.word	5264
	.word	instructionsTiles
	.word	100712448
	.word	instructionsMap
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L26
	mov	lr, pc
	bx	r3
	ldr	r4, .L26+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L26+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L26+12
	ldr	r2, .L26+16
	ldr	r1, .L26+20
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L26+24
	ldr	r1, .L26+28
	mov	lr, pc
	bx	r4
	ldr	r3, .L26+32
	ldr	r5, [r3]
	cmp	r5, #1
	beq	.L23
	cmp	r5, #2
	beq	.L24
	cmp	r5, #3
	beq	.L25
.L20:
	mov	r2, #67108864
	ldr	r3, .L26+36
	ldrh	r1, [r3]
	ldr	r3, .L26+40
	strh	r1, [r2, #18]	@ movhi
	ldrh	r1, [r3]
	mov	r0, #3
	strh	r1, [r2, #16]	@ movhi
	mov	r3, #16384
	ldr	r2, .L26+44
	ldr	r1, .L26+48
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L26+52
	ldr	r1, .L26+56
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L26+60
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L26+64
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L26+68
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L23:
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L26+72
	ldr	r1, .L26+76
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L26+80
	ldr	r1, .L26+84
	mov	lr, pc
	bx	r4
	b	.L20
.L24:
	mov	r3, #6272
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L26+88
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L26+80
	ldr	r1, .L26+92
	mov	lr, pc
	bx	r4
	b	.L20
.L25:
	mov	r0, r5
	mov	r3, #3376
	mov	r2, #100663296
	ldr	r1, .L26+96
	mov	lr, pc
	bx	r4
	mov	r0, r5
	mov	r3, #2048
	ldr	r2, .L26+80
	ldr	r1, .L26+100
	mov	lr, pc
	bx	r4
	b	.L20
.L27:
	.align	2
.L26:
	.word	waitForVBlank
	.word	DMANow
	.word	level1Pal
	.word	8416
	.word	100679680
	.word	treesTiles
	.word	100724736
	.word	treesMap
	.word	level
	.word	vOff
	.word	hOff
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.word	4912
	.word	level1Tiles
	.word	100712448
	.word	level1Map
	.word	level2Tiles
	.word	level2Map
	.word	level3Tiles
	.word	level3Map
	.size	goToGame, .-goToGame
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	start.part.0, %function
start.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #1
	ldr	r3, .L30
	str	r4, [r3]
	bl	goToGame
	ldr	r3, .L30+4
	mov	r2, r4
	ldr	r1, [r3]
	ldr	r0, .L30+8
	ldr	r3, .L30+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L30+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	level
	.word	folkGuitar_length
	.word	folkGuitar_data
	.word	playSoundA
	.word	initGame
	.size	start.part.0, .-start.part.0
	.set	instructions.part.0,start.part.0
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L44
	ldrh	r3, [r4]
	tst	r3, #1
	beq	.L33
	ldr	r2, .L44+4
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L42
.L33:
	tst	r3, #8
	beq	.L32
	ldr	r3, .L44+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L43
.L32:
	pop	{r4, lr}
	bx	lr
.L43:
	pop	{r4, lr}
	b	instructions.part.0
.L42:
	bl	goToStart
	ldrh	r3, [r4]
	b	.L33
.L45:
	.align	2
.L44:
	.word	oldButtons
	.word	buttons
	.size	instructions, .-instructions
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L58
	ldrh	r3, [r4]
	tst	r3, #1
	beq	.L47
	ldr	r2, .L58+4
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L56
.L47:
	tst	r3, #8
	beq	.L46
	ldr	r3, .L58+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L57
.L46:
	pop	{r4, lr}
	bx	lr
.L57:
	pop	{r4, lr}
	b	start.part.0
.L56:
	bl	goToInstructions
	ldrh	r3, [r4]
	b	.L47
.L59:
	.align	2
.L58:
	.word	oldButtons
	.word	buttons
	.size	start, .-start
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L62
	mov	lr, pc
	bx	r3
	ldr	r3, .L62+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L62+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L62+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L62+16
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L62+20
	ldr	r1, .L62+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L62+28
	ldr	r1, .L62+32
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #0
	mov	r0, #3
	ldr	r1, .L62+36
	strh	r2, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	str	r0, [r1]
	bx	lr
.L63:
	.align	2
.L62:
	.word	waitForVBlank
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	pausePal
	.word	5216
	.word	pauseTiles
	.word	100712448
	.word	pauseMap
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L71
	mov	lr, pc
	bx	r3
	ldr	r3, .L71+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L71+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L64
	ldr	r3, .L71+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L70
.L64:
	pop	{r4, lr}
	bx	lr
.L70:
	pop	{r4, lr}
	b	goToPause
.L72:
	.align	2
.L71:
	.word	updateGame
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.size	game, .-game
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L85
	mov	lr, pc
	bx	r3
	ldr	r4, .L85+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L85+8
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #0
	ldr	r4, .L85+12
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L74
	ldr	r2, .L85+16
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L83
.L74:
	tst	r3, #1
	beq	.L73
	ldr	r3, .L85+16
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L84
.L73:
	pop	{r4, lr}
	bx	lr
.L84:
	pop	{r4, lr}
	b	pause.part.0
.L83:
	bl	goToGame
	ldrh	r3, [r4]
	b	.L74
.L86:
	.align	2
.L85:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L89
	mov	lr, pc
	bx	r3
	ldr	r3, .L89+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L89+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L89+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L89+16
	mov	lr, pc
	bx	r4
	mov	r3, #7232
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L89+20
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L89+24
	ldr	r1, .L89+28
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #0
	mov	r0, #4
	ldr	r1, .L89+32
	strh	r2, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	str	r0, [r1]
	bx	lr
.L90:
	.align	2
.L89:
	.word	waitForVBlank
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	losePal
	.word	loseTiles
	.word	100712448
	.word	loseMap
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L98
	mov	lr, pc
	bx	r3
	ldr	r4, .L98+4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L98+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #0
	ldr	r1, .L98+12
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	ldrh	r3, [r1]
	tst	r3, #8
	beq	.L91
	ldr	r3, .L98+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L97
.L91:
	pop	{r4, lr}
	bx	lr
.L97:
	pop	{r4, lr}
	b	lose.part.0
.L99:
	.align	2
.L98:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L112
	mov	lr, pc
	bx	r3
	ldr	r6, .L112+4
	ldr	r8, .L112+8
	ldr	r5, .L112+12
	ldr	fp, .L112+16
	ldr	r10, .L112+20
	ldr	r9, .L112+24
	ldr	r7, .L112+28
	ldr	r4, .L112+32
.L101:
	ldr	r2, [r6]
	ldrh	r3, [r8]
.L102:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L102
.L104:
	.word	.L108
	.word	.L107
	.word	.L106
	.word	.L105
	.word	.L103
	.word	.L103
.L103:
	mov	lr, pc
	bx	r7
	b	.L101
.L105:
	ldr	r3, .L112+36
	mov	lr, pc
	bx	r3
	b	.L101
.L106:
	mov	lr, pc
	bx	r9
	b	.L101
.L107:
	mov	lr, pc
	bx	r10
	b	.L101
.L108:
	mov	lr, pc
	bx	fp
	b	.L101
.L113:
	.align	2
.L112:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	instructions
	.word	game
	.word	lose
	.word	67109120
	.word	pause
	.size	main, .-main
	.text
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L116
	mov	lr, pc
	bx	r3
	ldr	r3, .L116+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L116+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L116+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L116+16
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L116+20
	ldr	r1, .L116+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L116+28
	ldr	r1, .L116+32
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #0
	mov	r0, #5
	ldr	r1, .L116+36
	strh	r2, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	str	r0, [r1]
	bx	lr
.L117:
	.align	2
.L116:
	.word	waitForVBlank
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	winPal
	.word	5968
	.word	winTiles
	.word	100712448
	.word	winMap
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	lose
	.size	win, .-win
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	level,4,4
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

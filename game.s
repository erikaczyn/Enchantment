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
	.file	"game.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer.part.0, %function
drawPlayer.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L4
	ldr	r3, .L4+4
	push	{r4, lr}
	ldr	ip, .L4+8
	ldr	r2, [r1, #4]
	ldr	r4, [r3]
	ldr	lr, [r1, #36]
	ldr	r3, [r1, #28]
	ldr	r0, [r1]
	ldr	ip, [ip]
	ldr	r1, .L4+12
	sub	r2, r2, r4
	add	r3, r3, lr, lsl #5
	orr	r2, r2, #16384
	sub	r0, r0, ip
	lsl	r3, r3, #1
	strh	r2, [r1, #2]	@ movhi
	strh	r0, [r1]	@ movhi
	strh	r3, [r1, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	witch
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.size	drawPlayer.part.0, .-drawPlayer.part.0
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #16
	push	{r4, lr}
	mov	r1, #1
	mov	r4, #120
	mov	lr, #4
	mov	r2, #0
	mov	r0, #3
	ldr	r3, .L8
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	ldr	ip, .L8+4
	str	r4, [r3]
	str	r1, [ip]
	ldr	r4, .L8+8
	str	lr, [r3, #4]
	str	r1, [r3, #8]
	ldr	lr, .L8+12
	str	r1, [r3, #12]
	ldr	ip, .L8+16
	ldr	r1, .L8+20
	str	r2, [r4]
	str	r2, [lr]
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	str	r2, [r3, #28]
	str	r2, [ip]
	str	r0, [r3, #40]
	str	r0, [r1]
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	witch
	.word	onGround
	.word	jumpCount
	.word	hoverCount
	.word	cheat
	.word	mana
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initAnts
	.syntax unified
	.arm
	.fpu softvfp
	.type	initAnts, %function
initAnts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L19
	push	{r4, r5, lr}
	mov	r3, r0
	mov	r5, #32
	mov	r4, #16
	mov	r2, #1
	mov	r1, #0
	mov	lr, #4
	add	ip, r0, #156
.L11:
	str	r5, [r3, #16]
	str	r4, [r3, #20]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r1, [r3, #24]
	str	r1, [r3, #36]
	str	lr, [r3, #40]
	str	r2, [r3, #48]
	str	r2, [r3, #44]
	add	r3, r3, #52
	cmp	r3, ip
	bne	.L11
	ldr	r3, .L19+4
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L17
	cmp	r3, #2
	beq	.L18
	cmp	r3, #3
	bne	.L10
	mov	ip, #113
	mov	r1, #125
	mov	r2, #74
	ldr	r3, .L19+8
	str	ip, [r0]
	str	r1, [r0, #4]
	str	r2, [r0, #52]
	str	r3, [r0, #56]
	pop	{r4, r5, lr}
	bx	lr
.L18:
	mov	r3, #72
	mov	r1, #120
	mov	r2, #400
	str	r3, [r0]
	str	r3, [r0, #52]
	str	r1, [r0, #4]
	str	r2, [r0, #56]
.L10:
	pop	{r4, r5, lr}
	bx	lr
.L17:
	mov	r3, #120
	mov	r1, #96
	mov	r2, #320
	stm	r0, {r1, r3}
	str	r3, [r0, #52]
	str	r2, [r0, #56]
	pop	{r4, r5, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	ants
	.word	level
	.word	394
	.size	initAnts, .-initAnts
	.align	2
	.global	initWisps
	.syntax unified
	.arm
	.fpu softvfp
	.type	initWisps, %function
initWisps:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L30
	push	{r4, lr}
	mov	r0, #8
	mov	r3, ip
	mov	r2, #1
	mov	r1, #0
	mov	r4, #2
	add	lr, ip, #156
.L22:
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r1, [r3, #24]
	str	r1, [r3, #36]
	str	r4, [r3, #40]
	str	r2, [r3, #44]
	str	r2, [r3, #48]
	add	r3, r3, #52
	cmp	r3, lr
	bne	.L22
	ldr	r3, .L30+4
	ldr	r3, [r3]
	cmp	r3, #1
	moveq	r0, #16
	beq	.L28
	cmp	r3, #2
	beq	.L29
	cmp	r3, #3
	bne	.L21
	mov	r0, #40
	mov	r1, #124
	mov	r2, #120
	ldr	r3, .L30+8
	stm	ip, {r0, r1}
	str	r2, [ip, #52]
	str	r3, [ip, #56]
	pop	{r4, lr}
	bx	lr
.L29:
	mov	r0, #40
.L28:
	mov	r1, #140
	mov	r2, #24
	mov	r3, #440
	stm	ip, {r0, r1}
	str	r2, [ip, #52]
	str	r3, [ip, #56]
.L21:
	pop	{r4, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	wisps
	.word	level
	.word	350
	.size	initWisps, .-initWisps
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L41
	ldr	r3, [r3]
	ldr	r0, .L41+4
	ldr	r1, .L41+8
	cmp	r3, #1
	push	{r4, r5, r6, lr}
	str	r2, [r0]
	str	r2, [r1]
	beq	.L39
	cmp	r3, #2
	beq	.L40
	cmp	r3, #3
	ldreq	r3, .L41+12
	ldreq	r2, .L41+16
	streq	r2, [r3]
.L34:
	mov	r1, #120
	mov	r3, #0
	mov	r5, #1
	mov	ip, #4
	mov	r2, #3
	mov	r6, #16
	ldr	r4, .L41+20
	ldr	r0, .L41+24
	str	r1, [r4]
	ldr	r1, .L41+28
	str	r5, [r0]
	str	r3, [r1]
	str	ip, [r4, #4]
	ldr	r1, .L41+32
	ldr	ip, .L41+36
	ldr	r0, .L41+40
	str	r3, [ip]
	str	r2, [r1]
	str	r3, [r4, #24]
	str	r3, [r4, #36]
	str	r3, [r4, #28]
	str	r3, [r0]
	str	r2, [r4, #40]
	str	r5, [r4, #8]
	str	r5, [r4, #12]
	str	r6, [r4, #16]
	str	r6, [r4, #20]
	bl	initAnts
	bl	initWisps
	mov	r2, r5
	mov	r1, r6
	mov	r5, #2
	ldr	ip, [r4, #16]
	ldr	r0, [r4, #4]
	ldr	r3, .L41+44
	ldr	lr, [r4]
	add	r0, r0, ip
	add	ip, r3, #156
.L36:
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #8]
	str	r5, [r3, #12]
	str	r2, [r3, #44]
	str	lr, [r3]
	str	r0, [r3, #4]
	add	r3, r3, #52
	cmp	r3, ip
	bne	.L36
	pop	{r4, r5, r6, lr}
	bx	lr
.L40:
	ldr	r3, .L41+12
	ldr	r2, .L41+48
	str	r2, [r3]
	b	.L34
.L39:
	ldr	r3, .L41+12
	ldr	r2, .L41+52
	str	r2, [r3]
	b	.L34
.L42:
	.align	2
.L41:
	.word	level
	.word	vOff
	.word	hOff
	.word	collisionMap
	.word	collisionMap3Bitmap
	.word	witch
	.word	onGround
	.word	jumpCount
	.word	mana
	.word	hoverCount
	.word	cheat
	.word	spells
	.word	collisionMap2Bitmap
	.word	collisionMap1Bitmap
	.size	initGame, .-initGame
	.align	2
	.global	initSpells
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSpells, %function
initSpells:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r1, #16
	mov	r2, #1
	mov	r4, #2
	ldr	ip, .L47
	ldr	r3, .L47+4
	ldr	r0, [ip, #4]
	ldr	r5, [ip, #16]
	ldr	lr, [ip]
	add	r0, r0, r5
	add	ip, r3, #156
.L44:
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #8]
	str	r4, [r3, #12]
	str	r2, [r3, #44]
	str	lr, [r3]
	str	r0, [r3, #4]
	add	r3, r3, #52
	cmp	r3, ip
	bne	.L44
	pop	{r4, r5, lr}
	bx	lr
.L48:
	.align	2
.L47:
	.word	witch
	.word	spells
	.size	initSpells, .-initSpells
	.global	__aeabi_idivmod
	.align	2
	.global	animatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	animatePlayer, %function
animatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L77
	ldr	r3, .L77+4
	ldr	r5, [r4, #24]
	smull	r1, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	ldr	r6, [r4, #28]
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r6, [r4, #32]
	bne	.L50
	ldr	r0, [r4, #36]
	ldr	r3, .L77+8
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L50:
	ldr	r3, .L77+12
	ldrh	r3, [r3]
	tst	r3, #64
	beq	.L51
	ldr	r2, .L77+16
	ldrh	r2, [r2]
	tst	r2, #64
	bne	.L51
.L60:
	mov	r0, #2
	mov	r1, #0
	mov	r2, #1
	str	r0, [r4, #28]
	str	r1, [r4, #36]
	str	r2, [r4, #40]
.L61:
	tst	r3, #1
	beq	.L52
	ldr	r2, .L77+16
	ldrh	r2, [r2]
	mvn	r2, r2
	cmp	r6, #1
	movne	r6, #0
	andeq	r6, r2, #1
	cmp	r6, #0
	and	r2, r2, #1
	bne	.L75
	cmp	r2, #0
	movne	r1, #4
	movne	r2, #1
	strne	r6, [r4, #36]
	strne	r1, [r4, #28]
	strne	r2, [r4, #40]
.L52:
	tst	r3, #2
	beq	.L54
	ldr	r3, .L77+16
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L54
.L58:
	mov	r3, #1
	mov	r2, #0
	mov	r1, #6
	str	r3, [r4, #40]
	ldr	r3, .L77+20
	str	r2, [r4, #36]
	ldrh	r2, [r3, #48]
	tst	r2, #32
	str	r1, [r4, #28]
	bne	.L55
.L76:
	mov	r2, #1
	mov	r3, #3
	add	r5, r5, r2
	str	r5, [r4, #24]
	str	r2, [r4, #28]
	str	r3, [r4, #40]
	pop	{r4, r5, r6, lr}
	bx	lr
.L51:
	ldr	r2, .L77+24
	ldr	r2, [r2]
	cmp	r2, #0
	bgt	.L60
	b	.L61
.L54:
	ldr	r3, .L77+28
	ldr	r3, [r3]
	cmp	r3, #0
	bgt	.L58
	ldr	r3, .L77+20
	ldrh	r2, [r3, #48]
	tst	r2, #32
	beq	.L76
.L55:
	ldrh	r3, [r3, #48]
	ands	r3, r3, #16
	moveq	r2, #3
	movne	r3, #0
	addeq	r5, r5, #1
	streq	r5, [r4, #24]
	streq	r3, [r4, #28]
	streq	r2, [r4, #40]
	strne	r3, [r4, #36]
	pop	{r4, r5, r6, lr}
	bx	lr
.L75:
	mov	r0, #5
	mov	r1, #0
	mov	r2, #1
	str	r0, [r4, #28]
	str	r1, [r4, #36]
	str	r2, [r4, #40]
	b	.L52
.L78:
	.align	2
.L77:
	.word	witch
	.word	1717986919
	.word	__aeabi_idivmod
	.word	oldButtons
	.word	buttons
	.word	67109120
	.word	jumpCount
	.word	hoverCount
	.size	animatePlayer, .-animatePlayer
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L151
	ldr	r7, .L151+4
	ldr	r0, [r4, #8]
	ldr	r2, [r4, #20]
	ldr	r3, [r4, #16]
	sub	sp, sp, #20
	str	r0, [sp, #12]
	str	r2, [sp, #4]
	str	r3, [sp]
	str	r1, [sp, #8]
	ldr	r3, [r4]
	mov	r1, #512
	ldr	r2, [r4, #4]
	ldr	r0, [r7]
	ldr	r6, .L151+8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L140
	ldr	r8, .L151+12
.L80:
	mov	r2, #0
	mov	r3, #1
	ldr	r10, .L151+16
	ldr	r9, .L151+20
	str	r2, [r10]
	str	r3, [r9]
.L82:
	ldr	r5, .L151+24
	ldrh	r3, [r5]
	tst	r3, #64
	beq	.L86
	ldr	r3, .L151+28
	ldrh	r3, [r3]
	tst	r3, #64
	beq	.L144
.L86:
	ldr	r3, .L151+32
	ldrh	r3, [r3, #48]
	ands	r3, r3, #32
	beq	.L145
.L89:
	ldr	r3, .L151+32
	ldrh	r3, [r3, #48]
	ands	r3, r3, #16
	beq	.L146
.L92:
	ldrh	r3, [r5]
	tst	r3, #1
	beq	.L100
	ldr	r2, .L151+28
	ldrh	r2, [r2]
	ands	fp, r2, #1
	beq	.L147
.L100:
	tst	r3, #2
	beq	.L104
	ldr	r3, .L151+28
	ldrh	r2, [r3]
	ands	fp, r2, #2
	beq	.L148
.L104:
	ldr	r3, [r8]
	cmp	r3, #0
	bgt	.L149
.L107:
	ldrh	r2, [r5]
	ldr	r3, .L151+32
	tst	r2, #1
	ldrh	r3, [r3, #48]
	beq	.L111
	ldr	r2, .L151+28
	ldrh	r2, [r2]
	and	r3, r3, #128
	and	r2, r2, #1
	orrs	r3, r2, r3
	bne	.L111
	mov	r0, #3
	mov	r2, #1
	ldr	r1, .L151+36
	ldr	r3, .L151+40
	str	r0, [r1]
	str	r2, [r3]
.L111:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animatePlayer
.L140:
	ldr	r3, [r4]
	cmp	r3, #159
	ldr	r8, .L151+12
	bgt	.L80
	ldr	r1, [r8]
	cmp	r1, #0
	bne	.L80
	ldr	fp, .L151+44
	ldr	r2, [r4, #8]
	ldr	r0, [fp]
	ldr	r9, .L151+20
	add	r3, r3, r2
	cmn	r0, #1
	str	r3, [r4]
	str	r1, [r9]
	bge	.L81
	sub	r1, r3, r0
	cmp	r1, #80
	addgt	r0, r0, #1
	strgt	r0, [fp]
.L81:
	ldr	r10, .L151+16
	ldr	r1, [r10]
	cmp	r1, #0
	ble	.L82
	mov	r5, #0
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #16]
	rsb	r2, r2, r2, lsl #31
	lsl	r2, r2, #1
	stmib	sp, {r0, r5}
	str	r2, [sp, #12]
	str	r1, [sp]
	ldr	r2, [r4, #4]
	mov	r1, #512
	ldr	r0, [r7]
	mov	lr, pc
	bx	r6
	cmp	r0, r5
	beq	.L82
	ldr	r3, [r4]
	cmp	r3, r5
	ble	.L82
	ldr	r2, [r4, #8]
	ldr	r1, [fp]
	sub	r3, r3, r2, lsl #1
	ldr	r2, [r10]
	cmp	r1, #1
	sub	r2, r2, #1
	str	r5, [r9]
	str	r3, [r4]
	str	r2, [r10]
	ble	.L82
	sub	r3, r3, r1
	cmp	r3, #80
	suble	r1, r1, #2
	strle	r1, [fp]
	b	.L82
.L148:
	ldr	r10, .L151+36
	ldr	r3, [r10]
	cmp	r3, #0
	ble	.L104
	ldr	r3, .L151+48
	mov	r2, fp
	ldr	r1, [r3]
	ldr	r0, .L151+52
	ldr	r3, .L151+56
	mov	lr, pc
	bx	r3
	mov	ip, #80
	ldr	r3, [r4, #8]
	ldr	r1, [r4, #20]
	ldr	r2, [r4, #16]
	rsb	r3, r3, r3, lsl #29
	lsl	r3, r3, #3
	str	r3, [sp, #12]
	str	r1, [sp, #4]
	str	r2, [sp]
	mov	r1, #512
	str	fp, [sp, #8]
	ldr	r3, [r4]
	ldr	r2, [r4, #4]
	ldr	r0, [r7]
	str	ip, [r8]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L106
	ldr	r3, [r4]
	cmp	r3, #0
	subgt	r3, r3, #8
	strgt	r3, [r4]
	strgt	fp, [r9]
.L106:
	ldr	r3, .L151+40
	ldr	r3, [r3]
	cmp	r3, #0
	ldreq	r3, [r10]
	subeq	r3, r3, #1
	streq	r3, [r10]
	ldr	r3, [r8]
	cmp	r3, #0
	ble	.L107
.L149:
	mov	ip, #0
	ldr	r3, [r4, #8]
	ldr	r1, [r4, #20]
	ldr	r2, [r4, #16]
	rsb	r3, r3, #0
	stmib	sp, {r1, ip}
	str	r3, [sp, #12]
	str	r2, [sp]
	mov	r1, #512
	ldr	r0, [r7]
	ldr	r3, [r4]
	ldr	r2, [r4, #4]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L109
	ldr	r3, [r4]
	cmp	r3, #0
	ble	.L109
	ldr	r1, .L151+44
	ldr	r0, [r4, #8]
	ldr	r2, [r1]
	sub	r3, r3, r0
	cmp	r2, #0
	str	r3, [r4]
	ble	.L109
	sub	r3, r3, r2
	cmp	r3, #80
	suble	r2, r2, #1
	strle	r2, [r1]
.L109:
	ldr	r3, [r8]
	sub	r3, r3, #1
	str	r3, [r8]
	b	.L107
.L147:
	ldr	r10, .L151+36
	ldr	r2, [r10]
	cmp	r2, #0
	ble	.L100
	ldr	r3, .L151+48
	mov	r2, fp
	ldr	r1, [r3]
	ldr	r0, .L151+52
	ldr	r3, .L151+56
	mov	lr, pc
	bx	r3
	mov	r2, fp
	ldr	r0, [r4, #16]
	ldr	r1, [r4, #4]
	ldr	r3, .L151+60
	ldr	lr, [r4]
	add	r0, r0, r1
	add	ip, r3, #156
.L102:
	ldr	r1, [r3, #44]
	cmp	r1, #0
	strne	r2, [r3, #44]
	strne	lr, [r3]
	strne	r0, [r3, #4]
	add	r3, r3, #52
	cmp	ip, r3
	bne	.L102
	ldr	r3, .L151+40
	ldr	r3, [r3]
	cmp	r3, #0
	ldreq	r2, [r10]
	subeq	r2, r2, #1
	ldrh	r3, [r5]
	streq	r2, [r10]
	b	.L100
.L144:
	ldr	r2, [r10]
	ldr	r3, [r8]
	orrs	fp, r2, r3
	bne	.L86
	ldr	r3, [r9]
	cmp	r3, #0
	beq	.L86
	ldr	r3, [r4, #8]
	ldr	r1, [r4, #20]
	ldr	r2, [r4, #16]
	rsb	r3, r3, r3, lsl #31
	lsl	r3, r3, #1
	str	r3, [sp, #12]
	str	r1, [sp, #4]
	str	r2, [sp]
	mov	r1, #512
	str	fp, [sp, #8]
	ldr	r3, [r4]
	ldr	r2, [r4, #4]
	ldr	r0, [r7]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L86
	ldr	r3, [r4]
	cmp	r3, #0
	ble	.L86
	mov	r0, #20
	ldr	r2, [r4, #8]
	ldr	r1, .L151+44
	sub	r3, r3, r2, lsl #1
	ldr	r2, [r1]
	cmp	r2, #1
	str	fp, [r9]
	str	r3, [r4]
	str	r0, [r10]
	ble	.L86
	sub	r3, r3, r2
	cmp	r3, #80
	suble	r2, r2, #2
	strle	r2, [r1]
	b	.L86
.L146:
	ldr	r0, [r4, #12]
	ldr	r1, [r4, #20]
	ldr	r2, [r4, #16]
	str	r3, [sp, #12]
	str	r0, [sp, #8]
	str	r1, [sp, #4]
	str	r2, [sp]
	mov	r1, #512
	ldr	r3, [r4]
	ldr	r2, [r4, #4]
	ldr	r0, [r7]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L93
	ldr	r2, .L151+64
	ldr	r3, [r4, #4]
	ldr	r2, [r2]
	sub	r3, r3, r2
.L94:
	cmp	r3, #239
	ble	.L92
.L99:
	ldr	r2, .L151+68
	ldr	r3, [r2]
	cmp	r3, #3
	beq	.L150
	add	r3, r3, #1
	ldr	r1, .L151+72
	str	r3, [r2]
	mov	lr, pc
	bx	r1
	bl	initGame
	mov	r2, #83886080
	ldrh	r3, [r2]
	add	r3, r3, #1
	strh	r3, [r2]	@ movhi
	b	.L92
.L145:
	ldr	r2, [r4, #12]
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #16]
	rsb	r2, r2, #0
	stmib	sp, {r0, r2, r3}
	str	r1, [sp]
	ldr	r3, [r4]
	mov	r1, #512
	ldr	r2, [r4, #4]
	ldr	r0, [r7]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L89
	ldr	r3, [r4, #4]
	cmp	r3, #0
	ble	.L89
	ldr	r1, .L151+64
	ldr	r0, [r4, #12]
	ldr	r2, [r1]
	sub	r3, r3, r0
	cmp	r2, #0
	str	r3, [r4, #4]
	ble	.L89
	sub	r3, r3, r2
	cmp	r3, #120
	suble	r2, r2, #1
	strle	r2, [r1]
	b	.L89
.L93:
	ldr	r0, .L151+64
	ldr	r2, [r4, #4]
	ldr	r1, [r0]
	sub	r3, r2, r1
	cmp	r3, #239
	bgt	.L99
	ldr	r3, .L151+76
	ldr	ip, [r4, #12]
	cmp	r1, r3
	add	r2, r2, ip
	str	r2, [r4, #4]
	sub	r3, r2, r1
	bgt	.L94
	cmp	r3, #120
	ble	.L92
	add	r3, r1, #1
	str	r3, [r0]
	sub	r3, r2, r3
	b	.L94
.L150:
	ldr	r3, .L151+80
	mov	lr, pc
	bx	r3
	b	.L92
.L152:
	.align	2
.L151:
	.word	witch
	.word	collisionMap
	.word	collisionCheck
	.word	hoverCount
	.word	jumpCount
	.word	onGround
	.word	oldButtons
	.word	buttons
	.word	67109120
	.word	mana
	.word	cheat
	.word	vOff
	.word	spell_length
	.word	spell_data
	.word	playSoundB
	.word	spells
	.word	hOff
	.word	level
	.word	goToGame
	.word	270
	.word	goToWin
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	spawnSpell
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnSpell, %function
spawnSpell:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #0
	ldr	r2, .L161
	ldr	r3, .L161+4
	ldr	r0, [r2, #4]
	ldr	r1, [r2, #16]
	ldr	ip, [r2]
	add	r1, r1, r0
	add	r0, r3, #156
.L155:
	ldr	r2, [r3, #44]
	cmp	r2, #0
	strne	lr, [r3, #44]
	strne	ip, [r3]
	strne	r1, [r3, #4]
	add	r3, r3, #52
	cmp	r3, r0
	bne	.L155
	ldr	lr, [sp], #4
	bx	lr
.L162:
	.align	2
.L161:
	.word	witch
	.word	spells
	.size	spawnSpell, .-spawnSpell
	.align	2
	.global	updateAnts
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateAnts, %function
updateAnts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L177
	ldr	r5, .L177+4
	ldr	r8, .L177+8
	ldr	r7, .L177+12
	ldr	r9, .L177+16
	ldr	r10, .L177+20
	ldr	fp, .L177+24
	sub	sp, sp, #28
	add	r6, r4, #156
.L170:
	ldm	r4, {r2, r3}
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #16]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L164
	ldr	r3, [r4, #48]
	cmp	r3, #0
	beq	.L164
.L165:
	mov	lr, pc
	bx	r9
.L166:
	ldr	r3, [r4, #4]
	ldr	r2, [r7]
	sub	r3, r3, r2
	sub	r3, r3, #1
	cmp	r3, #238
	movls	r3, #0
	ldr	r0, [r4, #36]
	strls	r3, [r4, #44]
	sub	r3, r0, #1
	cmp	r3, #1
	bls	.L176
.L168:
	add	r4, r4, #52
	cmp	r4, r6
	bne	.L170
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L164:
	ldr	r3, [r5]
	ldr	r2, [r5, #20]
	add	r3, r3, r2
	cmp	r3, #159
	ble	.L166
	b	.L165
.L176:
	ldr	r3, [r4, #24]
	smull	r2, r1, r10, r3
	asr	r2, r3, #31
	rsb	r2, r2, r1, asr #3
	add	r2, r2, r2, lsl #2
	cmp	r3, r2, lsl #2
	bne	.L169
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	str	r3, [sp, #20]
	mov	lr, pc
	bx	fp
	ldr	r3, [sp, #20]
	str	r1, [r4, #36]
.L169:
	add	r3, r3, #1
	str	r3, [r4, #24]
	b	.L168
.L178:
	.align	2
.L177:
	.word	ants
	.word	witch
	.word	collision
	.word	hOff
	.word	goToLose
	.word	1717986919
	.word	__aeabi_idivmod
	.size	updateAnts, .-updateAnts
	.align	2
	.global	updateWisps
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateWisps, %function
updateWisps:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r9, #0
	ldr	r4, .L191
	ldr	r5, .L191+4
	ldr	r8, .L191+8
	ldr	r7, .L191+12
	ldr	r10, .L191+16
	sub	sp, sp, #16
	add	r6, r4, #156
.L182:
	ldm	r5, {r2, r3}
	ldr	r0, [r5, #20]
	ldr	r1, [r5, #16]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	ldr	r2, [r7]
	beq	.L180
	ldr	r3, [r4, #48]
	cmp	r3, #0
	ldrne	r3, [r10]
	addne	r3, r3, #1
	strne	r9, [r4, #48]
	strne	r3, [r10]
.L180:
	ldr	r3, [r4, #4]
	sub	r3, r3, r2
	sub	r3, r3, #1
	cmp	r3, #238
	strls	r9, [r4, #44]
	add	r4, r4, #52
	cmp	r4, r6
	bne	.L182
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L192:
	.align	2
.L191:
	.word	wisps
	.word	witch
	.word	collision
	.word	hOff
	.word	mana
	.size	updateWisps, .-updateWisps
	.align	2
	.global	animateWisp
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateWisp, %function
animateWisp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L198
	ldr	r8, .L198+4
	ldr	r6, .L198+8
	add	r7, r4, #156
.L195:
	ldr	r5, [r4, #24]
	smull	r3, r2, r8, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	bne	.L194
	add	r0, r4, #36
	ldm	r0, {r0, r1}
	add	r0, r0, #1
	mov	lr, pc
	bx	r6
	str	r1, [r4, #36]
.L194:
	add	r5, r5, #1
	str	r5, [r4, #24]
	add	r4, r4, #52
	cmp	r4, r7
	bne	.L195
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L199:
	.align	2
.L198:
	.word	wisps
	.word	1717986919
	.word	__aeabi_idivmod
	.size	animateWisp, .-animateWisp
	.align	2
	.global	updateSpells
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSpells, %function
updateSpells:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, #1
	ldr	r4, .L214
	ldr	r8, .L214+4
	ldr	r10, .L214+8
	ldr	fp, .L214+12
	sub	sp, sp, #28
	add	r7, r4, #156
.L206:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	ldr	r0, [r4, #4]
	beq	.L213
.L201:
	cmp	r0, #240
	strgt	r6, [r4, #44]
	add	r4, r4, #52
	cmp	r4, r7
	bne	.L206
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L213:
	ldr	r3, [r4, #12]
	ldr	r5, .L214+16
	add	r0, r0, r3
	str	r0, [r4, #4]
	add	r9, r5, #156
.L204:
	add	r1, r5, #16
	ldm	r1, {r1, ip}
	ldm	r5, {r2, r3}
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	ip, [sp, #12]
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L202
	mov	r1, #0
	ldr	r3, [r5, #24]
	smull	r2, r0, r10, r3
	asr	r2, r3, #31
	rsb	r2, r2, r0, asr #3
	add	r2, r2, r2, lsl #2
	cmp	r3, r2, lsl #2
	str	r6, [r4, #44]
	str	r6, [r5, #36]
	str	r1, [r5, #48]
	bne	.L203
	mov	r0, #2
	ldr	r1, [r5, #40]
	str	r3, [sp, #20]
	mov	lr, pc
	bx	fp
	ldr	r3, [sp, #20]
	str	r1, [r5, #36]
.L203:
	add	r3, r3, #1
	str	r3, [r5, #24]
.L202:
	add	r5, r5, #52
	cmp	r5, r9
	ldr	r0, [r4, #4]
	bne	.L204
	b	.L201
.L215:
	.align	2
.L214:
	.word	spells
	.word	collision
	.word	1717986919
	.word	__aeabi_idivmod
	.word	ants
	.size	updateSpells, .-updateSpells
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updatePlayer
	bl	updateAnts
	bl	updateWisps
	pop	{r4, lr}
	b	updateSpells
	.size	updateGame, .-updateGame
	.align	2
	.global	animateAnt
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateAnt, %function
animateAnt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r7, .L221
	add	r5, r0, r0, lsl #1
	add	r5, r0, r5, lsl #2
	add	r5, r7, r5, lsl #2
	ldr	r6, [r5, #24]
	ldr	r3, .L221+4
	smull	r1, r2, r3, r6
	asr	r3, r6, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r6, r3, lsl #2
	mov	r4, r0
	lsl	r8, r0, #1
	bne	.L219
	ldr	r0, [r5, #36]
	ldr	r3, .L221+8
	ldr	r1, [r5, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r5, #36]
.L219:
	add	r8, r8, r4
	add	r4, r4, r8, lsl #2
	add	r4, r7, r4, lsl #2
	add	r6, r6, #1
	str	r6, [r4, #24]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L222:
	.align	2
.L221:
	.word	ants
	.word	1717986919
	.word	__aeabi_idivmod
	.size	animateAnt, .-animateAnt
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L227
	ldr	r3, [r3, #44]
	cmp	r3, #0
	beq	.L224
	ldr	r2, .L227+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L224:
	b	drawPlayer.part.0
.L228:
	.align	2
.L227:
	.word	witch
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawAnts
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawAnts, %function
drawAnts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L235
	ldr	r1, .L235+4
	ldr	r3, .L235+8
	push	{r4, r5, r6, r7, lr}
	ldrh	r5, [r2]
	ldrh	r6, [r1]
	ldr	r2, .L235+12
	ldr	r4, .L235+16
	ldr	lr, .L235+20
	add	ip, r3, #156
.L232:
	ldr	r1, [r3, #44]
	cmp	r1, #0
	beq	.L230
	ldrh	r1, [r2, #8]
	orr	r1, r1, #512
	strh	r1, [r2, #8]	@ movhi
.L231:
	add	r3, r3, #52
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L232
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L230:
	ldm	r3, {r0, r1}
	ldr	r7, [r3, #36]
	sub	r0, r0, r6
	sub	r1, r1, r5
	and	r0, r0, #255
	and	r1, r1, r4
	lsl	r7, r7, #6
	orr	r0, r0, #16384
	orr	r1, r1, lr
	add	r7, r7, #17
	strh	r0, [r2, #8]	@ movhi
	strh	r1, [r2, #10]	@ movhi
	strh	r7, [r2, #12]	@ movhi
	b	.L231
.L236:
	.align	2
.L235:
	.word	hOff
	.word	vOff
	.word	ants
	.word	shadowOAM
	.word	511
	.word	-32768
	.size	drawAnts, .-drawAnts
	.align	2
	.global	drawWisps
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawWisps, %function
drawWisps:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L244
	ldr	r1, .L244+4
	ldr	r3, .L244+8
	push	{r4, r5, r6, lr}
	ldrh	r4, [r2]
	ldrh	r5, [r1]
	ldr	r2, .L244+12
	ldr	lr, .L244+16
	add	ip, r3, #156
.L241:
	ldr	r1, [r3, #44]
	cmp	r1, #0
	bne	.L238
	ldr	r1, [r3, #48]
	cmp	r1, #0
	beq	.L238
	ldr	r6, [r3]
	ldr	r0, [r3, #4]
	ldr	r1, [r3, #36]
	sub	r6, r6, r5
	sub	r0, r0, r4
	lsl	r1, r1, #5
	and	r6, r6, #255
	and	r0, r0, lr
	add	r1, r1, #16
	strh	r6, [r2, #32]	@ movhi
	strh	r0, [r2, #34]	@ movhi
	strh	r1, [r2, #36]	@ movhi
.L240:
	add	r3, r3, #52
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L241
	pop	{r4, r5, r6, lr}
	bx	lr
.L238:
	ldrh	r1, [r2, #32]
	orr	r1, r1, #512
	strh	r1, [r2, #32]	@ movhi
	b	.L240
.L245:
	.align	2
.L244:
	.word	hOff
	.word	vOff
	.word	wisps
	.word	shadowOAM
	.word	511
	.size	drawWisps, .-drawWisps
	.align	2
	.global	drawSpells
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSpells, %function
drawSpells:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r5, #21
	ldr	r2, .L252
	ldr	r1, .L252+4
	ldr	r3, .L252+8
	ldrh	lr, [r2]
	ldrh	r4, [r1]
	ldr	r2, .L252+12
	add	ip, r3, #24
.L249:
	ldr	r1, [r2, #44]
	cmp	r1, #0
	ldmeq	r2, {r0, r1}
	ldrhne	r1, [r3, #56]
	subeq	r1, r1, lr
	orrne	r1, r1, #512
	orreq	r1, r1, #16384
	subeq	r0, r0, r4
	strhne	r1, [r3, #56]	@ movhi
	strheq	r5, [r3, #60]	@ movhi
	strheq	r1, [r3, #58]	@ movhi
	strheq	r0, [r3, #56]	@ movhi
	add	r3, r3, #8
	cmp	r3, ip
	add	r2, r2, #52
	bne	.L249
	pop	{r4, r5, lr}
	bx	lr
.L253:
	.align	2
.L252:
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.word	spells
	.size	drawSpells, .-drawSpells
	.align	2
	.global	drawForeground
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawForeground, %function
drawForeground:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L259
	ldr	ip, .L259+4
	push	{r4, lr}
	ldrh	r0, [r2, #80]
	ldrh	r1, [r2, #88]
	ldrh	r3, [r2, #96]
	ldr	r4, [ip]
	orr	r0, r0, #512
	orr	r1, r1, #512
	orr	r3, r3, #512
	cmp	r4, #0
	strh	r0, [r2, #80]	@ movhi
	strh	r1, [r2, #88]	@ movhi
	strh	r3, [r2, #96]	@ movhi
	ble	.L254
	mov	r3, r2
	mov	lr, #8
	mov	ip, #16
	add	r2, r2, r4, lsl #3
	rsb	r0, r3, #6
.L256:
	add	r1, r0, r3
	strh	lr, [r3, #80]	@ movhi
	strh	ip, [r3, #84]	@ movhi
	strh	r1, [r3, #82]	@ movhi
	add	r3, r3, #8
	cmp	r2, r3
	bne	.L256
.L254:
	pop	{r4, lr}
	bx	lr
.L260:
	.align	2
.L259:
	.word	shadowOAM
	.word	mana
	.size	drawForeground, .-drawForeground
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L265
	ldr	r3, [r3, #44]
	cmp	r3, #0
	push	{r4, lr}
	beq	.L262
	ldr	r2, .L265+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
.L263:
	bl	drawAnts
	bl	drawWisps
	bl	drawSpells
	bl	drawForeground
	ldr	r3, .L265+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L265+12
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L265+4
	mov	lr, pc
	bx	r4
	mov	r0, #67108864
	ldr	r3, .L265+16
	ldr	r3, [r3]
	lsl	r2, r3, #16
	lsr	r2, r2, #16
	strh	r2, [r0, #16]	@ movhi
	ldr	r2, .L265+20
	ldr	r1, [r2]
	add	r3, r3, r3, lsr #31
	add	r2, r1, r1, lsr #31
	asr	r3, r3, #1
	asr	r2, r2, #1
	lsl	r3, r3, #16
	lsl	r1, r1, #16
	lsl	r2, r2, #16
	lsr	r3, r3, #16
	lsr	r1, r1, #16
	lsr	r2, r2, #16
	strh	r1, [r0, #18]	@ movhi
	pop	{r4, lr}
	strh	r3, [r0, #20]	@ movhi
	strh	r2, [r0, #22]	@ movhi
	bx	lr
.L262:
	bl	drawPlayer.part.0
	b	.L263
.L266:
	.align	2
.L265:
	.word	witch
	.word	shadowOAM
	.word	waitForVBlank
	.word	DMANow
	.word	hOff
	.word	vOff
	.size	drawGame, .-drawGame
	.comm	collisionMap,4,4
	.comm	cheat,4,4
	.comm	onGround,4,4
	.comm	mana,4,4
	.comm	hoverCount,4,4
	.comm	jumpCount,4,4
	.comm	spells,156,4
	.comm	wisps,156,4
	.comm	ants,156,4
	.comm	witch,52,4
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

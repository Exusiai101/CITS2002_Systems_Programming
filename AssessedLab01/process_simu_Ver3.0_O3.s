	.file	"process_simu_Ver3.0.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Name:%s  "
.LC1:
	.string	"TotalExecutionTime: %d  "
.LC2:
	.string	"IO Quanta: "
.LC3:
	.string	"%d "
	.text
	.p2align 4
	.globl	DisplayProcess
	.type	DisplayProcess, @function
DisplayProcess:
.LFB24:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	.LC0(%rip), %rdi
	xorl	%eax, %eax
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	leaq	32(%rsp), %rsi
	leaq	32(%rsp), %rbx
	call	printf@PLT
	movl	84(%rsp), %esi
	xorl	%eax, %eax
	leaq	72(%rsp), %rbp
	leaq	.LC1(%rip), %rdi
	call	printf@PLT
	leaq	.LC2(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	.p2align 4
	.p2align 3
.L2:
	movl	56(%rbx), %esi
	leaq	.LC3(%rip), %rdi
	xorl	%eax, %eax
	addq	$4, %rbx
	call	printf@PLT
	cmpq	%rbp, %rbx
	jne	.L2
	movl	$10, %edi
	call	putchar@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	DisplayProcess, .-DisplayProcess
	.section	.rodata.str1.1
.LC4:
	.string	"r"
.LC5:
	.string	"Error, File open failed"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC6:
	.string	"%s %d %d %d %d %d %d %d %d %d %d %d"
	.text
	.p2align 4
	.globl	readfile
	.type	readfile, @function
readfile:
.LFB25:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdi, %rdx
	movl	$62, %ecx
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rsi, %rbp
	leaq	.LC4(%rip), %rsi
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$600, %rsp
	.cfi_def_cfa_offset 656
	movq	%fs:40, %rax
	movq	%rax, 584(%rsp)
	xorl	%eax, %eax
	leaq	80(%rsp), %r13
	movq	%r13, %rdi
	rep stosq
	movl	$0, (%rdi)
	movq	%rdx, %rdi
	call	fopen@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L7
	movq	$0, 64(%rsp)
	movq	%rbp, 72(%rsp)
.L8:
	leaq	76(%rbp), %rcx
	leaq	52(%rbp), %rdx
	movq	%rbp, (%rsp)
	movq	%rcx, 8(%rsp)
	leaq	72(%rbp), %rcx
	leaq	92(%rbp), %r12
	movq	%rcx, 16(%rsp)
	leaq	68(%rbp), %rcx
	leaq	88(%rbp), %r15
	movq	%rcx, 24(%rsp)
	leaq	64(%rbp), %rcx
	leaq	84(%rbp), %r14
	movq	%rcx, 32(%rsp)
	leaq	60(%rbp), %rcx
	movq	%rcx, 40(%rsp)
	leaq	56(%rbp), %rcx
	addq	$80, %rbp
	movq	%rcx, 48(%rsp)
	movq	%rdx, 56(%rsp)
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L11:
	pushq	%r12
	.cfi_def_cfa_offset 664
	leaq	.LC6(%rip), %rsi
	movq	%r13, %rdi
	xorl	%eax, %eax
	pushq	%r15
	.cfi_def_cfa_offset 672
	pushq	%r14
	.cfi_def_cfa_offset 680
	pushq	%rbp
	.cfi_def_cfa_offset 688
	pushq	40(%rsp)
	.cfi_def_cfa_offset 696
	pushq	56(%rsp)
	.cfi_def_cfa_offset 704
	pushq	72(%rsp)
	.cfi_def_cfa_offset 712
	pushq	88(%rsp)
	.cfi_def_cfa_offset 720
	movq	104(%rsp), %r9
	movq	112(%rsp), %r8
	movq	120(%rsp), %rcx
	movq	64(%rsp), %rdx
	call	__isoc23_sscanf@PLT
	addq	$64, %rsp
	.cfi_def_cfa_offset 656
	cmpl	$1, %eax
	jg	.L15
.L10:
	movq	%rbx, %rdx
	movl	$500, %esi
	movq	%r13, %rdi
	call	fgets@PLT
	testq	%rax, %rax
	jne	.L11
	movq	64(%rsp), %rsi
	movq	72(%rsp), %rbp
	movq	%rbx, %rdi
	movl	%esi, TotalProcess(%rip)
	subq	$1, %rsi
	movq	%rbp, %rbx
	imulq	$116, %rsi, %rsi
	addl	$1, 96(%rbp,%rsi)
	call	fclose@PLT
.L6:
	movq	584(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L16
	addq	$600, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L15:
	.cfi_restore_state
	movq	(%rsp), %rbp
	leal	-2(%rax), %edx
	addq	$1, 64(%rsp)
	movl	%edx, 96(%rbp)
	addq	$116, %rbp
	movl	$0, -12(%rbp)
	movl	$0, -8(%rbp)
	movb	$0, -4(%rbp)
	movl	$0, -16(%rbp)
	jmp	.L8
.L7:
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	jmp	.L6
.L16:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE25:
	.size	readfile, .-readfile
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"ProcessName: %s, GlobalTime: %d \n"
	.text
	.p2align 4
	.globl	CompletionCheck
	.type	CompletionCheck, @function
CompletionCheck:
.LFB26:
	.cfi_startproc
	movl	52(%rdi), %ecx
	xorl	%eax, %eax
	cmpl	%ecx, 104(%rdi)
	jl	.L22
	cmpb	$0, 112(%rdi)
	je	.L25
.L22:
	ret
	.p2align 4,,10
	.p2align 3
.L25:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movb	$1, 112(%rdi)
	movl	TotalRunningTime(%rip), %edx
	movq	%rdi, %rsi
	leaq	.LC7(%rip), %rdi
	call	printf@PLT
	movl	$1, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE26:
	.size	CompletionCheck, .-CompletionCheck
	.p2align 4
	.globl	ProcessSimu
	.type	ProcessSimu, @function
ProcessSimu:
.LFB27:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movl	ProcessCompleted(%rip), %edi
	movl	TotalProcess(%rip), %esi
	cmpl	%esi, %edi
	jge	.L45
	xorl	%r12d, %r12d
	jmp	.L27
	.p2align 4,,10
	.p2align 3
.L33:
	movb	$1, 112(%rbx)
	movq	%rbx, %rsi
	leaq	.LC7(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	movl	ProcessCompleted(%rip), %eax
	movb	$1, 112(%rbx)
	movl	TotalProcess(%rip), %esi
	leal	1(%rax), %edi
	movl	%edi, ProcessCompleted(%rip)
.L29:
	leal	1(%r12), %eax
	cltd
	idivl	%esi
	movl	%edx, %r12d
	cmpl	%edi, %esi
	jle	.L45
.L27:
	movslq	%r12d, %rbx
	imulq	$116, %rbx, %rbx
	addq	%rbp, %rbx
	cmpb	$0, 112(%rbx)
	jne	.L29
	movl	108(%rbx), %eax
	movl	104(%rbx), %ecx
	movl	52(%rbx), %r8d
	leal	1(%rax), %r9d
	movslq	100(%rbx), %rax
	leal	1(%rcx), %r10d
	movl	%r9d, 108(%rbx)
	movq	%rax, %r11
	movl	56(%rbx,%rax,4), %r13d
	movl	TotalRunningTime(%rip), %eax
	movl	%r10d, 104(%rbx)
	leal	1(%rax), %edx
	movl	%edx, TotalRunningTime(%rip)
	cmpl	%r13d, %r9d
	jne	.L30
	testl	%r13d, %r13d
	jne	.L47
.L30:
	cmpl	%r10d, %r8d
	jle	.L33
	leal	2(%rcx), %r9d
	leal	2(%rax), %edx
	movl	%r9d, 104(%rbx)
	movl	%edx, TotalRunningTime(%rip)
	cmpl	%r9d, %r8d
	jle	.L33
	leal	3(%rcx), %r9d
	leal	3(%rax), %edx
	movl	%r9d, 104(%rbx)
	movl	%edx, TotalRunningTime(%rip)
	cmpl	%r9d, %r8d
	jle	.L33
	leal	4(%rcx), %r9d
	leal	4(%rax), %edx
	movl	%r9d, 104(%rbx)
	movl	%edx, TotalRunningTime(%rip)
	cmpl	%r9d, %r8d
	jle	.L33
	leal	5(%rcx), %r9d
	leal	5(%rax), %edx
	movl	%r9d, 104(%rbx)
	movl	%edx, TotalRunningTime(%rip)
	cmpl	%r9d, %r8d
	jle	.L33
	leal	6(%rcx), %r9d
	leal	6(%rax), %edx
	movl	%r9d, 104(%rbx)
	movl	%edx, TotalRunningTime(%rip)
	cmpl	%r9d, %r8d
	jle	.L33
	leal	7(%rcx), %r9d
	leal	7(%rax), %edx
	movl	%r9d, 104(%rbx)
	movl	%edx, TotalRunningTime(%rip)
	cmpl	%r9d, %r8d
	jle	.L33
	leal	8(%rcx), %r9d
	leal	8(%rax), %edx
	movl	%r9d, 104(%rbx)
	movl	%edx, TotalRunningTime(%rip)
	cmpl	%r9d, %r8d
	jle	.L33
	leal	9(%rcx), %r9d
	leal	9(%rax), %edx
	movl	%r9d, 104(%rbx)
	movl	%edx, TotalRunningTime(%rip)
	cmpl	%r9d, %r8d
	jle	.L33
	addl	$10, %ecx
	leal	10(%rax), %edx
	movl	%ecx, 104(%rbx)
	movl	%edx, TotalRunningTime(%rip)
	cmpl	%ecx, %r8d
	jle	.L33
	leal	1(%r12), %eax
	cltd
	idivl	%esi
	movl	%edx, %r12d
	cmpl	%edi, %esi
	jg	.L27
.L45:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L47:
	.cfi_restore_state
	cmpl	%r10d, %r8d
	jg	.L48
.L31:
	movb	$1, 112(%rbx)
	movq	%rbx, %rsi
	leaq	.LC7(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	movl	ProcessCompleted(%rip), %eax
	movl	100(%rbx), %r11d
	movb	$1, 112(%rbx)
	movl	TotalProcess(%rip), %esi
	leal	1(%rax), %edi
	addl	$1, %r11d
	movl	%edi, ProcessCompleted(%rip)
	movl	%r11d, 100(%rbx)
	jmp	.L29
	.p2align 4,,10
	.p2align 3
.L48:
	leal	2(%rcx), %r9d
	leal	2(%rax), %edx
	movl	%r9d, 104(%rbx)
	movl	%edx, TotalRunningTime(%rip)
	cmpl	%r9d, %r8d
	jle	.L31
	leal	3(%rcx), %r9d
	leal	3(%rax), %edx
	movl	%r9d, 104(%rbx)
	movl	%edx, TotalRunningTime(%rip)
	cmpl	%r9d, %r8d
	jle	.L31
	leal	4(%rcx), %r9d
	leal	4(%rax), %edx
	movl	%r9d, 104(%rbx)
	movl	%edx, TotalRunningTime(%rip)
	cmpl	%r9d, %r8d
	jle	.L31
	addl	$5, %ecx
	leal	5(%rax), %edx
	movl	%ecx, 104(%rbx)
	movl	%edx, TotalRunningTime(%rip)
	cmpl	%ecx, %r8d
	jle	.L31
	addl	$1, %r11d
	movl	%r11d, 100(%rbx)
	jmp	.L29
	.cfi_endproc
.LFE27:
	.size	ProcessSimu, .-ProcessSimu
	.section	.rodata.str1.8
	.align 8
.LC8:
	.string	"Usage: [ProgramName] [Filename]"
	.section	.rodata.str1.1
.LC9:
	.string	"File name: %s"
.LC10:
	.string	"File Read Failed"
.LC11:
	.string	"TotalProcess %d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB28:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$1368, %rsp
	.cfi_def_cfa_offset 1424
	movq	%fs:40, %rbp
	movq	%rbp, 1352(%rsp)
	xorl	%ebp, %ebp
	cmpl	$2, %edi
	je	.L50
	leaq	.LC8(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
.L51:
	movq	1352(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L60
	addq	$1368, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L50:
	.cfi_restore_state
	movq	8(%rsi), %rsi
	leaq	1296(%rsp), %rdi
	call	strcpy@PLT
	leaq	1296(%rsp), %rsi
	leaq	.LC9(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	movq	%rbp, %rax
	leaq	128(%rsp), %rdi
	movl	$145, %ecx
	rep stosq
	leaq	128(%rsp), %rsi
	leaq	1296(%rsp), %rdi
	call	readfile
	movq	%rax, %r15
	testq	%rax, %rax
	je	.L61
	movl	TotalProcess(%rip), %esi
	xorl	%eax, %eax
	leaq	.LC11(%rip), %rdi
	call	printf@PLT
	cmpl	$0, TotalProcess(%rip)
	jle	.L53
	movq	%r15, %r12
	xorl	%r13d, %r13d
	leaq	40(%rsp), %rbp
	.p2align 4
	.p2align 3
.L55:
	movdqu	(%r12), %xmm0
	movq	%rsp, %rsi
	leaq	.LC0(%rip), %rdi
	movq	%rsp, %rbx
	movaps	%xmm0, (%rsp)
	movdqu	16(%r12), %xmm0
	movaps	%xmm0, 16(%rsp)
	movdqu	32(%r12), %xmm0
	movaps	%xmm0, 32(%rsp)
	movdqu	48(%r12), %xmm0
	movaps	%xmm0, 48(%rsp)
	movdqu	64(%r12), %xmm0
	movaps	%xmm0, 64(%rsp)
	movdqu	80(%r12), %xmm0
	movaps	%xmm0, 80(%rsp)
	movdqu	96(%r12), %xmm0
	movaps	%xmm0, 96(%rsp)
	movl	112(%r12), %eax
	movl	%eax, 112(%rsp)
	xorl	%eax, %eax
	call	printf@PLT
	movl	52(%rsp), %esi
	leaq	.LC1(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	leaq	.LC2(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	.p2align 4
	.p2align 3
.L54:
	movl	56(%rbx), %esi
	leaq	.LC3(%rip), %rdi
	xorl	%eax, %eax
	addq	$4, %rbx
	call	printf@PLT
	cmpq	%rbp, %rbx
	jne	.L54
	movl	$10, %edi
	addl	$1, %r13d
	addq	$116, %r12
	call	putchar@PLT
	cmpl	%r13d, TotalProcess(%rip)
	jg	.L55
.L53:
	movq	%r15, %rdi
	call	ProcessSimu
	jmp	.L51
.L61:
	leaq	.LC10(%rip), %rdi
	call	puts@PLT
	jmp	.L51
.L60:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE28:
	.size	main, .-main
	.globl	ProcessCompleted
	.bss
	.align 4
	.type	ProcessCompleted, @object
	.size	ProcessCompleted, 4
ProcessCompleted:
	.zero	4
	.globl	TotalProcess
	.align 4
	.type	TotalProcess, @object
	.size	TotalProcess, 4
TotalProcess:
	.zero	4
	.globl	TimeInAQuanta
	.align 4
	.type	TimeInAQuanta, @object
	.size	TimeInAQuanta, 4
TimeInAQuanta:
	.zero	4
	.globl	TotalRunningTime
	.align 4
	.type	TotalRunningTime, @object
	.size	TotalRunningTime, 4
TotalRunningTime:
	.zero	4
	.ident	"GCC: (GNU) 15.2.1 20250813"
	.section	.note.GNU-stack,"",@progbits

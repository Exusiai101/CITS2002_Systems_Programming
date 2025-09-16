	.file	"lab03.c"
	.text
	.section	.rodata
.LC0:
	.string	"%s %i"
.LC1:
	.string	"name = %s, number = %i \n"
	.text
	.globl	task1
	.type	task1, @function
task1:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$432, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movabsq	$3833179224697040193, %rax
	movl	$0, %edx
	movq	%rax, -128(%rbp)
	movq	%rdx, -120(%rbp)
	movq	$0, -112(%rbp)
	movq	$0, -104(%rbp)
	movq	$0, -96(%rbp)
	movq	$0, -88(%rbp)
	movw	$0, -80(%rbp)
	movl	$0, -424(%rbp)
	jmp	.L2
.L3:
	movq	$0, -64(%rbp)
	movq	$0, -56(%rbp)
	movq	$0, -48(%rbp)
	movq	$0, -40(%rbp)
	movq	$0, -32(%rbp)
	movq	$0, -24(%rbp)
	movw	$0, -16(%rbp)
	leaq	-416(%rbp), %rax
	movl	-424(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$56, %rdx, %rdx
	addq	$48, %rdx
	addq	%rdx, %rax
	leaq	4(%rax), %rdx
	leaq	-416(%rbp), %rcx
	movl	-424(%rbp), %eax
	cltq
	imulq	$56, %rax, %rax
	addq	%rax, %rcx
	leaq	.LC0(%rip), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc23_scanf@PLT
	addl	$1, -424(%rbp)
.L2:
	cmpl	$4, -424(%rbp)
	jle	.L3
	movl	$0, -420(%rbp)
	jmp	.L4
.L5:
	movl	-420(%rbp), %eax
	cltq
	imulq	$56, %rax, %rax
	addq	%rbp, %rax
	subq	$364, %rax
	movl	(%rax), %eax
	leaq	-416(%rbp), %rcx
	movl	-420(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$56, %rdx, %rdx
	leaq	(%rcx,%rdx), %rsi
	leaq	.LC1(%rip), %rcx
	movl	%eax, %edx
	movq	%rcx, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -420(%rbp)
.L4:
	cmpl	$4, -420(%rbp)
	jle	.L5
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L6
	call	__stack_chk_fail@PLT
.L6:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	task1, .-task1
	.section	.rodata
.LC2:
	.string	"w"
.LC3:
	.string	"myfile"
.LC4:
	.string	"%s"
.LC5:
	.string	"My file is  = %s"
	.text
	.globl	task2
	.type	task2, @function
task2:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1024, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC2(%rip), %rdx
	leaq	.LC3(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -1016(%rbp)
	movl	$0, -1020(%rbp)
	jmp	.L8
.L9:
	leaq	-1008(%rbp), %rax
	leaq	.LC4(%rip), %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movl	$0, %eax
	call	__isoc23_scanf@PLT
	leaq	-1008(%rbp), %rdx
	movq	-1016(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movq	-1016(%rbp), %rax
	movq	%rax, %rsi
	movl	$10, %edi
	call	fputc@PLT
	addl	$1, -1020(%rbp)
.L8:
	cmpl	$9, -1020(%rbp)
	jle	.L9
	leaq	-1008(%rbp), %rax
	leaq	.LC5(%rip), %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	task2, .-task2
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	call	task2
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.ident	"GCC: (GNU) 15.2.1 20250813"
	.section	.note.GNU-stack,"",@progbits

	.file	"process_simu_Ver3.0.c"
	.text
	.globl	TotalRunningTime
	.bss
	.align 4
	.type	TotalRunningTime, @object
	.size	TotalRunningTime, 4
TotalRunningTime:
	.zero	4
	.globl	TimeInAQuanta
	.align 4
	.type	TimeInAQuanta, @object
	.size	TimeInAQuanta, 4
TimeInAQuanta:
	.zero	4
	.globl	TotalProcess
	.align 4
	.type	TotalProcess, @object
	.size	TotalProcess, 4
TotalProcess:
	.zero	4
	.globl	ProcessCompleted
	.align 4
	.type	ProcessCompleted, @object
	.size	ProcessCompleted, 4
ProcessCompleted:
	.zero	4
	.section	.rodata
.LC0:
	.string	"Name:%s  "
.LC1:
	.string	"TotalExecutionTime: %d  "
.LC2:
	.string	"IO Quanta: "
.LC3:
	.string	"%d "
	.text
	.globl	DisplayProcess
	.type	DisplayProcess, @function
DisplayProcess:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	leaq	.LC0(%rip), %rax
	leaq	16(%rbp), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	68(%rbp), %eax
	leaq	.LC1(%rip), %rdx
	movl	%eax, %esi
	movq	%rdx, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, -4(%rbp)
	jmp	.L2
.L3:
	movl	-4(%rbp), %eax
	cltq
	addq	$12, %rax
	movl	24(%rbp,%rax,4), %eax
	leaq	.LC3(%rip), %rdx
	movl	%eax, %esi
	movq	%rdx, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
.L2:
	cmpl	$9, -4(%rbp)
	jle	.L3
	movl	$10, %edi
	call	putchar@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	DisplayProcess, .-DisplayProcess
	.section	.rodata
.LC4:
	.string	"r"
.LC5:
	.string	"Error, File open failed"
	.align 8
.LC6:
	.string	"%s %d %d %d %d %d %d %d %d %d %d %d"
	.text
	.globl	readfile
	.type	readfile, @function
readfile:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$552, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, -584(%rbp)
	movq	%rsi, -592(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	leaq	-560(%rbp), %rdx
	movl	$0, %eax
	movl	$62, %ecx
	movq	%rdx, %rdi
	rep stosq
	movq	%rdi, %rdx
	movl	%eax, (%rdx)
	addq	$4, %rdx
	leaq	.LC4(%rip), %rdx
	movq	-584(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -568(%rbp)
	cmpq	$0, -568(%rbp)
	jne	.L5
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L9
.L5:
	movl	$0, -576(%rbp)
	jmp	.L7
.L8:
	movl	-576(%rbp), %eax
	cltq
	imulq	$116, %rax, %rdx
	movq	-592(%rbp), %rax
	addq	%rdx, %rax
	leaq	92(%rax), %r12
	movl	-576(%rbp), %eax
	cltq
	imulq	$116, %rax, %rdx
	movq	-592(%rbp), %rax
	addq	%rdx, %rax
	leaq	88(%rax), %rbx
	movl	-576(%rbp), %eax
	cltq
	imulq	$116, %rax, %rdx
	movq	-592(%rbp), %rax
	addq	%rdx, %rax
	leaq	84(%rax), %r11
	movl	-576(%rbp), %eax
	cltq
	imulq	$116, %rax, %rdx
	movq	-592(%rbp), %rax
	addq	%rdx, %rax
	leaq	80(%rax), %r10
	movl	-576(%rbp), %eax
	cltq
	imulq	$116, %rax, %rdx
	movq	-592(%rbp), %rax
	addq	%rdx, %rax
	leaq	76(%rax), %r9
	movl	-576(%rbp), %eax
	cltq
	imulq	$116, %rax, %rdx
	movq	-592(%rbp), %rax
	addq	%rdx, %rax
	leaq	72(%rax), %r8
	movl	-576(%rbp), %eax
	cltq
	imulq	$116, %rax, %rdx
	movq	-592(%rbp), %rax
	addq	%rdx, %rax
	leaq	68(%rax), %rdi
	movl	-576(%rbp), %eax
	cltq
	imulq	$116, %rax, %rdx
	movq	-592(%rbp), %rax
	addq	%rdx, %rax
	leaq	64(%rax), %rcx
	movl	-576(%rbp), %eax
	cltq
	imulq	$116, %rax, %rdx
	movq	-592(%rbp), %rax
	addq	%rdx, %rax
	leaq	60(%rax), %r14
	movl	-576(%rbp), %eax
	cltq
	imulq	$116, %rax, %rdx
	movq	-592(%rbp), %rax
	addq	%rdx, %rax
	leaq	56(%rax), %r13
	movl	-576(%rbp), %eax
	cltq
	imulq	$116, %rax, %rdx
	movq	-592(%rbp), %rax
	addq	%rdx, %rax
	leaq	52(%rax), %rdx
	movl	-576(%rbp), %eax
	cltq
	imulq	$116, %rax, %rsi
	movq	-592(%rbp), %rax
	addq	%rsi, %rax
	movq	%rax, %r15
	leaq	.LC6(%rip), %rsi
	leaq	-560(%rbp), %rax
	pushq	%r12
	pushq	%rbx
	pushq	%r11
	pushq	%r10
	pushq	%r9
	pushq	%r8
	pushq	%rdi
	pushq	%rcx
	movq	%r14, %r9
	movq	%r13, %r8
	movq	%rdx, %rcx
	movq	%r15, %rdx
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc23_sscanf@PLT
	addq	$64, %rsp
	movl	%eax, -572(%rbp)
	cmpl	$1, -572(%rbp)
	jle	.L7
	movl	-576(%rbp), %eax
	cltq
	imulq	$116, %rax, %rdx
	movq	-592(%rbp), %rax
	addq	%rdx, %rax
	movl	-572(%rbp), %edx
	subl	$2, %edx
	movl	%edx, 96(%rax)
	movl	-576(%rbp), %eax
	cltq
	imulq	$116, %rax, %rdx
	movq	-592(%rbp), %rax
	addq	%rdx, %rax
	movl	$0, 104(%rax)
	movl	-576(%rbp), %eax
	cltq
	imulq	$116, %rax, %rdx
	movq	-592(%rbp), %rax
	addq	%rdx, %rax
	movl	$0, 108(%rax)
	movl	-576(%rbp), %eax
	cltq
	imulq	$116, %rax, %rdx
	movq	-592(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, 112(%rax)
	movl	-576(%rbp), %eax
	cltq
	imulq	$116, %rax, %rdx
	movq	-592(%rbp), %rax
	addq	%rdx, %rax
	movl	$0, 100(%rax)
	addl	$1, -576(%rbp)
.L7:
	movq	-568(%rbp), %rdx
	leaq	-560(%rbp), %rax
	movl	$500, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	testq	%rax, %rax
	jne	.L8
	movl	-576(%rbp), %eax
	movl	%eax, TotalProcess(%rip)
	movl	-576(%rbp), %eax
	cltq
	imulq	$116, %rax, %rax
	leaq	-116(%rax), %rdx
	movq	-592(%rbp), %rax
	addq	%rdx, %rax
	movl	96(%rax), %edx
	movl	-576(%rbp), %eax
	cltq
	imulq	$116, %rax, %rax
	leaq	-116(%rax), %rcx
	movq	-592(%rbp), %rax
	addq	%rcx, %rax
	addl	$1, %edx
	movl	%edx, 96(%rax)
	movq	-568(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movq	-592(%rbp), %rax
.L9:
	movq	-56(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	readfile, .-readfile
	.section	.rodata
	.align 8
.LC7:
	.string	"ProcessName: %s, GlobalTime: %d \n"
	.text
	.globl	CompletionCheck
	.type	CompletionCheck, @function
CompletionCheck:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	104(%rax), %edx
	movq	-8(%rbp), %rax
	movl	52(%rax), %eax
	cmpl	%eax, %edx
	jl	.L12
	movq	-8(%rbp), %rax
	movzbl	112(%rax), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	.L12
	movq	-8(%rbp), %rax
	movb	$1, 112(%rax)
	movl	TotalRunningTime(%rip), %edx
	movq	-8(%rbp), %rax
	leaq	.LC7(%rip), %rcx
	movq	%rax, %rsi
	movq	%rcx, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %eax
	jmp	.L13
.L12:
	movl	$0, %eax
.L13:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	CompletionCheck, .-CompletionCheck
	.globl	ProcessSimu
	.type	ProcessSimu, @function
ProcessSimu:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L15
.L25:
	movl	-12(%rbp), %eax
	cltq
	imulq	$116, %rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	112(%rax), %eax
	xorl	$1, %eax
	testb	%al, %al
	je	.L16
	movl	-12(%rbp), %eax
	cltq
	imulq	$116, %rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	108(%rax), %edx
	addl	$1, %edx
	movl	%edx, 108(%rax)
	movl	-12(%rbp), %eax
	cltq
	imulq	$116, %rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	108(%rax), %edx
	movl	-12(%rbp), %eax
	cltq
	imulq	$116, %rax, %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movl	-12(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	$116, %rcx, %rsi
	movq	-24(%rbp), %rcx
	addq	%rsi, %rcx
	movl	100(%rcx), %ecx
	movslq	%ecx, %rcx
	addq	$12, %rcx
	movl	8(%rax,%rcx,4), %eax
	cmpl	%eax, %edx
	jne	.L17
	movl	-12(%rbp), %eax
	cltq
	imulq	$116, %rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	imulq	$116, %rdx, %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movl	100(%rdx), %edx
	movslq	%edx, %rdx
	addq	$12, %rdx
	movl	8(%rax,%rdx,4), %eax
	testl	%eax, %eax
	je	.L17
	movl	$0, -8(%rbp)
	jmp	.L18
.L21:
	movl	-12(%rbp), %eax
	cltq
	imulq	$116, %rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	104(%rax), %edx
	addl	$1, %edx
	movl	%edx, 104(%rax)
	movl	TotalRunningTime(%rip), %eax
	addl	$1, %eax
	movl	%eax, TotalRunningTime(%rip)
	movl	-12(%rbp), %eax
	cltq
	imulq	$116, %rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rdi
	call	CompletionCheck
	testb	%al, %al
	je	.L19
	movl	-12(%rbp), %eax
	cltq
	imulq	$116, %rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movb	$1, 112(%rax)
	movl	ProcessCompleted(%rip), %eax
	addl	$1, %eax
	movl	%eax, ProcessCompleted(%rip)
	jmp	.L20
.L19:
	addl	$1, -8(%rbp)
.L18:
	cmpl	$4, -8(%rbp)
	jle	.L21
.L20:
	movl	-12(%rbp), %eax
	cltq
	imulq	$116, %rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	100(%rax), %edx
	addl	$1, %edx
	movl	%edx, 100(%rax)
	jmp	.L16
.L17:
	movl	$0, -4(%rbp)
	jmp	.L22
.L24:
	movl	-12(%rbp), %eax
	cltq
	imulq	$116, %rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	104(%rax), %edx
	addl	$1, %edx
	movl	%edx, 104(%rax)
	movl	TotalRunningTime(%rip), %eax
	addl	$1, %eax
	movl	%eax, TotalRunningTime(%rip)
	movl	-12(%rbp), %eax
	cltq
	imulq	$116, %rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rdi
	call	CompletionCheck
	testb	%al, %al
	je	.L23
	movl	-12(%rbp), %eax
	cltq
	imulq	$116, %rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movb	$1, 112(%rax)
	movl	ProcessCompleted(%rip), %eax
	addl	$1, %eax
	movl	%eax, ProcessCompleted(%rip)
	jmp	.L16
.L23:
	addl	$1, -4(%rbp)
.L22:
	cmpl	$9, -4(%rbp)
	jle	.L24
.L16:
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	TotalProcess(%rip), %ecx
	cltd
	idivl	%ecx
	movl	%edx, -12(%rbp)
.L15:
	movl	ProcessCompleted(%rip), %edx
	movl	TotalProcess(%rip), %eax
	cmpl	%eax, %edx
	jl	.L25
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	ProcessSimu, .-ProcessSimu
	.section	.rodata
	.align 8
.LC8:
	.string	"Usage: [ProgramName] [Filename]"
.LC9:
	.string	"File name: %s"
.LC10:
	.string	"File Read Failed"
.LC11:
	.string	"TotalProcess %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$1288, %rsp
	.cfi_offset 3, -24
	movl	%edi, -1284(%rbp)
	movq	%rsi, -1296(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	cmpl	$2, -1284(%rbp)
	je	.L28
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	jmp	.L33
.L28:
	movq	-1296(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rdx
	leaq	-80(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	leaq	-80(%rbp), %rax
	leaq	.LC9(%rip), %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-1248(%rbp), %rdx
	movl	$0, %eax
	movl	$145, %ecx
	movq	%rdx, %rdi
	rep stosq
	leaq	-1248(%rbp), %rax
	movq	%rax, -1264(%rbp)
	movq	-1264(%rbp), %rdx
	leaq	-80(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	readfile
	movq	%rax, -1256(%rbp)
	cmpq	$0, -1256(%rbp)
	jne	.L30
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L33
.L30:
	movl	TotalProcess(%rip), %eax
	leaq	.LC11(%rip), %rdx
	movl	%eax, %esi
	movq	%rdx, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, -1268(%rbp)
	jmp	.L31
.L32:
	movl	-1268(%rbp), %eax
	cltq
	imulq	$116, %rax, %rdx
	movq	-1256(%rbp), %rax
	addq	%rdx, %rax
	subq	$8, %rsp
	subq	$120, %rsp
	movq	%rsp, %rdx
	movq	(%rax), %rcx
	movq	8(%rax), %rbx
	movq	%rcx, (%rdx)
	movq	%rbx, 8(%rdx)
	movq	16(%rax), %rcx
	movq	24(%rax), %rbx
	movq	%rcx, 16(%rdx)
	movq	%rbx, 24(%rdx)
	movq	32(%rax), %rcx
	movq	40(%rax), %rbx
	movq	%rcx, 32(%rdx)
	movq	%rbx, 40(%rdx)
	movq	48(%rax), %rcx
	movq	56(%rax), %rbx
	movq	%rcx, 48(%rdx)
	movq	%rbx, 56(%rdx)
	movq	64(%rax), %rcx
	movq	72(%rax), %rbx
	movq	%rcx, 64(%rdx)
	movq	%rbx, 72(%rdx)
	movq	80(%rax), %rcx
	movq	88(%rax), %rbx
	movq	%rcx, 80(%rdx)
	movq	%rbx, 88(%rdx)
	movq	96(%rax), %rcx
	movq	104(%rax), %rbx
	movq	%rcx, 96(%rdx)
	movq	%rbx, 104(%rdx)
	movl	112(%rax), %eax
	movl	%eax, 112(%rdx)
	call	DisplayProcess
	subq	$-128, %rsp
	addl	$1, -1268(%rbp)
.L31:
	movl	TotalProcess(%rip), %eax
	cmpl	%eax, -1268(%rbp)
	jl	.L32
	movq	-1256(%rbp), %rax
	movq	%rax, %rdi
	call	ProcessSimu
	movl	$0, %eax
.L33:
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L34
	call	__stack_chk_fail@PLT
.L34:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	main, .-main
	.ident	"GCC: (GNU) 15.2.1 20250813"
	.section	.note.GNU-stack,"",@progbits

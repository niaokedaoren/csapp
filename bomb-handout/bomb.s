
bomb:     file format elf64-x86-64


Disassembly of section .init:

0000000000400a28 <_init>:
  400a28:	48 83 ec 08          	sub    $0x8,%rsp
  400a2c:	e8 0b 02 00 00       	callq  400c3c <call_gmon_start>
  400a31:	e8 8a 02 00 00       	callq  400cc0 <frame_dummy>
  400a36:	e8 35 1a 00 00       	callq  402470 <__do_global_ctors_aux>
  400a3b:	48 83 c4 08          	add    $0x8,%rsp
  400a3f:	c3                   	retq   

Disassembly of section .plt:

0000000000400a40 <printf@plt-0x10>:
  400a40:	ff 35 2a 28 20 00    	pushq  0x20282a(%rip)        # 603270 <_GLOBAL_OFFSET_TABLE_+0x8>
  400a46:	ff 25 2c 28 20 00    	jmpq   *0x20282c(%rip)        # 603278 <_GLOBAL_OFFSET_TABLE_+0x10>
  400a4c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400a50 <printf@plt>:
  400a50:	ff 25 2a 28 20 00    	jmpq   *0x20282a(%rip)        # 603280 <_GLOBAL_OFFSET_TABLE_+0x18>
  400a56:	68 00 00 00 00       	pushq  $0x0
  400a5b:	e9 e0 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400a60 <memset@plt>:
  400a60:	ff 25 22 28 20 00    	jmpq   *0x202822(%rip)        # 603288 <_GLOBAL_OFFSET_TABLE_+0x20>
  400a66:	68 01 00 00 00       	pushq  $0x1
  400a6b:	e9 d0 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400a70 <close@plt>:
  400a70:	ff 25 1a 28 20 00    	jmpq   *0x20281a(%rip)        # 603290 <_GLOBAL_OFFSET_TABLE_+0x28>
  400a76:	68 02 00 00 00       	pushq  $0x2
  400a7b:	e9 c0 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400a80 <gethostbyname@plt>:
  400a80:	ff 25 12 28 20 00    	jmpq   *0x202812(%rip)        # 603298 <_GLOBAL_OFFSET_TABLE_+0x30>
  400a86:	68 03 00 00 00       	pushq  $0x3
  400a8b:	e9 b0 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400a90 <puts@plt>:
  400a90:	ff 25 0a 28 20 00    	jmpq   *0x20280a(%rip)        # 6032a0 <_GLOBAL_OFFSET_TABLE_+0x38>
  400a96:	68 04 00 00 00       	pushq  $0x4
  400a9b:	e9 a0 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400aa0 <exit@plt>:
  400aa0:	ff 25 02 28 20 00    	jmpq   *0x202802(%rip)        # 6032a8 <_GLOBAL_OFFSET_TABLE_+0x40>
  400aa6:	68 05 00 00 00       	pushq  $0x5
  400aab:	e9 90 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400ab0 <strcasecmp@plt>:
  400ab0:	ff 25 fa 27 20 00    	jmpq   *0x2027fa(%rip)        # 6032b0 <_GLOBAL_OFFSET_TABLE_+0x48>
  400ab6:	68 06 00 00 00       	pushq  $0x6
  400abb:	e9 80 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400ac0 <read@plt>:
  400ac0:	ff 25 f2 27 20 00    	jmpq   *0x2027f2(%rip)        # 6032b8 <_GLOBAL_OFFSET_TABLE_+0x50>
  400ac6:	68 07 00 00 00       	pushq  $0x7
  400acb:	e9 70 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400ad0 <fopen@plt>:
  400ad0:	ff 25 ea 27 20 00    	jmpq   *0x2027ea(%rip)        # 6032c0 <_GLOBAL_OFFSET_TABLE_+0x58>
  400ad6:	68 08 00 00 00       	pushq  $0x8
  400adb:	e9 60 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400ae0 <__libc_start_main@plt>:
  400ae0:	ff 25 e2 27 20 00    	jmpq   *0x2027e2(%rip)        # 6032c8 <_GLOBAL_OFFSET_TABLE_+0x60>
  400ae6:	68 09 00 00 00       	pushq  $0x9
  400aeb:	e9 50 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400af0 <fgets@plt>:
  400af0:	ff 25 da 27 20 00    	jmpq   *0x2027da(%rip)        # 6032d0 <_GLOBAL_OFFSET_TABLE_+0x68>
  400af6:	68 0a 00 00 00       	pushq  $0xa
  400afb:	e9 40 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b00 <bcopy@plt>:
  400b00:	ff 25 d2 27 20 00    	jmpq   *0x2027d2(%rip)        # 6032d8 <_GLOBAL_OFFSET_TABLE_+0x70>
  400b06:	68 0b 00 00 00       	pushq  $0xb
  400b0b:	e9 30 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b10 <__ctype_b_loc@plt>:
  400b10:	ff 25 ca 27 20 00    	jmpq   *0x2027ca(%rip)        # 6032e0 <_GLOBAL_OFFSET_TABLE_+0x78>
  400b16:	68 0c 00 00 00       	pushq  $0xc
  400b1b:	e9 20 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b20 <sprintf@plt>:
  400b20:	ff 25 c2 27 20 00    	jmpq   *0x2027c2(%rip)        # 6032e8 <_GLOBAL_OFFSET_TABLE_+0x80>
  400b26:	68 0d 00 00 00       	pushq  $0xd
  400b2b:	e9 10 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b30 <__strtol_internal@plt>:
  400b30:	ff 25 ba 27 20 00    	jmpq   *0x2027ba(%rip)        # 6032f0 <_GLOBAL_OFFSET_TABLE_+0x88>
  400b36:	68 0e 00 00 00       	pushq  $0xe
  400b3b:	e9 00 ff ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b40 <sscanf@plt>:
  400b40:	ff 25 b2 27 20 00    	jmpq   *0x2027b2(%rip)        # 6032f8 <_GLOBAL_OFFSET_TABLE_+0x90>
  400b46:	68 0f 00 00 00       	pushq  $0xf
  400b4b:	e9 f0 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b50 <sleep@plt>:
  400b50:	ff 25 aa 27 20 00    	jmpq   *0x2027aa(%rip)        # 603300 <_GLOBAL_OFFSET_TABLE_+0x98>
  400b56:	68 10 00 00 00       	pushq  $0x10
  400b5b:	e9 e0 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b60 <connect@plt>:
  400b60:	ff 25 a2 27 20 00    	jmpq   *0x2027a2(%rip)        # 603308 <_GLOBAL_OFFSET_TABLE_+0xa0>
  400b66:	68 11 00 00 00       	pushq  $0x11
  400b6b:	e9 d0 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b70 <gethostname@plt>:
  400b70:	ff 25 9a 27 20 00    	jmpq   *0x20279a(%rip)        # 603310 <_GLOBAL_OFFSET_TABLE_+0xa8>
  400b76:	68 12 00 00 00       	pushq  $0x12
  400b7b:	e9 c0 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b80 <signal@plt>:
  400b80:	ff 25 92 27 20 00    	jmpq   *0x202792(%rip)        # 603318 <_GLOBAL_OFFSET_TABLE_+0xb0>
  400b86:	68 13 00 00 00       	pushq  $0x13
  400b8b:	e9 b0 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400b90 <socket@plt>:
  400b90:	ff 25 8a 27 20 00    	jmpq   *0x20278a(%rip)        # 603320 <_GLOBAL_OFFSET_TABLE_+0xb8>
  400b96:	68 14 00 00 00       	pushq  $0x14
  400b9b:	e9 a0 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400ba0 <getenv@plt>:
  400ba0:	ff 25 82 27 20 00    	jmpq   *0x202782(%rip)        # 603328 <_GLOBAL_OFFSET_TABLE_+0xc0>
  400ba6:	68 15 00 00 00       	pushq  $0x15
  400bab:	e9 90 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400bb0 <alarm@plt>:
  400bb0:	ff 25 7a 27 20 00    	jmpq   *0x20277a(%rip)        # 603330 <_GLOBAL_OFFSET_TABLE_+0xc8>
  400bb6:	68 16 00 00 00       	pushq  $0x16
  400bbb:	e9 80 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400bc0 <__errno_location@plt>:
  400bc0:	ff 25 72 27 20 00    	jmpq   *0x202772(%rip)        # 603338 <_GLOBAL_OFFSET_TABLE_+0xd0>
  400bc6:	68 17 00 00 00       	pushq  $0x17
  400bcb:	e9 70 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400bd0 <strcpy@plt>:
  400bd0:	ff 25 6a 27 20 00    	jmpq   *0x20276a(%rip)        # 603340 <_GLOBAL_OFFSET_TABLE_+0xd8>
  400bd6:	68 18 00 00 00       	pushq  $0x18
  400bdb:	e9 60 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400be0 <fprintf@plt>:
  400be0:	ff 25 62 27 20 00    	jmpq   *0x202762(%rip)        # 603348 <_GLOBAL_OFFSET_TABLE_+0xe0>
  400be6:	68 19 00 00 00       	pushq  $0x19
  400beb:	e9 50 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400bf0 <write@plt>:
  400bf0:	ff 25 5a 27 20 00    	jmpq   *0x20275a(%rip)        # 603350 <_GLOBAL_OFFSET_TABLE_+0xe8>
  400bf6:	68 1a 00 00 00       	pushq  $0x1a
  400bfb:	e9 40 fe ff ff       	jmpq   400a40 <_init+0x18>

0000000000400c00 <fflush@plt>:
  400c00:	ff 25 52 27 20 00    	jmpq   *0x202752(%rip)        # 603358 <_GLOBAL_OFFSET_TABLE_+0xf0>
  400c06:	68 1b 00 00 00       	pushq  $0x1b
  400c0b:	e9 30 fe ff ff       	jmpq   400a40 <_init+0x18>

Disassembly of section .text:

0000000000400c10 <_start>:
  400c10:	31 ed                	xor    %ebp,%ebp
  400c12:	49 89 d1             	mov    %rdx,%r9
  400c15:	5e                   	pop    %rsi
  400c16:	48 89 e2             	mov    %rsp,%rdx
  400c19:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  400c1d:	50                   	push   %rax
  400c1e:	54                   	push   %rsp
  400c1f:	49 c7 c0 d0 23 40 00 	mov    $0x4023d0,%r8
  400c26:	48 c7 c1 e0 23 40 00 	mov    $0x4023e0,%rcx
  400c2d:	48 c7 c7 e8 0c 40 00 	mov    $0x400ce8,%rdi
  400c34:	e8 a7 fe ff ff       	callq  400ae0 <__libc_start_main@plt>
  400c39:	f4                   	hlt    
  400c3a:	90                   	nop
  400c3b:	90                   	nop

0000000000400c3c <call_gmon_start>:
  400c3c:	48 83 ec 08          	sub    $0x8,%rsp
  400c40:	48 8b 05 19 26 20 00 	mov    0x202619(%rip),%rax        # 603260 <_DYNAMIC+0x190>
  400c47:	48 85 c0             	test   %rax,%rax
  400c4a:	74 02                	je     400c4e <call_gmon_start+0x12>
  400c4c:	ff d0                	callq  *%rax
  400c4e:	48 83 c4 08          	add    $0x8,%rsp
  400c52:	c3                   	retq   
  400c53:	90                   	nop
  400c54:	90                   	nop
  400c55:	90                   	nop
  400c56:	90                   	nop
  400c57:	90                   	nop
  400c58:	90                   	nop
  400c59:	90                   	nop
  400c5a:	90                   	nop
  400c5b:	90                   	nop
  400c5c:	90                   	nop
  400c5d:	90                   	nop
  400c5e:	90                   	nop
  400c5f:	90                   	nop

0000000000400c60 <__do_global_dtors_aux>:
  400c60:	55                   	push   %rbp
  400c61:	48 89 e5             	mov    %rsp,%rbp
  400c64:	53                   	push   %rbx
  400c65:	48 83 ec 08          	sub    $0x8,%rsp
  400c69:	80 3d 10 30 20 00 00 	cmpb   $0x0,0x203010(%rip)        # 603c80 <completed.6145>
  400c70:	75 44                	jne    400cb6 <__do_global_dtors_aux+0x56>
  400c72:	b8 c0 30 60 00       	mov    $0x6030c0,%eax
  400c77:	48 2d b8 30 60 00    	sub    $0x6030b8,%rax
  400c7d:	48 c1 f8 03          	sar    $0x3,%rax
  400c81:	48 8d 58 ff          	lea    -0x1(%rax),%rbx
  400c85:	48 8b 05 ec 2f 20 00 	mov    0x202fec(%rip),%rax        # 603c78 <dtor_idx.6147>
  400c8c:	48 39 c3             	cmp    %rax,%rbx
  400c8f:	76 1e                	jbe    400caf <__do_global_dtors_aux+0x4f>
  400c91:	48 83 c0 01          	add    $0x1,%rax
  400c95:	48 89 05 dc 2f 20 00 	mov    %rax,0x202fdc(%rip)        # 603c78 <dtor_idx.6147>
  400c9c:	ff 14 c5 b8 30 60 00 	callq  *0x6030b8(,%rax,8)
  400ca3:	48 8b 05 ce 2f 20 00 	mov    0x202fce(%rip),%rax        # 603c78 <dtor_idx.6147>
  400caa:	48 39 c3             	cmp    %rax,%rbx
  400cad:	77 e2                	ja     400c91 <__do_global_dtors_aux+0x31>
  400caf:	c6 05 ca 2f 20 00 01 	movb   $0x1,0x202fca(%rip)        # 603c80 <completed.6145>
  400cb6:	48 83 c4 08          	add    $0x8,%rsp
  400cba:	5b                   	pop    %rbx
  400cbb:	c9                   	leaveq 
  400cbc:	c3                   	retq   
  400cbd:	0f 1f 00             	nopl   (%rax)

0000000000400cc0 <frame_dummy>:
  400cc0:	55                   	push   %rbp
  400cc1:	48 83 3d ff 23 20 00 	cmpq   $0x0,0x2023ff(%rip)        # 6030c8 <__JCR_END__>
  400cc8:	00 
  400cc9:	48 89 e5             	mov    %rsp,%rbp
  400ccc:	74 16                	je     400ce4 <frame_dummy+0x24>
  400cce:	b8 00 00 00 00       	mov    $0x0,%eax
  400cd3:	48 85 c0             	test   %rax,%rax
  400cd6:	74 0c                	je     400ce4 <frame_dummy+0x24>
  400cd8:	bf c8 30 60 00       	mov    $0x6030c8,%edi
  400cdd:	49 89 c3             	mov    %rax,%r11
  400ce0:	c9                   	leaveq 
  400ce1:	41 ff e3             	jmpq   *%r11
  400ce4:	c9                   	leaveq 
  400ce5:	c3                   	retq   
  400ce6:	90                   	nop
  400ce7:	90                   	nop

0000000000400ce8 <main>:
  400ce8:	53                   	push   %rbx
  400ce9:	48 89 f3             	mov    %rsi,%rbx
  400cec:	83 ff 01             	cmp    $0x1,%edi
  400cef:	75 10                	jne    400d01 <main+0x19>
  400cf1:	48 8b 05 68 2f 20 00 	mov    0x202f68(%rip),%rax        # 603c60 <__bss_start>
  400cf8:	48 89 05 89 2f 20 00 	mov    %rax,0x202f89(%rip)        # 603c88 <infile>
  400cff:	eb 56                	jmp    400d57 <main+0x6f>
  400d01:	83 ff 02             	cmp    $0x2,%edi
  400d04:	75 35                	jne    400d3b <main+0x53>
  400d06:	be d0 24 40 00       	mov    $0x4024d0,%esi
  400d0b:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  400d0f:	e8 bc fd ff ff       	callq  400ad0 <fopen@plt>
  400d14:	48 89 05 6d 2f 20 00 	mov    %rax,0x202f6d(%rip)        # 603c88 <infile>
  400d1b:	48 85 c0             	test   %rax,%rax
  400d1e:	75 37                	jne    400d57 <main+0x6f>
  400d20:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  400d24:	48 8b 33             	mov    (%rbx),%rsi
  400d27:	bf d2 24 40 00       	mov    $0x4024d2,%edi
  400d2c:	e8 1f fd ff ff       	callq  400a50 <printf@plt>
  400d31:	bf 08 00 00 00       	mov    $0x8,%edi
  400d36:	e8 65 fd ff ff       	callq  400aa0 <exit@plt>
  400d3b:	48 8b 36             	mov    (%rsi),%rsi
  400d3e:	bf ef 24 40 00       	mov    $0x4024ef,%edi
  400d43:	b8 00 00 00 00       	mov    $0x0,%eax
  400d48:	e8 03 fd ff ff       	callq  400a50 <printf@plt>
  400d4d:	bf 08 00 00 00       	mov    $0x8,%edi
  400d52:	e8 49 fd ff ff       	callq  400aa0 <exit@plt>
  400d57:	e8 b5 08 00 00       	callq  401611 <initialize_bomb>
  400d5c:	bf 58 25 40 00       	mov    $0x402558,%edi
  400d61:	e8 2a fd ff ff       	callq  400a90 <puts@plt>
  400d66:	bf 98 25 40 00       	mov    $0x402598,%edi
  400d6b:	e8 20 fd ff ff       	callq  400a90 <puts@plt>
  400d70:	e8 72 07 00 00       	callq  4014e7 <read_line>
  400d75:	48 89 c7             	mov    %rax,%rdi
  400d78:	e8 3e 03 00 00       	callq  4010bb <phase_1>
  400d7d:	e8 e3 05 00 00       	callq  401365 <phase_defused>
  400d82:	bf c8 25 40 00       	mov    $0x4025c8,%edi
  400d87:	e8 04 fd ff ff       	callq  400a90 <puts@plt>
  400d8c:	e8 56 07 00 00       	callq  4014e7 <read_line>
  400d91:	48 89 c7             	mov    %rax,%rdi
  400d94:	e8 7d 02 00 00       	callq  401016 <phase_2>
  400d99:	e8 c7 05 00 00       	callq  401365 <phase_defused>
  400d9e:	bf 09 25 40 00       	mov    $0x402509,%edi
  400da3:	e8 e8 fc ff ff       	callq  400a90 <puts@plt>
  400da8:	e8 3a 07 00 00       	callq  4014e7 <read_line>
  400dad:	48 89 c7             	mov    %rax,%rdi
  400db0:	e8 85 03 00 00       	callq  40113a <phase_3>
  400db5:	e8 ab 05 00 00       	callq  401365 <phase_defused>
  400dba:	bf 27 25 40 00       	mov    $0x402527,%edi
  400dbf:	e8 cc fc ff ff       	callq  400a90 <puts@plt>
  400dc4:	e8 1e 07 00 00       	callq  4014e7 <read_line>
  400dc9:	48 89 c7             	mov    %rax,%rdi
  400dcc:	e8 06 03 00 00       	callq  4010d7 <phase_4>
  400dd1:	e8 8f 05 00 00       	callq  401365 <phase_defused>
  400dd6:	bf f8 25 40 00       	mov    $0x4025f8,%edi
  400ddb:	e8 b0 fc ff ff       	callq  400a90 <puts@plt>
  400de0:	e8 02 07 00 00       	callq  4014e7 <read_line>
  400de5:	48 89 c7             	mov    %rax,%rdi
  400de8:	e8 72 02 00 00       	callq  40105f <phase_5>
  400ded:	e8 73 05 00 00       	callq  401365 <phase_defused>
  400df2:	bf 36 25 40 00       	mov    $0x402536,%edi
  400df7:	e8 94 fc ff ff       	callq  400a90 <puts@plt>
  400dfc:	e8 e6 06 00 00       	callq  4014e7 <read_line>
  400e01:	48 89 c7             	mov    %rax,%rdi
  400e04:	e8 da 00 00 00       	callq  400ee3 <phase_6>
  400e09:	e8 57 05 00 00       	callq  401365 <phase_defused>
  400e0e:	b8 00 00 00 00       	mov    $0x0,%eax
  400e13:	5b                   	pop    %rbx
  400e14:	c3                   	retq   
  400e15:	90                   	nop
  400e16:	90                   	nop
  400e17:	90                   	nop
  400e18:	90                   	nop
  400e19:	90                   	nop
  400e1a:	90                   	nop
  400e1b:	90                   	nop
  400e1c:	90                   	nop
  400e1d:	90                   	nop
  400e1e:	90                   	nop
  400e1f:	90                   	nop

0000000000400e20 <func4>:
  400e20:	89 d1                	mov    %edx,%ecx
  400e22:	29 f2                	sub    %esi,%edx
  400e24:	89 d0                	mov    %edx,%eax
  400e26:	c1 e8 1f             	shr    $0x1f,%eax
  400e29:	01 d0                	add    %edx,%eax
  400e2b:	d1 f8                	sar    %eax
  400e2d:	01 f0                	add    %esi,%eax
  400e2f:	39 f8                	cmp    %edi,%eax
  400e31:	7e 0d                	jle    400e40 <func4+0x20>
  400e33:	8d 50 ff             	lea    -0x1(%rax),%edx
  400e36:	e8 e5 ff ff ff       	callq  400e20 <func4>
  400e3b:	8d 14 00             	lea    (%rax,%rax,1),%edx
  400e3e:	eb 17                	jmp    400e57 <func4+0x37>
  400e40:	ba 00 00 00 00       	mov    $0x0,%edx
  400e45:	39 f8                	cmp    %edi,%eax
  400e47:	7d 0e                	jge    400e57 <func4+0x37>
  400e49:	8d 70 01             	lea    0x1(%rax),%esi
  400e4c:	89 ca                	mov    %ecx,%edx
  400e4e:	e8 cd ff ff ff       	callq  400e20 <func4>
  400e53:	8d 54 00 01          	lea    0x1(%rax,%rax,1),%edx
  400e57:	89 d0                	mov    %edx,%eax
  400e59:	c3                   	retq   

0000000000400e5a <fun7>:
  400e5a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  400e5f:	48 85 ff             	test   %rdi,%rdi
  400e62:	74 28                	je     400e8c <fun7+0x32>
  400e64:	8b 17                	mov    (%rdi),%edx
  400e66:	39 f2                	cmp    %esi,%edx
  400e68:	7e 0c                	jle    400e76 <fun7+0x1c>
  400e6a:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
  400e6e:	e8 e7 ff ff ff       	callq  400e5a <fun7>
  400e73:	01 c0                	add    %eax,%eax
  400e75:	c3                   	retq   
  400e76:	b8 00 00 00 00       	mov    $0x0,%eax
  400e7b:	39 f2                	cmp    %esi,%edx
  400e7d:	74 0d                	je     400e8c <fun7+0x32>
  400e7f:	48 8b 7f 10          	mov    0x10(%rdi),%rdi
  400e83:	e8 d2 ff ff ff       	callq  400e5a <fun7>
  400e88:	8d 44 00 01          	lea    0x1(%rax,%rax,1),%eax
  400e8c:	f3 c3                	repz retq 

0000000000400e8e <secret_phase>:
  400e8e:	53                   	push   %rbx
  400e8f:	e8 53 06 00 00       	callq  4014e7 <read_line>
  400e94:	48 89 c7             	mov    %rax,%rdi
  400e97:	b9 00 00 00 00       	mov    $0x0,%ecx
  400e9c:	ba 0a 00 00 00       	mov    $0xa,%edx
  400ea1:	be 00 00 00 00       	mov    $0x0,%esi
  400ea6:	e8 85 fc ff ff       	callq  400b30 <__strtol_internal@plt>
  400eab:	89 c3                	mov    %eax,%ebx
  400ead:	8d 40 ff             	lea    -0x1(%rax),%eax
  400eb0:	3d e8 03 00 00       	cmp    $0x3e8,%eax
  400eb5:	76 05                	jbe    400ebc <secret_phase+0x2e>
  400eb7:	e8 35 05 00 00       	callq  4013f1 <explode_bomb>
  400ebc:	89 de                	mov    %ebx,%esi
  400ebe:	bf c0 39 60 00       	mov    $0x6039c0,%edi
  400ec3:	e8 92 ff ff ff       	callq  400e5a <fun7>
  400ec8:	83 f8 01             	cmp    $0x1,%eax
  400ecb:	74 05                	je     400ed2 <secret_phase+0x44>
  400ecd:	e8 1f 05 00 00       	callq  4013f1 <explode_bomb>
  400ed2:	bf 20 26 40 00       	mov    $0x402620,%edi
  400ed7:	e8 b4 fb ff ff       	callq  400a90 <puts@plt>
  400edc:	e8 84 04 00 00       	callq  401365 <phase_defused>
  400ee1:	5b                   	pop    %rbx
  400ee2:	c3                   	retq   

0000000000400ee3 <phase_6>:
  400ee3:	41 57                	push   %r15
  400ee5:	41 56                	push   %r14
  400ee7:	41 55                	push   %r13
  400ee9:	41 54                	push   %r12
  400eeb:	55                   	push   %rbp
  400eec:	53                   	push   %rbx
  400eed:	48 83 ec 58          	sub    $0x58,%rsp
  400ef1:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  400ef6:	e8 2c 05 00 00       	callq  401427 <read_six_numbers>
  400efb:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  400f01:	4c 8d 74 24 30       	lea    0x30(%rsp),%r14
  400f06:	4d 89 f7             	mov    %r14,%r15
  400f09:	4d 89 ec             	mov    %r13,%r12
  400f0c:	43 8b 04 ae          	mov    (%r14,%r13,4),%eax
  400f10:	83 e8 01             	sub    $0x1,%eax
  400f13:	83 f8 05             	cmp    $0x5,%eax
  400f16:	76 05                	jbe    400f1d <phase_6+0x3a>
  400f18:	e8 d4 04 00 00       	callq  4013f1 <explode_bomb>
  400f1d:	41 8d 5d 01          	lea    0x1(%r13),%ebx
  400f21:	49 83 fd 05          	cmp    $0x5,%r13
  400f25:	0f 84 d2 00 00 00    	je     400ffd <phase_6+0x11a>
  400f2b:	4c 89 fd             	mov    %r15,%rbp
  400f2e:	48 63 d3             	movslq %ebx,%rdx
  400f31:	42 8b 44 a5 00       	mov    0x0(%rbp,%r12,4),%eax
  400f36:	3b 44 94 30          	cmp    0x30(%rsp,%rdx,4),%eax
  400f3a:	75 05                	jne    400f41 <phase_6+0x5e>
  400f3c:	e8 b0 04 00 00       	callq  4013f1 <explode_bomb>
  400f41:	83 c3 01             	add    $0x1,%ebx
  400f44:	83 fb 05             	cmp    $0x5,%ebx
  400f47:	7e e5                	jle    400f2e <phase_6+0x4b>
  400f49:	49 83 c5 01          	add    $0x1,%r13
  400f4d:	eb ba                	jmp    400f09 <phase_6+0x26>
  400f4f:	b8 07 00 00 00       	mov    $0x7,%eax
  400f54:	2b 02                	sub    (%rdx),%eax
  400f56:	89 02                	mov    %eax,(%rdx)
  400f58:	48 83 c2 04          	add    $0x4,%rdx
  400f5c:	48 8d 44 24 48       	lea    0x48(%rsp),%rax
  400f61:	48 39 c2             	cmp    %rax,%rdx
  400f64:	75 e9                	jne    400f4f <phase_6+0x6c>
  400f66:	be f0 37 60 00       	mov    $0x6037f0,%esi
  400f6b:	ba 01 00 00 00       	mov    $0x1,%edx
  400f70:	b9 00 00 00 00       	mov    $0x0,%ecx
  400f75:	eb 07                	jmp    400f7e <phase_6+0x9b>
  400f77:	48 8b 76 08          	mov    0x8(%rsi),%rsi
  400f7b:	83 c2 01             	add    $0x1,%edx
  400f7e:	48 63 c1             	movslq %ecx,%rax
  400f81:	3b 54 84 30          	cmp    0x30(%rsp,%rax,4),%edx
  400f85:	7c f0                	jl     400f77 <phase_6+0x94>
  400f87:	48 89 34 c4          	mov    %rsi,(%rsp,%rax,8)
  400f8b:	83 c1 01             	add    $0x1,%ecx
  400f8e:	83 f9 05             	cmp    $0x5,%ecx
  400f91:	7f 0c                	jg     400f9f <phase_6+0xbc>
  400f93:	be f0 37 60 00       	mov    $0x6037f0,%esi
  400f98:	ba 01 00 00 00       	mov    $0x1,%edx
  400f9d:	eb df                	jmp    400f7e <phase_6+0x9b>
  400f9f:	48 8b 0c 24          	mov    (%rsp),%rcx
  400fa3:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  400fa8:	48 89 41 08          	mov    %rax,0x8(%rcx)
  400fac:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
  400fb1:	48 89 50 08          	mov    %rdx,0x8(%rax)
  400fb5:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  400fba:	48 89 42 08          	mov    %rax,0x8(%rdx)
  400fbe:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
  400fc3:	48 89 50 08          	mov    %rdx,0x8(%rax)
  400fc7:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
  400fcc:	48 89 42 08          	mov    %rax,0x8(%rdx)
  400fd0:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
  400fd7:	00 
  400fd8:	48 89 cb             	mov    %rcx,%rbx
  400fdb:	bd 00 00 00 00       	mov    $0x0,%ebp
  400fe0:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  400fe4:	8b 03                	mov    (%rbx),%eax
  400fe6:	3b 02                	cmp    (%rdx),%eax
  400fe8:	7d 05                	jge    400fef <phase_6+0x10c>
  400fea:	e8 02 04 00 00       	callq  4013f1 <explode_bomb>
  400fef:	48 8b 5b 08          	mov    0x8(%rbx),%rbx
  400ff3:	83 c5 01             	add    $0x1,%ebp
  400ff6:	83 fd 05             	cmp    $0x5,%ebp
  400ff9:	74 0c                	je     401007 <phase_6+0x124>
  400ffb:	eb e3                	jmp    400fe0 <phase_6+0xfd>
  400ffd:	48 8d 54 24 30       	lea    0x30(%rsp),%rdx
  401002:	e9 48 ff ff ff       	jmpq   400f4f <phase_6+0x6c>
  401007:	48 83 c4 58          	add    $0x58,%rsp
  40100b:	5b                   	pop    %rbx
  40100c:	5d                   	pop    %rbp
  40100d:	41 5c                	pop    %r12
  40100f:	41 5d                	pop    %r13
  401011:	41 5e                	pop    %r14
  401013:	41 5f                	pop    %r15
  401015:	c3                   	retq   

0000000000401016 <phase_2>:
  401016:	55                   	push   %rbp
  401017:	53                   	push   %rbx
  401018:	48 83 ec 28          	sub    $0x28,%rsp
  40101c:	48 89 e6             	mov    %rsp,%rsi
  40101f:	e8 03 04 00 00       	callq  401427 <read_six_numbers>
  401024:	83 3c 24 00          	cmpl   $0x0,(%rsp)
  401028:	75 07                	jne    401031 <phase_2+0x1b>
  40102a:	83 7c 24 04 01       	cmpl   $0x1,0x4(%rsp)
  40102f:	74 05                	je     401036 <phase_2+0x20>
  401031:	e8 bb 03 00 00       	callq  4013f1 <explode_bomb>
  401036:	48 8d 5c 24 08       	lea    0x8(%rsp),%rbx
  40103b:	48 8d 6c 24 18       	lea    0x18(%rsp),%rbp
  401040:	8b 43 f8             	mov    -0x8(%rbx),%eax
  401043:	03 43 fc             	add    -0x4(%rbx),%eax
  401046:	39 03                	cmp    %eax,(%rbx)
  401048:	74 05                	je     40104f <phase_2+0x39>
  40104a:	e8 a2 03 00 00       	callq  4013f1 <explode_bomb>
  40104f:	48 83 c3 04          	add    $0x4,%rbx
  401053:	48 39 eb             	cmp    %rbp,%rbx
  401056:	75 e8                	jne    401040 <phase_2+0x2a>
  401058:	48 83 c4 28          	add    $0x28,%rsp
  40105c:	5b                   	pop    %rbx
  40105d:	5d                   	pop    %rbp
  40105e:	c3                   	retq   

000000000040105f <phase_5>:
  40105f:	53                   	push   %rbx
  401060:	48 83 ec 10          	sub    $0x10,%rsp
  401064:	48 89 fb             	mov    %rdi,%rbx
  401067:	e8 94 01 00 00       	callq  401200 <string_length>
  40106c:	83 f8 06             	cmp    $0x6,%eax
  40106f:	74 05                	je     401076 <phase_5+0x17>
  401071:	e8 7b 03 00 00       	callq  4013f1 <explode_bomb>
  401076:	ba 00 00 00 00       	mov    $0x0,%edx
  40107b:	48 89 e7             	mov    %rsp,%rdi
  40107e:	48 0f be 04 1a       	movsbq (%rdx,%rbx,1),%rax
  401083:	83 e0 0f             	and    $0xf,%eax
  401086:	0f b6 80 b0 26 40 00 	movzbl 0x4026b0(%rax),%eax
  40108d:	88 04 3a             	mov    %al,(%rdx,%rdi,1)
  401090:	48 83 c2 01          	add    $0x1,%rdx
  401094:	48 83 fa 06          	cmp    $0x6,%rdx
  401098:	75 e4                	jne    40107e <phase_5+0x1f>
  40109a:	c6 44 24 06 00       	movb   $0x0,0x6(%rsp)
  40109f:	be 46 26 40 00       	mov    $0x402646,%esi
  4010a4:	48 89 e7             	mov    %rsp,%rdi
  4010a7:	e8 73 01 00 00       	callq  40121f <strings_not_equal>
  4010ac:	85 c0                	test   %eax,%eax
  4010ae:	74 05                	je     4010b5 <phase_5+0x56>
  4010b0:	e8 3c 03 00 00       	callq  4013f1 <explode_bomb>
  4010b5:	48 83 c4 10          	add    $0x10,%rsp
  4010b9:	5b                   	pop    %rbx
  4010ba:	c3                   	retq   

00000000004010bb <phase_1>:
  4010bb:	48 83 ec 08          	sub    $0x8,%rsp
  4010bf:	be 4d 26 40 00       	mov    $0x40264d,%esi
  4010c4:	e8 56 01 00 00       	callq  40121f <strings_not_equal>
  4010c9:	85 c0                	test   %eax,%eax
  4010cb:	74 05                	je     4010d2 <phase_1+0x17>
  4010cd:	e8 1f 03 00 00       	callq  4013f1 <explode_bomb>
  4010d2:	48 83 c4 08          	add    $0x8,%rsp
  4010d6:	c3                   	retq   

00000000004010d7 <phase_4>:
  4010d7:	48 83 ec 18          	sub    $0x18,%rsp
  4010db:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
  4010e0:	48 8d 54 24 14       	lea    0x14(%rsp),%rdx
  4010e5:	be 2d 27 40 00       	mov    $0x40272d,%esi
  4010ea:	b8 00 00 00 00       	mov    $0x0,%eax
  4010ef:	e8 4c fa ff ff       	callq  400b40 <sscanf@plt>
  4010f4:	83 f8 02             	cmp    $0x2,%eax
  4010f7:	75 0d                	jne    401106 <phase_4+0x2f>
  4010f9:	8b 44 24 14          	mov    0x14(%rsp),%eax
  4010fd:	85 c0                	test   %eax,%eax
  4010ff:	78 05                	js     401106 <phase_4+0x2f>
  401101:	83 f8 0e             	cmp    $0xe,%eax
  401104:	7e 05                	jle    40110b <phase_4+0x34>
  401106:	e8 e6 02 00 00       	callq  4013f1 <explode_bomb>
  40110b:	8b 7c 24 14          	mov    0x14(%rsp),%edi
  40110f:	ba 0e 00 00 00       	mov    $0xe,%edx
  401114:	be 00 00 00 00       	mov    $0x0,%esi
  401119:	e8 02 fd ff ff       	callq  400e20 <func4>
  40111e:	83 f8 05             	cmp    $0x5,%eax
  401121:	75 07                	jne    40112a <phase_4+0x53>
  401123:	83 7c 24 10 05       	cmpl   $0x5,0x10(%rsp)
  401128:	74 0b                	je     401135 <phase_4+0x5e>
  40112a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  401130:	e8 bc 02 00 00       	callq  4013f1 <explode_bomb>
  401135:	48 83 c4 18          	add    $0x18,%rsp
  401139:	c3                   	retq   

000000000040113a <phase_3>:
  40113a:	48 83 ec 18          	sub    $0x18,%rsp
  40113e:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
  401143:	48 8d 54 24 14       	lea    0x14(%rsp),%rdx
  401148:	be 2d 27 40 00       	mov    $0x40272d,%esi
  40114d:	b8 00 00 00 00       	mov    $0x0,%eax
  401152:	e8 e9 f9 ff ff       	callq  400b40 <sscanf@plt>
  401157:	83 f8 01             	cmp    $0x1,%eax
  40115a:	7f 05                	jg     401161 <phase_3+0x27>
  40115c:	e8 90 02 00 00       	callq  4013f1 <explode_bomb>
  401161:	83 7c 24 14 07       	cmpl   $0x7,0x14(%rsp)
  401166:	77 6b                	ja     4011d3 <phase_3+0x99>
  401168:	8b 44 24 14          	mov    0x14(%rsp),%eax
  40116c:	ff 24 c5 70 26 40 00 	jmpq   *0x402670(,%rax,8)
  401173:	b8 00 00 00 00       	mov    $0x0,%eax
  401178:	eb 52                	jmp    4011cc <phase_3+0x92>
  40117a:	b8 00 00 00 00       	mov    $0x0,%eax
  40117f:	90                   	nop
  401180:	eb 45                	jmp    4011c7 <phase_3+0x8d>
  401182:	b8 00 00 00 00       	mov    $0x0,%eax
  401187:	eb 39                	jmp    4011c2 <phase_3+0x88>
  401189:	b8 00 00 00 00       	mov    $0x0,%eax
  40118e:	66 90                	xchg   %ax,%ax
  401190:	eb 2b                	jmp    4011bd <phase_3+0x83>
  401192:	b8 00 00 00 00       	mov    $0x0,%eax
  401197:	eb 1f                	jmp    4011b8 <phase_3+0x7e>
  401199:	b8 00 00 00 00       	mov    $0x0,%eax
  40119e:	66 90                	xchg   %ax,%ax
  4011a0:	eb 11                	jmp    4011b3 <phase_3+0x79>
  4011a2:	b8 e8 00 00 00       	mov    $0xe8,%eax
  4011a7:	eb 05                	jmp    4011ae <phase_3+0x74>
  4011a9:	b8 00 00 00 00       	mov    $0x0,%eax
  4011ae:	2d 3f 03 00 00       	sub    $0x33f,%eax
  4011b3:	05 08 01 00 00       	add    $0x108,%eax
  4011b8:	2d 6e 01 00 00       	sub    $0x16e,%eax
  4011bd:	05 6e 01 00 00       	add    $0x16e,%eax
  4011c2:	2d 6e 01 00 00       	sub    $0x16e,%eax
  4011c7:	05 6e 01 00 00       	add    $0x16e,%eax
  4011cc:	2d 6e 01 00 00       	sub    $0x16e,%eax
  4011d1:	eb 0a                	jmp    4011dd <phase_3+0xa3>
  4011d3:	e8 19 02 00 00       	callq  4013f1 <explode_bomb>
  4011d8:	b8 00 00 00 00       	mov    $0x0,%eax
  4011dd:	83 7c 24 14 05       	cmpl   $0x5,0x14(%rsp)
  4011e2:	7f 06                	jg     4011ea <phase_3+0xb0>
  4011e4:	3b 44 24 10          	cmp    0x10(%rsp),%eax
  4011e8:	74 05                	je     4011ef <phase_3+0xb5>
  4011ea:	e8 02 02 00 00       	callq  4013f1 <explode_bomb>
  4011ef:	48 83 c4 18          	add    $0x18,%rsp
  4011f3:	c3                   	retq   
  4011f4:	90                   	nop
  4011f5:	90                   	nop
  4011f6:	90                   	nop
  4011f7:	90                   	nop
  4011f8:	90                   	nop
  4011f9:	90                   	nop
  4011fa:	90                   	nop
  4011fb:	90                   	nop
  4011fc:	90                   	nop
  4011fd:	90                   	nop
  4011fe:	90                   	nop
  4011ff:	90                   	nop

0000000000401200 <string_length>:
  401200:	b8 00 00 00 00       	mov    $0x0,%eax
  401205:	80 3f 00             	cmpb   $0x0,(%rdi)
  401208:	74 13                	je     40121d <string_length+0x1d>
  40120a:	48 89 fa             	mov    %rdi,%rdx
  40120d:	0f b6 42 01          	movzbl 0x1(%rdx),%eax
  401211:	48 83 c2 01          	add    $0x1,%rdx
  401215:	84 c0                	test   %al,%al
  401217:	75 f4                	jne    40120d <string_length+0xd>
  401219:	89 d0                	mov    %edx,%eax
  40121b:	29 f8                	sub    %edi,%eax
  40121d:	f3 c3                	repz retq 

000000000040121f <strings_not_equal>:
  40121f:	41 54                	push   %r12
  401221:	55                   	push   %rbp
  401222:	53                   	push   %rbx
  401223:	48 89 fd             	mov    %rdi,%rbp
  401226:	49 89 f4             	mov    %rsi,%r12
  401229:	e8 d2 ff ff ff       	callq  401200 <string_length>
  40122e:	89 c3                	mov    %eax,%ebx
  401230:	4c 89 e7             	mov    %r12,%rdi
  401233:	e8 c8 ff ff ff       	callq  401200 <string_length>
  401238:	39 c3                	cmp    %eax,%ebx
  40123a:	75 32                	jne    40126e <strings_not_equal+0x4f>
  40123c:	0f b6 45 00          	movzbl 0x0(%rbp),%eax
  401240:	84 c0                	test   %al,%al
  401242:	74 31                	je     401275 <strings_not_equal+0x56>
  401244:	48 89 e9             	mov    %rbp,%rcx
  401247:	4c 89 e2             	mov    %r12,%rdx
  40124a:	41 3a 04 24          	cmp    (%r12),%al
  40124e:	74 13                	je     401263 <strings_not_equal+0x44>
  401250:	eb 1c                	jmp    40126e <strings_not_equal+0x4f>
  401252:	0f b6 42 01          	movzbl 0x1(%rdx),%eax
  401256:	48 83 c1 01          	add    $0x1,%rcx
  40125a:	48 83 c2 01          	add    $0x1,%rdx
  40125e:	40 38 c6             	cmp    %al,%sil
  401261:	75 0b                	jne    40126e <strings_not_equal+0x4f>
  401263:	0f b6 71 01          	movzbl 0x1(%rcx),%esi
  401267:	40 84 f6             	test   %sil,%sil
  40126a:	75 e6                	jne    401252 <strings_not_equal+0x33>
  40126c:	eb 07                	jmp    401275 <strings_not_equal+0x56>
  40126e:	b8 01 00 00 00       	mov    $0x1,%eax
  401273:	eb 05                	jmp    40127a <strings_not_equal+0x5b>
  401275:	b8 00 00 00 00       	mov    $0x0,%eax
  40127a:	5b                   	pop    %rbx
  40127b:	5d                   	pop    %rbp
  40127c:	41 5c                	pop    %r12
  40127e:	66 90                	xchg   %ax,%ax
  401280:	c3                   	retq   

0000000000401281 <initialize_bomb_solve>:
  401281:	f3 c3                	repz retq 

0000000000401283 <invalid_phase>:
  401283:	48 83 ec 08          	sub    $0x8,%rsp
  401287:	48 89 fe             	mov    %rdi,%rsi
  40128a:	bf c0 26 40 00       	mov    $0x4026c0,%edi
  40128f:	b8 00 00 00 00       	mov    $0x0,%eax
  401294:	e8 b7 f7 ff ff       	callq  400a50 <printf@plt>
  401299:	bf 08 00 00 00       	mov    $0x8,%edi
  40129e:	e8 fd f7 ff ff       	callq  400aa0 <exit@plt>

00000000004012a3 <send_msg>:
  4012a3:	55                   	push   %rbp
  4012a4:	53                   	push   %rbx
  4012a5:	48 81 ec 08 40 00 00 	sub    $0x4008,%rsp
  4012ac:	89 fe                	mov    %edi,%esi
  4012ae:	44 8b 05 cf 29 20 00 	mov    0x2029cf(%rip),%r8d        # 603c84 <num_input_strings>
  4012b5:	49 63 c0             	movslq %r8d,%rax
  4012b8:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  4012bc:	48 c1 e0 04          	shl    $0x4,%rax
  4012c0:	48 8d 90 50 3c 60 00 	lea    0x603c50(%rax),%rdx
  4012c7:	48 89 d7             	mov    %rdx,%rdi
  4012ca:	fc                   	cld    
  4012cb:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  4012d2:	b8 00 00 00 00       	mov    $0x0,%eax
  4012d7:	f2 ae                	repnz scas %es:(%rdi),%al
  4012d9:	48 f7 d1             	not    %rcx
  4012dc:	48 83 c1 63          	add    $0x63,%rcx
  4012e0:	48 81 f9 00 20 00 00 	cmp    $0x2000,%rcx
  4012e7:	76 14                	jbe    4012fd <send_msg+0x5a>
  4012e9:	bf a8 28 40 00       	mov    $0x4028a8,%edi
  4012ee:	e8 5d f7 ff ff       	callq  400a50 <printf@plt>
  4012f3:	bf 08 00 00 00       	mov    $0x8,%edi
  4012f8:	e8 a3 f7 ff ff       	callq  400aa0 <exit@plt>
  4012fd:	85 f6                	test   %esi,%esi
  4012ff:	b9 d9 26 40 00       	mov    $0x4026d9,%ecx
  401304:	b8 d1 26 40 00       	mov    $0x4026d1,%eax
  401309:	48 0f 45 c8          	cmovne %rax,%rcx
  40130d:	48 8d 9c 24 00 20 00 	lea    0x2000(%rsp),%rbx
  401314:	00 
  401315:	49 89 d1             	mov    %rdx,%r9
  401318:	8b 15 62 20 20 00    	mov    0x202062(%rip),%edx        # 603380 <bomb_id>
  40131e:	be e2 26 40 00       	mov    $0x4026e2,%esi
  401323:	48 89 df             	mov    %rbx,%rdi
  401326:	b8 00 00 00 00       	mov    $0x0,%eax
  40132b:	e8 f0 f7 ff ff       	callq  400b20 <sprintf@plt>
  401330:	48 89 e1             	mov    %rsp,%rcx
  401333:	ba 00 00 00 00       	mov    $0x0,%edx
  401338:	48 89 de             	mov    %rbx,%rsi
  40133b:	bf a0 33 60 00       	mov    $0x6033a0,%edi
  401340:	e8 db 0f 00 00       	callq  402320 <driver_post>
  401345:	85 c0                	test   %eax,%eax
  401347:	79 12                	jns    40135b <send_msg+0xb8>
  401349:	48 89 e7             	mov    %rsp,%rdi
  40134c:	e8 3f f7 ff ff       	callq  400a90 <puts@plt>
  401351:	bf 00 00 00 00       	mov    $0x0,%edi
  401356:	e8 45 f7 ff ff       	callq  400aa0 <exit@plt>
  40135b:	48 81 c4 08 40 00 00 	add    $0x4008,%rsp
  401362:	5b                   	pop    %rbx
  401363:	5d                   	pop    %rbp
  401364:	c3                   	retq   

0000000000401365 <phase_defused>:
  401365:	53                   	push   %rbx
  401366:	48 83 ec 60          	sub    $0x60,%rsp
  40136a:	bf 01 00 00 00       	mov    $0x1,%edi
  40136f:	e8 2f ff ff ff       	callq  4012a3 <send_msg>
  401374:	83 3d 09 29 20 00 06 	cmpl   $0x6,0x202909(%rip)        # 603c84 <num_input_strings>
  40137b:	75 6e                	jne    4013eb <phase_defused+0x86>
  40137d:	48 8d 5c 24 10       	lea    0x10(%rsp),%rbx
  401382:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
  401387:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
  40138c:	49 89 d8             	mov    %rbx,%r8
  40138f:	be ee 26 40 00       	mov    $0x4026ee,%esi
  401394:	bf 90 3d 60 00       	mov    $0x603d90,%edi
  401399:	b8 00 00 00 00       	mov    $0x0,%eax
  40139e:	e8 9d f7 ff ff       	callq  400b40 <sscanf@plt>
  4013a3:	83 f8 03             	cmp    $0x3,%eax
  4013a6:	75 2f                	jne    4013d7 <phase_defused+0x72>
  4013a8:	be f7 26 40 00       	mov    $0x4026f7,%esi
  4013ad:	48 89 df             	mov    %rbx,%rdi
  4013b0:	e8 6a fe ff ff       	callq  40121f <strings_not_equal>
  4013b5:	85 c0                	test   %eax,%eax
  4013b7:	75 1e                	jne    4013d7 <phase_defused+0x72>
  4013b9:	bf d0 28 40 00       	mov    $0x4028d0,%edi
  4013be:	e8 cd f6 ff ff       	callq  400a90 <puts@plt>
  4013c3:	bf f8 28 40 00       	mov    $0x4028f8,%edi
  4013c8:	e8 c3 f6 ff ff       	callq  400a90 <puts@plt>
  4013cd:	b8 00 00 00 00       	mov    $0x0,%eax
  4013d2:	e8 b7 fa ff ff       	callq  400e8e <secret_phase>
  4013d7:	bf 30 29 40 00       	mov    $0x402930,%edi
  4013dc:	e8 af f6 ff ff       	callq  400a90 <puts@plt>
  4013e1:	bf 60 29 40 00       	mov    $0x402960,%edi
  4013e6:	e8 a5 f6 ff ff       	callq  400a90 <puts@plt>
  4013eb:	48 83 c4 60          	add    $0x60,%rsp
  4013ef:	5b                   	pop    %rbx
  4013f0:	c3                   	retq   

00000000004013f1 <explode_bomb>:
  4013f1:	48 83 ec 08          	sub    $0x8,%rsp
  4013f5:	bf 01 27 40 00       	mov    $0x402701,%edi
  4013fa:	e8 91 f6 ff ff       	callq  400a90 <puts@plt>
  4013ff:	bf 0a 27 40 00       	mov    $0x40270a,%edi
  401404:	e8 87 f6 ff ff       	callq  400a90 <puts@plt>
  401409:	bf 00 00 00 00       	mov    $0x0,%edi
  40140e:	e8 90 fe ff ff       	callq  4012a3 <send_msg>
  401413:	bf a8 29 40 00       	mov    $0x4029a8,%edi
  401418:	e8 73 f6 ff ff       	callq  400a90 <puts@plt>
  40141d:	bf 08 00 00 00       	mov    $0x8,%edi
  401422:	e8 79 f6 ff ff       	callq  400aa0 <exit@plt>

0000000000401427 <read_six_numbers>:
  401427:	48 83 ec 18          	sub    $0x18,%rsp
  40142b:	48 8d 4e 04          	lea    0x4(%rsi),%rcx
  40142f:	48 8d 46 14          	lea    0x14(%rsi),%rax
  401433:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  401438:	48 8d 46 10          	lea    0x10(%rsi),%rax
  40143c:	48 89 04 24          	mov    %rax,(%rsp)
  401440:	4c 8d 4e 0c          	lea    0xc(%rsi),%r9
  401444:	4c 8d 46 08          	lea    0x8(%rsi),%r8
  401448:	48 89 f2             	mov    %rsi,%rdx
  40144b:	be 21 27 40 00       	mov    $0x402721,%esi
  401450:	b8 00 00 00 00       	mov    $0x0,%eax
  401455:	e8 e6 f6 ff ff       	callq  400b40 <sscanf@plt>
  40145a:	83 f8 05             	cmp    $0x5,%eax
  40145d:	7f 05                	jg     401464 <read_six_numbers+0x3d>
  40145f:	e8 8d ff ff ff       	callq  4013f1 <explode_bomb>
  401464:	48 83 c4 18          	add    $0x18,%rsp
  401468:	c3                   	retq   

0000000000401469 <blank_line>:
  401469:	55                   	push   %rbp
  40146a:	53                   	push   %rbx
  40146b:	48 83 ec 08          	sub    $0x8,%rsp
  40146f:	48 89 fd             	mov    %rdi,%rbp
  401472:	eb 1e                	jmp    401492 <blank_line+0x29>
  401474:	e8 97 f6 ff ff       	callq  400b10 <__ctype_b_loc@plt>
  401479:	48 0f be d3          	movsbq %bl,%rdx
  40147d:	48 8b 00             	mov    (%rax),%rax
  401480:	f6 44 50 01 20       	testb  $0x20,0x1(%rax,%rdx,2)
  401485:	75 07                	jne    40148e <blank_line+0x25>
  401487:	b8 00 00 00 00       	mov    $0x0,%eax
  40148c:	eb 11                	jmp    40149f <blank_line+0x36>
  40148e:	48 83 c5 01          	add    $0x1,%rbp
  401492:	0f b6 5d 00          	movzbl 0x0(%rbp),%ebx
  401496:	84 db                	test   %bl,%bl
  401498:	75 da                	jne    401474 <blank_line+0xb>
  40149a:	b8 01 00 00 00       	mov    $0x1,%eax
  40149f:	48 83 c4 08          	add    $0x8,%rsp
  4014a3:	5b                   	pop    %rbx
  4014a4:	5d                   	pop    %rbp
  4014a5:	c3                   	retq   

00000000004014a6 <skip>:
  4014a6:	53                   	push   %rbx
  4014a7:	48 63 3d d6 27 20 00 	movslq 0x2027d6(%rip),%rdi        # 603c84 <num_input_strings>
  4014ae:	48 8d 3c bf          	lea    (%rdi,%rdi,4),%rdi
  4014b2:	48 c1 e7 04          	shl    $0x4,%rdi
  4014b6:	48 81 c7 a0 3c 60 00 	add    $0x603ca0,%rdi
  4014bd:	48 8b 15 c4 27 20 00 	mov    0x2027c4(%rip),%rdx        # 603c88 <infile>
  4014c4:	be 50 00 00 00       	mov    $0x50,%esi
  4014c9:	e8 22 f6 ff ff       	callq  400af0 <fgets@plt>
  4014ce:	48 89 c3             	mov    %rax,%rbx
  4014d1:	48 85 c0             	test   %rax,%rax
  4014d4:	74 0c                	je     4014e2 <skip+0x3c>
  4014d6:	48 89 c7             	mov    %rax,%rdi
  4014d9:	e8 8b ff ff ff       	callq  401469 <blank_line>
  4014de:	85 c0                	test   %eax,%eax
  4014e0:	75 c5                	jne    4014a7 <skip+0x1>
  4014e2:	48 89 d8             	mov    %rbx,%rax
  4014e5:	5b                   	pop    %rbx
  4014e6:	c3                   	retq   

00000000004014e7 <read_line>:
  4014e7:	53                   	push   %rbx
  4014e8:	b8 00 00 00 00       	mov    $0x0,%eax
  4014ed:	e8 b4 ff ff ff       	callq  4014a6 <skip>
  4014f2:	48 85 c0             	test   %rax,%rax
  4014f5:	75 6e                	jne    401565 <read_line+0x7e>
  4014f7:	48 8b 05 62 27 20 00 	mov    0x202762(%rip),%rax        # 603c60 <__bss_start>
  4014fe:	48 39 05 83 27 20 00 	cmp    %rax,0x202783(%rip)        # 603c88 <infile>
  401505:	75 14                	jne    40151b <read_line+0x34>
  401507:	bf 33 27 40 00       	mov    $0x402733,%edi
  40150c:	e8 7f f5 ff ff       	callq  400a90 <puts@plt>
  401511:	bf 08 00 00 00       	mov    $0x8,%edi
  401516:	e8 85 f5 ff ff       	callq  400aa0 <exit@plt>
  40151b:	bf 51 27 40 00       	mov    $0x402751,%edi
  401520:	e8 7b f6 ff ff       	callq  400ba0 <getenv@plt>
  401525:	48 85 c0             	test   %rax,%rax
  401528:	74 0a                	je     401534 <read_line+0x4d>
  40152a:	bf 00 00 00 00       	mov    $0x0,%edi
  40152f:	e8 6c f5 ff ff       	callq  400aa0 <exit@plt>
  401534:	48 8b 05 25 27 20 00 	mov    0x202725(%rip),%rax        # 603c60 <__bss_start>
  40153b:	48 89 05 46 27 20 00 	mov    %rax,0x202746(%rip)        # 603c88 <infile>
  401542:	b8 00 00 00 00       	mov    $0x0,%eax
  401547:	e8 5a ff ff ff       	callq  4014a6 <skip>
  40154c:	48 85 c0             	test   %rax,%rax
  40154f:	75 14                	jne    401565 <read_line+0x7e>
  401551:	bf 33 27 40 00       	mov    $0x402733,%edi
  401556:	e8 35 f5 ff ff       	callq  400a90 <puts@plt>
  40155b:	bf 00 00 00 00       	mov    $0x0,%edi
  401560:	e8 3b f5 ff ff       	callq  400aa0 <exit@plt>
  401565:	48 63 05 18 27 20 00 	movslq 0x202718(%rip),%rax        # 603c84 <num_input_strings>
  40156c:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  401570:	48 c1 e0 04          	shl    $0x4,%rax
  401574:	48 8d b8 a0 3c 60 00 	lea    0x603ca0(%rax),%rdi
  40157b:	fc                   	cld    
  40157c:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  401583:	b8 00 00 00 00       	mov    $0x0,%eax
  401588:	f2 ae                	repnz scas %es:(%rdi),%al
  40158a:	48 f7 d1             	not    %rcx
  40158d:	8d 59 ff             	lea    -0x1(%rcx),%ebx
  401590:	83 fb 4e             	cmp    $0x4e,%ebx
  401593:	7e 50                	jle    4015e5 <read_line+0xfe>
  401595:	bf 5c 27 40 00       	mov    $0x40275c,%edi
  40159a:	e8 f1 f4 ff ff       	callq  400a90 <puts@plt>
  40159f:	8b 05 df 26 20 00    	mov    0x2026df(%rip),%eax        # 603c84 <num_input_strings>
  4015a5:	8d 50 01             	lea    0x1(%rax),%edx
  4015a8:	89 15 d6 26 20 00    	mov    %edx,0x2026d6(%rip)        # 603c84 <num_input_strings>
  4015ae:	48 98                	cltq   
  4015b0:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  4015b4:	48 c1 e0 04          	shl    $0x4,%rax
  4015b8:	c7 80 a0 3c 60 00 2a 	movl   $0x742a2a2a,0x603ca0(%rax)
  4015bf:	2a 2a 74 
  4015c2:	c7 80 a4 3c 60 00 72 	movl   $0x636e7572,0x603ca4(%rax)
  4015c9:	75 6e 63 
  4015cc:	c7 80 a8 3c 60 00 61 	movl   $0x64657461,0x603ca8(%rax)
  4015d3:	74 65 64 
  4015d6:	c7 80 ac 3c 60 00 2a 	movl   $0x2a2a2a,0x603cac(%rax)
  4015dd:	2a 2a 00 
  4015e0:	e8 0c fe ff ff       	callq  4013f1 <explode_bomb>
  4015e5:	8b 0d 99 26 20 00    	mov    0x202699(%rip),%ecx        # 603c84 <num_input_strings>
  4015eb:	8d 53 ff             	lea    -0x1(%rbx),%edx
  4015ee:	48 63 d2             	movslq %edx,%rdx
  4015f1:	48 63 c1             	movslq %ecx,%rax
  4015f4:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  4015f8:	48 c1 e0 04          	shl    $0x4,%rax
  4015fc:	48 05 a0 3c 60 00    	add    $0x603ca0,%rax
  401602:	c6 04 10 00          	movb   $0x0,(%rax,%rdx,1)
  401606:	83 c1 01             	add    $0x1,%ecx
  401609:	89 0d 75 26 20 00    	mov    %ecx,0x202675(%rip)        # 603c84 <num_input_strings>
  40160f:	5b                   	pop    %rbx
  401610:	c3                   	retq   

0000000000401611 <initialize_bomb>:
  401611:	55                   	push   %rbp
  401612:	53                   	push   %rbx
  401613:	48 81 ec 48 20 00 00 	sub    $0x2048,%rsp
  40161a:	be d3 16 40 00       	mov    $0x4016d3,%esi
  40161f:	bf 02 00 00 00       	mov    $0x2,%edi
  401624:	e8 57 f5 ff ff       	callq  400b80 <signal@plt>
  401629:	48 8d bc 24 00 20 00 	lea    0x2000(%rsp),%rdi
  401630:	00 
  401631:	be 40 00 00 00       	mov    $0x40,%esi
  401636:	e8 35 f5 ff ff       	callq  400b70 <gethostname@plt>
  40163b:	85 c0                	test   %eax,%eax
  40163d:	75 1b                	jne    40165a <initialize_bomb+0x49>
  40163f:	48 8b 3d 9a 23 20 00 	mov    0x20239a(%rip),%rdi        # 6039e0 <host_table>
  401646:	bb 00 00 00 00       	mov    $0x0,%ebx
  40164b:	48 8d ac 24 00 20 00 	lea    0x2000(%rsp),%rbp
  401652:	00 
  401653:	48 85 ff             	test   %rdi,%rdi
  401656:	75 16                	jne    40166e <initialize_bomb+0x5d>
  401658:	eb 5b                	jmp    4016b5 <initialize_bomb+0xa4>
  40165a:	bf d0 29 40 00       	mov    $0x4029d0,%edi
  40165f:	e8 2c f4 ff ff       	callq  400a90 <puts@plt>
  401664:	bf 08 00 00 00       	mov    $0x8,%edi
  401669:	e8 32 f4 ff ff       	callq  400aa0 <exit@plt>
  40166e:	48 89 ee             	mov    %rbp,%rsi
  401671:	e8 3a f4 ff ff       	callq  400ab0 <strcasecmp@plt>
  401676:	85 c0                	test   %eax,%eax
  401678:	74 13                	je     40168d <initialize_bomb+0x7c>
  40167a:	48 8b 3c dd e8 39 60 	mov    0x6039e8(,%rbx,8),%rdi
  401681:	00 
  401682:	48 83 c3 01          	add    $0x1,%rbx
  401686:	48 85 ff             	test   %rdi,%rdi
  401689:	74 2a                	je     4016b5 <initialize_bomb+0xa4>
  40168b:	eb e1                	jmp    40166e <initialize_bomb+0x5d>
  40168d:	48 89 e7             	mov    %rsp,%rdi
  401690:	e8 9b 00 00 00       	callq  401730 <init_driver>
  401695:	85 c0                	test   %eax,%eax
  401697:	79 30                	jns    4016c9 <initialize_bomb+0xb8>
  401699:	48 89 e6             	mov    %rsp,%rsi
  40169c:	bf 77 27 40 00       	mov    $0x402777,%edi
  4016a1:	b8 00 00 00 00       	mov    $0x0,%eax
  4016a6:	e8 a5 f3 ff ff       	callq  400a50 <printf@plt>
  4016ab:	bf 08 00 00 00       	mov    $0x8,%edi
  4016b0:	e8 eb f3 ff ff       	callq  400aa0 <exit@plt>
  4016b5:	bf 08 2a 40 00       	mov    $0x402a08,%edi
  4016ba:	e8 d1 f3 ff ff       	callq  400a90 <puts@plt>
  4016bf:	bf 08 00 00 00       	mov    $0x8,%edi
  4016c4:	e8 d7 f3 ff ff       	callq  400aa0 <exit@plt>
  4016c9:	48 81 c4 48 20 00 00 	add    $0x2048,%rsp
  4016d0:	5b                   	pop    %rbx
  4016d1:	5d                   	pop    %rbp
  4016d2:	c3                   	retq   

00000000004016d3 <sig_handler>:
  4016d3:	48 83 ec 08          	sub    $0x8,%rsp
  4016d7:	bf 40 2a 40 00       	mov    $0x402a40,%edi
  4016dc:	e8 af f3 ff ff       	callq  400a90 <puts@plt>
  4016e1:	bf 03 00 00 00       	mov    $0x3,%edi
  4016e6:	e8 65 f4 ff ff       	callq  400b50 <sleep@plt>
  4016eb:	bf 91 27 40 00       	mov    $0x402791,%edi
  4016f0:	b8 00 00 00 00       	mov    $0x0,%eax
  4016f5:	e8 56 f3 ff ff       	callq  400a50 <printf@plt>
  4016fa:	48 8b 3d 6f 25 20 00 	mov    0x20256f(%rip),%rdi        # 603c70 <stdout@@GLIBC_2.2.5>
  401701:	e8 fa f4 ff ff       	callq  400c00 <fflush@plt>
  401706:	bf 01 00 00 00       	mov    $0x1,%edi
  40170b:	e8 40 f4 ff ff       	callq  400b50 <sleep@plt>
  401710:	bf 99 27 40 00       	mov    $0x402799,%edi
  401715:	e8 76 f3 ff ff       	callq  400a90 <puts@plt>
  40171a:	bf 10 00 00 00       	mov    $0x10,%edi
  40171f:	e8 7c f3 ff ff       	callq  400aa0 <exit@plt>
  401724:	90                   	nop
  401725:	90                   	nop
  401726:	90                   	nop
  401727:	90                   	nop
  401728:	90                   	nop
  401729:	90                   	nop
  40172a:	90                   	nop
  40172b:	90                   	nop
  40172c:	90                   	nop
  40172d:	90                   	nop
  40172e:	90                   	nop
  40172f:	90                   	nop

0000000000401730 <init_driver>:
  401730:	41 54                	push   %r12
  401732:	55                   	push   %rbp
  401733:	53                   	push   %rbx
  401734:	48 83 ec 10          	sub    $0x10,%rsp
  401738:	48 89 fd             	mov    %rdi,%rbp
  40173b:	be 01 00 00 00       	mov    $0x1,%esi
  401740:	bf 0d 00 00 00       	mov    $0xd,%edi
  401745:	e8 36 f4 ff ff       	callq  400b80 <signal@plt>
  40174a:	be 01 00 00 00       	mov    $0x1,%esi
  40174f:	bf 1d 00 00 00       	mov    $0x1d,%edi
  401754:	e8 27 f4 ff ff       	callq  400b80 <signal@plt>
  401759:	be 01 00 00 00       	mov    $0x1,%esi
  40175e:	bf 1d 00 00 00       	mov    $0x1d,%edi
  401763:	e8 18 f4 ff ff       	callq  400b80 <signal@plt>
  401768:	ba 00 00 00 00       	mov    $0x0,%edx
  40176d:	be 01 00 00 00       	mov    $0x1,%esi
  401772:	bf 02 00 00 00       	mov    $0x2,%edi
  401777:	e8 14 f4 ff ff       	callq  400b90 <socket@plt>
  40177c:	41 89 c4             	mov    %eax,%r12d
  40177f:	85 c0                	test   %eax,%eax
  401781:	79 4f                	jns    4017d2 <init_driver+0xa2>
  401783:	c7 45 00 45 72 72 6f 	movl   $0x6f727245,0x0(%rbp)
  40178a:	c7 45 04 72 3a 20 43 	movl   $0x43203a72,0x4(%rbp)
  401791:	c7 45 08 6c 69 65 6e 	movl   $0x6e65696c,0x8(%rbp)
  401798:	c7 45 0c 74 20 75 6e 	movl   $0x6e752074,0xc(%rbp)
  40179f:	c7 45 10 61 62 6c 65 	movl   $0x656c6261,0x10(%rbp)
  4017a6:	c7 45 14 20 74 6f 20 	movl   $0x206f7420,0x14(%rbp)
  4017ad:	c7 45 18 63 72 65 61 	movl   $0x61657263,0x18(%rbp)
  4017b4:	c7 45 1c 74 65 20 73 	movl   $0x73206574,0x1c(%rbp)
  4017bb:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  4017c2:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  4017c8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4017cd:	e9 27 01 00 00       	jmpq   4018f9 <init_driver+0x1c9>
  4017d2:	bf 98 2a 40 00       	mov    $0x402a98,%edi
  4017d7:	e8 a4 f2 ff ff       	callq  400a80 <gethostbyname@plt>
  4017dc:	48 85 c0             	test   %rax,%rax
  4017df:	75 69                	jne    40184a <init_driver+0x11a>
  4017e1:	c7 45 00 45 72 72 6f 	movl   $0x6f727245,0x0(%rbp)
  4017e8:	c7 45 04 72 3a 20 44 	movl   $0x44203a72,0x4(%rbp)
  4017ef:	c7 45 08 4e 53 20 69 	movl   $0x6920534e,0x8(%rbp)
  4017f6:	c7 45 0c 73 20 75 6e 	movl   $0x6e752073,0xc(%rbp)
  4017fd:	c7 45 10 61 62 6c 65 	movl   $0x656c6261,0x10(%rbp)
  401804:	c7 45 14 20 74 6f 20 	movl   $0x206f7420,0x14(%rbp)
  40180b:	c7 45 18 72 65 73 6f 	movl   $0x6f736572,0x18(%rbp)
  401812:	c7 45 1c 6c 76 65 20 	movl   $0x2065766c,0x1c(%rbp)
  401819:	c7 45 20 73 65 72 76 	movl   $0x76726573,0x20(%rbp)
  401820:	c7 45 24 65 72 20 61 	movl   $0x61207265,0x24(%rbp)
  401827:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  40182e:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  401834:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  401838:	44 89 e7             	mov    %r12d,%edi
  40183b:	e8 30 f2 ff ff       	callq  400a70 <close@plt>
  401840:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401845:	e9 af 00 00 00       	jmpq   4018f9 <init_driver+0x1c9>
  40184a:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  401851:	00 
  401852:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  401859:	00 00 
  40185b:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  401861:	48 8d 74 24 04       	lea    0x4(%rsp),%rsi
  401866:	48 63 50 14          	movslq 0x14(%rax),%rdx
  40186a:	48 8b 40 18          	mov    0x18(%rax),%rax
  40186e:	48 8b 38             	mov    (%rax),%rdi
  401871:	e8 8a f2 ff ff       	callq  400b00 <bcopy@plt>
  401876:	66 c7 44 24 02 00 50 	movw   $0x5000,0x2(%rsp)
  40187d:	ba 10 00 00 00       	mov    $0x10,%edx
  401882:	48 89 e6             	mov    %rsp,%rsi
  401885:	44 89 e7             	mov    %r12d,%edi
  401888:	e8 d3 f2 ff ff       	callq  400b60 <connect@plt>
  40188d:	85 c0                	test   %eax,%eax
  40188f:	79 51                	jns    4018e2 <init_driver+0x1b2>
  401891:	c7 45 00 45 72 72 6f 	movl   $0x6f727245,0x0(%rbp)
  401898:	c7 45 04 72 3a 20 55 	movl   $0x55203a72,0x4(%rbp)
  40189f:	c7 45 08 6e 61 62 6c 	movl   $0x6c62616e,0x8(%rbp)
  4018a6:	c7 45 0c 65 20 74 6f 	movl   $0x6f742065,0xc(%rbp)
  4018ad:	c7 45 10 20 63 6f 6e 	movl   $0x6e6f6320,0x10(%rbp)
  4018b4:	c7 45 14 6e 65 63 74 	movl   $0x7463656e,0x14(%rbp)
  4018bb:	c7 45 18 20 74 6f 20 	movl   $0x206f7420,0x18(%rbp)
  4018c2:	c7 45 1c 73 65 72 76 	movl   $0x76726573,0x1c(%rbp)
  4018c9:	66 c7 45 20 65 72    	movw   $0x7265,0x20(%rbp)
  4018cf:	c6 45 22 00          	movb   $0x0,0x22(%rbp)
  4018d3:	44 89 e7             	mov    %r12d,%edi
  4018d6:	e8 95 f1 ff ff       	callq  400a70 <close@plt>
  4018db:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4018e0:	eb 17                	jmp    4018f9 <init_driver+0x1c9>
  4018e2:	44 89 e7             	mov    %r12d,%edi
  4018e5:	e8 86 f1 ff ff       	callq  400a70 <close@plt>
  4018ea:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  4018f0:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  4018f4:	b8 00 00 00 00       	mov    $0x0,%eax
  4018f9:	48 83 c4 10          	add    $0x10,%rsp
  4018fd:	5b                   	pop    %rbx
  4018fe:	5d                   	pop    %rbp
  4018ff:	41 5c                	pop    %r12
  401901:	c3                   	retq   

0000000000401902 <init_timeout>:
  401902:	53                   	push   %rbx
  401903:	89 fb                	mov    %edi,%ebx
  401905:	85 ff                	test   %edi,%edi
  401907:	74 1e                	je     401927 <init_timeout+0x25>
  401909:	be 98 23 40 00       	mov    $0x402398,%esi
  40190e:	bf 0e 00 00 00       	mov    $0xe,%edi
  401913:	e8 68 f2 ff ff       	callq  400b80 <signal@plt>
  401918:	85 db                	test   %ebx,%ebx
  40191a:	bf 00 00 00 00       	mov    $0x0,%edi
  40191f:	0f 49 fb             	cmovns %ebx,%edi
  401922:	e8 89 f2 ff ff       	callq  400bb0 <alarm@plt>
  401927:	5b                   	pop    %rbx
  401928:	c3                   	retq   

0000000000401929 <rio_readlineb>:
  401929:	41 57                	push   %r15
  40192b:	41 56                	push   %r14
  40192d:	41 55                	push   %r13
  40192f:	41 54                	push   %r12
  401931:	55                   	push   %rbp
  401932:	53                   	push   %rbx
  401933:	48 83 ec 18          	sub    $0x18,%rsp
  401937:	48 89 fb             	mov    %rdi,%rbx
  40193a:	49 89 d7             	mov    %rdx,%r15
  40193d:	49 89 f5             	mov    %rsi,%r13
  401940:	49 89 f6             	mov    %rsi,%r14
  401943:	41 bc 01 00 00 00    	mov    $0x1,%r12d
  401949:	48 83 fa 01          	cmp    $0x1,%rdx
  40194d:	77 3b                	ja     40198a <rio_readlineb+0x61>
  40194f:	e9 7e 00 00 00       	jmpq   4019d2 <rio_readlineb+0xa9>
  401954:	48 8d 6b 10          	lea    0x10(%rbx),%rbp
  401958:	ba 00 20 00 00       	mov    $0x2000,%edx
  40195d:	48 89 ee             	mov    %rbp,%rsi
  401960:	8b 3b                	mov    (%rbx),%edi
  401962:	e8 59 f1 ff ff       	callq  400ac0 <read@plt>
  401967:	89 43 04             	mov    %eax,0x4(%rbx)
  40196a:	85 c0                	test   %eax,%eax
  40196c:	79 14                	jns    401982 <rio_readlineb+0x59>
  40196e:	e8 4d f2 ff ff       	callq  400bc0 <__errno_location@plt>
  401973:	83 38 04             	cmpl   $0x4,(%rax)
  401976:	74 12                	je     40198a <rio_readlineb+0x61>
  401978:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  40197f:	90                   	nop
  401980:	eb 67                	jmp    4019e9 <rio_readlineb+0xc0>
  401982:	85 c0                	test   %eax,%eax
  401984:	74 5e                	je     4019e4 <rio_readlineb+0xbb>
  401986:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
  40198a:	83 7b 04 00          	cmpl   $0x0,0x4(%rbx)
  40198e:	66 90                	xchg   %ax,%ax
  401990:	7e c2                	jle    401954 <rio_readlineb+0x2b>
  401992:	48 8b 43 08          	mov    0x8(%rbx),%rax
  401996:	0f b6 00             	movzbl (%rax),%eax
  401999:	88 44 24 17          	mov    %al,0x17(%rsp)
  40199d:	48 83 43 08 01       	addq   $0x1,0x8(%rbx)
  4019a2:	83 6b 04 01          	subl   $0x1,0x4(%rbx)
  4019a6:	43 88 44 2c ff       	mov    %al,-0x1(%r12,%r13,1)
  4019ab:	49 83 c6 01          	add    $0x1,%r14
  4019af:	80 7c 24 17 0a       	cmpb   $0xa,0x17(%rsp)
  4019b4:	75 0f                	jne    4019c5 <rio_readlineb+0x9c>
  4019b6:	eb 23                	jmp    4019db <rio_readlineb+0xb2>
  4019b8:	b8 00 00 00 00       	mov    $0x0,%eax
  4019bd:	49 83 fc 01          	cmp    $0x1,%r12
  4019c1:	74 31                	je     4019f4 <rio_readlineb+0xcb>
  4019c3:	eb 16                	jmp    4019db <rio_readlineb+0xb2>
  4019c5:	49 83 c4 01          	add    $0x1,%r12
  4019c9:	4d 39 fc             	cmp    %r15,%r12
  4019cc:	75 bc                	jne    40198a <rio_readlineb+0x61>
  4019ce:	66 90                	xchg   %ax,%ax
  4019d0:	eb 09                	jmp    4019db <rio_readlineb+0xb2>
  4019d2:	49 89 f6             	mov    %rsi,%r14
  4019d5:	41 bc 01 00 00 00    	mov    $0x1,%r12d
  4019db:	41 c6 06 00          	movb   $0x0,(%r14)
  4019df:	4c 89 e0             	mov    %r12,%rax
  4019e2:	eb 10                	jmp    4019f4 <rio_readlineb+0xcb>
  4019e4:	b8 00 00 00 00       	mov    $0x0,%eax
  4019e9:	85 c0                	test   %eax,%eax
  4019eb:	74 cb                	je     4019b8 <rio_readlineb+0x8f>
  4019ed:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  4019f4:	48 83 c4 18          	add    $0x18,%rsp
  4019f8:	5b                   	pop    %rbx
  4019f9:	5d                   	pop    %rbp
  4019fa:	41 5c                	pop    %r12
  4019fc:	41 5d                	pop    %r13
  4019fe:	41 5e                	pop    %r14
  401a00:	41 5f                	pop    %r15
  401a02:	c3                   	retq   

0000000000401a03 <submitr>:
  401a03:	41 57                	push   %r15
  401a05:	41 56                	push   %r14
  401a07:	41 55                	push   %r13
  401a09:	41 54                	push   %r12
  401a0b:	55                   	push   %rbp
  401a0c:	53                   	push   %rbx
  401a0d:	48 81 ec 78 a0 00 00 	sub    $0xa078,%rsp
  401a14:	48 89 7c 24 28       	mov    %rdi,0x28(%rsp)
  401a19:	89 f5                	mov    %esi,%ebp
  401a1b:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
  401a20:	48 89 4c 24 18       	mov    %rcx,0x18(%rsp)
  401a25:	4c 89 44 24 10       	mov    %r8,0x10(%rsp)
  401a2a:	4d 89 cf             	mov    %r9,%r15
  401a2d:	4c 8b b4 24 b0 a0 00 	mov    0xa0b0(%rsp),%r14
  401a34:	00 
  401a35:	c7 84 24 4c 20 00 00 	movl   $0x0,0x204c(%rsp)
  401a3c:	00 00 00 00 
  401a40:	ba 00 00 00 00       	mov    $0x0,%edx
  401a45:	be 01 00 00 00       	mov    $0x1,%esi
  401a4a:	bf 02 00 00 00       	mov    $0x2,%edi
  401a4f:	e8 3c f1 ff ff       	callq  400b90 <socket@plt>
  401a54:	41 89 c5             	mov    %eax,%r13d
  401a57:	85 c0                	test   %eax,%eax
  401a59:	79 58                	jns    401ab3 <submitr+0xb0>
  401a5b:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  401a62:	41 c7 46 04 72 3a 20 	movl   $0x43203a72,0x4(%r14)
  401a69:	43 
  401a6a:	41 c7 46 08 6c 69 65 	movl   $0x6e65696c,0x8(%r14)
  401a71:	6e 
  401a72:	41 c7 46 0c 74 20 75 	movl   $0x6e752074,0xc(%r14)
  401a79:	6e 
  401a7a:	41 c7 46 10 61 62 6c 	movl   $0x656c6261,0x10(%r14)
  401a81:	65 
  401a82:	41 c7 46 14 20 74 6f 	movl   $0x206f7420,0x14(%r14)
  401a89:	20 
  401a8a:	41 c7 46 18 63 72 65 	movl   $0x61657263,0x18(%r14)
  401a91:	61 
  401a92:	41 c7 46 1c 74 65 20 	movl   $0x73206574,0x1c(%r14)
  401a99:	73 
  401a9a:	41 c7 46 20 6f 63 6b 	movl   $0x656b636f,0x20(%r14)
  401aa1:	65 
  401aa2:	66 41 c7 46 24 74 00 	movw   $0x74,0x24(%r14)
  401aa9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401aae:	e9 5b 08 00 00       	jmpq   40230e <submitr+0x90b>
  401ab3:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
  401ab8:	e8 c3 ef ff ff       	callq  400a80 <gethostbyname@plt>
  401abd:	48 85 c0             	test   %rax,%rax
  401ac0:	0f 85 85 00 00 00    	jne    401b4b <submitr+0x148>
  401ac6:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  401acd:	41 c7 46 04 72 3a 20 	movl   $0x44203a72,0x4(%r14)
  401ad4:	44 
  401ad5:	41 c7 46 08 4e 53 20 	movl   $0x6920534e,0x8(%r14)
  401adc:	69 
  401add:	41 c7 46 0c 73 20 75 	movl   $0x6e752073,0xc(%r14)
  401ae4:	6e 
  401ae5:	41 c7 46 10 61 62 6c 	movl   $0x656c6261,0x10(%r14)
  401aec:	65 
  401aed:	41 c7 46 14 20 74 6f 	movl   $0x206f7420,0x14(%r14)
  401af4:	20 
  401af5:	41 c7 46 18 72 65 73 	movl   $0x6f736572,0x18(%r14)
  401afc:	6f 
  401afd:	41 c7 46 1c 6c 76 65 	movl   $0x2065766c,0x1c(%r14)
  401b04:	20 
  401b05:	41 c7 46 20 41 75 74 	movl   $0x6f747541,0x20(%r14)
  401b0c:	6f 
  401b0d:	41 c7 46 24 6c 61 62 	movl   $0x2062616c,0x24(%r14)
  401b14:	20 
  401b15:	41 c7 46 28 73 65 72 	movl   $0x76726573,0x28(%r14)
  401b1c:	76 
  401b1d:	41 c7 46 2c 65 72 20 	movl   $0x61207265,0x2c(%r14)
  401b24:	61 
  401b25:	41 c7 46 30 64 64 72 	movl   $0x65726464,0x30(%r14)
  401b2c:	65 
  401b2d:	66 41 c7 46 34 73 73 	movw   $0x7373,0x34(%r14)
  401b34:	41 c6 46 36 00       	movb   $0x0,0x36(%r14)
  401b39:	44 89 ef             	mov    %r13d,%edi
  401b3c:	e8 2f ef ff ff       	callq  400a70 <close@plt>
  401b41:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401b46:	e9 c3 07 00 00       	jmpq   40230e <submitr+0x90b>
  401b4b:	48 8d 9c 24 60 a0 00 	lea    0xa060(%rsp),%rbx
  401b52:	00 
  401b53:	48 c7 84 24 60 a0 00 	movq   $0x0,0xa060(%rsp)
  401b5a:	00 00 00 00 00 
  401b5f:	48 c7 84 24 68 a0 00 	movq   $0x0,0xa068(%rsp)
  401b66:	00 00 00 00 00 
  401b6b:	66 c7 84 24 60 a0 00 	movw   $0x2,0xa060(%rsp)
  401b72:	00 02 00 
  401b75:	48 8d 73 04          	lea    0x4(%rbx),%rsi
  401b79:	48 63 50 14          	movslq 0x14(%rax),%rdx
  401b7d:	48 8b 40 18          	mov    0x18(%rax),%rax
  401b81:	48 8b 38             	mov    (%rax),%rdi
  401b84:	e8 77 ef ff ff       	callq  400b00 <bcopy@plt>
  401b89:	89 e8                	mov    %ebp,%eax
  401b8b:	66 c1 c8 08          	ror    $0x8,%ax
  401b8f:	66 89 84 24 62 a0 00 	mov    %ax,0xa062(%rsp)
  401b96:	00 
  401b97:	ba 10 00 00 00       	mov    $0x10,%edx
  401b9c:	48 89 de             	mov    %rbx,%rsi
  401b9f:	44 89 ef             	mov    %r13d,%edi
  401ba2:	e8 b9 ef ff ff       	callq  400b60 <connect@plt>
  401ba7:	85 c0                	test   %eax,%eax
  401ba9:	79 75                	jns    401c20 <submitr+0x21d>
  401bab:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  401bb2:	41 c7 46 04 72 3a 20 	movl   $0x55203a72,0x4(%r14)
  401bb9:	55 
  401bba:	41 c7 46 08 6e 61 62 	movl   $0x6c62616e,0x8(%r14)
  401bc1:	6c 
  401bc2:	41 c7 46 0c 65 20 74 	movl   $0x6f742065,0xc(%r14)
  401bc9:	6f 
  401bca:	41 c7 46 10 20 63 6f 	movl   $0x6e6f6320,0x10(%r14)
  401bd1:	6e 
  401bd2:	41 c7 46 14 6e 65 63 	movl   $0x7463656e,0x14(%r14)
  401bd9:	74 
  401bda:	41 c7 46 18 20 74 6f 	movl   $0x206f7420,0x18(%r14)
  401be1:	20 
  401be2:	41 c7 46 1c 74 68 65 	movl   $0x20656874,0x1c(%r14)
  401be9:	20 
  401bea:	41 c7 46 20 41 75 74 	movl   $0x6f747541,0x20(%r14)
  401bf1:	6f 
  401bf2:	41 c7 46 24 6c 61 62 	movl   $0x2062616c,0x24(%r14)
  401bf9:	20 
  401bfa:	41 c7 46 28 73 65 72 	movl   $0x76726573,0x28(%r14)
  401c01:	76 
  401c02:	66 41 c7 46 2c 65 72 	movw   $0x7265,0x2c(%r14)
  401c09:	41 c6 46 2e 00       	movb   $0x0,0x2e(%r14)
  401c0e:	44 89 ef             	mov    %r13d,%edi
  401c11:	e8 5a ee ff ff       	callq  400a70 <close@plt>
  401c16:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401c1b:	e9 ee 06 00 00       	jmpq   40230e <submitr+0x90b>
  401c20:	48 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%rbx
  401c27:	4c 89 ff             	mov    %r15,%rdi
  401c2a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401c30:	fc                   	cld    
  401c31:	48 89 d9             	mov    %rbx,%rcx
  401c34:	44 89 c0             	mov    %r8d,%eax
  401c37:	f2 ae                	repnz scas %es:(%rdi),%al
  401c39:	48 89 ce             	mov    %rcx,%rsi
  401c3c:	48 f7 d6             	not    %rsi
  401c3f:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
  401c44:	48 89 d9             	mov    %rbx,%rcx
  401c47:	f2 ae                	repnz scas %es:(%rdi),%al
  401c49:	48 89 ca             	mov    %rcx,%rdx
  401c4c:	48 f7 d2             	not    %rdx
  401c4f:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
  401c54:	48 89 d9             	mov    %rbx,%rcx
  401c57:	f2 ae                	repnz scas %es:(%rdi),%al
  401c59:	49 89 c9             	mov    %rcx,%r9
  401c5c:	49 f7 d1             	not    %r9
  401c5f:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
  401c64:	48 89 d9             	mov    %rbx,%rcx
  401c67:	f2 ae                	repnz scas %es:(%rdi),%al
  401c69:	48 f7 d1             	not    %rcx
  401c6c:	49 8d 44 11 7e       	lea    0x7e(%r9,%rdx,1),%rax
  401c71:	48 8d 4c 01 ff       	lea    -0x1(%rcx,%rax,1),%rcx
  401c76:	48 8d 44 76 fd       	lea    -0x3(%rsi,%rsi,2),%rax
  401c7b:	48 01 c1             	add    %rax,%rcx
  401c7e:	48 81 f9 00 20 00 00 	cmp    $0x2000,%rcx
  401c85:	76 7e                	jbe    401d05 <submitr+0x302>
  401c87:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  401c8e:	41 c7 46 04 72 3a 20 	movl   $0x52203a72,0x4(%r14)
  401c95:	52 
  401c96:	41 c7 46 08 65 73 75 	movl   $0x6c757365,0x8(%r14)
  401c9d:	6c 
  401c9e:	41 c7 46 0c 74 20 73 	movl   $0x74732074,0xc(%r14)
  401ca5:	74 
  401ca6:	41 c7 46 10 72 69 6e 	movl   $0x676e6972,0x10(%r14)
  401cad:	67 
  401cae:	41 c7 46 14 20 74 6f 	movl   $0x6f6f7420,0x14(%r14)
  401cb5:	6f 
  401cb6:	41 c7 46 18 20 6c 61 	movl   $0x72616c20,0x18(%r14)
  401cbd:	72 
  401cbe:	41 c7 46 1c 67 65 2e 	movl   $0x202e6567,0x1c(%r14)
  401cc5:	20 
  401cc6:	41 c7 46 20 49 6e 63 	movl   $0x72636e49,0x20(%r14)
  401ccd:	72 
  401cce:	41 c7 46 24 65 61 73 	movl   $0x65736165,0x24(%r14)
  401cd5:	65 
  401cd6:	41 c7 46 28 20 53 55 	movl   $0x42555320,0x28(%r14)
  401cdd:	42 
  401cde:	41 c7 46 2c 4d 49 54 	movl   $0x5254494d,0x2c(%r14)
  401ce5:	52 
  401ce6:	41 c7 46 30 5f 4d 41 	movl   $0x58414d5f,0x30(%r14)
  401ced:	58 
  401cee:	41 c7 46 34 42 55 46 	movl   $0x465542,0x34(%r14)
  401cf5:	00 
  401cf6:	44 89 ef             	mov    %r13d,%edi
  401cf9:	e8 72 ed ff ff       	callq  400a70 <close@plt>
  401cfe:	89 d8                	mov    %ebx,%eax
  401d00:	e9 09 06 00 00       	jmpq   40230e <submitr+0x90b>
  401d05:	4c 8d a4 24 50 40 00 	lea    0x4050(%rsp),%r12
  401d0c:	00 
  401d0d:	ba 00 20 00 00       	mov    $0x2000,%edx
  401d12:	be 00 00 00 00       	mov    $0x0,%esi
  401d17:	4c 89 e7             	mov    %r12,%rdi
  401d1a:	e8 41 ed ff ff       	callq  400a60 <memset@plt>
  401d1f:	4c 89 fd             	mov    %r15,%rbp
  401d22:	4c 89 ff             	mov    %r15,%rdi
  401d25:	fc                   	cld    
  401d26:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  401d2d:	b8 00 00 00 00       	mov    $0x0,%eax
  401d32:	f2 ae                	repnz scas %es:(%rdi),%al
  401d34:	48 f7 d1             	not    %rcx
  401d37:	8d 59 fe             	lea    -0x2(%rcx),%ebx
  401d3a:	83 fb ff             	cmp    $0xffffffffffffffff,%ebx
  401d3d:	0f 84 e6 04 00 00    	je     402229 <submitr+0x826>
  401d43:	4c 8d 7c 24 30       	lea    0x30(%rsp),%r15
  401d48:	0f b6 55 00          	movzbl 0x0(%rbp),%edx
  401d4c:	80 fa 2a             	cmp    $0x2a,%dl
  401d4f:	74 26                	je     401d77 <submitr+0x374>
  401d51:	80 fa 2d             	cmp    $0x2d,%dl
  401d54:	74 21                	je     401d77 <submitr+0x374>
  401d56:	80 fa 2e             	cmp    $0x2e,%dl
  401d59:	74 1c                	je     401d77 <submitr+0x374>
  401d5b:	80 fa 5f             	cmp    $0x5f,%dl
  401d5e:	66 90                	xchg   %ax,%ax
  401d60:	74 15                	je     401d77 <submitr+0x374>
  401d62:	8d 42 d0             	lea    -0x30(%rdx),%eax
  401d65:	3c 09                	cmp    $0x9,%al
  401d67:	76 0e                	jbe    401d77 <submitr+0x374>
  401d69:	8d 42 bf             	lea    -0x41(%rdx),%eax
  401d6c:	3c 19                	cmp    $0x19,%al
  401d6e:	76 07                	jbe    401d77 <submitr+0x374>
  401d70:	8d 42 9f             	lea    -0x61(%rdx),%eax
  401d73:	3c 19                	cmp    $0x19,%al
  401d75:	77 0a                	ja     401d81 <submitr+0x37e>
  401d77:	41 88 14 24          	mov    %dl,(%r12)
  401d7b:	49 83 c4 01          	add    $0x1,%r12
  401d7f:	eb 52                	jmp    401dd3 <submitr+0x3d0>
  401d81:	80 fa 20             	cmp    $0x20,%dl
  401d84:	75 0b                	jne    401d91 <submitr+0x38e>
  401d86:	41 c6 04 24 2b       	movb   $0x2b,(%r12)
  401d8b:	49 83 c4 01          	add    $0x1,%r12
  401d8f:	eb 42                	jmp    401dd3 <submitr+0x3d0>
  401d91:	8d 42 e0             	lea    -0x20(%rdx),%eax
  401d94:	3c 5f                	cmp    $0x5f,%al
  401d96:	76 05                	jbe    401d9d <submitr+0x39a>
  401d98:	80 fa 09             	cmp    $0x9,%dl
  401d9b:	75 4b                	jne    401de8 <submitr+0x3e5>
  401d9d:	0f b6 d2             	movzbl %dl,%edx
  401da0:	be 70 2b 40 00       	mov    $0x402b70,%esi
  401da5:	4c 89 ff             	mov    %r15,%rdi
  401da8:	b8 00 00 00 00       	mov    $0x0,%eax
  401dad:	e8 6e ed ff ff       	callq  400b20 <sprintf@plt>
  401db2:	0f b6 44 24 30       	movzbl 0x30(%rsp),%eax
  401db7:	41 88 04 24          	mov    %al,(%r12)
  401dbb:	0f b6 44 24 31       	movzbl 0x31(%rsp),%eax
  401dc0:	41 88 44 24 01       	mov    %al,0x1(%r12)
  401dc5:	0f b6 44 24 32       	movzbl 0x32(%rsp),%eax
  401dca:	41 88 44 24 02       	mov    %al,0x2(%r12)
  401dcf:	49 83 c4 03          	add    $0x3,%r12
  401dd3:	83 eb 01             	sub    $0x1,%ebx
  401dd6:	83 fb ff             	cmp    $0xffffffffffffffff,%ebx
  401dd9:	0f 84 4a 04 00 00    	je     402229 <submitr+0x826>
  401ddf:	48 83 c5 01          	add    $0x1,%rbp
  401de3:	e9 60 ff ff ff       	jmpq   401d48 <submitr+0x345>
  401de8:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  401def:	41 c7 46 04 72 3a 20 	movl   $0x52203a72,0x4(%r14)
  401df6:	52 
  401df7:	41 c7 46 08 65 73 75 	movl   $0x6c757365,0x8(%r14)
  401dfe:	6c 
  401dff:	41 c7 46 0c 74 20 73 	movl   $0x74732074,0xc(%r14)
  401e06:	74 
  401e07:	41 c7 46 10 72 69 6e 	movl   $0x676e6972,0x10(%r14)
  401e0e:	67 
  401e0f:	41 c7 46 14 20 63 6f 	movl   $0x6e6f6320,0x14(%r14)
  401e16:	6e 
  401e17:	41 c7 46 18 74 61 69 	movl   $0x6e696174,0x18(%r14)
  401e1e:	6e 
  401e1f:	41 c7 46 1c 73 20 61 	movl   $0x6e612073,0x1c(%r14)
  401e26:	6e 
  401e27:	41 c7 46 20 20 69 6c 	movl   $0x6c6c6920,0x20(%r14)
  401e2e:	6c 
  401e2f:	41 c7 46 24 65 67 61 	movl   $0x6c616765,0x24(%r14)
  401e36:	6c 
  401e37:	41 c7 46 28 20 6f 72 	movl   $0x20726f20,0x28(%r14)
  401e3e:	20 
  401e3f:	41 c7 46 2c 75 6e 70 	movl   $0x72706e75,0x2c(%r14)
  401e46:	72 
  401e47:	41 c7 46 30 69 6e 74 	movl   $0x61746e69,0x30(%r14)
  401e4e:	61 
  401e4f:	41 c7 46 34 62 6c 65 	movl   $0x20656c62,0x34(%r14)
  401e56:	20 
  401e57:	41 c7 46 38 63 68 61 	movl   $0x72616863,0x38(%r14)
  401e5e:	72 
  401e5f:	41 c7 46 3c 61 63 74 	movl   $0x65746361,0x3c(%r14)
  401e66:	65 
  401e67:	66 41 c7 46 40 72 2e 	movw   $0x2e72,0x40(%r14)
  401e6e:	41 c6 46 42 00       	movb   $0x0,0x42(%r14)
  401e73:	44 89 ef             	mov    %r13d,%edi
  401e76:	e8 f5 eb ff ff       	callq  400a70 <close@plt>
  401e7b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401e80:	e9 89 04 00 00       	jmpq   40230e <submitr+0x90b>
  401e85:	48 01 c5             	add    %rax,%rbp
  401e88:	48 89 da             	mov    %rbx,%rdx
  401e8b:	48 89 ee             	mov    %rbp,%rsi
  401e8e:	44 89 ef             	mov    %r13d,%edi
  401e91:	e8 5a ed ff ff       	callq  400bf0 <write@plt>
  401e96:	48 85 c0             	test   %rax,%rax
  401e99:	7f 0f                	jg     401eaa <submitr+0x4a7>
  401e9b:	e8 20 ed ff ff       	callq  400bc0 <__errno_location@plt>
  401ea0:	83 38 04             	cmpl   $0x4,(%rax)
  401ea3:	75 0f                	jne    401eb4 <submitr+0x4b1>
  401ea5:	b8 00 00 00 00       	mov    $0x0,%eax
  401eaa:	48 29 c3             	sub    %rax,%rbx
  401ead:	75 d6                	jne    401e85 <submitr+0x482>
  401eaf:	4d 85 e4             	test   %r12,%r12
  401eb2:	79 79                	jns    401f2d <submitr+0x52a>
  401eb4:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  401ebb:	41 c7 46 04 72 3a 20 	movl   $0x43203a72,0x4(%r14)
  401ec2:	43 
  401ec3:	41 c7 46 08 6c 69 65 	movl   $0x6e65696c,0x8(%r14)
  401eca:	6e 
  401ecb:	41 c7 46 0c 74 20 75 	movl   $0x6e752074,0xc(%r14)
  401ed2:	6e 
  401ed3:	41 c7 46 10 61 62 6c 	movl   $0x656c6261,0x10(%r14)
  401eda:	65 
  401edb:	41 c7 46 14 20 74 6f 	movl   $0x206f7420,0x14(%r14)
  401ee2:	20 
  401ee3:	41 c7 46 18 77 72 69 	movl   $0x74697277,0x18(%r14)
  401eea:	74 
  401eeb:	41 c7 46 1c 65 20 74 	movl   $0x6f742065,0x1c(%r14)
  401ef2:	6f 
  401ef3:	41 c7 46 20 20 74 68 	movl   $0x65687420,0x20(%r14)
  401efa:	65 
  401efb:	41 c7 46 24 20 41 75 	movl   $0x74754120,0x24(%r14)
  401f02:	74 
  401f03:	41 c7 46 28 6f 6c 61 	movl   $0x62616c6f,0x28(%r14)
  401f0a:	62 
  401f0b:	41 c7 46 2c 20 73 65 	movl   $0x72657320,0x2c(%r14)
  401f12:	72 
  401f13:	41 c7 46 30 76 65 72 	movl   $0x726576,0x30(%r14)
  401f1a:	00 
  401f1b:	44 89 ef             	mov    %r13d,%edi
  401f1e:	e8 4d eb ff ff       	callq  400a70 <close@plt>
  401f23:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401f28:	e9 e1 03 00 00       	jmpq   40230e <submitr+0x90b>
  401f2d:	44 89 ac 24 50 80 00 	mov    %r13d,0x8050(%rsp)
  401f34:	00 
  401f35:	c7 84 24 54 80 00 00 	movl   $0x0,0x8054(%rsp)
  401f3c:	00 00 00 00 
  401f40:	48 8d bc 24 50 80 00 	lea    0x8050(%rsp),%rdi
  401f47:	00 
  401f48:	48 8d 47 10          	lea    0x10(%rdi),%rax
  401f4c:	48 89 84 24 58 80 00 	mov    %rax,0x8058(%rsp)
  401f53:	00 
  401f54:	48 8d b4 24 50 60 00 	lea    0x6050(%rsp),%rsi
  401f5b:	00 
  401f5c:	ba 00 20 00 00       	mov    $0x2000,%edx
  401f61:	e8 c3 f9 ff ff       	callq  401929 <rio_readlineb>
  401f66:	48 85 c0             	test   %rax,%rax
  401f69:	0f 8f 90 00 00 00    	jg     401fff <submitr+0x5fc>
  401f6f:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  401f76:	41 c7 46 04 72 3a 20 	movl   $0x43203a72,0x4(%r14)
  401f7d:	43 
  401f7e:	41 c7 46 08 6c 69 65 	movl   $0x6e65696c,0x8(%r14)
  401f85:	6e 
  401f86:	41 c7 46 0c 74 20 75 	movl   $0x6e752074,0xc(%r14)
  401f8d:	6e 
  401f8e:	41 c7 46 10 61 62 6c 	movl   $0x656c6261,0x10(%r14)
  401f95:	65 
  401f96:	41 c7 46 14 20 74 6f 	movl   $0x206f7420,0x14(%r14)
  401f9d:	20 
  401f9e:	41 c7 46 18 72 65 61 	movl   $0x64616572,0x18(%r14)
  401fa5:	64 
  401fa6:	41 c7 46 1c 20 66 69 	movl   $0x72696620,0x1c(%r14)
  401fad:	72 
  401fae:	41 c7 46 20 73 74 20 	movl   $0x68207473,0x20(%r14)
  401fb5:	68 
  401fb6:	41 c7 46 24 65 61 64 	movl   $0x65646165,0x24(%r14)
  401fbd:	65 
  401fbe:	41 c7 46 28 72 20 66 	movl   $0x72662072,0x28(%r14)
  401fc5:	72 
  401fc6:	41 c7 46 2c 6f 6d 20 	movl   $0x41206d6f,0x2c(%r14)
  401fcd:	41 
  401fce:	41 c7 46 30 75 74 6f 	movl   $0x6c6f7475,0x30(%r14)
  401fd5:	6c 
  401fd6:	41 c7 46 34 61 62 20 	movl   $0x73206261,0x34(%r14)
  401fdd:	73 
  401fde:	41 c7 46 38 65 72 76 	movl   $0x65767265,0x38(%r14)
  401fe5:	65 
  401fe6:	66 41 c7 46 3c 72 00 	movw   $0x72,0x3c(%r14)
  401fed:	44 89 ef             	mov    %r13d,%edi
  401ff0:	e8 7b ea ff ff       	callq  400a70 <close@plt>
  401ff5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401ffa:	e9 0f 03 00 00       	jmpq   40230e <submitr+0x90b>
  401fff:	48 8d 5c 24 40       	lea    0x40(%rsp),%rbx
  402004:	48 8d 8c 24 4c 20 00 	lea    0x204c(%rsp),%rcx
  40200b:	00 
  40200c:	48 8d 94 24 50 20 00 	lea    0x2050(%rsp),%rdx
  402013:	00 
  402014:	48 8d bc 24 50 60 00 	lea    0x6050(%rsp),%rdi
  40201b:	00 
  40201c:	49 89 d8             	mov    %rbx,%r8
  40201f:	be 77 2b 40 00       	mov    $0x402b77,%esi
  402024:	b8 00 00 00 00       	mov    $0x0,%eax
  402029:	e8 12 eb ff ff       	callq  400b40 <sscanf@plt>
  40202e:	8b 94 24 4c 20 00 00 	mov    0x204c(%rsp),%edx
  402035:	81 fa c8 00 00 00    	cmp    $0xc8,%edx
  40203b:	74 4a                	je     402087 <submitr+0x684>
  40203d:	48 89 d9             	mov    %rbx,%rcx
  402040:	be b8 2a 40 00       	mov    $0x402ab8,%esi
  402045:	4c 89 f7             	mov    %r14,%rdi
  402048:	b8 00 00 00 00       	mov    $0x0,%eax
  40204d:	e8 ce ea ff ff       	callq  400b20 <sprintf@plt>
  402052:	44 89 ef             	mov    %r13d,%edi
  402055:	e8 16 ea ff ff       	callq  400a70 <close@plt>
  40205a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40205f:	e9 aa 02 00 00       	jmpq   40230e <submitr+0x90b>
  402064:	48 8d b4 24 50 60 00 	lea    0x6050(%rsp),%rsi
  40206b:	00 
  40206c:	48 8d bc 24 50 80 00 	lea    0x8050(%rsp),%rdi
  402073:	00 
  402074:	ba 00 20 00 00       	mov    $0x2000,%edx
  402079:	e8 ab f8 ff ff       	callq  401929 <rio_readlineb>
  40207e:	48 85 c0             	test   %rax,%rax
  402081:	0f 8e 06 02 00 00    	jle    40228d <submitr+0x88a>
  402087:	48 8d b4 24 50 60 00 	lea    0x6050(%rsp),%rsi
  40208e:	00 
  40208f:	0f b6 94 24 50 60 00 	movzbl 0x6050(%rsp),%edx
  402096:	00 
  402097:	0f b6 05 f0 0a 00 00 	movzbl 0xaf0(%rip),%eax        # 402b8e <array.3311+0x4de>
  40209e:	39 c2                	cmp    %eax,%edx
  4020a0:	75 c2                	jne    402064 <submitr+0x661>
  4020a2:	0f b6 94 24 51 60 00 	movzbl 0x6051(%rsp),%edx
  4020a9:	00 
  4020aa:	0f b6 05 de 0a 00 00 	movzbl 0xade(%rip),%eax        # 402b8f <array.3311+0x4df>
  4020b1:	39 c2                	cmp    %eax,%edx
  4020b3:	75 af                	jne    402064 <submitr+0x661>
  4020b5:	0f b6 94 24 52 60 00 	movzbl 0x6052(%rsp),%edx
  4020bc:	00 
  4020bd:	0f b6 05 cc 0a 00 00 	movzbl 0xacc(%rip),%eax        # 402b90 <array.3311+0x4e0>
  4020c4:	39 c2                	cmp    %eax,%edx
  4020c6:	75 9c                	jne    402064 <submitr+0x661>
  4020c8:	48 8d bc 24 50 80 00 	lea    0x8050(%rsp),%rdi
  4020cf:	00 
  4020d0:	ba 00 20 00 00       	mov    $0x2000,%edx
  4020d5:	e8 4f f8 ff ff       	callq  401929 <rio_readlineb>
  4020da:	48 85 c0             	test   %rax,%rax
  4020dd:	0f 8f 91 00 00 00    	jg     402174 <submitr+0x771>
  4020e3:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  4020ea:	41 c7 46 04 72 3a 20 	movl   $0x43203a72,0x4(%r14)
  4020f1:	43 
  4020f2:	41 c7 46 08 6c 69 65 	movl   $0x6e65696c,0x8(%r14)
  4020f9:	6e 
  4020fa:	41 c7 46 0c 74 20 75 	movl   $0x6e752074,0xc(%r14)
  402101:	6e 
  402102:	41 c7 46 10 61 62 6c 	movl   $0x656c6261,0x10(%r14)
  402109:	65 
  40210a:	41 c7 46 14 20 74 6f 	movl   $0x206f7420,0x14(%r14)
  402111:	20 
  402112:	41 c7 46 18 72 65 61 	movl   $0x64616572,0x18(%r14)
  402119:	64 
  40211a:	41 c7 46 1c 20 73 74 	movl   $0x61747320,0x1c(%r14)
  402121:	61 
  402122:	41 c7 46 20 74 75 73 	movl   $0x20737574,0x20(%r14)
  402129:	20 
  40212a:	41 c7 46 24 6d 65 73 	movl   $0x7373656d,0x24(%r14)
  402131:	73 
  402132:	41 c7 46 28 61 67 65 	movl   $0x20656761,0x28(%r14)
  402139:	20 
  40213a:	41 c7 46 2c 66 72 6f 	movl   $0x6d6f7266,0x2c(%r14)
  402141:	6d 
  402142:	41 c7 46 30 20 41 75 	movl   $0x74754120,0x30(%r14)
  402149:	74 
  40214a:	41 c7 46 34 6f 6c 61 	movl   $0x62616c6f,0x34(%r14)
  402151:	62 
  402152:	41 c7 46 38 20 73 65 	movl   $0x72657320,0x38(%r14)
  402159:	72 
  40215a:	41 c7 46 3c 76 65 72 	movl   $0x726576,0x3c(%r14)
  402161:	00 
  402162:	44 89 ef             	mov    %r13d,%edi
  402165:	e8 06 e9 ff ff       	callq  400a70 <close@plt>
  40216a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40216f:	e9 9a 01 00 00       	jmpq   40230e <submitr+0x90b>
  402174:	48 8d b4 24 50 60 00 	lea    0x6050(%rsp),%rsi
  40217b:	00 
  40217c:	4c 89 f7             	mov    %r14,%rdi
  40217f:	e8 4c ea ff ff       	callq  400bd0 <strcpy@plt>
  402184:	44 89 ef             	mov    %r13d,%edi
  402187:	e8 e4 e8 ff ff       	callq  400a70 <close@plt>
  40218c:	4d 89 f0             	mov    %r14,%r8
  40218f:	45 0f b6 0e          	movzbl (%r14),%r9d
  402193:	0f b6 05 ee 09 00 00 	movzbl 0x9ee(%rip),%eax        # 402b88 <array.3311+0x4d8>
  40219a:	41 39 c1             	cmp    %eax,%r9d
  40219d:	75 30                	jne    4021cf <submitr+0x7cc>
  40219f:	41 0f b6 56 01       	movzbl 0x1(%r14),%edx
  4021a4:	0f b6 05 de 09 00 00 	movzbl 0x9de(%rip),%eax        # 402b89 <array.3311+0x4d9>
  4021ab:	39 c2                	cmp    %eax,%edx
  4021ad:	75 20                	jne    4021cf <submitr+0x7cc>
  4021af:	41 0f b6 56 02       	movzbl 0x2(%r14),%edx
  4021b4:	0f b6 05 cf 09 00 00 	movzbl 0x9cf(%rip),%eax        # 402b8a <array.3311+0x4da>
  4021bb:	39 c2                	cmp    %eax,%edx
  4021bd:	75 10                	jne    4021cf <submitr+0x7cc>
  4021bf:	41 0f b6 56 03       	movzbl 0x3(%r14),%edx
  4021c4:	0f b6 05 c0 09 00 00 	movzbl 0x9c0(%rip),%eax        # 402b8b <array.3311+0x4db>
  4021cb:	39 c2                	cmp    %eax,%edx
  4021cd:	74 46                	je     402215 <submitr+0x812>
  4021cf:	4c 89 f6             	mov    %r14,%rsi
  4021d2:	bf 8c 2b 40 00       	mov    $0x402b8c,%edi
  4021d7:	b9 05 00 00 00       	mov    $0x5,%ecx
  4021dc:	fc                   	cld    
  4021dd:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  4021df:	0f 97 c2             	seta   %dl
  4021e2:	0f 92 c0             	setb   %al
  4021e5:	38 c2                	cmp    %al,%dl
  4021e7:	74 2c                	je     402215 <submitr+0x812>
  4021e9:	0f b6 05 a1 09 00 00 	movzbl 0x9a1(%rip),%eax        # 402b91 <array.3311+0x4e1>
  4021f0:	41 39 c1             	cmp    %eax,%r9d
  4021f3:	75 2a                	jne    40221f <submitr+0x81c>
  4021f5:	41 0f b6 50 01       	movzbl 0x1(%r8),%edx
  4021fa:	0f b6 05 91 09 00 00 	movzbl 0x991(%rip),%eax        # 402b92 <array.3311+0x4e2>
  402201:	39 c2                	cmp    %eax,%edx
  402203:	75 1a                	jne    40221f <submitr+0x81c>
  402205:	41 0f b6 50 02       	movzbl 0x2(%r8),%edx
  40220a:	0f b6 05 82 09 00 00 	movzbl 0x982(%rip),%eax        # 402b93 <array.3311+0x4e3>
  402211:	39 c2                	cmp    %eax,%edx
  402213:	75 0a                	jne    40221f <submitr+0x81c>
  402215:	b8 00 00 00 00       	mov    $0x0,%eax
  40221a:	e9 ef 00 00 00       	jmpq   40230e <submitr+0x90b>
  40221f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402224:	e9 e5 00 00 00       	jmpq   40230e <submitr+0x90b>
  402229:	48 8d ac 24 50 60 00 	lea    0x6050(%rsp),%rbp
  402230:	00 
  402231:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
  402236:	48 89 04 24          	mov    %rax,(%rsp)
  40223a:	4c 8d 8c 24 50 40 00 	lea    0x4050(%rsp),%r9
  402241:	00 
  402242:	4c 8b 44 24 10       	mov    0x10(%rsp),%r8
  402247:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
  40224c:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
  402251:	be e8 2a 40 00       	mov    $0x402ae8,%esi
  402256:	48 89 ef             	mov    %rbp,%rdi
  402259:	b8 00 00 00 00       	mov    $0x0,%eax
  40225e:	e8 bd e8 ff ff       	callq  400b20 <sprintf@plt>
  402263:	48 89 ef             	mov    %rbp,%rdi
  402266:	fc                   	cld    
  402267:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  40226e:	b8 00 00 00 00       	mov    $0x0,%eax
  402273:	f2 ae                	repnz scas %es:(%rdi),%al
  402275:	48 f7 d1             	not    %rcx
  402278:	49 89 cc             	mov    %rcx,%r12
  40227b:	49 83 ec 01          	sub    $0x1,%r12
  40227f:	0f 84 a8 fc ff ff    	je     401f2d <submitr+0x52a>
  402285:	4c 89 e3             	mov    %r12,%rbx
  402288:	e9 fb fb ff ff       	jmpq   401e88 <submitr+0x485>
  40228d:	41 c7 06 45 72 72 6f 	movl   $0x6f727245,(%r14)
  402294:	41 c7 46 04 72 3a 20 	movl   $0x43203a72,0x4(%r14)
  40229b:	43 
  40229c:	41 c7 46 08 6c 69 65 	movl   $0x6e65696c,0x8(%r14)
  4022a3:	6e 
  4022a4:	41 c7 46 0c 74 20 75 	movl   $0x6e752074,0xc(%r14)
  4022ab:	6e 
  4022ac:	41 c7 46 10 61 62 6c 	movl   $0x656c6261,0x10(%r14)
  4022b3:	65 
  4022b4:	41 c7 46 14 20 74 6f 	movl   $0x206f7420,0x14(%r14)
  4022bb:	20 
  4022bc:	41 c7 46 18 72 65 61 	movl   $0x64616572,0x18(%r14)
  4022c3:	64 
  4022c4:	41 c7 46 1c 20 68 65 	movl   $0x61656820,0x1c(%r14)
  4022cb:	61 
  4022cc:	41 c7 46 20 64 65 72 	movl   $0x73726564,0x20(%r14)
  4022d3:	73 
  4022d4:	41 c7 46 24 20 66 72 	movl   $0x6f726620,0x24(%r14)
  4022db:	6f 
  4022dc:	41 c7 46 28 6d 20 41 	movl   $0x7541206d,0x28(%r14)
  4022e3:	75 
  4022e4:	41 c7 46 2c 74 6f 6c 	movl   $0x616c6f74,0x2c(%r14)
  4022eb:	61 
  4022ec:	41 c7 46 30 62 20 73 	movl   $0x65732062,0x30(%r14)
  4022f3:	65 
  4022f4:	41 c7 46 34 72 76 65 	movl   $0x72657672,0x34(%r14)
  4022fb:	72 
  4022fc:	41 c6 46 38 00       	movb   $0x0,0x38(%r14)
  402301:	44 89 ef             	mov    %r13d,%edi
  402304:	e8 67 e7 ff ff       	callq  400a70 <close@plt>
  402309:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40230e:	48 81 c4 78 a0 00 00 	add    $0xa078,%rsp
  402315:	5b                   	pop    %rbx
  402316:	5d                   	pop    %rbp
  402317:	41 5c                	pop    %r12
  402319:	41 5d                	pop    %r13
  40231b:	41 5e                	pop    %r14
  40231d:	41 5f                	pop    %r15
  40231f:	c3                   	retq   

0000000000402320 <driver_post>:
  402320:	53                   	push   %rbx
  402321:	48 83 ec 10          	sub    $0x10,%rsp
  402325:	48 89 cb             	mov    %rcx,%rbx
  402328:	85 d2                	test   %edx,%edx
  40232a:	74 1f                	je     40234b <driver_post+0x2b>
  40232c:	bf 94 2b 40 00       	mov    $0x402b94,%edi
  402331:	b8 00 00 00 00       	mov    $0x0,%eax
  402336:	e8 15 e7 ff ff       	callq  400a50 <printf@plt>
  40233b:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402340:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402344:	b8 00 00 00 00       	mov    $0x0,%eax
  402349:	eb 47                	jmp    402392 <driver_post+0x72>
  40234b:	48 85 ff             	test   %rdi,%rdi
  40234e:	74 34                	je     402384 <driver_post+0x64>
  402350:	0f b6 17             	movzbl (%rdi),%edx
  402353:	0f b6 05 36 08 00 00 	movzbl 0x836(%rip),%eax        # 402b90 <array.3311+0x4e0>
  40235a:	39 c2                	cmp    %eax,%edx
  40235c:	74 26                	je     402384 <driver_post+0x64>
  40235e:	48 89 0c 24          	mov    %rcx,(%rsp)
  402362:	49 89 f1             	mov    %rsi,%r9
  402365:	41 b8 ab 2b 40 00    	mov    $0x402bab,%r8d
  40236b:	48 89 f9             	mov    %rdi,%rcx
  40236e:	ba b3 2b 40 00       	mov    $0x402bb3,%edx
  402373:	be 50 00 00 00       	mov    $0x50,%esi
  402378:	bf 98 2a 40 00       	mov    $0x402a98,%edi
  40237d:	e8 81 f6 ff ff       	callq  401a03 <submitr>
  402382:	eb 0e                	jmp    402392 <driver_post+0x72>
  402384:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402389:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  40238d:	b8 00 00 00 00       	mov    $0x0,%eax
  402392:	48 83 c4 10          	add    $0x10,%rsp
  402396:	5b                   	pop    %rbx
  402397:	c3                   	retq   

0000000000402398 <sigalrm_handler>:
  402398:	48 83 ec 08          	sub    $0x8,%rsp
  40239c:	ba 00 00 00 00       	mov    $0x0,%edx
  4023a1:	be 48 2b 40 00       	mov    $0x402b48,%esi
  4023a6:	48 8b 3d bb 18 20 00 	mov    0x2018bb(%rip),%rdi        # 603c68 <stderr@@GLIBC_2.2.5>
  4023ad:	b8 00 00 00 00       	mov    $0x0,%eax
  4023b2:	e8 29 e8 ff ff       	callq  400be0 <fprintf@plt>
  4023b7:	bf 01 00 00 00       	mov    $0x1,%edi
  4023bc:	e8 df e6 ff ff       	callq  400aa0 <exit@plt>
  4023c1:	90                   	nop
  4023c2:	90                   	nop
  4023c3:	90                   	nop
  4023c4:	90                   	nop
  4023c5:	90                   	nop
  4023c6:	90                   	nop
  4023c7:	90                   	nop
  4023c8:	90                   	nop
  4023c9:	90                   	nop
  4023ca:	90                   	nop
  4023cb:	90                   	nop
  4023cc:	90                   	nop
  4023cd:	90                   	nop
  4023ce:	90                   	nop
  4023cf:	90                   	nop

00000000004023d0 <__libc_csu_fini>:
  4023d0:	f3 c3                	repz retq 
  4023d2:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  4023d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000004023e0 <__libc_csu_init>:
  4023e0:	4c 89 64 24 e0       	mov    %r12,-0x20(%rsp)
  4023e5:	4c 89 6c 24 e8       	mov    %r13,-0x18(%rsp)
  4023ea:	4c 8d 25 b3 0c 20 00 	lea    0x200cb3(%rip),%r12        # 6030a4 <__fini_array_end>
  4023f1:	4c 89 74 24 f0       	mov    %r14,-0x10(%rsp)
  4023f6:	4c 89 7c 24 f8       	mov    %r15,-0x8(%rsp)
  4023fb:	49 89 f6             	mov    %rsi,%r14
  4023fe:	48 89 5c 24 d0       	mov    %rbx,-0x30(%rsp)
  402403:	48 89 6c 24 d8       	mov    %rbp,-0x28(%rsp)
  402408:	48 83 ec 38          	sub    $0x38,%rsp
  40240c:	41 89 ff             	mov    %edi,%r15d
  40240f:	49 89 d5             	mov    %rdx,%r13
  402412:	e8 11 e6 ff ff       	callq  400a28 <_init>
  402417:	48 8d 05 86 0c 20 00 	lea    0x200c86(%rip),%rax        # 6030a4 <__fini_array_end>
  40241e:	49 29 c4             	sub    %rax,%r12
  402421:	49 c1 fc 03          	sar    $0x3,%r12
  402425:	4d 85 e4             	test   %r12,%r12
  402428:	74 1e                	je     402448 <__libc_csu_init+0x68>
  40242a:	31 ed                	xor    %ebp,%ebp
  40242c:	48 89 c3             	mov    %rax,%rbx
  40242f:	90                   	nop
  402430:	48 83 c5 01          	add    $0x1,%rbp
  402434:	4c 89 ea             	mov    %r13,%rdx
  402437:	4c 89 f6             	mov    %r14,%rsi
  40243a:	44 89 ff             	mov    %r15d,%edi
  40243d:	ff 13                	callq  *(%rbx)
  40243f:	48 83 c3 08          	add    $0x8,%rbx
  402443:	49 39 ec             	cmp    %rbp,%r12
  402446:	75 e8                	jne    402430 <__libc_csu_init+0x50>
  402448:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  40244d:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
  402452:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  402457:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
  40245c:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
  402461:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
  402466:	48 83 c4 38          	add    $0x38,%rsp
  40246a:	c3                   	retq   
  40246b:	90                   	nop
  40246c:	90                   	nop
  40246d:	90                   	nop
  40246e:	90                   	nop
  40246f:	90                   	nop

0000000000402470 <__do_global_ctors_aux>:
  402470:	55                   	push   %rbp
  402471:	48 89 e5             	mov    %rsp,%rbp
  402474:	53                   	push   %rbx
  402475:	bb a8 30 60 00       	mov    $0x6030a8,%ebx
  40247a:	48 83 ec 08          	sub    $0x8,%rsp
  40247e:	48 8b 05 23 0c 20 00 	mov    0x200c23(%rip),%rax        # 6030a8 <__CTOR_LIST__>
  402485:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
  402489:	74 14                	je     40249f <__do_global_ctors_aux+0x2f>
  40248b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  402490:	48 83 eb 08          	sub    $0x8,%rbx
  402494:	ff d0                	callq  *%rax
  402496:	48 8b 03             	mov    (%rbx),%rax
  402499:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
  40249d:	75 f1                	jne    402490 <__do_global_ctors_aux+0x20>
  40249f:	48 83 c4 08          	add    $0x8,%rsp
  4024a3:	5b                   	pop    %rbx
  4024a4:	c9                   	leaveq 
  4024a5:	c3                   	retq   
  4024a6:	90                   	nop
  4024a7:	90                   	nop

Disassembly of section .fini:

00000000004024a8 <_fini>:
  4024a8:	48 83 ec 08          	sub    $0x8,%rsp
  4024ac:	e8 af e7 ff ff       	callq  400c60 <__do_global_dtors_aux>
  4024b1:	48 83 c4 08          	add    $0x8,%rsp
  4024b5:	c3                   	retq   

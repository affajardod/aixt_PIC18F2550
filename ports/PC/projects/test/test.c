// This C code was automatically generated by Aixt Project
// Device = x64
// Board = x64-based board
// Backend = pc

#include <stdbool.h>

#include "/home/aixt-project/ports/PC/api/builtin.c"


int main() {
	char s1[] = "Hola";
	char s2[] = " mundo!";
	char s[80];
	__string_assign(s, __string_add(s1, s2));
	println(s);
	return 0;
}
extern "C"
{
#include <stdio.h>
#include <string.h>
#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>
}
int main (int argc, char **argv)
{
	printf("Assignment #3-1, William Wood, woodw221@gmail.com\n");

	int error;
	lua_State *L = luaL_newstate();
	luaL_openlibs(L);
	luaL_dofile(L, argv[1]);

	lua_close(L);
	return 0;
}

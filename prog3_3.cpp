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
	printf("Assignment #3-3, William Wood, woodw221@gmail.com\n");

	int error;
	lua_State *L = luaL_newstate();
	luaL_openlibs(L);
	luaL_dofile(L, argv[1]);

	char *string;
	fgets(string, 256, stdin);

	
	lua_getglobal(L, "InfixToPostfix");
	lua_pushstring(L, string);
	lua_call(L, 1, 1);
	const char *result = luaL_checkstring(L, 1);
	printf("%s\n", result);

	lua_close(L);
	return 0;
}

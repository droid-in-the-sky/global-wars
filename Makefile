CFLAGS += -D CEU_DEBUG -D DEBUG #-O0
#CFLAGS += -g -O0 -v -da -Q #-pg
# valgrind --error-limit=no --leak-check=full ./mtg_trader
# valgrind --tool=massif ./mtg_trader
# ms_print massif.out.19214 |less

all:
	ceu main.ceu
	gcc -Os main.c $(CFLAGS) -lSDL2 -lSDL2_gfx -lSDL2_image -lSDL2_ttf -llua \
		-o global-wars.exe

menu-new:
	ceu --cpp-args "-D __MENU_NEW_CEU" menu-new.ceu
	gcc -Os main.c $(CFLAGS) -lSDL2 -lSDL2_gfx -lSDL2_ttf -lSDL2_image -llua \
		-o global-wars.exe

menu-games:
	cp main.lua.orig main.lua
	ceu --cpp-args "-D __MENU_GAMES_CEU" menu-games.ceu
	gcc -Os main.c $(CFLAGS) -lSDL2 -lSDL2_gfx -lSDL2_ttf -lSDL2_image -llua \
		-o global-wars.exe

game:
	cp g1.lua _g1.lua
	ceu --cpp-args "-D __GAME_CEU" game.ceu
	gcc -Os main.c $(CFLAGS) -lSDL2 -lSDL2_gfx -lSDL2_ttf -lSDL2_image -llua \
		-o global-wars.exe

ai:
	ceu --cpp-args "-D __AI_CEU" ai.ceu
	gcc -Os main.c $(CFLAGS) -lSDL2 -lSDL2_gfx -lSDL2_ttf -lSDL2_image -llua \
		-o global-wars.exe

human:
	ceu --cpp-args "-D __GAME_HUMAN_CEU" game-human.ceu
	gcc -Os main.c $(CFLAGS) -lSDL2 -lSDL2_gfx -lSDL2_image -lSDL2_ttf -llua \
		-o global-wars.exe

attack:
	ceu --cpp-args "-D __GAME_ATTACK_CEU" game-attack.ceu
	gcc -Os main.c $(CFLAGS) -lSDL2 -lSDL2_gfx -lSDL2_image -lSDL2_ttf -llua \
		-o global-wars.exe

fortify:
	ceu --cpp-args "-D __GAME_FORTIFY_CEU" game-fortify.ceu
	gcc -Os main.c $(CFLAGS) -lSDL2 -lSDL2_gfx -lSDL2_image -lSDL2_ttf -llua \
		-o global-wars.exe

nav:
	ceu --cpp-args "-D __GAME_NAV_CEU" game-nav.ceu
	gcc -Os main.c $(CFLAGS) -lSDL2 -lSDL2_gfx -lSDL2_image -lSDL2_ttf -llua \
		-o global-wars.exe

move:
	ceu --cpp-args "-D __GAME_MOVE_CEU" game-move.ceu
	gcc -Os main.c $(CFLAGS) -lSDL2 -lSDL2_gfx -llua \
		-o global-wars.exe

state:
	ceu --cpp-args "-D __GAME_STATE_CEU" game-state.ceu
	gcc -Os main.c $(CFLAGS) -lSDL2 -lSDL2_gfx -llua \
		-o global-wars.exe

map:
	ceu --cpp-args "-D __MAP_CEU" map.ceu
	gcc -Os main.c $(CFLAGS) -lSDL2 -lSDL2_gfx -llua \
		-o global-wars.exe

clean:
	rm -f *.exe _ceu_* _g*.lua

.PHONY: all game map clean

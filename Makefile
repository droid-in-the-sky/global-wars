CFLAGS += -D CEU_DEBUG -D DEBUG
#CFLAGS += -g -O0 -v -da -Q #-pg
# valgrind --error-limit=no --leak-check=full ./mtg_trader
# valgrind --tool=massif ./mtg_trader
# ms_print massif.out.19214 |less

all:
	ceu --m4 main.ceu
	gcc -Os main.c $(CFLAGS) -lSDL2 -lSDL2_image -lSDL2_gfx -llua \
		-o global-wars.exe

ai:
	ceu --m4 ai.ceu
	gcc -Os main.c $(CFLAGS) -lSDL2 -lSDL2_image -lSDL2_gfx -llua \
		-o global-wars.exe

game:
	ceu --m4 game.ceu
	gcc -Os main.c $(CFLAGS) -lSDL2 -lSDL2_ttf -lSDL2_gfx -llua \
		-o global-wars.exe

fortify:
	ceu --m4 game-fortify.ceu
	gcc -Os main.c $(CFLAGS) -lSDL2 -lSDL2_ttf -lSDL2_gfx -lSDL2_image -llua \
		-o global-wars.exe

nav:
	ceu --m4 game-nav.ceu
	gcc -Os main.c $(CFLAGS) -lSDL2 -lSDL2_gfx -llua \
		-o global-wars.exe

move:
	ceu --m4 game-move.ceu
	gcc -Os main.c $(CFLAGS) -lSDL2 -lSDL2_gfx -llua \
		-o global-wars.exe

state:
	ceu --m4 game-state.ceu
	gcc -Os main.c $(CFLAGS) -lSDL2 -lSDL2_gfx -llua \
		-o global-wars.exe

map:
	ceu --m4 map.ceu
	gcc -Os main.c $(CFLAGS) -lSDL2 -lSDL2_image -lSDL2_gfx -llua \
		-o global-wars.exe

clean:
	rm -f *.exe _ceu_* *.ceu_m4 _g*.lua

.PHONY: all game map clean

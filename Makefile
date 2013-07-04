CFLAGS = -D CEU_DEBUG -D DEBUG
#CFLAGS = -DDEBUG -g -O0 -v -da -Q #-pg
# valgrind --error-limit=no --leak-check=full ./mtg_trader
# valgrind --tool=massif ./mtg_trader
# ms_print massif.out.19214 |less

all:
	ceu --m4 main.ceu
	gcc -Os main.c $(CFLAGS) -lSDL2 -lSDL2_image -lSDL2_gfx -llua \
		-o global-wars.exe

game:
	ceu --m4 ui-game.ceu
	gcc -Os main.c $(CFLAGS) -lSDL2 -lSDL2_image -lSDL2_gfx -llua \
		-o global-wars.exe

move:
	ceu --m4 ui-game-move.ceu
	gcc -Os main.c $(CFLAGS) -lSDL2 -lSDL2_image -lSDL2_gfx -llua \
		-o global-wars.exe

state:
	ceu --m4 ui-game-state.ceu
	gcc -Os main.c $(CFLAGS) -lSDL2 -lSDL2_image -lSDL2_gfx -llua \
		-o global-wars.exe

map:
	ceu --m4 ui-map.ceu
	gcc -Os main.c $(CFLAGS) -lSDL2 -lSDL2_image -lSDL2_gfx -llua \
		-o global-wars.exe

clean:
	rm -f *.exe _ceu_

.PHONY: all game map clean

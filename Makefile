#CFLAGS = -D CEU_DEBUG -D DEBUG0
#CFLAGS = -DDEBUG -g -O0 -v -da -Q #-pg
# valgrind --error-limit=no --leak-check=full ./mtg_trader
# valgrind --tool=massif ./mtg_trader
# ms_print massif.out.19214 |less

all:
	ceu --m4 main.ceu
	gcc -Os main.c $(CFLAGS) -lSDL2 -lSDL2_image -lSDL2_gfx \
		-o global-wars.exe

clean:
	rm -f *.exe _ceu_

.PHONY: all clean

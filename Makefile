SRCS = #ここにファイル
FLAGS = -Wall -Werror -Wextra
LEEK_FLAGS = valgrind --leak-check=full --leak-check=full --show-leak-kinds=all

all	:
	cc $(FLAGS) $(SRCS)
do	: all
	./a.out
leek	: all
	$(LEEK_FLAGS) ./a.out
check	:
	cc -fsanitize=address -g $(SRCS)

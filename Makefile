SRCS = #ここにファイル
FLAGS = -Wall -Werror -Wextra
LEAK_FLAGS = valgrind --leak-check=full --show-leak-kinds=all

all	:
	cc $(FLAGS) $(SRCS)
do	: all
	./a.out
leak	: all
	$(LEAK_FLAGS) ./a.out
check	:
	cc -fsanitize=address -g $(SRCS)

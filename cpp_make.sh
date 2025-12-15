#!/bin/bash

# make.sh
CPP_FILES=$(ls | grep '\.cpp$' | sed 's/$/ \\/')

cat <<EOF > Makefile
CPP=c++
CFLAGS=-Wall -Wextra -Werror -std=c++98 -pedantic
NAME=ex01
FILES= \\
$CPP_FILES

OBJS=\$(FILES:.cpp=.o)

all: \$(NAME)

\$(NAME): \$(OBJS)
	\$(CPP) \$(CFLAGS) -o \$(NAME) \$(OBJS)

%.o: %.cpp
	\$(CPP) \$(CFLAGS) -c \$< -o \$@

clean:
	\$(RM) \$(OBJS)

fclean: clean
	\$(RM) \$(NAME)

re:
	@\$(MAKE) fclean
	@\$(MAKE) all

.PHONY: all clean fclean re
EOF

echo "✅ Create Makefile"

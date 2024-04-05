##
## EPITECH PROJECT, 2024
## MINISHELL1
## File description:
## The project Makefile
##

SRCS	=	test.c


OBJS	= $(SRCS:.c=.o)

BINARY = organized

all: $(BINARY)

$(BINARY): $(OBJS)
	gcc -o $(BINARY) $(OBJS) -g3 -Og

unit_tests: fclean $(BINARY)
	gcc -o unit_tests tests/test_minishell.c $(SRCS) -lcriterion --coverage

tests_run: unit_tests
	./unit_tests
	gcovr --exclude tests/ --branches
	gcovr --exclude tests/

clean:
	find . -type f -name "*.o" -delete
	find . -type f -name "*~" -delete
	find . -type f -name "#*#" -delete
	find . -type f -name "a.out" -delete
	find . -type f -name "vgcore*" -delete
	find . -type f -name "*.gcda" -delete
	find . -type f -name "*.gcno" -delete

fclean: clean
	rm -f $(BINARY) unit_tests

re: fclean all

.PHONY: all clean fclean re

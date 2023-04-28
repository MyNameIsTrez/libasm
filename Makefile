# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: sbos <sbos@student.codam.nl>                 +#+                      #
#                                                    +#+                       #
#    Created: 2023/04/11 17:07:00 by sbos          #+#    #+#                  #
#    Updated: 2023/04/11 17:07:00 by sbos          ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

################################################################################

NAME := libasm.a

CFLAGS := -Wall -Wextra -Werror

################################################################################

ifdef O3
CFLAGS += -Ofast
endif
ifdef DEBUG
CFLAGS += -g3
endif
ifdef SAN
CFLAGS += -fsanitize=address
endif

################################################################################

ASSEMBLY_FILES :=\
	ft_strlen.asm

ifdef BONUS
# ASSEMBLY_FILES +=\
# 	src/collisions/get_line_rgb_bonus.c
else
# ASSEMBLY_FILES +=\
# 	src/collisions/get_line_rgb.c
endif

################################################################################

OBJS := $(addprefix obj/,$(ASSEMBLY_FILES:asm=o))

################################################################################

.PHONY: all
all: $(NAME)

$(NAME): $(OBJS)
	@ar rcs $(NAME) $(OBJS)
	@echo Created libasm.a

obj/%.o : %.asm Makefile
	@mkdir -p $(@D)
	nasm -f macho64 $< -o $@

################################################################################

.PHONY: clean
clean:
	@$(RM) -rf obj
	@echo Deleted \'obj/\'

.PHONY: fclean
fclean: clean
	@$(RM) -f $(NAME)
	@echo Deleted executable \'$(NAME)\'

.PHONY: re
re: fclean all

.PHONY: bonus
bonus:
	@$(MAKE) all BONUS=1

.PHONY: test_non_bonus
test_non_bonus: all
	@gcc -c tests.c -o obj/tests.o
	@ld -lSystem -L. -lasm -o tests obj/tests.o && ./tests
	./tests

.PHONY: test_bonus
test_bonus: bonus

################################################################################

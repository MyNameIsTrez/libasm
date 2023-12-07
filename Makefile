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
NASM_CFLAGS += -g
endif
ifdef SAN
CFLAGS += -fsanitize=address
endif

################################################################################

ASSEMBLY_FILES := $(wildcard asm/*.s)

ifdef BONUS
# ASSEMBLY_FILES +=\
# 	asm/foo_bonus.s
else
# ASSEMBLY_FILES +=\
# 	asm/foo.s
endif

################################################################################

OBJS := $(patsubst asm/%,obj/%,$(ASSEMBLY_FILES:.s=.o))

################################################################################

.PHONY: all
all: $(NAME)

$(NAME): $(OBJS)
	@ar rcs $(NAME) $(OBJS)
	@echo Created libasm.a

obj/%.o : asm/%.s Makefile
	@mkdir -p $(@D)
	nasm -f elf64 $(NASM_CFLAGS) $< -o $@

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
	gcc $(CFLAGS) tests.c -L. -lasm -o tests
	./tests

# TODO: Fill this rule in
.PHONY: test_bonus
test_bonus: bonus

################################################################################

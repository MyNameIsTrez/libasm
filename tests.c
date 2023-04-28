#include <assert.h>
#include <stdlib.h>
#include <stdio.h>

size_t	ft_strlen(const char *str);

int	main(void) {
	assert(ft_strlen("") == 0);
	assert(ft_strlen("a") == 1);
	assert(ft_strlen("ab") == 2);

	return EXIT_SUCCESS;
}

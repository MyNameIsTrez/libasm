#include <assert.h>
#include <stdlib.h>
#include <stdio.h>

size_t	ft_strlen(const char *str);
// size_t	ft_strlen(int n, int m);

int	main(void) {
	// assert(ft_strlen("") == 0);
	// assert(ft_strlen("f") == 1);
	// assert(ft_strlen("foo") == 3);

	printf("%zu\n", ft_strlen(""));
	printf("%zu\n", ft_strlen("a"));

	return EXIT_SUCCESS;
}

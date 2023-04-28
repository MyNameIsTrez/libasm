#include <assert.h>
#include <stdlib.h>

size_t	ft_strlen(const char *str);

int	main(void) {
	// assert(ft_strlen("") == 0);
	// assert(ft_strlen("f") == 1);
	assert(ft_strlen("foo") == 3);

	return EXIT_SUCCESS;
}

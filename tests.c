#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

size_t	ft_strlen(const char *str);
char	*ft_strcpy(char *dst, const char *src);
int		ft_strcmp(const char *str1, const char *str2);

void	test_ft_strlen(void) {
	assert(ft_strlen("") == 0);
	assert(ft_strlen("a") == 1);
	assert(ft_strlen("ab") == 2);
}

void	test_ft_strcpy(void) {
	char	dst[3];

	assert(strcmp(ft_strcpy(dst, ""), "") == 0);
	assert(strcmp(dst, "") == 0);

	assert(strcmp(ft_strcpy(dst, "a"), "a") == 0);
	assert(strcmp(dst, "a") == 0);

	assert(strcmp(ft_strcpy(dst, "ab"), "ab") == 0);
	assert(strcmp(dst, "ab") == 0);
}

void	test_ft_strcmp(void) {
	assert(ft_strcmp("", "") == 0);
	assert(ft_strcmp("a", "a") == 0);
	assert(ft_strcmp("a", "c") == -1);
	assert(ft_strcmp("c", "a") == 1);
	assert(ft_strcmp("aa", "ac") == -1);
	assert(ft_strcmp("ac", "aa") == 1);
}

int	main(void) {
	test_ft_strlen();
	test_ft_strcpy();
	test_ft_strcmp();
	return EXIT_SUCCESS;
}

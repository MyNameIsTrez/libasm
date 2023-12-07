#include <assert.h>
#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int		ft_strcmp(const char *str1, const char *str2);
char	*ft_strcpy(char *dst, const char *src);
size_t	ft_strlen(const char *str);
// ssize_t	ft_write(int fildes, const void *buf, size_t nbyte);

static void	test_ft_strcmp(void)
{
	assert(ft_strcmp("", "") == 0);
	assert(ft_strcmp("a", "a") == 0);
	assert(ft_strcmp("a", "c") == -1);
	assert(ft_strcmp("c", "a") == 1);
	assert(ft_strcmp("aa", "ac") == -1);
	assert(ft_strcmp("ac", "aa") == 1);
}

static void	test_ft_strcpy(void)
{
	char	dst[3];

	assert(strcmp(ft_strcpy(dst, ""), "") == 0);
	assert(strcmp(dst, "") == 0);

	assert(strcmp(ft_strcpy(dst, "a"), "a") == 0);
	assert(strcmp(dst, "a") == 0);

	assert(strcmp(ft_strcpy(dst, "ab"), "ab") == 0);
	assert(strcmp(dst, "ab") == 0);
}

static void	test_ft_strlen(void)
{
	assert(ft_strlen("") == 0);
	assert(ft_strlen("a") == 1);
	assert(ft_strlen("ab") == 2);
}

// TODO: Add this back
// static void	assert_single_ft_write(const char *path, int flags, int chmod, const char *written, size_t written_length)
// {
// 	int fd;
// 	ssize_t returned_real;
// 	ssize_t returned_ft;
// 	int errno_real;
// 	int errno_ft;

// 	fd = open(path, flags, chmod);

// 	returned_real = write(fd, written, written_length);
// 	errno_real = errno;

// 	errno = 0;
// 	returned_ft = ft_write(fd, written, written_length);
// 	errno_ft = errno;

// 	close(fd);

// 	assert(returned_real == returned_ft);
// 	assert(errno_real == errno_ft);
// }

// TODO: Add this back
// static void	ft_write_errno_0(void)
// {
// 	assert_single_ft_write("/tmp/test_ft_write.txt", O_RDWR | O_CREAT | O_TRUNC, 0777, "a", 1);
// 	assert_single_ft_write("/tmp/test_ft_write.txt", O_RDWR | O_CREAT | O_TRUNC, 0777, "a", 0);
// 	assert_single_ft_write("/tmp/test_ft_write.txt", O_RDWR | O_CREAT | O_TRUNC, 0777, "ab", 2);
// 	assert_single_ft_write("/tmp/test_ft_write.txt", O_RDWR | O_CREAT | O_TRUNC, 0000, "a", 1);
// }

// TODO: Add this back
// Errno 9 is EBADF: bad file descriptor
// static void	ft_write_errno_9(void)
// {
// 	assert_single_ft_write("/tmp/test_ft_write.txt", O_RDONLY, 0777, "a", 1);
// 	assert_single_ft_write("asm", O_RDONLY, 0777, "", 0);
// 	assert_single_ft_write("asm", O_RDONLY, 0777, "", -1);
// 	assert_single_ft_write("asm", O_RDONLY, 0777, "a", 0);
// 	assert_single_ft_write("asm", O_RDONLY, 0777, "a", 1);
// 	assert_single_ft_write("asm", O_RDONLY, 0777, "a", 2);
// 	assert_single_ft_write("asm", O_RDONLY, 0777, "ab", 2);
// 	assert_single_ft_write("asm", O_RDWR | O_CREAT | O_TRUNC, 0777, "a", 1);
// }

// TODO: Add this back
// Errno 22 is EINVAL: invalid argument
// static void	ft_write_errno_22(void)
// {
// 	assert_single_ft_write("/tmp/test_ft_write.txt", O_RDWR | O_CREAT | O_TRUNC, 0777, "a", -1);
// }

// TODO: Add this back
// static void	test_ft_write(void)
// {
// 	ft_write_errno_0();
// 	ft_write_errno_9();
// 	ft_write_errno_22();

// 	// TODO: Try to produce other errno values

// 	// TODO: Add tests for weird fds

// 	// assert(errno == 0);
// 	// assert(write(42, "", -2) == -1);
// 	// assert(errno == -1);
// 	// assert(ft_write(42, "", -1) == -1);
// 	// assert(ft_write(42, "", 0) == -1);
// 	// assert(ft_write(42, "", 1) == -1);

// 	// TODO: Let assert_single_ft_write() test that the contents of the files written to are identical
// 	// char	buf[43];
// 	// int fd;
// 	// bzero(buf, 43);
// 	// fd = open("/tmp/test_ft_write.txt", O_RDWR | O_CREAT | O_TRUNC, 0777);
// 	// assert(ft_write(fd, "ab", 2) == 2);
// 	// lseek(fd, 0, SEEK_SET);
// 	// read(fd, buf, 2);
// 	// assert(strcmp(buf, "ab") == 0);
// 	// close(fd);
// }

int	main(void)
{
	test_ft_strcmp();
	test_ft_strcpy();
	test_ft_strlen();
	// TODO: Add this back
	// test_ft_write();

	return EXIT_SUCCESS;
}

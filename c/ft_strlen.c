// Other nasm and C files
// are automatically allowed to call this
int	ft_strlen(char *str)
{
	int i = 0;

	while (str[i] != '\0')
	{
		i++;
	}

	return i;
}

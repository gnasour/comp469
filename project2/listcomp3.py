def swap_case_and_print_c(list_of_strings):
    for string in list_of_strings:
        string = string.swapcase()
        if string.endswith('c') or string.endswith('C'):
            print(string)


strings = ['Some string', 'Art', 'Music', 'Artificial Intelligence']
swap_case_and_print_c(strings)

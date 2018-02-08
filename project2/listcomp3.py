def swap_case_and_print_c(list_of_strings):
    for string in list_of_strings:
        string = string.swapcase()
        for character in string:
            if character.lower() == 'c':
                print(string)
                break


strings = ['Some string', 'Art', 'Music', 'Artificial Intelligence']
swap_case_and_print_c(strings)

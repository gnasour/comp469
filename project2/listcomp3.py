"""
George Nassour
AI Comp 469
Steven Wirsz
T-TH 2:00-3:15
"""
def swap_case_and_print_c(list_of_strings):
    for string in list_of_strings:
        string = string.swapcase()
        if string.endswith('c') or string.endswith('C'):
            print(string)


strings = ['Some string', 'Art', 'Music', 'Artificial Intelligence']
swap_case_and_print_c(strings)

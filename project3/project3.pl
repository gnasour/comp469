/*
George Nassour
Project 3, List Comprehension
Comp 469 T&Th 2:00-3:15
Steven Wirsz
*/


/*Take a list, recursively remove the head, check to see if it is the last element in the list*/
last([H|T]):-
    last(H, T).

last(RemoveHead, [H|T]):-
    last(H,T).

last(H, []):-
    write(H).
    


/*
second to last element
Recursively check the list to see if it still has a tail i.e. atleast one element at the end.
Explicitly ask for another item in the list by using a comma instead of a pipe.
If it does, unify the variable to the head.
*/
nextlast([H|T]):-
    nextlast(X, T).

nextlast(X, [_|T]):-
    nextlast(X, T).

nextlast(H, [H,_]):-
    write(H).


/*
Kth element of a list
Recursively remove the head of the list as long as the number is greater than zero.
Base case is the number 1 and then the rule writes the head of the list.
Not using zero indexing. Sorry!
*/

kelement([H|T], Number):-
    Number2 is Number - 1,
    (Number2 > 0
    -> kelement(T, Number2);
        (
            Number2 =:= 0,
            write(H)
        )
    ).

/*
Flatten nested lists into one list
Using prolog's predefined rule flatten.
*/
flatten(L):-
    flatten(L, X),
    write(X).

/*
Remove Kth Element.
Use modified kelement rule to retrieve the Kth item.
Use prolog's delete command to create new list with the Kth item deleted.
*/
kelementremove([H|T], Number, DelElement):-
    Number2 is Number - 1,
    (Number2 > 0
    -> kelementremove(T, Number2, DelElement);
        (
            Number2 =:= 0,
            DelElement = H
        )
    ).

remove(List, Number):-
    kelementremove(List, Number, DelElement),
    delete(List, DelElement, NewList),
    write(NewList).


/*
Check if palindrome
Use the append method supplied by prolog.
Check if the front and back elements of the list are the same.
If not then it is not a palindrome.
Definitions:
1.Empty list is a palindrome.
2.An odd numbered list will have an element in the middle when we shave off all the first and last elements
    We don't care about this element since
Cite: https://stackoverflow.com/questions/27480578/code-for-prolog-program-to-check-whether-a-given-list-is-palindrome-or-not-witho
Help from user joel76.
*/
palindrome([]).
palindrome([_]).
palindrome(CheckList) :-
    append([H|T], [H], CheckList),
    palindrome(T).





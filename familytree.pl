/*members of my family (facts)*/
male(george).
male(hanna).
male(nicholas).
male(mikhail).
male(rakan).
male(henin).
male(abdulahad).
male(elie).
male(aboud).
male(chris).
male(fadi).
female(roula).
female(mary).
female(hanan).
female(sabah).
female(jakleen).
/*Marriage status*/
married(mikhail, hanan).
married(abdulahad, sabah).
married(fadi, mary).
married(rakan, jakleen).
married(henin, roula).
/*Parents, not explicitly stating father or mother, implied through gender and following */
parent(mikhail, george).
parent(mikhail, hanna).
parent(mikhail, nicholas).
parent(hanan, george).
parent(hanan, hanna).
parent(hanan, nicholas).
parent(rakan, elie).
parent(jakleen, elie).
parent(roula, aboud).
parent(henin, aboud).
parent(mary, chris).
parent(fadi, chris).
parent(sabah, hanan).
parent(abdulahad,  hanan).
parent(sabah, jakleen).
parent(abdulahad,  jakleen).
parent(sabah, henin).
parent(abdulahad,  henin).
parent(sabah, fadi).
parent(abdulahad,  fadi).
parent(needal, rakan).
parent(ahed, mary).
parent(francine, mikhail).
parent(wanda, roula).
parent(fada,  rakan).
parent(ahmed,  mary).
parent(hannan,  mikhail).
parent(baheej,  roula).

/*Transitive clause. Only way to have a grandparent is to have a parent that has a parent.*/
grandparent(Grandparent, Child):-
    parent(Grandparent, Parent),
    parent(Parent, Child).

/*Checks to see if you are a brother by checking
if the sibling is male and if they have a common mother or father.
Will give you two trues if the brothers share a mother and father.
*/
brother(Sibling_1, Sibling_2):-
    male(Sibling_1),
    parent(Parent_of_sibling, Sibling_1),
    parent(Parent_of_sibling, Sibling_2).

/*Same as brother, but checks if sibling is female*/
sister(Sibling_1, Sibling_2):-
    female(Sibling_1),
    parent(Parent_of_sibling, Sibling_1),
    parent(Parent_of_sibling, Sibling_2).

aunt(Aunt, Child):-
    parent(Parent_of_sibling, Child),
    sister(Aunt, Parent_of_sibling).

uncle(Uncle, Child):-
    parent(Parent_of_sibling, Child),
    brother(Uncle, Parent_of_sibling).

son(Child, Parent):-
    male(son),
    parent(Parent, Child).

daughter(Child, Parent):-
    female(son),
    parent(Parent, Child).

    











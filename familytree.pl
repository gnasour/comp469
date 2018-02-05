/* George Nassour
   Steven Wirsz
   AI 469 T,Th 2:00PM-3:15PM
   February 5, 2018
*/


/*members of my family (facts).*/
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
/*Marriage status.*/
married(mikhail, hanan).
married(abdulahad, sabah).
married(fadi, mary).
married(rakan, jakleen).
married(henin, roula).
/*Parents, not explicitly stating father or mother, implied through gender.*/
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
parent(abdulahad, hanan).
parent(sabah, jakleen).
parent(abdulahad, jakleen).
parent(sabah, henin).
parent(abdulahad, henin).
parent(sabah, fadi).
parent(abdulahad, fadi).
parent(needal, rakan).
parent(ahed, mary).
parent(francine, mikhail).
parent(wanda, roula).
parent(fada, rakan).
parent(ahmed, mary).
parent(hannan, mikhail).
parent(baheej, roula).

/*Rules start here*/

/*Transitive clause. Only way to have a grandparent is to have a parent that has a parent.*/
grandparent(Grandparent, Child):-
    parent(Grandparent, Parent),
    parent(Parent, Child).

/*Checks to see if you are a brother by checking
if the sibling is male and if they have a common mother or father.
Using an intermediate rule called check_parent to check for both parents.
*/
brother(Sibling_1, Sibling_2):-
    male(Sibling_1),
    Sibling_1 \== Sibling_2,
    parent(Parent_of_sibling, Sibling_1),
    parent(Parent_of_sibling, Sibling_2).

/*Same as brother, but checks if sibling is female*/
sister(Sibling_1, Sibling_2):-
    female(Sibling_1),
    Sibling_1 \== Sibling_2,
    parent(Parent_of_sibling, Sibling_1),
    parent(Parent_of_sibling, Sibling_2).

/*Check if the child has a parent who is related to the aunt*/
aunt(Aunt, Child):-
    parent(Parent_of_sibling, Child),
    sister(Aunt, Parent_of_sibling),
    Parent_of_sibling \== Aunt.

/*Same as aunt but check if the relative is a brother*/
uncle(Uncle, Child):-
    parent(Parent_of_sibling, Child),
    brother(Uncle, Parent_of_sibling),
    Parent_of_sibling \== Uncle.
    
/*Find the parents of the son*/
son(Parent, Son):-
    male(Son),
    parent(Parent, Son).

/*Find the parents of the daughter*/
daughter(Parent, Daughter):-
    female(Daughter),
    parent(Parent, Daughter).

mother(Parent, Child):-
    parent(Parent, Child),
    female(Parent).

father(Parent, Child):-
    parent(Parent, Child),
    male(Parent).

/*Recursively check the descendents of each ancestor until you hit the parents of the descendent.
  Same idea as grandparent, but grandparent only checks two facts while ancestor checks the rule until it is false.
  Base case matches the case where the parent is the direct ancestor of the descendent. 
  Found in site https://www.doc.gold.ac.uk/~mas02gw/prolog_tutorial/prologpages/recursion.html
*/
ancestor(Ancestor, Descendent):-
    parent(Ancestor, Descendent).

ancestor(Ancestor, Descendent):-
    /*write(Ancestor),*/
    parent(Ancestor, Child),
    /*write(Ancestor),
    write(Child),*/
    ancestor(Child, Descendent).
    











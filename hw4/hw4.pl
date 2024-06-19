%Problem1 this works
shuffle( [], [], []).  % shuffling two empty lists results empty list
shuffle([X | L1], [Y | L2], [X, Y | L3]) :-  %  if the first list has a head X and a tail L1, the second list has a head Y and a tail L2, then
    shuffle(L1, L2, L3).

%Problem2, this works
% Base case: If both lists are empty, they are considered doubles.
double([], []).
% Recursive case: Check if the list is a double of the input list.
double([X|TailL1], [X,X|TailL2]) :- double(TailL1, TailL2).

%problem3 this works for all
no_duplicates([], []). 
no_duplicates([X|RestL1], L2) :- no_duplicates(RestL1, TempL2), (member(X, TempL2) ->  L2 = TempL2; L2 = [X|TempL2]).

%problem4 this works
% Base case: If both lists are empty, they are considered the same.
same_elements([], []). % Check if both lists are empty. If they are, return true because they have the same elements (0 elements).
same_elements([H1|L1], L2) :- 
    select(H1, L2, NewL2), % remove the first occurrence of `H1` from `L2`, resulting in a new list `NewL2`.
    same_elements(L1, NewL2). % recursively calls the `same_elements` predicate with the remaining elements of `L1` (represented by `L1`) and the modified list `NewL2`.

    /* select takes 3 arguments: the element to be removed, the original list and the resulting list with the element removed
    
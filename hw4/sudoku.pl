/* ----------- cut here ----------- */
/* 
/* This runs all the simple tests. If it
works correctly, you should see three identical
and completed sudoku tables, and finally the
word false (as test0c will fail.) */
test :-
test0, nl,
test0a, nl,
test0b, nl,
test0c.
/* This is a completly solved solution. */
test0 :-
L = [
[9,6,3,1,7,4,2,5,8],
[1,7,8,3,2,5,6,4,9],
[2,5,4,6,8,9,7,3,1],
[8,2,1,4,3,7,5,9,6],
[4,9,6,8,5,2,3,1,7],
[7,3,5,9,6,1,8,2,4],
[5,8,9,7,1,3,4,6,2],
[3,1,7,2,4,6,9,8,5],
[6,4,2,5,9,8,1,7,3]],
sudoku(L),
printsudoku(L).
/* This has a solution (the one in test0) which
should be found very quickly. */
test0a :-
L = [
[9,_,3,1,7,4,2,5,8],
[_,7,_,3,2,5,6,4,9],
[2,5,4,6,8,9,7,3,1],
[8,2,1,4,3,7,5,_,6],
[4,9,6,8,5,2,3,1,7],
[7,3,_,9,6,1,8,2,4],
[5,8,9,7,1,3,4,6,2],
[3,1,7,2,4,6,9,8,5],
[6,4,2,5,9,8,1,7,3]],
sudoku(L),
printsudoku(L).
/* This has a solution (the one in test0) and
may take a few seconds to find. */
test0b :-
L = [
[9,_,3,1,7,4,2,5,_],
[_,7,_,3,2,5,6,4,9],
[2,5,4,6,_,9,_,3,1],
[_,2,1,4,3,_,5,_,6],
[4,9,_,8,_,2,3,1,_],
[_,3,_,9,6,_,8,2,_],
[5,8,9,7,1,3,4,6,2],
[_,1,7,2,_,6,_,8,5],
[6,4,2,5,9,8,1,7,3]],
sudoku(L),
printsudoku(L).
/* This one obviously has no solution (column 2 has
two nines in it.) and it may take a few seconds
to deduce this. */
test0c :-
L = [
[_,9,3,1,7,4,2,5,8],
[_,7,_,3,2,5,6,4,9],
[2,5,4,6,8,9,7,3,1],
[8,2,1,4,3,7,5,_,6],
[4,9,6,8,5,2,3,1,7],
[7,3,_,9,6,1,8,2,4],
[5,8,9,7,1,3,4,6,2],
[3,1,7,2,4,6,9,8,5],
[6,4,2,5,9,8,1,7,3]],
sudoku(L),
printsudoku(L).
% print sudoku table
printsudoku([]).
printsudoku([H|T]) :-
write(H),nl,
printsudoku(T).

% MA CODE GOES HERE

% This predicate is the entry point for the Sudoku solving process
sudoku(L) :-
    validate_row(L),
    validate_column(L),
    validate_group(L).

validate_row([]).
validate_row([Row|RestRows]) :- 
    are_nums_valid(Row), 
    are_all_different(Row), 
    validate_row(RestRows).

validate_column([]).
validate_column([Col|RestCols]) :- 
    extract_column(Col, ColList), 
    are_all_different(ColList), 
    validate_column(RestCols).

extract_column([], []).
extract_column([H|T], [H|Rest]) :- 
    extract_column(T, Rest).

are_nums_valid([]).
are_nums_valid([Num|Rest]) :- 
    num_is_one_to_nine(Num), 
    are_nums_valid(Rest).

num_is_one_to_nine(X) :- member(X, [1,2,3,4,5,6,7,8,9]).

are_all_different(L) :-
    setof(X, member(X, L), LUnique), % Get unique elements from L
    length(L, Len), % Get length of L
    length(LUnique, Len). % Compare lengths to ensure all elements are different

validate_group([[],[],[],[],[],[],[],[],[]]).
validate_group([[B1,B2,B3|T1],
                 [B4,B5,B6|T2],
                 [B7,B8,B9|T3],
                 [B11,B12,B13|T4],
                 [B14,B15,B16|T5],
                 [B17,B18,B19|T6],
                 [B21,B22,B23|T7],
                 [B24,B25,B26|T8],
                 [B27,B28,B29|T9]]) :- 
    [B1,B2,B3,B4,B5,B6,B7,B8,B9] = L1,
    [B11,B12,B13,B14,B15,B16,B17,B18,B19] = L2,
    [B21,B22,B23,B24,B25,B26,B27,B28,B29] = L3,
    are_all_different(L1),
    are_all_different(L2),
    are_all_different(L3),
    validate_group([T1,T2,T3,T4,T5,T6,T7,T8,T9]).

printsudoku([]).
printsudoku([H|T]) :-
    write(H), nl,
    printsudoku(T).

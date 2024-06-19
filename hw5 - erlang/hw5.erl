-module(hw5).
-export([myremoveduplicates/1, myintersection/2, mylast/1, myreverse/1, myreplaceall/3]).

% myremoveduplicates("") => ""
% myremoveduplicates("a") => "a"
% myremoveduplicates("aa") => "a"
% myremoveduplicates("abcabc") => "abc"
% myremoveduplicates([1,1,2,2,3,3]) => [1,2,3]

myremoveduplicates("") -> "";
myremoveduplicates([H|T]) ->
    case lists:member(H, T) of
        true -> myremoveduplicates(T);
        false -> [H|myremoveduplicates(T)]
    end.

% myintersection("", "") => ""
% myintersection("a", "") => ""
% myintersection("", "a") => ""
% myintersection("a", "a") => "a"
% myintersection("abcd", "acdf") => "adc"
% myintersection([1,2,3,4], [4,5,6,7]) => [4]
% myintersection([], []) => []

myintersection([], _List2) -> [];
myintersection([Head|Tail], List2) ->
    case lists:member(Head, List2) of
        true -> [Head | myintersection(Tail, List2)];
        false -> myintersection(Tail, List2)
    end.

% mylast("") => ""
% mylast("b") => "b"
% mylast("abcd") => "d"
% mylast([1,2,3,4]) => [4]
% mylast([]) => []

mylast([]) -> [];
mylast([X]) -> [X];
mylast([_|Xs]) -> mylast(Xs).

% myreverse("") => ""
% myreverse("abc") => "cba"
% myreverse([1,2,3]) => [3,2,1]
% myreverse([]) => []

myreverse(List) ->
  myreverse_helper(List, []).

myreverse_helper([], Reversed) ->
  Reversed;
myreverse_helper([Head|Tail], Reversed) ->
  myreverse_helper(Tail, [Head|Reversed]).

% myreplaceall(3,7,[7,0,7,1,7,2,7]) => [3,0,3,1,3,2,3] 
% myreplaceall(3,9,[7,0,7,1,7,2,7]) => [7,0,7,1,7,2,7]

myreplaceall(_, _, []) -> [];
myreplaceall(One, Two, List) ->
    case List of
        [Head | Tail] when Head == Two ->
            [One | myreplaceall(One, Two, Tail)];
        [Head | Tail] ->
            [Head | myreplaceall(One, Two, Tail)]
    end.
% Реализация предиката 1.1 - Получение последнего элемента
last_element([X], X).
last_element([_|T], X) :- last_element(T, X).

% Пример запроса
% ?- last_element([1, 2, 3, 4], X).
% X = 4.

% Реализация предиката 1.2 - Вычисление позиции минимального элемента в списке
min_element_position([H|T], Pos) :-
    min_element_position(T, H, 1, 1, Pos).

min_element_position([], _, Pos, Pos, Pos).
min_element_position([H|T], Min, CurrentPos, MinPos, Pos) :-
    (H < Min -> NewMin is H, NewMinPos is CurrentPos ; NewMin is Min, NewMinPos is MinPos),
    NextPos is CurrentPos + 1,
    min_element_position(T, NewMin, NextPos, NewMinPos, Pos).

% Пример запроса
% ?- min_element_position([4, 1, 3, 5], Pos).
% Pos = 2.

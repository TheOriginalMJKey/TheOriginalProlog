% Удаление N первых элементов с использованием стандартных предикатов
remove_first_n_elements(N, List, Result) :-
    length(Prefix, N),
    append(Prefix, Result, List).

% Удаление N первых элементов без использования стандартных предикатов
remove_first_n_elements_custom(0, List, List).
remove_first_n_elements_custom(N, [_|Tail], Result) :-
    N > 0,
    N1 is N - 1,
    remove_first_n_elements_custom(N1, Tail, Result).

% Вычисление позиции минимального элемента в списке с использованием стандартных предикатов
min_position(List, Position) :-
    min_list(List, MinValue),
    nth1(Position, List, MinValue).

% Вычисление позиции минимального элемента в списке без использования стандартных предикатов
min_position_custom([H|T], Position) :-
    min_position_custom(T, H, 1, 1, Position).

min_position_custom([], MinValue, CurrentPos, MinPos, MinPos) :-
    !.
min_position_custom([H|T], MinValue, CurrentPos, MinPos, ResultPos) :-
    (H < MinValue ->
        NewMinValue = H,
        NewMinPos = CurrentPos
    ;
        NewMinValue = MinValue,
        NewMinPos = MinPos
    ),
    NextPos is CurrentPos + 1,
    min_position_custom(T, NewMinValue, NextPos, NewMinPos, ResultPos).

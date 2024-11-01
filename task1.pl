% Получение последнего элемента списка
last_element([X], X).
last_element([_|T], X) :- last_element(T, X).

% Удаление последнего элемента списка
remove_last([_], []).
remove_last([X|Xs], [X|Ys]) :- remove_last(Xs, Ys).

% Удаление трех последних элементов списка
remove_last_three(L, R) :-
    append(R, [_,_,_], L).

% Удаление трех первых элементов списка
remove_first_three([_,_,_|T], T).

% Удаление N первых элементов списка
remove_first_n(_, 0, []).
remove_first_n([H|T], N, [H|R]) :- N > 0, N1 is N - 1, remove_first_n(T, N1, R).

% Удаление N последних элементов списка
remove_last_n(L, N, R) :-
    length(L, Len),
    Len1 is Len - N,
    length(R, Len1),
    append(R, _, L).

% Усечение списка до указанной длины
truncate_list(L, N, R) :-
    length(R, N),
    append(R, _, L).

% Добавление элемента в конец списка
append_element(L, X, R) :- append(L, [X], R).

% Получение N-го элемента списка
nth_element(L, N, X) :-
    nth1(N, L, X).

% Вставка элемента в список на указанную позицию
insert_element(L, X, N, R) :-
    nth1(N, R, X, L).

% Удаление элемента с заданным номером
remove_element(L, N, R) :-
    nth1(N, L, _, R).

% Удаление всех элементов списка по значению
remove_all_elements([], _, []).
remove_all_elements([H|T], H, R) :- remove_all_elements(T, H, R).
remove_all_elements([H|T], X, [H|R]) :- H \= X, remove_all_elements(T, X, R).

% Нахождение элемента списка, следующего за данным
next_element([X,Y|_], X, Y).
next_element([_|T], X, Y) :- next_element(T, X, Y).

% Замена N-го элемента списка на указанный
replace_nth_element(L, N, X, R) :-
    nth1(N, L, _, R1),
    nth1(N, R, X, R1).

% Замена всех элементов списка с указанным значением на другое значение
replace_all_elements([], _, _, []).
replace_all_elements([H|T], H, X, [X|R]) :- replace_all_elements(T, H, X, R).
replace_all_elements([H|T], Y, X, [H|R]) :- H \= Y, replace_all_elements(T, Y, X, R).

% Нахождение номера первого вхождения элемента со заданным значением
find_first_occurrence(L, X, N) :-
    nth1(N, L, X).

% Отделение хвоста, начиная с элемента с данным значением
tail_from_element(L, X, T) :-
    append(_, [X|T], L).

% Подсчет числа вхождений заданного элемента в список
count_occurrences([], _, 0).
count_occurrences([H|T], H, N) :- count_occurrences(T, H, N1), N is N1 + 1.
count_occurrences([H|T], X, N) :- H \= X, count_occurrences(T, X, N).

% Циклический сдвиг списка вправо
rotate_right(L, R) :-
    append(T, [H], L),
    append([H], T, R).

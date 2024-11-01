% Реализация предиката 2.1 - Для каждого студента найти средний балл и статус сдачи
average_grade(Student, Avg, Passed) :-
    findall(Grade, subject(_, [grade(Student, Grade) | _]), Grades),
    sum_list(Grades, Sum),
    length(Grades, Count),
    Avg is Sum / Count,
    (Avg >= 3 -> Passed = yes ; Passed = no).

% Пример запроса
% ?- average_grade('Петров', Avg, Passed).
% Avg = 3.67, Passed = yes.

% Реализация предиката 2.2 - Найти количество не сдавших студентов для каждого предмета
subject_failed_students(Subject, Count) :-
    subject(Subject, Grades),
    include(\=(grade(_, 2)), Grades, FailedGrades),
    length(FailedGrades, Count).

% Пример запроса
% ?- subject_failed_students('Логическое программирование', Count).
% Count = 2.

% Реализация предиката 2.3 - Найти студента с максимальным средним баллом в группе
max_avg_student(Group, Student, MaxAvg) :-
    group(Group, Students),
    findall(Avg, (member(Student, Students), average_grade(Student, Avg, _)), Avgs),
    max_list(Avgs, MaxAvg),
    member(Student, Students), average_grade(Student, MaxAvg, _).

% Пример запроса
% ?- max_avg_student(101, Student, MaxAvg).
% Student = 'Петровский', MaxAvg = 4.0.

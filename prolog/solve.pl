%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tanner Kvarfordt               %
% I have no idea what I'm doing  %
%                                %
% CS4700                         %
% Dr. Dyreson                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% -------------------------- Movement Rules -------------------------- %

% Try a move in the "up" direction, assumes Row and Column are bound.
try(Row, Column, NextRow, NextColumn) :- NextRow is Row, NextColumn is Column - 1.
% Try a move in the "down" direction, assumes Row and Column are bound.
try(Row, Column, NextRow, NextColumn) :- NextRow is Row, NextColumn is Column + 1.
% Try a move in the "right" direction, assumes Row and Column are bound.
try(Row, Column, NextRow, NextColumn) :- NextRow is Row + 1, NextColumn is Column.
% Try a move in the "left" direction, assumes Row and Column are bound.
try(Row, Column, NextRow, NextColumn) :- NextRow is Row - 1, NextColumn is Column.

% move(Maze, List, NewList, Row, Column, GoalRow, GoalColumn) - moves, 
%   and keep on moving until the GoalRow and GoalColumn coordinates 
%   are reached. List is the list of previous moves (important to check 
%   that the current move is not one previously made), NewList will be 
%   bound to the list of successful moves in a solved maze.

%
%   Recursive case still needed.

% -------------------------- Printing Rules -------------------------- %

% Prints the contents of a list
printList([H | T]) :- write(H), write('\n'), printList(T).

% Print the top or bottom walls of a Maze
printTop(Maze) :- put('+'), mazeSize(Maze, _, Y), \+ printDashes(Y), put('+').
printDashes(X) :- dif(X, 0), Y is X - 1, write('-'), printDashes(Y).

% Print a cell with a move in it
printMove(Maze, [H | _], Row, Column) :- maze(Maze, Row, Column, open), nth0(1, H, Column), nth0(0, H, Row), put('*').

% Print a barrier.
printCell(Maze, _, Row, Column) :- maze(Maze, Row, Column, barrier), write('x').

% Print an open cell.
printCell(Maze, List, Row, Column) :- \+ printMove(Maze, List, Row, Column), maze(Maze, Row, Column, open), write(' ').

% Print a row of cells
% Cols defines the number of columns left to print in the row
printRow(Maze, List, Row, Column, Cols) :- 
    dif(Cols, 0), 
    ((printCell(Maze, List, Row, Column)) -> 
    ( 
        ((X is Column + 1, Y is Cols - 1, maze(Maze, Row, Column, barrier), filterList([Row, Column], List, T))
            -> (printRow(Maze, T, Row, X, Y)))
        ;
        (X is Column + 1, Y is Cols - 1, printRow(Maze, List, Row, X, Y))) 
    ; 
    (X is Column + 1, Y is Cols - 1, removeHead(List, T), printRow(Maze, T, Row, X, Y))).

% Print a row of a maze
printRow(Maze, Row, List) :- mazeSize(Maze, _, Cols), printRow(Maze, List, Row, 1, Cols).

% Print the rows of a maze
printRows(Maze, Rows, StartRow, List) :- 
    dif(Rows, 0), 
    put('|'),
    \+ printRow(Maze, StartRow, List),
    put('|'), put('\n'), 
    Z is Rows - 1, W is StartRow + 1,
    printRows(Maze, Z, W, List).

% Print a maze
% TODO: figure out why movelists that contain moves from one row to another don't work past the first row
printMaze(Maze, List) :- 
    printTop(Maze), put('\n'),
    mazeSize(Maze, Rows, _),
    \+ printRows(Maze, Rows, 1, List),
    printTop(Maze), put('\n').

% -------------------------- Solving Rules --------------------------- %

solve(Maze) :- true.

% ------------------ Misc Helper Facts and Rules --------------------- %

removeHead([_ | T], T).

are_identical(X, Y) :- Y == X.

filterList(A, In, Out) :- exclude(are_identical(A), In, Out).

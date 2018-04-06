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

% Print a barrier.
printCell(Maze, _, Row, Column) :- maze(Maze, Row, Column, barrier), write('x').
% Print an open cell.
printCell(Maze, _, Row, Column) :- maze(Maze, Row, Column, open), write(' ').
% Print an edge
printCell(Maze, _, Row, Column) :- mazeSize(Maze, X, Y), ((Y == Column) ; (Column == 0)), put('|').

% Print the top or bottom walls of a Maze
printTop(Maze) :- put('+'), mazeSize(Maze, X, Y), \+ printDashes(Y), put('+').
printDashes(X) :- dif(X, 0), Y is X - 1, write('-'), printDashes(Y).

% Print a row of cells
% Cols defines the number of columns left to print in the row
printRow(Maze, _, Row, Column, Cols) :- 
    dif(Cols, 0), printCell(Maze, _, Row, Column), 
    X is Column + 1, Y is Cols - 1, printRow(Maze, _, Row, X, Y).
% Print a row of a maze
printRow(Maze, Row, [H | T]) :- mazeSize(Maze, _, Cols), Y is Cols + 2, printRow(Maze, _, Row, 0, Y).

printMaze(Maze, [H | T]) :- printTop(Maze), /* TODO printRows ,*/ printTop(Maze).

% -------------------------- Solving Rules --------------------------- %

solve(Maze) :- true.

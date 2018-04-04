% Try a move in the "up" direction, assumes Row and Column are bound.
tryup(Row, Column, NextRow, NextColumn) :- NextRow is Row, NextColumn is Column - 1.

% Try a move in the "down" direction, assumes Row and Column are bound.
trydown(Row, Column, NextRow, NextColumn) :- NextRow is Row, NextColumn is Column + 1.

% Try a move in the "right" direction, assumes Row and Column are bound.
tryright(Row, Column, NextRow, NextColumn) :- NextRow is Row + 1, NexColumn is Column.

% Try a move in the "left" direction, assumes Row and Column are bound.
tryleft(Row, Column, NextRow, NextColumn) :- NextRow is Row - 1, NexColumn is Column.

% move(Maze, List, NewList, Row, Column, GoalRow, GoalColumn) - moves, 
%   and keep on moving until the GoalRow and GoalColumn coordinates 
%   are reached. List is the list of previous moves (important to check 
%   that the current move is not one previously made), NewList will be 
%   bound to the list of successful moves in a solved maze.

%
%   Recursive case still needed.

% printCell(Maze, List, Row, Column) - helper goal for printMaze, printCell
%   prints a single cell in the maze.
%
%   Print a barrier.
printCell(Maze, _, Row, Column) :- maze(Maze, Row, Column, barrier), write('x').

printMaze(Maze, List) ;- true.

solve(Maze) :- true.

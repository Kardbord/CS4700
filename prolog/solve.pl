%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tanner Kvarfordt               %
% I have no idea what I'm doing  %
%                                %
% CS4700                         %
% Dr. Dyreson                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% -------------------------- Movement Rules -------------------------- %

% Check if the goal has been reached
% Assumes all input but SolnList is bound.
move(Maze, List, SolnList, Row, Column, GoalRow, GoalColumn) :- 
    maze(Maze, Row, Column, open),
    \+ isInList([Row, Column], List),
    Row is GoalRow,
    Column is GoalColumn,
    append(List, [[Row, Column]], SolnList).

% Try a move in the 'up' direction
% Assumes all input but SolnList is bound.
move(Maze, List, SolnList, Row, Column, GoalRow, GoalColumn) :- 
    maze(Maze, Row, Column, open),
    \+ isInList([Row, Column], List),
    append(List, [[Row, Column]], Result),
    Up is Row + 1,
    move(Maze, Result, SolnList, Up, Column, GoalRow, GoalColumn).

% Try a move in the 'right' direction
% Assumes all input but SolnList is bound.
move(Maze, List, SolnList, Row, Column, GoalRow, GoalColumn) :- 
    maze(Maze, Row, Column, open),
    \+ isInList([Row, Column], List),
    append(List, [[Row, Column]], Result),
    Right is Column + 1,
    move(Maze, Result, SolnList, Row, Right, GoalRow, GoalColumn).

% Try a move in the 'down' direction.
% Assumes all input but SolnList is bound.
move(Maze, List, SolnList, Row, Column, GoalRow, GoalColumn) :- 
    maze(Maze, Row, Column, open),
    \+ isInList([Row, Column], List),
    append(List, [[Row, Column]], Result),
    Down is Row - 1,
    move(Maze, Result, SolnList, Down, Column, GoalRow, GoalColumn).

% Try a move in the 'left' direction.
% Assumes all input but SolnList is bound.
move(Maze, List, SolnList, Row, Column, GoalRow, GoalColumn) :- 
    maze(Maze, Row, Column, open),
    \+ isInList([Row, Column], List),
    append(List, [[Row, Column]], Result),
    Left is Column - 1,
    move(Maze, Result, SolnList, Row, Left, GoalRow, GoalColumn).

% -------------------------- Solving Rules --------------------------- %

% Solve a maze, print the solution list, then print the maze with the solution
% Assumes Maze is bound.
solve(Maze) :- 
    mazeSize(Maze, Rows, Cols), move(Maze, [], SolnList, 1, 1, Rows, Cols),
    \+ printList(SolnList), printMaze(Maze, SolnList).

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
    filterListNot([Row, _], List, RowMoves),
    ((printCell(Maze, RowMoves, Row, Column)) -> 
    ( 
        ((X is Column + 1, Y is Cols - 1, maze(Maze, Row, Column, barrier), filterList([Row, Column], RowMoves, T))
            -> (printRow(Maze, T, Row, X, Y)))
        ;
        (X is Column + 1, Y is Cols - 1, printRow(Maze, RowMoves, Row, X, Y))
    ) 
    ; 
    (X is Column + 1, Y is Cols - 1, removeHead(RowMoves, T), printRow(Maze, T, Row, X, Y))).

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
printMaze(Maze, List) :- 
    printTop(Maze), put('\n'),
    mazeSize(Maze, Rows, _),
    \+ printRows(Maze, Rows, 1, List),
    printTop(Maze), put('\n').

% ------------------ Misc Helper Facts and Rules --------------------- %

% Remove the first element from a list.
% Assumes [_ | T] is bound.
removeHead([_ | T], T).

% Check if two items are identical
are_identical(X, Y) :- Y == X.

% Check if two items are not identical
are_notidentical(X, Y) :- Y \= X.

% Remove any @A from @In
% Assumes A and In are bound.
filterList(A, In, Out) :- exclude(are_identical(A), In, Out).

% Remove anything that isn't @A from @In
% Assumes A and In are bound.
filterListNot(A, In, Out) :- exclude(are_notidentical(A), In, Out).

% Check if A is in a list
isInList(A, [A | _]) :- true.
isInList(A, [_ | T]) :- isInList(A, T).

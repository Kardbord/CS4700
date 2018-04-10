% Load the maze.pl file
?- consult(maze).
% Load the solve.pl file
?- consult(solve).

% Solve the small maze
?- solve(small).

% Solve the nobarrier maze
?- solve(nobarrier).

% Try to solve the unsolvable maze
?- solve(unsolvable).

% Solve the unknown maze
?- solve(unknown).

% Solve the second unknown maze
?- solve(unknown2).

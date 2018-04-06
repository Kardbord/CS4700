% Load the maze.pl file
?- consult(maze).
% Load the solve.pl file
?- consult(solve).

% Should print the small maze
?- printMaze(small, []).

% Should print the small maze
?- printList([]).

% Solve the small maze
?- solve(small).

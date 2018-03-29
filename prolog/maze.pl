% This file contains some test mazes, you can add your own if you like

% Need to group the size facts or Prolog complains
mazeSize(small, 4, 7).
mazeSize(nobarrier, 7, 7).
mazeSize(unsolvable, 4, 4).
mazeSize(unknown, 4, 5).

% A small maze
maze(small, 1, 1, open).
maze(small, 1, 2, open).
maze(small, 1, 3, open).
maze(small, 1, 4, open).
maze(small, 1, 5, open).
maze(small, 1, 6, open).
maze(small, 1, 7, open).
maze(small, 2, 1, open).
maze(small, 2, 2, barrier).
maze(small, 2, 3, open).
maze(small, 2, 4, open).
maze(small, 2, 5, open).
maze(small, 2, 6, open).
maze(small, 2, 7, open).
maze(small, 3, 1, open).
maze(small, 3, 2, barrier).
maze(small, 3, 3, open).
maze(small, 3, 4, open).
maze(small, 3, 5, open).
maze(small, 3, 6, open).
maze(small, 3, 7, open).
maze(small, 4, 1, open).
maze(small, 4, 2, barrier).
maze(small, 4, 3, open).
maze(small, 4, 4, open).
maze(small, 4, 5, open).
maze(small, 4, 6, open).
maze(small, 4, 7, open).

% A no barrier maze, it has no barrier facts, see the size facts above.
maze(nobarrier, 1, 1, open).
maze(nobarrier, 1, 2, open).
maze(nobarrier, 1, 3, open).
maze(nobarrier, 1, 4, open).
maze(nobarrier, 1, 5, open).
maze(nobarrier, 1, 6, open).
maze(nobarrier, 1, 7, open).
maze(nobarrier, 2, 1, open).
maze(nobarrier, 2, 2, open).
maze(nobarrier, 2, 3, open).
maze(nobarrier, 2, 4, open).
maze(nobarrier, 2, 5, open).
maze(nobarrier, 2, 6, open).
maze(nobarrier, 2, 7, open).
maze(nobarrier, 3, 1, open).
maze(nobarrier, 3, 2, open).
maze(nobarrier, 3, 3, open).
maze(nobarrier, 3, 4, open).
maze(nobarrier, 3, 5, open).
maze(nobarrier, 3, 6, open).
maze(nobarrier, 3, 7, open).
maze(nobarrier, 4, 1, open).
maze(nobarrier, 4, 2, open).
maze(nobarrier, 4, 3, open).
maze(nobarrier, 4, 4, open).
maze(nobarrier, 4, 5, open).
maze(nobarrier, 4, 6, open).
maze(nobarrier, 4, 7, open).
maze(nobarrier, 5, 1, open).
maze(nobarrier, 5, 2, open).
maze(nobarrier, 5, 3, open).
maze(nobarrier, 5, 4, open).
maze(nobarrier, 5, 5, open).
maze(nobarrier, 5, 6, open).
maze(nobarrier, 5, 7, open).
maze(nobarrier, 6, 1, open).
maze(nobarrier, 6, 2, open).
maze(nobarrier, 6, 3, open).
maze(nobarrier, 6, 4, open).
maze(nobarrier, 6, 5, open).
maze(nobarrier, 6, 6, open).
maze(nobarrier, 6, 7, open).
maze(nobarrier, 7, 1, open).
maze(nobarrier, 7, 2, open).
maze(nobarrier, 7, 3, open).
maze(nobarrier, 7, 4, open).
maze(nobarrier, 7, 5, open).
maze(nobarrier, 7, 6, open).
maze(nobarrier, 7, 7, open).

% An unsolvable maze, it has a barrier at row 3
maze(unsolvable, 1, 1, open).
maze(unsolvable, 1, 2, open).
maze(unsolvable, 1, 3, open).
maze(unsolvable, 1, 4, open).
maze(unsolvable, 2, 1, open).
maze(unsolvable, 2, 2, open).
maze(unsolvable, 2, 3, open).
maze(unsolvable, 2, 4, open).
maze(unsolvable, 3, 1, barrier).
maze(unsolvable, 3, 2, barrier).
maze(unsolvable, 3, 3, barrier).
maze(unsolvable, 3, 4, barrier).
maze(unsolvable, 4, 1, open).
maze(unsolvable, 4, 2, open).
maze(unsolvable, 4, 3, open).
maze(unsolvable, 4, 4, open).

% An unknnown maze
maze(unknown, 1, 1, open).
maze(unknown, 1, 2, barrier).
maze(unknown, 1, 3, open).
maze(unknown, 1, 4, open).
maze(unknown, 1, 5, open).
maze(unknown, 2, 1, open).
maze(unknown, 2, 2, barrier).
maze(unknown, 2, 3, open).
maze(unknown, 2, 4, barrier).
maze(unknown, 2, 5, open).
maze(unknown, 3, 1, open).
maze(unknown, 3, 2, barrier).
maze(unknown, 3, 3, open).
maze(unknown, 3, 4, barrier).
maze(unknown, 3, 5, open).
maze(unknown, 4, 1, open).
maze(unknown, 4, 2, open).
maze(unknown, 4, 3, open).
maze(unknown, 4, 4, barrier).
maze(unknown, 4, 5, open).

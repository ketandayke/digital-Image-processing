clc;
clear;

%% STEP 1: CREATE THE SKELETON (MASK MATRIX)
% M is a 3x9 matrix
% 1  -> number will be placed here
% 0  -> empty cell
M = zeros(3,9);

% Each row must have exactly 5 numbers
for r = 1:3
    chosen_columns = randperm(9, 5);   % pick 5 unique columns
    M(r, chosen_columns) = 1;
end

%% STEP 2: ENSURE EVERY COLUMN HAS AT LEAST ONE NUMBER
% Tambola rule: No column can be empty
while any(sum(M) == 0)
    empty_col = find(sum(M) == 0, 1);   % column with 0 numbers
    rich_col  = find(sum(M) > 1, 1);    % column with >1 numbers

    % Pick a row where rich_col has a number
    row_idx = find(M(:, rich_col) == 1, 1);

    % Move number from rich column to empty column
    M(row_idx, rich_col) = 0;
    M(row_idx, empty_col) = 1;
end

%% STEP 3: FILL REAL TAMBOLA NUMBERS
Ticket = zeros(3,9);

for c = 1:9
    % Column-wise number ranges
    if c == 1
        lower = 1; upper = 9;
    elseif c == 9
        lower = 80; upper = 90;
    else
        lower = (c-1)*10; upper = lower + 9;
    end

    % Rows that need numbers in this column
    rows_to_fill = find(M(:, c) == 1);
    count = length(rows_to_fill);

    % Random unique numbers from column range
    pool = lower:upper;
    selected = pool(randperm(length(pool), count));

    % Tambola rule: numbers go top-to-bottom in increasing order
    selected = sort(selected);

    % Place them
    Ticket(rows_to_fill, c) = selected;
end

disp(Ticket);

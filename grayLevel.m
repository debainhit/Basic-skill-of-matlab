f = [ 1 1 7 5 3 2;
    5 1 6 1 2 5;
    8 8 6 8 1 2;
    4 3 4 5 5 1;
    8 7 8 7 6 2;
    7 8 6 2 6 2
];
f = mat2gray(f);
class(f)
offsets = [0 1];
[GS, IS] = graycomatrix( f, 'NumLevels', 8 , 'offset',offsets);
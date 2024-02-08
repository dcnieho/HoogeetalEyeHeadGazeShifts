function [newx,newy] = screen2fick(x,y,z)

r2d         = 180/pi;

% convert to angles
d           = sqrt(sqr(x) + sqr(y) + sqr(z));
newx        = r2d * atan(x./z); 
newy        = r2d * atan(y./d);
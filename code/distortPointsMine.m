function distortedPoints = distortPointsMine(points, intrinsicMatrix, ...
    radialDistortion, tangentialDistortion)
% changed from mathworks version to support 6-param radial distortion

%   Copyright 2014-2020 The MathWorks, Inc.

%#codegen

% unpack the intrinisc matrix
cx = intrinsicMatrix(3, 1);
cy = intrinsicMatrix(3, 2);
fx = intrinsicMatrix(1, 1);
fy = intrinsicMatrix(2, 2);
skew = intrinsicMatrix(2, 1);

% center the points
center = [cx, cy];
centeredPoints = bsxfun(@minus, points, center);

% normalize the points
yNorm = centeredPoints(:, 2, :) ./ fy;
xNorm = centeredPoints(:, 1, :) ./ fx;

% compute radial distortion
r2 = xNorm .^ 2 + yNorm .^ 2;
r4 = r2 .* r2;
r6 = r2 .* r4;

k = zeros(1, 6, 'like', radialDistortion);
k(1:2) = radialDistortion(1:2);
if numel(radialDistortion) < 3
    k(3) = 0;
else
    k(3) = radialDistortion(3);
end
if numel(radialDistortion) > 3
    assert(numel(radialDistortion)==6, 'radialDistortion should have 2, 3 or 6 elements')
    k(4:6) = radialDistortion(4:6);
else
    k(4:6) = 0;
end

alpha  = 1 + k(1) * r2 + k(2) * r4 + k(3) * r6;
ialpha = 1 + k(4) * r2 + k(5) * r4 + k(6) * r6;
radFac = alpha./ialpha;

% compute tangential distortion
p = tangentialDistortion;
xyProduct = xNorm .* yNorm;
dxTangential = 2 * p(1) * xyProduct + p(2) * (r2 + 2 * xNorm .^ 2);
dyTangential = p(1) * (r2 + 2 * yNorm .^ 2) + 2 * p(2) * xyProduct;

% apply the distortion to the points
normalizedPoints = [xNorm, yNorm];
distortedNormalizedPoints = normalizedPoints .* [radFac, radFac] + ...
    [dxTangential, dyTangential];

% convert back to pixels
distortedPointsX = distortedNormalizedPoints(:, 1, :) * fx + cx + ...
    skew * distortedNormalizedPoints(:, 2, :);
distortedPointsY = distortedNormalizedPoints(:, 2, :) * fy + cy;

distortedPoints = [distortedPointsX, distortedPointsY];
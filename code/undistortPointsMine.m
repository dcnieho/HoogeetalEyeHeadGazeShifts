function [undistortedPoints, reprojectionErrors] = undistortPointsMine(points, cameraParams, radialOverride)

if isa(points, 'double')
    outputClass = 'double';
else
    outputClass = 'single';
end

pointsDouble = double(points);

if isa(cameraParams, 'cameraParameters')
    intrinsicParams = cameraParams;
else
    intrinsicParams = cameraParams.CameraParameters;
end

if nargin<3
    radialOverride = [];
end

undistortedPointsDouble = undistortPointsImpl(intrinsicParams, pointsDouble, radialOverride);
undistortedPoints = cast(undistortedPointsDouble, outputClass);

if nargout > 1
    redistortedPoints = distortPointsMine(undistortedPointsDouble, camparam.IntrinsicMatrix,camparam.RadialDistortion,camparam.TangentialDistortion);
    errorsDouble = sqrt(sum((pointsDouble - redistortedPoints).^ 2 , 2));
    reprojectionErrors = cast(errorsDouble, outputClass);
end

function undistortedPoints = undistortPointsImpl(camparam, points, radialOverride)
options = optimset('Display', 'off');
if ~isempty(radialOverride)
    radialDistortion = radialOverride;
else
    radialDistortion = camparam.RadialDistortion;
end
undistortedPoints = lscftsh(@(x,~) distortPointsMine(x,camparam.IntrinsicMatrix,radialDistortion,camparam.TangentialDistortion), points, [], points, [], [], options);

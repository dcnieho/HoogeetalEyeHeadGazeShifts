function [exd,eyd] = pix2degPupilInvisible(exp,eyp,serial)

% exp, horizontal component Eye in pixels of the scene camera image
% eyp, vertical component Eye in pixels of the scene camera image
% serial, serial of the scene camera of the pupil invisible glasses
% exd horizontal eye orientation in degrees
% eyd vertical eye orientation in degrees

hres                = [1088 1080]/2;                % 1088 1080 resolution scene camera pupil invisible

switch serial
    case 'serialofmyscenecamera'                    % here put the serial of your scene camera and below the correct values
        intrinsicMatrix     = [758.4496713313719, 0.0, 527.8879057509266; 0.0, 757.7808640950572, 533.5321970486801; 0. 0. 1.];
        tangent             = [0.0004573976158320329, 0.0009418012364615087];
        rad                 = [-0.1247860767994248, 0.09942132620500195, 0.017099523456675172, 0.20107966451590206, 0.010423831533627314, 0.062261038589581784];
    otherwise
        error('You need to download your scene camera calibration: see https://api.cloud.pupil-labs.com/v2/hardware/%s/calibration.v1?json', serial);
end
camparam            = cameraIntrinsics(intrinsicMatrix([1,5]),intrinsicMatrix([7,8]),[1088 1080],'RadialDistortion',rad(1:3),'TangentialDistortion',tangent);

qnotnan             = ~isnan(exp) & ~isnan(eyp);
exp                 = exp(qnotnan);
eyp                 = eyp(qnotnan);

gaz                 = undistortPointsMine([exp eyp],camparam,rad);

hresw               = pointsToWorld(camparam,eye(3),[0 0 1],hres);
gazw                = pointsToWorld(camparam,eye(3),[0 0 1],gaz) - hresw;

gazw                = [gazw ones(size(gazw,1),1)];
gazw                = gazw./repmat(sqrt(sum(gazw.^2,2)),1,3);

[gazx,gazy]         = screen2fick(gazw(:,1),gazw(:,2),gazw(:,3));
exd(qnotnan)        = gazx;
eyd(qnotnan)        = gazy;

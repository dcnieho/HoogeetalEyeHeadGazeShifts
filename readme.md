This repository contains the experiment data and code used for the
article [_Hooge, I.T.C., Niehorster, D.C., Nyström, M. & Hessels, R.S.
(2024). Large eye–head gaze shifts measured with a wearable
eye tracker and an industrial camera. Behavior Research Methods.
doi:10.3758/s13428-023-02316-w_](https://doi.org/10.3758/s13428-023-02316-w)

When using the data in this repository in your work, please cite
Hooge et al. (2024).

For more information or questions, e-mail: i.hooge@uu.nl /
dcnieho@gmail.com. The latest version of this repository is available
from www.github.com/dcnieho/HoogeetalEyeHeadGazeShifts

The data and code are licensed under the Creative Commons
Attribution-NonCommercial-ShareAlike 4.0 (CC NC-BY-SA 4.0) license.

Contents:
The `data` folder contains 5 participant folders (p1 to p5). Each
particpant folder contains 7 tsv files. `A1.tsv` to `A6.tsv` are data
files for the different target to target distances (A1 for the smallest,
A6 for the largest). `CAL.tsv` contains the data for the calibration trial
(see Fig 2 in the article). Each file consists of 4 columns, time (s),
horizontal eye orientation (deg), horizontal head orientation (deg) and
horizontal gaze orientation (deg).

The `code` folder contains MATLAB code to convert the eye orientation signals
from pixel coordinates in the eye-tracker scene camera image (from the Pupil
Invisble eye tracker) to gaze directions. The main function is called
`pix2degPupilInvisible.m`.


## Version History
N.B.: complete details of changes made are available on
[github](https://github.com/dcnieho/HoogeetalEyeHeadGazeShifts)
### Version 0.1
- placeholder
### Version 1.0
- data and code release



## Data disclaimer, limitations and conditions of release
By downloading this data (including the code), you expressly agree to the following conditions of release and acknowledge the following disclaimers issued by the authors:

### A. Conditions of Release
Data are available by permission of the authors. Use of data in publications,
either digital or hardcopy, must be cited as follows: [Hooge, I.T.C.,
Niehorster, D.C., Nyström, M. & Hessels, R.S. (2024). Large eye–head gaze
shifts measured with a wearable eye tracker and an industrial camera. Behavior
Research Methods. doi:10.3758/s13428-023-02316-w](https://doi.org/10.3758/s13428-023-02316-w)

### B. Disclaimer of Liability
The authors shall not be held liable for any improper or incorrect use or application of the data provided, and assume no responsibility for the use or application of the data or interpretations based on the data, or information derived from interpretation of the data. In no event shall the authors be liable for any direct, indirect or incidental damage, injury, loss, harm, illness or other damage or injury arising from the release, use or application of these data. This disclaimer of liability applies to any direct, indirect, incidental, exemplary, special or consequential damages or injury, even if advised of the possibility of such damage or injury, including but not limited to those caused by any failure of performance, error, omission, defect, delay in operation or transmission, computer virus, alteration, use, application, analysis or interpretation of data.

### C. Disclaimer of Accuracy of Data
No warranty, expressed or implied, is made regarding the accuracy, adequacy, completeness, reliability or usefulness of any data provided. These data are provided "as is." All warranties of any kind, expressed or implied, including but not limited to fitness for a particular use, freedom from computer viruses, the quality, accuracy or completeness of data or information, and that the use of such data or information will not infringe any patent, intellectual property or proprietary rights of any party, are disclaimed. The user expressly acknowledges that the data may contain some nonconformities, omissions, defects, or errors. The authors do not warrant that the data will meet the user's needs or expectations, or that all nonconformities, omissions, defects, or errors can or will be corrected. The authors are not inviting reliance on these data, and the user should always verify actual data.



# Coding Challenge
# Part 1
Please read [The Sreenivasan Lab Coding Manual](https://github.com/vbabushkin/CodingChallengeSreenivasanLabGitHub/blob/master/The%20Sreenivasan%20Lab%20Coding%20Manual.docx) before starting the coding challenge.
# Part 2
You are provided with basic experimental code called TRST  (Triangle Rotated Stimulus Test).  If you already have coding experience, then you can work with the more challenging version of the code TRST_difficult. 
In the TRST folder, locate [main.m](https://github.com/vbabushkin/CodingChallengeSreenivasanLabGitHub/blob/master/TRST/main.m) and open it in Matlab, run it and go through all the trials. 
As soon as you run main.m, you will see the following prompt in the Command Line window, asking you to submit a subject and session number. You can type any integer for the subject and session number. 

`
Please type subject number: 0
`

`
Please type session number: 0
`

Type 1 for the prompt asking for the distance from the screen:

`
Is the Viewing Distance -- 60.0cm (Yes = 1, No = 0)  1
`
# Coding Challenge Questions
1.	The user results file and log file overwrites each time you run main.m (for a given date). Please modify the code to prevent overwriting of data files.
2.	Each time the code is run, it generates a new taskmap for any subject except subject # 0. However, if the taskmap for a given subject already exists, it does not allow you to proceed with this subject within the same session. You will see the following error:


`
Error using initSubjectInfo (line 57)
`

`
ERROR! Result data file already exists! Choose a different subject/session number.
`

This is a good practice in order to prevent overwriting of files. Add a feature allowing the experimenter to select whether the taskmap file should be overwritten. 

3. The probe triangle orientation is selected randomly. However, in several cases it overlays the stimulus triangle and the subject can just submit their response without needing to rotate the triangle. Modify the code to ensure the difference between the stimulus and presented probe triangle orientation is no less than 30 degrees. 

4. Currently the task consists of 10 trials. If the number of trials increases, we need to let the subject rest after a certain number of trials is completed. Please introduce a functionality into the program that splits the number of trials into a specified number of blocks. There should be a break screen with the following text: 'End of Block (block number). Press Space to Continue'. This functionality should allow the participant to start the next block themselves by pressing the Space Key.

5.	Add code to show feedback on the screen at the end of every trial. The feedback must include the number of points earned for the current trial, the total number of points earned and the reported orientation (black triangle) overlaid on the actual orientation (white triangle).
6.	Modify the code to allow the experimenter to exit the program any time the ‘Q’ key is pressed. Make sure that adding this functionality updates 'resReport' so that no data is lost if the program is quit.
7.	For some MEG and fMRI experiments we use a buttonbox to submit responses and a dial for rotations. Since you don't have a dial or a buttonbox, you will have to imitate this functionality with your computer keyboard. Create a new version of the code to allow subject to rotate the cursor (‘t’ key – rotates clockwise, ‘b’ –key counterclockwise) and lock your responses pressing any key from 1 to 4 (imitates buttonbox functionality). Use this sample code [DialCode.m](https://github.com/vbabushkin/CodingChallengeSreenivasanLabGitHub/blob/master/DialCode/DialCode.m) to give yourself an idea of how key presses can be implemented to rotate the cursor location rather than using the mouse.

## Part 3
There are different ways to measure working memory capacity. One of these is closely related to the notion of “set size” – the number of items stored in the working memory.  Currently our code asks a participant to remember only one stimulus.
1.	Modify the code to remember five stimuli. Create 12 different orientations and select 5 at random for each trial. For example below we have selected following 5 out of 12 main orientations [30, 90, 150, 270, 340]. The triangles must be placed in these orientations plus some jitter between [-10,10]  degrees. Please ensure the triangles are not overlapping. Each triangle should also have a randomly selected orientation.

![alt text](https://github.com/vbabushkin/CodingChallengeSreenivasanLabGitHub/blob//master/img1.png)

2.	In Part 2 the response triangle was presented in the center of the screen. Now that we have five stimuli we need to pick one of them randomly for the participant to report on.  Modify the response screen to present this randomly picked stimulus at its corresponding location. In addition it should be presented in a random orientation so that the subject has to adjust the orientation of the triangle. We expect something like this:

![alt text](https://github.com/vbabushkin/CodingChallengeSreenivasanLabGitHub/blob/master/img2.png)

3.	Make sure the feedback reflects these changes.

## Part 4
This part requires you to create a version of the code in which subjects report color rather than orientation. So, every triangle needs to have a different color and the subject will be asked to report the color of one of the five triangles.

1.	Make another version of task that cues the color. From the supportFiles folder, load the colorwheel360.mat and on each trial, pick 5 random colors for the 5 triangles. Make sure that none of the colors are repeated. You should get something similar to the following stimulus screen:

![alt text](https://github.com/vbabushkin/CodingChallengeSreenivasanLabGitHub/blob/master/img5.png)

2. Replace the orientation wheel with the colorwheel using the code in [drawColorwheel.m](https://github.com/vbabushkin/CodingChallengeSreenivasanLabGitHub/blob/master/DrawColorwheel/drawColorwheel.m)

3. Modify the code so that the color of the triangle changes with the position of the cursor on the colorwheel as it is rotated.

![alt text](https://github.com/vbabushkin/CodingChallengeSreenivasanLabGitHub/blob/master/img4.png)

4.	Make sure the probe screen duration is limited, so the subject has to respond within 20 seconds. If no response has been received – the program should mark the corresponding values in the datafile as “NaN”  and move on to the next trial.



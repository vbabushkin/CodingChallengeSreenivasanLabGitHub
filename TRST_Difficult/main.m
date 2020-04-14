%  This is a very simple template of experiment with triangular stimulus
%  TRST -- Triangle Rotated Stimulus Test

clear all
close all

global parameters;
global kbx;
global screen;
global tc;
global taskMap;
global resReport;
global totalTime;

Screen('Preference', 'SkipSyncTests', 1);
Screen('Preference', 'Verbosity', 0);

%   Load parameters
%--------------------------------------------------------------------------------------------------------------------------------------%
loadParameters();
 
%   Initialize the subject info
%--------------------------------------------------------------------------------------------------------------------------------------%
initSubjectInfo();

%  Hide Mouse Cursor

if parameters.hideCursor
    HideCursor()
end

%   Initialize screen
%--------------------------------------------------------------------------------------------------------------------------------------%
initScreen(); %change transparency of screen from here

%   Convert values from visual degrees to pixels
%--------------------------------------------------------------------------------------------------------------------------------------%
visDegrees2Pix();

%   Initialize input devices
%--------------------------------------------------------------------------------------------------------------------------------------%
initKeyboard();
 
%   Generate task map
%--------------------------------------------------------------------------------------------------------------------------------------%
taskMap = generateTaskMap();
% 

startTime = GetSecs;
%  run the experiment
%--------------------------------------------------------------------------------------------------------------------------------------%
%  

% To suspend the output of keyboard to command line
ListenChar(2); 

runExperiment();
% 
%  save the data
%--------------------------------------------------------------------------------------------------------------------------------------%
% 
totalTime = GetSecs-startTime;
writetable(struct2table(resReport),parameters.datafile);

%save taskmap if modified
save(parameters.taskMapFile,'taskMap');
saveLogFile();

%   Clear the keyboard buffer
KbQueueRelease(kbx); 

%   To allow the output of keyboard to command line
ListenChar(1);

% Show cursor back
ShowCursor('Arrow');

sca;


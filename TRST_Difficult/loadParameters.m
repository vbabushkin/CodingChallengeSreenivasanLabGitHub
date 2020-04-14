%   loads experimental parameters
function loadParameters()
    global parameters;
    global screen;
    %---------------------------------------------------------------------%
    % 
    %---------------------------------------------------------------------%
    %   show/hide cursor on probe window
    parameters.hideCursor = true;
    
    %   to set the demo mode with half-transparent screen
    parameters.isDemoMode = false;
    
    %   screen transparency in demo mode
    parameters.transparency = 0.8;
    
    %   to make screen background darker (close to 0) or lighter (close to 1)
    parameters.greyFactor = 0.6; 
    
 
    parameters.viewDistance = 60;%default
    
    %---------------------------------------------------------------------%
    % study parameters
    %---------------------------------------------------------------------%
    %    set the name of your study
    parameters.currentStudy = 'TRST';
    
    %    set the version of your study
    parameters.currentStudyVersion = 1;
    
    %    set the number of current run
    parameters.runNumber = 1;
    
    %    set the name of current session (modifiable in the command prompt)
    parameters.session = 1;
    
    %    set the subject id (modifiable in the command prompt)
    parameters.subjectId = 0;
    
    %---------------------------------------------------------------------%
    % data and log files parameters
    %---------------------------------------------------------------------%
    
    %   default name for the datafiles -- no need to modify. The program 
    %   will set the name of the data file in the following format:
    %   currentStudy currentStudyVersion subNumStr  session '_' runNumberStr '_' currentDate '.csv'
    parameters.datafile = 'unitled.csv';
    parameters.matfile = 'untitled.mat';
    
    %   default name for the taskmap files -- no need to modify. The program 
    %   will set the name of the data file in the following format:
    %   currentStudy currentStudyVersion subNumStr  session '_' runNumberStr '_' currentDate '_taskMap.mat'
    parameters.taskMapFile = 'untitled_taskMap.mat';
    
    %   default name for the log file -- no need to modify. The program 
    %   will set the name of the data file in the following format:
    %   currentStudy currentStudyVersion subNumStr  session '_' runNumberStr '_' currentDate '_log.txt'
    parameters.logFile = 'untitled_log.txt';
  
    %---------------------------------------------------------------------%
    % experiment  parameters
    %---------------------------------------------------------------------%
    
    %   set the number of trials in your experiment
    parameters.numberOfTrials = 10;
   
    
    %---------------------------------------------------------------------%
    % tasks durations ( in seconds)
    %---------------------------------------------------------------------%
    
    %   sample task duration
    parameters.sampleDuration = 0.5; 

    %   delay duration between stimuli
    parameters.delayTaskDuration = 0.25;
    
    %   feedback window duration
    parameters.feedBackTime = 1.5;

    %   pre-trial task duration
    parameters.preTrialTaskDuration = 1;
    
    %   delay between two consecutive bet-placing tasks (appears in 
    %   practice part only in showNewTrialStartWarningWindow())
    parameters.intertrialTaskDuration = 1;
    
    %   how long the get ready message appears before the start of the
    %   first trial
    parameters.getReadyTaskDuration = 3;

    %---------------------------------------------------------------------%
    % Some string resources 
    %---------------------------------------------------------------------%
    parameters.welcomeMsg = sprintf('Welcome! \n Please press SPACE to continue.');
    parameters.getReadyMsg = sprintf('Get ready...');
    parameters.thankYouMsg = sprintf('Thank you for your participation!!! \n Please press SPACE to exit the experiment.');
   
    %---------------------------------------------------------------------%
    % Some geometry parameters
    %---------------------------------------------------------------------%

    %   Here we set the size of the arms of our fixation cross in degrees
    parameters.fixationCrossSizeDeg = 0.2;
    
    %   size of fixation cross in pixels by default -- no need to modify
    parameters.fixationCrossSizePix =10; % size of fixation cross in pixels by default
    
    %   set the line width for our fixation cross in degrees
    parameters.lineWidthDeg = 0.05;
    
    %  line width for our fixation cross in pixels by default -- no need to
    %  modify
    parameters.lineWidthPix = 2;
 
    %	set the radius of the central circle for the probe task in degrees
    parameters.rhoCircleDeg = 8.5;
    
    %	default radius of the central circle for the probe task in pixels
    parameters.rhoCirclePix = 300; 
    
    %   set the triangle parameters in degrees
    parameters.triangHeightDeg = 5;
    parameters.triangWidthDeg = 2.5;
    
    %   default triangle parameters in pixels, will be overwritten by
    %   program
    parameters.triangHeight= 250;
    parameters.triangWidth = 125;
 
    %	set the fond size
    parameters.textSizeDeg = 0.8;
    
    %	default value for the font size -- no need to modify
    parameters.textSize = 30;
   
    % max  score can be earned for one trial
    parameters.maxScore = 100;
    
end

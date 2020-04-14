function showPreTrialWindow()
    global screen;
    global parameters;
    grey  = screen.grey;
    
    %import the files for the fixation crosses and create the respective textures
    fixBG = [grey grey grey]; %grey background offset
    
    %import the files contating the fixation crosses
    fix1Data=imread(strcat(pwd,'/supportFiles/fix1.png'),'BackgroundColor',fixBG./255); %Trial fixation
    % make texture image out of image matrix 'imdata'
    fix1=Screen('MakeTexture', screen.win, fix1Data);
    
    xCenter = screen.screenXpixels/2;
    yCenter = screen.screenYpixels/2;
    
    fixRect = [ xCenter-parameters.fixationCrossSizePix ...
                yCenter-parameters.fixationCrossSizePix ...
                xCenter+parameters.fixationCrossSizePix ...
                yCenter+parameters.fixationCrossSizePix];

    Screen('DrawTexture', screen.win, fix1,[],fixRect); %fixaton dot
    Screen('Flip', screen.win);
    WaitSecs(parameters.preTrialTaskDuration);
end
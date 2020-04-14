%   probe task window

function showSampleWindow(tc)
    global screen;
    global parameters;
    global taskMap;

    black = screen.black;
    grey  = screen.grey;
    
    xCenter = screen.screenXpixels/2;
    yCenter = screen.screenYpixels/2;

    %import the files for the fixation crosses and create the respective textures
    fixBG = [grey grey grey]; %grey background offset
    
    %import the files contating the fixation crosses
    fix1Data=imread(strcat(pwd,'/supportFiles/fix1.png'),'BackgroundColor',fixBG./255); %Trial fixation
    % make texture image out of image matrix 'imdata'
    fix1=Screen('MakeTexture', screen.win, fix1Data);
   
    fixRect = [ xCenter-parameters.fixationCrossSizePix ...
                yCenter-parameters.fixationCrossSizePix ...
                xCenter+parameters.fixationCrossSizePix ...
                yCenter+parameters.fixationCrossSizePix];
    
          
    Screen('DrawTexture', screen.win, fix1,[],fixRect); %fixaton dot
    
    %define the centers of triangles
    triangCenterX = screen.screenXpixels/2; % triangle
    triangCenterY = yCenter;
    
    %define stimulus triangles
    StimulusTriangle= Triangle(taskMap(:,tc).triangOrientation,triangCenterX,yCenter);
    
    %draw left and right triangles on the screen
    Screen(screen.win,'FillPoly',black, StimulusTriangle.setTriangleVertices())
    
    Screen('Flip', screen.win);
    WaitSecs(parameters.sampleDuration);
end
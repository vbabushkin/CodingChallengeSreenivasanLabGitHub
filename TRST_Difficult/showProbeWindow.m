%   probe task window

function showProbeWindow(tc)
    global screen;
    global parameters;
    global taskMap;
    global resReport;
    global totalScore;
    
    white = screen.white;
    black = screen.black;
    grey  = screen.grey;
   
    
    % get coordinates of the screen center
    xCenter = screen.screenXpixels/2;
    yCenter = screen.screenYpixels/2;
    
    % rectangle defining the central circle
    baseRect = [0 0 2*(parameters.rhoCirclePix) 2*(parameters.rhoCirclePix)];
    
    
    % Center the left hand side squares on positions in the screen.
    rect = CenterRectOnPointd(baseRect, xCenter, yCenter);
    
   
    % initialize clicking flag for responses
    mouseClicked = 0; 
    
    % for the first trial set the mouse coordinates in a random place of the screen
    SetMouse(randi(screen.screenXpixels),randi(screen.screenYpixels),screen.win); 
    
    
    triangCenterX = xCenter;
    triangCenterY = yCenter;
    
    initTheta = taskMap(:,tc).triangOrientation;
    
    currentTriangle= Triangle(initTheta,xCenter,yCenter);
  
    tempCoord =currentTriangle.setTriangleVertices();
    initTriangVerticeCoord = [tempCoord(1,1),tempCoord(1,2)];    
  
    %   draw an intital triangle in the center (alpha = 0, rho = parameters.triangHeight/2)
    %--------------------------------------------------------------------------------------------------------------------------------------%
    triangCenterX = xCenter;
    triangCenterY = yCenter;
    currentTriangle= Triangle(0,xCenter,yCenter);  
    Screen('Flip', screen.win);

    % Wait for mouse click reset
    while sum(mouseClicked)~=0
        [xmouse,ymouse,mouseClicked] = GetMouse;
    end

    %   monitor mouse clicks
    %--------------------------------------------------------------------------------------------------------------------------------------%
    %  

    %   initialize flag for clicking 
    mouseClicked = 0;

    %   initialize the starting time of the current bet 
    timeStart = GetSecs;

    while (any(mouseClicked)==0 ) 
        [xmouse,ymouse,mouseClicked] = GetMouse(screen.win);
        
        %  initialize the end time 
        timeEnd = GetSecs;
        
        % convert mouse coordinates into polar
        [alpha, rho] = cart2pol(xmouse-triangCenterX,ymouse-triangCenterY);

        % adjust the angle to the scale starting with 0 at 90 degrees
        % and positive in clockwise  direction
        if rad2deg(alpha)>=0 && rad2deg(alpha) <=180
            thetaDeg = 90+rad2deg(alpha);
        elseif rad2deg(alpha)<0 && rad2deg(alpha) >=-90
            thetaDeg = 90+rad2deg(alpha);
        elseif rad2deg(alpha)<-90 && rad2deg(alpha) >-180
            thetaDeg =360+(rad2deg(alpha)+90);
        end


        %fill the main circle
        Screen('FillOval', screen.win, grey, rect);
        %draw the main circle
        Screen('FrameOval', screen.win, white, rect, 3);
        %rotate the triangle
        currentTriangle.rotationAngle = thetaDeg;

        % draw probe triangle following the mouse pointer
        Screen(screen.win,'FillPoly',white, currentTriangle.setTriangleVertices());

        % to determine the response error we also need the vertix of
        % the rotated triangle
        tempCoord =currentTriangle.setTriangleVertices();
        currentTriangVerticeCoord = [tempCoord(1,1),tempCoord(1,2)]; 

        % let's define two vectors starting from the center of the
        % screen and ending in the vertices of initial triangle and the
        % reported triangle. The angle btw these two vectors will give
        % us the response error (in degrees). It is positive in clock-
        % wise and negative in counterclockwise directions
        v1 = [initTriangVerticeCoord(1)-triangCenterX,initTriangVerticeCoord(2)-triangCenterY];
        v2 = [currentTriangVerticeCoord(1)-triangCenterX,currentTriangVerticeCoord(2)-triangCenterY];

        %  Dividing these vectors' cross product's length by their dot 
        %  product gives the angle in degrees between the vectors as 
        %  measured in a counterclockwise direction from v1 to v2. If 
        %  that angle would exceed 180 degrees, then the angle is measured
        %  in the clockwise direction but given a negative value gives 
        %  the angle in degrees between the vectors as measured in a 
        %  counterclockwise direction from v1 to v2. If that angle would 
        %  exceed 180 degrees, then the angle is measured in the clockwise 
        %  direction but given a negative value.
        %  https://www.mathworks.com/matlabcentral/answers/180131-how-can-i-find-the-angle-between-two-vectors-including-directional-information
        respError = atan2d(v1(1)*v2(2)-v1(2)*v2(1),v1(1)*v2(1)+v1(2)*v2(2));
        Screen('Flip', screen.win);
    end


    %record results
    %--------------------------------------------------------------------------------------------------------------------------------------%
    % 
    
    timeElapsed = timeEnd-timeStart;

    resReport(:,tc).trial = tc;

    resReport(:,tc).actualOrientation =  taskMap(:,tc).triangOrientation ;
    resReport(:,tc).reportedOrientation = thetaDeg;
    resReport(:,tc).error = respError;
    resReport(:,tc).responseTime = timeElapsed;
    scoreEarned = parameters.maxScore * 1./exp(abs(respError));
    resReport(:,tc).score = scoreEarned;
    totalScore = totalScore + scoreEarned;
    % update valueAtOrient
    %--------------------------------------------------------------------------------------------------------------------------------------%
    % 

    Screen('Flip', screen.win);
    
    
end
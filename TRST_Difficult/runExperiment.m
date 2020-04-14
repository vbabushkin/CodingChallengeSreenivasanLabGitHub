function runExperiment()
    global parameters;
    global screen;
    global totalScore;
    global taskMap;
    global resReport;
    global fixCrossData;
    
    grey  = screen.grey;
    
    %  init structure to store user responces
    %--------------------------------------------------------------------------------------------------------------------------------------%
    % 
    resReport = {};
    row = 1;
    for trials = 1:parameters.numberOfTrials
        clear map
        map = struct('trial',0,...
            'actualOrientation',0,...
            'reportedOrientation',0,...
            'error',0,...
            'score',0,...
            'responseTime',0);
        resReport{row}=map;
        row = row+1;
    end

    resReport=cell2mat(resReport);
    
    totalScore = 0;
    
    %import the files contating the fixation crosses
    fixCrossData=imread(strcat(pwd,'/supportFiles/fix1.png'),'BackgroundColor',[screen.grey/255,screen.grey/255,screen.grey/255]);
              
    
    %  init start of experiment procedures 
    %--------------------------------------------------------------------------------------------------------------------------------------%
    % 
    showSoeWindow();
    
    
    %  iterate over all trials 
    %--------------------------------------------------------------------------------------------------------------------------------------%
    % 
    for   tc = 1:parameters.numberOfTrials

        showPreTrialWindow();

        showSampleWindow(tc);

        showDelayWindow();

        showProbeWindow(tc);

        showFeedbackWindow(tc);
        
    end

    %  init end of experiment procedures
    %--------------------------------------------------------------------------------------------------------------------------------------%
    % 
    showEoeWindow();


end
function taskMap = generateTaskMap()
    global parameters;
    global screen;
    global screens;

    % specify the task map file name and re-check to make sure it doesn't
    % already exist

    numTrialsTotal = parameters.numberOfTrials;
    
    %shuffle all orientations for both of the triangles
    orientations = Shuffle(randi(360, numTrialsTotal,1));

    %TODO -- in case of multiple triangle stimuli
    %make sure that the two neighobing orientations are not the same
    %the min difference btw orientations is set in parameters.diffBtwLeftRightOrientations
  
    
    %Save the Task Map
    taskMap={};
    for tc = 1:numTrialsTotal
        clear map
        map = struct('trial',tc,...
            'triangOrientation',orientations(tc,1)...
            );
            taskMap{tc}=map;
    end

    taskMap=cell2mat(taskMap);

    % Save the task map
    save(parameters.taskMapFile,'taskMap');
   
    
end

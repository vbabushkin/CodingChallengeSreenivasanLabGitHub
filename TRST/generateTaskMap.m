% Generates task map file
% @param taskMapFile -- file name
% @param numTrialsTotal -- total number of trials used in the experiment

function generateTaskMap(taskMapFile,numTrialsTotal)
    
    %shuffle all orientations for both of the triangles
    orientations = Shuffle(randi(360, numTrialsTotal,1));

    %TODO -- in case of multiple triangle stimuli
    %make sure that the two neighobing orientations are not the same
    %the min difference btw orientations is set in diffBtwLeftRightOrientations


    for tc = 1:numTrialsTotal
        clear map
        map = struct('trial',tc,...
            'triangOrientation',orientations(tc,1)...
            );
            taskMap{tc}=map;
    end

    taskMap=cell2mat(taskMap);

    % Save the task map
    save(taskMapFile,'taskMap');

end
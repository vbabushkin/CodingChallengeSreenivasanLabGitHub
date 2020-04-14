function saveLogFile()
    global parameters;
    global totalTime;
    global totalScore;
    global screen;
    
    logData = fopen(parameters.logFile,'wt');

    %save results to file
    %--------------------------------------------------------------------------------------------------------------------------------------%
    fprintf(logData, sprintf('%-50s%-10s\n','Date', date));
    fprintf(logData, sprintf('%-50s%-10.2f%-10s\n','Time taken', totalTime,'sec'));
    fprintf(logData, sprintf('%-50s%-10s\n','Study', parameters.currentStudy));
    fprintf(logData, sprintf('%-50s%-10d\n','Version',parameters.currentStudyVersion));
    fprintf(logData, sprintf('%-50s%-10d\n','Run',parameters.runNumber));
    fprintf(logData, sprintf('%-50s%-10d\n','Session',parameters.session));
    fprintf(logData, sprintf('%-50s%-10d\n','Subject id',parameters.subjectId));
    fprintf(logData, sprintf('%-50s%-10d\n','Number of trials',parameters.numberOfTrials));
    fprintf(logData, sprintf('%-50s%-10.2f\n','Sample duration', parameters.sampleDuration));
   
    fprintf(logData, sprintf('%-50s%-10s\n','Points earned', totalScore));
    
    fprintf(logData, sprintf('%-50s%-10.5f\n','ifi', screen.ifi));
    fprintf(logData, sprintf('%-50s%-10d\n','x pixels', screen.screenXpixels));
    fprintf(logData, sprintf('%-50s%-10d\n','y pixels', screen.screenYpixels));
    fprintf(logData, sprintf('%-50s%-10.2f%-10s\n','Screen width', screen.screenWidth, 'cm'));
    fprintf(logData, sprintf('%-50s%-10.2f%-10s\n','Screen height', screen.screenHeight, 'cm'));
    fprintf(logData, sprintf('%-50s%-10.2f%-10s\n','Viewing distance', screen.viewDist, 'cm'));
    
    fprintf(logData, sprintf('%-50s%-10.2f\n','Delay duration', parameters.delayTaskDuration));
    fprintf(logData, sprintf('%-50s%-10.2f\n','Feedback duration', parameters.feedBackTime));
    fprintf(logData, sprintf('%-50s%-10.2f\n','Grey factor', parameters.greyFactor));
    
    fprintf(logData, sprintf('%-50s%-10.2f%-10s\n','Fixation dot size', parameters.fixationCrossSizePix, 'px'));
    fprintf(logData, sprintf('%-50s%-10.2f%-10s\n','Fixation dot size', parameters.fixationCrossSizeDeg, 'deg'));
    
    fprintf(logData, sprintf('%-50s%-10.2f%-10s\n','Radius of the central circle', parameters.rhoCirclePix, 'px'));
    fprintf(logData, sprintf('%-50s%-10.2f%-10s\n','Radius of the central circle', parameters.rhoCircleDeg,'deg'));

    fclose('all');
end


%   End of experiment window
function showEoeWindow()
    global screen;
    global parameters;
    global totalScore;

    
    white = screen.white;
   
    text = sprintf('%s \nYour cummulative score is %.2f.\n', parameters.thankYouMsg, totalScore);
    
    showTextMessage( screen.win, white,text);
    
end

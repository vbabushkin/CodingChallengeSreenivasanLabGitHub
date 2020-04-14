%   Start of experiment window
function showSoeWindow()
    global screen;
    global parameters;
    
    white = screen.white;
    text = parameters.welcomeMsg;
    showTextMessage( screen.win, white, text);
end




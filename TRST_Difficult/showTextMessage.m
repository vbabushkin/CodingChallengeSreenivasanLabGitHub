function showTextMessage(window, color, text)
    global parameters;
    %Demonstrates given text on current window. Waits until user presses 
    %the SPACE key and moves to another window
    FlushEvents;
    Screen('TextSize', window, parameters.textSize);
    DrawFormattedText(window, text, 'center', 'center',color);
    Screen('Flip', window);
    ourKeyPressed = 0;

    while ~ourKeyPressed
          [keyIsPressed,secs, keyCode, deltaSecs] = KbCheck();
          if keyIsPressed
             if keyCode(KbName('SPACE'))
                    ourKeyPressed = 1;
             end
          end
    end
    FlushEvents;
    WaitSecs(0.2); %wait here to allow for key release
end
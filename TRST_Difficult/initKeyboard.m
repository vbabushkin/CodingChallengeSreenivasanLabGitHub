function initKeyboard()
    LoadPsychHID;
    
    %   create keyboard events queue
    PsychHID('KbQueueCreate');

    PsychHID('KbQueueStart');
end
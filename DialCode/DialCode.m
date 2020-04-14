 ourKeyPressed=0;
while ~ourKeyPressed % if already down, wait for release
    [ pressed, firstPress]=KbQueueCheck(bbx);
    if pressed
        if firstPress(KbName('1!'))
            ourKeyPressed=1;
            break
        end
    end


 
      [keyIsPressedDial,secsDial, keyCodeDial, deltaSecsDial] = KbCheck(dial);

      if keyCodeDial(KbName('b')) %counterClockwise
          mousemarkerAngle0vertical = mousemarkerAngle0vertical - 1;

      elseif keyCodeDial(KbName('t')) %Clockwise
          mousemarkerAngle0vertical = mousemarkerAngle0vertical + 1;

      end

      if mousemarkerAngle0vertical > 360
         mousemarkerAngle0vertical = mousemarkerAngle0vertical - 360;
      elseif mousemarkerAngle0vertical < 0
         mousemarkerAngle0vertical= 360 - (-mousemarkerAngle0vertical);
      end


      [x,y]=pol2cart(deg2rad(mousemarkerAngle0vertical-90),rhoPix);
      xCursor=x+xCenter; 
      yCursor=y+yCenter;


end % of while loop

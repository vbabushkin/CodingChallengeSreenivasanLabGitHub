function visDegrees2Pix()
    global screen;
    global parameters;
    parameters.fixationCrossSizePix =parameters.fixationCrossSizeDeg * screen.pixels_per_deg_width; %    8.1393
    parameters.rhoCirclePix = parameters.rhoCircleDeg * screen.pixels_per_deg_width;
    parameters.textSize = round(parameters.textSizeDeg * screen.pixels_per_deg_width);
    parameters.lineWidthPix = parameters.lineWidthDeg * screen.pixels_per_deg_width; 
    parameters.triangHeight = parameters.triangHeightDeg * screen.pixels_per_deg_width;
    parameters.triangWidth = parameters.triangWidthDeg * screen.pixels_per_deg_width;
   
end
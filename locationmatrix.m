function [locationmatrix]=locationmatrix()

rectOne=[0 0 100 100];
rectTwo=[0 0 100 100];
rectThree=[0 0 100 100];         %rect size
rectFour=[0 0 100 100];

rectOneX=0.4*(rect(3));   %rect locations
rectOneY=0.35*(rect(4));

rectTwoX=0.6*(rect(3));
rectTwoY=0.37*(rect(4));

rectThreeX=0.6*(rect(3));
rectThreeY=0.6*(rect(4));

rectFourX=0.41*(rect(3));
rectFourY=0.6*(rect(4));

locationOne=CenterRectOnPoint(rectOne,rectOneX,rectOneY);  %places rects on location we want
locationTwo=CenterRectOnPoint(rectTwo,rectTwoX,rectTwoY);
locationThree=CenterRectOnPoint(rectThree,rectThreeX,rectThreeY);
locationFour=CenterRectOnPoint(rectFour,rectFourX,rectFourY);

locationmatrix=[locationOne',locationTwo',locationThree',locationFour'];
end
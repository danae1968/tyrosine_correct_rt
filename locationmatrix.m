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

 rectsize=[0 0 100 100];
 rect =[0 0 1680 1050]; %why does this not work? fix this
 numrects=4;
 xyindex=[0.4 0.6 0.6 0.41;0.35 0.37 0.6 0.6]';
 
locationmatrix=zeros(size(xyindex,1),size(xyindex,2));

 for r=1:length(locationmatrix)
locationmatrix(r,1)=(rect(3)*xyindex(r,1));
locationmatrix(r,2)=(rect(4)*xyindex(r,2));
 end
% 
% locationmatrix=[locationOne',locationTwo',locationThree',locationFour'];
end
%impixel finds rgb values of images
%colormapeditor shows rgb values of all colormaps! 
%with colormap we can make our own map
%http://matlab.wikia.com/wiki/FAQ#How_do_I_create_a_circle.3F
%maybe can create a ring and split it in rads as many as the colors we use
%not really analogical, but we can then estimate st.dev from colormapeditor
%http://www.mathworks.com/matlabcentral/fileexchange/16233-sc-powerful-image-rendering
%http://www.mathworks.com/matlabcentral/fileexchange/23342-real2rgb---colormaps

r = linspace(0,1,10);
theta = linspace(0, 2*pi, 100);
[rg, thg] = meshgrid(r,theta);
[x,y] = pol2cart(thg,rg);
pcolor(x,y,thg);
colormap(get);
shading flat;
% axis equal;

% Create a logical image of a ring with specified
% inner diameter, outer diameter center, and image size.
% First create the image.
figure()
imageSizeX = 640;
imageSizeY = 480;
[columnsInImage rowsInImage] = meshgrid(1:imageSizeX, 1:imageSizeY);
% Next create the circle in the image.
centerX = 320;
centerY = 240;
innerRadius = 100;
outerRadius = 140;
array2D = (rowsInImage - centerY).^2 ...
    + (columnsInImage - centerX).^2;
circlePixels = array2D >= innerRadius.^2 & array2D <= outerRadius.^2;
% circlePixels is a 2D "logical" array.
% Now, display it.
pcolor(circlePixels);
image(circlePixels) ;
colormap(jet)
colormap(223,0,0);
title('Ring', 'FontSize', 25);

%Or, if you want a list of x and y coordinates of the perimeter of the circle, or of an arc, you can do this:

xCenter = 12;
yCenter = 10;
theta = 0 : 0.01 : 2*pi;
radius = 5;
x = radius * cos(theta) + xCenter;
y = radius * sin(theta) + yCenter;
plot(x, y);
axis square;
xlim([0 20]);
ylim([0 20]);
grid on;


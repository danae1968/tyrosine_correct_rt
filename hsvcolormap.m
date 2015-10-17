function [hsvcolormap]=hsvcolormap()
numberColors=65;
step=24;
R=zeros(numberColors,1);
R(1:10)=255;
R(11:21)=255:-step:0;
R(43:53)=0:step:255;
R(54:65)=255;
G=zeros(numberColors,1);
G(1:11)=0:step:255;
G(12:32)=255;
G(33:43)=255:-step:0;
B=zeros(numberColors,1);
B(23:33)=0:step:255;
B(33:54)=255;
B(55:65)=255:-step:0;

hsvcolormap=[R G B]
end


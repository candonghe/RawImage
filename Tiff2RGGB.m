%% read tiff files, get the center area RGGB values.
% both dng and CR2 images could be opened by Fiji/ImageJ, check x,y vlaue:
% x=4215;y=3308;
% img(x+1,y+1)

camera='p40';%'p40';
if camera=='p40'
    folder_contents=dir('./*.dng');
else
    folder_contents=dir('./*.CR2');
end
RGGB=zeros(numel(folder_contents),4);

for i=1:numel(folder_contents)
    dng_file_name=fullfile(folder_contents(i).folder, folder_contents(i).name);
    if camera=='p40'
        tiff_file_name=strrep(dng_file_name,'dng','tiff');
        info1=imfinfo(dng_file_name);
        blacklevel=info1.BlackLevel;
        %whitelevel=info1.WhiteLevel;
        Area=[3900 4400 3000 3500];
    else
        tiff_file_name=strrep(dng_file_name,'CR2','tiff');
        info1=imfinfo(tiff_file_name);
        blacklevel=2048;% blacklevel is know in ImageJ
        %whitelevel=4096;
        Area=[2400 2800 1300 1700];
    end
    disp(tiff_file_name)
    cfa_tiff= read( Tiff(tiff_file_name,'r'));
    img_xy=cfa_tiff';
    [RGGB(i,1) RGGB(i,2) RGGB(i,3) RGGB(i,4)]=readRGGB(img_xy,blacklevel,Area);
end



function [red, green1, green2, blue]=readRGGB(img,black,area)
%% BG GR pattern
%even number: 0,2,4...
%Blue: x-3900-4400   y=3000-3500
x_stat=area(1);x_end=area(2);
y_stat=area(3);y_end=area(4);
bk=black(1);
b=img(x_stat+1:2:x_end+1,y_stat+1:2:y_end+1);
blue=mean(mean(b))-bk;
g1=img(x_stat+2:2:x_end+2,y_stat+1:2:y_end+1);
green1=mean(mean(g1))-bk;
g2=img(x_stat+1:2:x_end+1,y_stat+2:2:y_end+2);
green2=mean(mean(g2))-bk;
r=img(x_stat+2:2:x_end+2,y_stat+2:2:y_end+2);
red=mean(mean(r))-bk;
end


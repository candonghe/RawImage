# RawImage
Handle Raw image(DNG from huawei, CR2 from Canon), convert to TIFF

## Raw2Tiff.m
* show the info of dng/CR2 images in matlab. Be caution about the difference between dng and CR2 information. Download samples images [here](https://1drv.ms/u/s!Am2krNGddSzUoWKFZYKMwV9wpbud?e=Ao8HbA)
* convert dng/CR2 images to Tiff through dcaw. You could either download exutable programme directly [here](https://dcraw.en.softonic.com/?ex=MOB-615.2), or you could download the .c file and compile it yourself [here](https://www.dechifro.org/dcraw/). Afterwards, you need to copy dcraw.exe into `c:\windows` in order to call it in matlab.

## Tiff2BGGR
* load tiff images, read BGGR pattern values in an specified area.

## You may need the following tools
* [ImageJ/Fiji](https://imagej.net/Fiji/Downloads): For the observation of DNG/CR2 images features
* [dcraw](https://www.dechifro.org/dcraw/): For the convertion to tiff images

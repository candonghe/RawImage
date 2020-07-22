# RawImage
Handle Raw image(DNG from huawei, CR2 from Canon), convert to TIFF

## Raw2Tiff.m
* show the info of dng/CR2 images in matlab. Be caution about the difference between dng and CR2 information. Download samples images [here](https://1drv.ms/u/s!Am2krNGddSzUoWKFZYKMwV9wpbud?e=Ao8HbA)
* convert dng/CR2 images to Tiff through [Dcraw](https://dcraw.en.softonic.com/?ex=MOB-615.2), you need to copy dcraw.exe into `c:\windows` in order to call it in matlab.

## Tiff2BGGR
* load tiff images, read BGGR pattern values in an specified area.

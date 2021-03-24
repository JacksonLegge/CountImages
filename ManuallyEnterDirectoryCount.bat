@echo off
::fix variables
setlocal ENABLEDELAYEDEXPANSION
::ask user for num of images and where they are located
set /p max="Enter Number of Images: "
set /p directory="Enter Directory: "
set cnt=0
::loop once for each number from 1-max
for /L %%f in (1,1,%max%) do (
:: pad zeroes
    set "num=00000%%f"
    set "num=!num:~-4!"
    if not exist "%directory%\IMG_!num!.JPG" (
	::tell the user that the image is missing
        echo IMG_!num!.JPG
		::add 1 to the count of missing images
        set /A "cnt=!cnt!+1"
    )
)
::tell the user how many images are missing
echo NUMBER MISSING: !cnt!
::finish
endlocal
pause

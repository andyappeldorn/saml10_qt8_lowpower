for %%I in (.) do set CurrDirName=%%~nxI
echo %CurrDirName%

"C:\Program Files\7-Zip\7z.exe" a %CurrDirName%.zip -r "-x!*.d" "-x!*.o" "-x!*.elf" "-x!*.srec" "-x!*.eep" "-x!*.lss" "-x!*.map" "-x!*.mk" "-x!MAKEFILE" "-x!.bin" "-x!.bat"


pause
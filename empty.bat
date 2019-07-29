
@REM copy empty.xlsx file to desktop
@REM yyyymmdd_[count].xlsx
@REM if sames name file exists rename to yyyymmdd_[count+1].xlsx
@REM max to yyyymmdd_10.xlsx

FOR /F "TOKENS=1-4 DELIMS=/ " %%A IN ('DATE /T') DO (SET MYDATE=%%A%%B%%C)
rem FOR /F "TOKENS=1-2 DELIMS=/:" %%A IN ('TIME /T') DO (SET MYTIME=%%A%%B)

for /L %%X in (1,1,10) DO (
	if exist c:\Users\me\Desktop\%MYDATE%_%%X.xlsx (
		rem continue
	) else (
		copy C:\Users\me\Desktop\__etcs\empty.xlsx c:\Users\me\Desktop\%MYDATE%%MYTIME%_%%X.xlsx
		exit goto :end
	)
)
:end




@ECHO OFF
FOR /F "tokens=5 delims= " %%P IN ('netstat -a -n -o ^| findstr :8080') DO (
@ECHO "kills " %%P
TaskKill.exe /F /PID %%P
)




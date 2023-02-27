call .\build.bat
call .\download.bat
call .\stop.bat

docker-compose up --build -d --remove-orphans
timeout /t 20 /nobreak
npm test -- --detectOpenHandles
pause

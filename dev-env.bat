@echo off

:: Check if a command was passed
IF "%~1"=="" GOTO :Help

:: Route to the appropriate function
IF /I "%~1"=="start" GOTO :Start
IF /I "%~1"=="stop" GOTO :Stop
IF /I "%~1"=="clean" GOTO :Clean
IF /I "%~1"=="status" GOTO :Status
IF /I "%~1"=="logs" GOTO :Logs

:Help
echo.
echo ========================================================
echo   Development Environment Manager (Windows)
echo ========================================================
echo Usage: dev-env [command]
echo.
echo Commands:
echo   start   - Starts the environment in the background
echo   stop    - Stops the environment without deleting data
echo   clean   - Stops the environment and deletes volumes
echo   status  - Shows the status of the containers
echo   logs    - Tails the logs for all services
echo.
GOTO :EOF

:Start
echo Starting development environment...
docker compose up -d

IF %ERRORLEVEL% NEQ 0 (
    echo.
    echo Error: Failed to start the development environment.
    echo Please check if the Docker Desktop/daemon is running.
    GOTO :EOF
)

echo.
echo Environment is up!
echo - Kafka Brokers: localhost:9092
echo - Schema Registry: http://localhost:8081
echo - AKHQ UI: http://localhost:8080
GOTO :EOF

:Stop
echo Stopping development environment...
docker compose down
GOTO :EOF

:Clean
echo Stopping and deleting data volumes...
docker compose down -v
echo Environment cleaned up.
GOTO :EOF

:Status
echo Container Status:
docker compose ps
GOTO :EOF

:Logs
echo Tailing logs (Press Ctrl+C to exit)...
docker compose logs -f
GOTO :EOF
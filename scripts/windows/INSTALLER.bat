@echo off
setlocal DisableDelayedExpansion
title Installation du metier de barde / Bard profession installer
echo.
echo  INSTALLATION DU METIER DE BARDE / BARD PROFESSION INSTALLER
echo  ===========================================================
echo  Ferme le jeu avant de continuer / Close the game first.
echo  Le serveur sera arrete puis redemarre / The server is stopped then restarted.
echo.
echo  1) SERVEUR : dossier contenant Core, Data, mysql, Scripts / SERVER folder (Core, Data, mysql, Scripts)
set /p REPACK=  Chemin / Path : 
echo.
echo  2) JEU : dossier contenant Data et Interface / GAME folder (Data and Interface)
set /p CLIENT=  Chemin / Path : 
echo.
echo  3) PROGRAMME COMPILE : dossier contenant worldserver.exe compile avec le module (voir BUILD_BARDE.bat)
echo     COMPILED SERVER: folder holding the worldserver.exe built with the module (see BUILD_BARDE.bat)
set /p BUILD=  Chemin / Path : 
set "REPACK=%REPACK:"=%"
set "CLIENT=%CLIENT:"=%"
set "BUILD=%BUILD:"=%"
echo.
if not exist "%REPACK%\Scripts\manage.py" ( echo ERREUR / ERROR : "%REPACK%" n'est pas un serveur CoA ^(Scripts\manage.py introuvable^). & pause & exit /b 1 )
if not exist "%CLIENT%\Interface" ( echo ERREUR / ERROR : "%CLIENT%" n'est pas un dossier de jeu ^(Interface introuvable^). & pause & exit /b 1 )
if not exist "%BUILD%\worldserver.exe" ( echo ERREUR / ERROR : "%BUILD%\worldserver.exe" introuvable. & pause & exit /b 1 )
"%REPACK%\Runtime\python\python.exe" -B "%~dp0install_barde.py" "%REPACK%" "%BUILD%" "%~dp0..\.." "%CLIENT%"
if errorlevel 1 ( echo. & echo ECHEC / FAILED : lis le message ci-dessus / read the message above. & pause & exit /b 1 )
echo.
echo  TERMINE / DONE. Quand "ready" apparait, attends 1 minute puis lance le jeu / wait 1 minute after "ready", then start the game.
echo  En jeu / In game (GM) :  .barde apprendre   puis / then   /barde
pause

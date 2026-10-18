@echo off
setlocal DisableDelayedExpansion
title Installation du metier de barde / Bard profession installer
echo.
echo  INSTALLATION DU METIER DE BARDE / BARD PROFESSION INSTALLER
echo  ===========================================================
echo  Installe le metier sur ton serveur local ET dans ton jeu.
echo  Installs the profession on your local server AND into your game.
echo.
echo  Avant de continuer / Before you continue :
echo    - ferme completement le jeu / close the game completely
echo    - fais une copie de securite de ton dossier serveur / back up your server folder
echo  Le serveur sera arrete puis redemarre / The server is stopped then restarted.
echo.
pause

rem --- Le jeu : le dossier ou ce logiciel a ete decompresse / The game: the folder this software was unzipped into
set "CLIENT=%~dp0"
if "%CLIENT:~-1%"=="\" set "CLIENT=%CLIENT:~0,-1%"
if not exist "%CLIENT%\Data" goto :askclient
if exist "%CLIENT%\Wow.exe" goto :clientok
if exist "%CLIENT%\WoW.exe" goto :clientok
if exist "%CLIENT%\Ascension.exe" goto :clientok
goto :askclient
:askclient
echo.
echo  Ce logiciel doit etre decompresse dans ton dossier de jeu ^(celui qui contient le dossier Data
echo  et le programme du jeu, par exemple Ascension.exe ou Wow.exe^).
echo  This software must be unzipped into your game folder ^(the one holding the Data folder
echo  and the game program, for example Ascension.exe or Wow.exe^).
set "CLIENT="
set /p CLIENT=  Chemin du jeu / Game path :
if not defined CLIENT ( echo ERREUR / ERROR : aucun chemin donne / no path given. & pause & exit /b 1 )
set "CLIENT=%CLIENT:"=%"
if not exist "%CLIENT%\Data" ( echo ERREUR / ERROR : "%CLIENT%" n'est pas un dossier de jeu ^(dossier Data introuvable^). & pause & exit /b 1 )
:clientok
echo.
echo  Jeu / Game : %CLIENT%

rem --- Le jeu doit etre ferme / The game must be closed
tasklist /FI "IMAGENAME eq Wow.exe" 2>nul | find /I "Wow.exe" >nul && goto :gameopen
tasklist /FI "IMAGENAME eq Ascension.exe" 2>nul | find /I "Ascension.exe" >nul && goto :gameopen
goto :gameclosed
:gameopen
echo.
echo  ATTENTION / WARNING : le jeu est ouvert. Ferme-le completement, puis relance ce logiciel.
echo  The game is open. Close it completely, then run this software again.
pause
exit /b 1
:gameclosed

rem --- Ou sont le programme compile et le module ? / Where are the built server and the module?
if exist "%~dp0worldserver-barde\worldserver.exe" (
  set "BUILD=%~dp0worldserver-barde"
  set "MODULE=%~dp0mod-barde"
) else (
  set "MODULE=%~dp0..\.."
  set "BUILD="
)

rem --- Le serveur local / The local server
set "REPACK="
echo.
echo  Recherche de ton serveur CoA ^(peut prendre une minute^)... / Looking for your CoA server ^(may take a minute^)...
for /f "usebackq delims=" %%i in (`powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0trouver.ps1" serveur`) do set "REPACK=%%i"
if defined REPACK (
  echo  Serveur trouve / Server found : %REPACK%
  set "OK="
  set /p OK=  C'est le bon ? / Is it the right one? [O/Y = oui, N = non] :
  if /i "%OK%"=="N" set "REPACK="
)
if not defined REPACK (
  echo.
  echo  Donne le dossier du serveur : celui qui contient Core, Data, mysql et Scripts.
  echo  Give the server folder: the one holding Core, Data, mysql and Scripts.
  set /p REPACK=  Chemin / Path :
)
set "REPACK=%REPACK:"=%"

if not defined BUILD (
  echo.
  echo  Dossier contenant le worldserver.exe compile avec le module ^(voir les Releases^) :
  echo  Folder holding the worldserver.exe built with the module ^(see the Releases^):
  set /p BUILD=  Chemin / Path :
)
set "BUILD=%BUILD:"=%"

echo.
if not exist "%REPACK%\Scripts\manage.py" ( echo ERREUR / ERROR : "%REPACK%" n'est pas un serveur CoA ^(Scripts\manage.py introuvable^). & pause & exit /b 1 )
if not exist "%BUILD%\worldserver.exe" ( echo ERREUR / ERROR : "%BUILD%\worldserver.exe" introuvable. & pause & exit /b 1 )
if not exist "%REPACK%\Runtime\python\python.exe" ( echo ERREUR / ERROR : Python du serveur introuvable dans "%REPACK%\Runtime\python". & pause & exit /b 1 )

echo  Installation en cours... / Installing...
"%REPACK%\Runtime\python\python.exe" -B "%~dp0install_barde.py" "%REPACK%" "%BUILD%" "%MODULE%" "%CLIENT%"
if errorlevel 1 ( echo. & echo ECHEC / FAILED : lis le message ci-dessus / read the message above. & pause & exit /b 1 )
echo.
echo  TERMINE / DONE.
echo  Quand "ready" apparait dans la fenetre du serveur, attends 1 minute puis lance le jeu.
echo  When "ready" shows in the server window, wait 1 minute then start the game.
echo  En jeu, avec un compte MJ / In game, with a GM account :  .barde apprendre   puis / then   /barde
pause
exit /b 0

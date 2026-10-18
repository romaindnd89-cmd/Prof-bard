# Scripts Windows / Windows scripts

## Installer sur un serveur CoA (le plus simple) / Install on a CoA server (the easy way)

**Français.** Le métier se joue avec **votre propre serveur local** (le « CoA Server » du gestionnaire, avec les dossiers `Core`, `Data`, `mysql`, `Scripts`).

1. Téléchargez `Prof-bard-installateur-CoA.zip` dans les [Releases](https://github.com/romaindnd89-cmd/Prof-bard/releases/latest). Il contient un `worldserver.exe` compilé avec le module, pour le cœur `b95c4368`. Si votre serveur est d'une autre version, compilez-le vous-même (voir « Compiler le serveur » plus bas) : le programme doit être de la **même version** que votre serveur.
2. Fermez le jeu et faites une copie de sécurité de votre dossier serveur.
3. Décompressez le paquet **directement dans votre dossier de jeu** (celui qui contient `Data` et `Interface`), puis double-cliquez sur `INSTALLER.bat`.
4. Il cherche votre serveur (environ une minute) et vous demande de confirmer. Il arrête le serveur, installe le programme, la configuration et la base de données, fabrique le patch client à partir de **vos** DBC, copie l'addon et le patch dans le jeu, puis redémarre le serveur.
5. Quand « ready » apparaît, attendez 1 minute. Dans le lanceur CoA, choisissez la connexion **Solo** (votre propre serveur local), lancez le jeu, puis (compte MJ) `.barde apprendre` et `/barde`.

**English.** The profession is played with **your own local server** (the manager's "CoA Server", with the folders `Core`, `Data`, `mysql`, `Scripts`).

1. Download `Prof-bard-installateur-CoA.zip` from the [Releases](https://github.com/romaindnd89-cmd/Prof-bard/releases/latest). It holds a `worldserver.exe` built with the module, for core `b95c4368`. If your server is another version, build it yourself (see "Building the server" below): the program must be the **same version** as your server.
2. Close the game and back up your server folder.
3. Unzip the pack **directly into your game folder** (the one holding `Data` and `Interface`), then double-click `INSTALLER.bat`.
4. It looks for your server (about a minute) and asks you to confirm. It stops the server, installs the program, the configuration and the database, builds the client patch from **your** DBC files, copies the addon and the patch into the game, then restarts the server.
5. When "ready" shows, wait 1 minute. In the CoA launcher choose the **Solo** connection (your own local server), start the game, then (GM account) `.barde apprendre` and `/barde`.

## Compiler le serveur / Building the server

**Français.** Le serveur CoA est basé sur ce cœur public : <https://github.com/jealous-sound/azerothcore-wotlk-coa>. Le module a été compilé avec la version **`b95c4368`** (« Pin reviewed race overlay hashes to CoA Custom 1.7 »), celle du serveur « propre » du gestionnaire. Si votre serveur est d'une autre version, prenez les sources de **sa** version.

1. Installez Visual Studio (composant « Développement Desktop en C++ »), CMake, Ninja et Git, et préparez les bibliothèques de AzerothCore avec vcpkg (voir la documentation du cœur).
2. Clonez le cœur à la bonne version : `git clone https://github.com/jealous-sound/azerothcore-wotlk-coa.git`, puis `git checkout b95c4368`.
3. Si votre serveur est livré avec libmysql 8.4, appliquez `mysql-version.patch` (il n'exige que la même version majeure de MySQL).
4. Placez ce dépôt dans `modules/mod-barde` des sources, puis compilez avec `BUILD_BARDE.bat` après avoir adapté ses chemins, ou à la main : `cmake -DMODULES=static -DSCRIPTS=static -DAPPS_BUILD=world-only` puis la cible `worldserver`.
5. Le dossier qui contient le `worldserver.exe` obtenu et ses DLL est celui à donner à `INSTALLER.bat` quand il le demande.

**English.** The CoA server is based on this public core: <https://github.com/jealous-sound/azerothcore-wotlk-coa>. The module was built against version **`b95c4368`** ("Pin reviewed race overlay hashes to CoA Custom 1.7"), the one of the manager's "clean" server. If your server is another version, take the sources of **its** version.

1. Install Visual Studio ("Desktop development with C++"), CMake, Ninja and Git, and prepare AzerothCore's libraries with vcpkg (see the core's documentation).
2. Clone the core at the right version: `git clone https://github.com/jealous-sound/azerothcore-wotlk-coa.git`, then `git checkout b95c4368`.
3. If your server ships libmysql 8.4, apply `mysql-version.patch` (it only requires the same MySQL major version).
4. Put this repository in the sources' `modules/mod-barde`, then build with `BUILD_BARDE.bat` after adapting its paths, or by hand: `cmake -DMODULES=static -DSCRIPTS=static -DAPPS_BUILD=world-only` then the `worldserver` target.
5. The folder holding the resulting `worldserver.exe` and its DLLs is the one to give to `INSTALLER.bat` when it asks.

## Les scripts / The scripts

Ils contiennent des chemins propres au poste de développement (`M:\conquest\...`, `C:\coa-build\vcpkg`) : **adaptez-les**. / They contain paths specific to the development machine: **adapt them**.

- `INSTALLER.bat` + `trouver.ps1` : l'installateur ci-dessus (`trouver.ps1` cherche le serveur sur les disques). / the installer above (`trouver.ps1` looks for the server on the drives).
- `BUILD_BARDE.bat` : compile `worldserver` avec le module (Visual Studio, CMake, Ninja, vcpkg). / builds `worldserver` with the module.
- `INSTALL_BARDE.bat` + `install_barde.py` : l'installation proprement dite (utilisée par `INSTALLER.bat`). / the installation itself (used by `INSTALLER.bat`).
- `COPIER_SERVEUR.bat` : fait une copie du serveur d'origine pour y installer le module. / copies the original server to install the module into.
- `mysql-version.patch` : contournement propre à un serveur précis (version de libmysql). / a workaround specific to one server.

Manuels généraux / general guides: [INSTALL.md](../../INSTALL.md) (English), [INSTALL.fr.md](../../INSTALL.fr.md) (français).

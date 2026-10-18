# Scripts Windows / Windows scripts

## Installer sur un serveur CoA (le plus simple) / Install on a CoA server (the easy way)

**Français.** Pour un serveur « CoA Server » du gestionnaire (dossiers `Core`, `Data`, `mysql`, `Scripts`) :

1. Il faut un `worldserver.exe` **compilé avec le module**. Il n'est pas dans ce dépôt (il dépend des sources du serveur utilisé). Deux façons de l'obtenir : le compiler avec `BUILD_BARDE.bat` (voir plus bas), ou le demander à quelqu'un qui a le même serveur que vous. Le programme doit être de la **même version** que votre serveur.
2. Fermez le jeu et faites une copie de sécurité de votre dossier serveur.
3. Double-cliquez sur `INSTALLER.bat` et donnez les trois chemins : le serveur, le jeu, et le dossier qui contient le `worldserver.exe` compilé.
4. Le script arrête le serveur, installe le programme, la configuration et la base de données, fabrique le patch client à partir de **vos** DBC, copie l'addon et le patch dans le jeu, puis redémarre le serveur.
5. Quand « ready » apparaît, attendez 1 minute, lancez le jeu, puis (compte MJ) `.barde apprendre` et `/barde`.

Les autres joueurs n'ont rien de tout cela à faire : ils copient seulement `addon/Barde` dans `Interface\AddOns` et le `patch-ZO.MPQ` que vous avez fabriqué dans leur dossier `Data`, puis se connectent à votre serveur.

**English.** For a "CoA Server" from the manager (folders `Core`, `Data`, `mysql`, `Scripts`):

1. You need a `worldserver.exe` **built with the module**. It is not in this repository (it depends on the sources of the server used). Get it by building it with `BUILD_BARDE.bat` (see below), or ask someone who runs the same server. The program must be the **same version** as your server.
2. Close the game and back up your server folder.
3. Double-click `INSTALLER.bat` and give the three paths: the server, the game, and the folder holding the built `worldserver.exe`.
4. The script stops the server, installs the program, the configuration and the database, builds the client patch from **your** DBC files, copies the addon and the patch into the game, then restarts the server.
5. When "ready" shows, wait 1 minute, start the game, then (GM account) `.barde apprendre` and `/barde`.

Other players need none of this: they only copy `addon/Barde` into `Interface\AddOns` and the `patch-ZO.MPQ` you built into their `Data` folder, then connect to your server.

## Les scripts / The scripts

Ils contiennent des chemins propres au poste de développement (`M:\conquest\...`, `C:\coa-build\vcpkg`) : **adaptez-les**. / They contain paths specific to the development machine: **adapt them**.

- `INSTALLER.bat` : l'installateur ci-dessus, qui pose les questions. / the installer above, which asks the questions.
- `BUILD_BARDE.bat` : compile `worldserver` avec le module (Visual Studio, CMake, Ninja, vcpkg). / builds `worldserver` with the module.
- `INSTALL_BARDE.bat` + `install_barde.py` : l'installation proprement dite (utilisée par `INSTALLER.bat`). / the installation itself (used by `INSTALLER.bat`).
- `COPIER_SERVEUR.bat` : fait une copie du serveur d'origine pour y installer le module. / copies the original server to install the module into.
- `mysql-version.patch` : contournement propre à un serveur précis (version de libmysql). / a workaround specific to one server.

Manuels généraux / general guides: [INSTALL.md](../../INSTALL.md) (English), [INSTALL.fr.md](../../INSTALL.fr.md) (français).

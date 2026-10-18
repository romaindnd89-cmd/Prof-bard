# Commandes du métier de barde / Bard profession commands

**Français** · [English](#english)

Toutes les commandes serveur commencent par `.barde` (à taper dans le chat du jeu). Les commandes de maître de jeu (MJ) demandent un compte avec les droits MJ ; sur un serveur CoA, le gestionnaire (onglet « Comptes ») permet de régler le niveau d'un compte.

---

## Français

### Apprendre le métier

**Tout joueur peut l'apprendre sans aucune commande** : ouvrir le **Livre des artisans** (la fenêtre des métiers) et apprendre le sort **« Apprenti barde »** (gratuit, sans niveau requis). Il apparaît en tête de la liste, car son nom commence par « Apprenti ». Le sort « Barde » arrive alors dans le grimoire : un clic dessus (ou `/barde`) ouvre le carnet. La commande `.barde apprendre` n'est qu'un **raccourci de MJ**.

### Commandes du serveur (`.barde ...`)

| Commande | Accès | Ce qu'elle fait |
|---|---|---|
| `.barde airs` | joueur | Liste les airs du carnet (numéro, nom, niveau, tempo, durée). |
| `.barde jouer <n> [entrainement]` | joueur | Lance l'air numéro `n` avec le luth (le carnet de l'addon doit être installé). Avec `entrainement` : sans malus, chant réduit. |
| `.barde luth` | MJ | Donne un Luth de cuivre (joueur sélectionné, sinon vous). |
| `.barde instruments [palier] [qualité]` | MJ | Donne un exemplaire de chaque instrument qu'il n'a pas encore. `palier` de 0 (cuivre) à 4 (arcanite), `qualité` de 0 (commun) à 4 (légendaire). Exemple : `.barde instruments 4 3` donne les instruments d'arcanite épiques. |
| `.barde apprendre` | MJ | Raccourci : enseigne le métier de barde (joueur sélectionné, sinon vous). Un joueur normal l'apprend au Livre des artisans. |
| `.barde competence <valeur>` | MJ | Fixe la compétence de barde, de 1 au maximum du serveur (300 par défaut). Exemple : `.barde competence 300`. |
| `.barde duo <air> [justesse]` | MJ | Lance un duo de test avec un **partenaire virtuel** (pas besoin d'un second joueur). `justesse` en pourcentage (exemple : `.barde duo 1 90`). |
| `.barde legende tout` | MJ | **Pour les essais** : valide d'un coup les étapes de la quête légendaire (or et 100 % sur les airs du carnet, duel, trio). Les matériaux se remettent en jeu. |
| `.barde legende reset` | MJ | Efface les étapes franchies de la quête. Les airs ne sont pas touchés, et un instrument déjà forgé reste légendaire. |
| `.barde aura <1-7>` | MJ | Montre pendant 20 secondes l'une des sept apparences possibles de l'aura de jeu (essais visuels). |
| `.barde pose <1-3>` | MJ | Met l'instrument en main avec l'aura et l'une des danses, pendant 25 secondes. `.barde pose 0` arrête. |
| `.barde recharger` | administrateur | Recharge les airs, les instruments et les compositions depuis la base de données, sans redémarrer le serveur. Utilisable depuis la console du serveur. |

Les commandes `luth`, `instruments`, `apprendre`, `competence` et `legende` s'appliquent au **joueur sélectionné**, ou à vous si personne n'est sélectionné. `duo`, `aura` et `pose` s'appliquent toujours à vous.

### Commandes de l'addon (pour tous les joueurs)

| Commande | Ce qu'elle fait |
|---|---|
| `/barde` | Ouvre ou ferme le carnet. |
| `/barde improviser` (ou `improv`) | Ouvre l'improvisation (clavier libre, mode expert). |
| `/barde atelier` | Ouvre l'atelier. |
| `/barde lang fr` / `lang en` | Change la langue de l'addon (l'interface se recharge). |
| `/barde ecoute` | Coupe ou rétablit l'écoute des bardes proches. |
| `/barde auto [justesse]` | MJ seulement : le morceau se joue tout seul avec la justesse donnée (90 % par défaut), pour tester. Retaper la commande l'arrête. |
| `/applaud` (`/applaudir` en français) | Applaudit près de la bourse d'un concert (une ovation pour le barde). |

### Tester chaque fonction avec les commandes de MJ

| Fonction à tester | Comment |
|---|---|
| Jouer un air | Apprendre le métier (Livre des artisans, ou `.barde apprendre`), `.barde luth`, puis `/barde`, choisir un air, « Jouer ». |
| Atelier, qualités, accordage | `.barde competence 300`, puis l'Atelier. Pour des instruments déjà faits : `.barde instruments 4 3`. |
| Camp de barde | Atelier → onglet « Accordage » → « Fabriquer un camp ». Matériaux : `.additem 2592 4` (laine), `.additem 2319 2` (cuir moyen), `.additem 4471 1` (silex et amadou). |
| Jouer ensemble (duo) | `.barde duo 1` (partenaire virtuel), ou deux comptes dans un même groupe. La fenêtre de préparation s'ouvre. |
| Concert, bourse, ovations | Jouer dans un camp, une taverne ou une ville ; un second compte clique sur la bourse ou tape `/applaud`. |
| Compositions et parchemins | Impro → Enregistrer → Composer. Copier sur parchemin : `.additem 39354 1` (Parchemin léger). |
| Spécialités | `.barde competence 200` (il faut 180 minimum), puis le bouton « Spécialité » du carnet. Changer de spécialité coûte 10 po : `.modify money 100000`. |
| Quête légendaire | `.barde competence 300`, `.barde instruments 4 3`, puis `.barde legende tout`. Matériaux de l'étape 2 : `.additem 12360 10` (barre d'arcanite), `.additem 7080 5` (essence d'eau), `.additem 7077 1` (Cœur de feu), puis « Remettre » dans la fenêtre de la quête et « Forger la légende ». |
| Titres | Ils se gagnent en jouant ; le serveur les vérifie à chaque connexion. |
| Tout remettre à zéro (essais) | `.barde legende reset` pour la quête. |

Les commandes `.additem` et `.modify money` sont des commandes du jeu (MJ), pas du métier.

---

## English

All server commands start with `.barde` (typed in the in-game chat). Game-master (GM) commands need an account with GM rights; on a CoA server the manager's "Comptes" (accounts) tab sets an account's level.

### Learning the profession

**Any player can learn it without any command**: open the **Book of Artisans** (the professions window) and learn the spell **"Apprenti barde"** (free, no level required). It shows at the top of the list, because its name starts with "Apprenti". The "Barde" spell then arrives in the spellbook: a click on it (or `/barde`) opens the songbook. The `.barde apprendre` command is only a **GM shortcut**.

### Server commands (`.barde ...`)

| Command | Access | What it does |
|---|---|---|
| `.barde airs` | player | Lists the songbook's songs (number, name, level, tempo, length). |
| `.barde jouer <n> [entrainement]` | player | Starts song number `n` with the lute (the addon's songbook must be installed). With `entrainement`: no malus, reduced chant. |
| `.barde luth` | GM | Gives a Copper Lute (selected player, otherwise yourself). |
| `.barde instruments [tier] [quality]` | GM | Gives one of each instrument not yet owned. `tier` from 0 (copper) to 4 (arcanite), `quality` from 0 (common) to 4 (legendary). Example: `.barde instruments 4 3` gives the epic arcanite instruments. |
| `.barde apprendre` | GM | Shortcut: teaches the bard profession (selected player, otherwise yourself). A normal player learns it from the Book of Artisans. |
| `.barde competence <value>` | GM | Sets the bard skill, from 1 to the server maximum (300 by default). Example: `.barde competence 300`. |
| `.barde duo <song> [accuracy]` | GM | Starts a test duo with a **virtual partner** (no second player needed). `accuracy` in percent (example: `.barde duo 1 90`). |
| `.barde legende tout` | GM | **For testing**: validates the legendary quest steps at once (gold and 100 % on the book's songs, duel, trio). The materials are still handed in in game. |
| `.barde legende reset` | GM | Clears the quest steps passed. The songs are not touched, and an instrument already forged stays legendary. |
| `.barde aura <1-7>` | GM | Shows for 20 seconds one of the seven possible looks of the play aura (visual tests). |
| `.barde pose <1-3>` | GM | Puts the instrument in hand with the aura and one of the dances, for 25 seconds. `.barde pose 0` stops. |
| `.barde recharger` | administrator | Reloads songs, instruments and compositions from the database, without restarting the server. Usable from the server console. |

The `luth`, `instruments`, `apprendre`, `competence` and `legende` commands apply to the **selected player**, or to you if nobody is selected. `duo`, `aura` and `pose` always apply to you.

### Addon commands (for every player)

| Command | What it does |
|---|---|
| `/barde` | Opens or closes the songbook. |
| `/barde improviser` (or `improv`) | Opens the improvisation window (free keyboard, expert mode). |
| `/barde atelier` | Opens the workshop. |
| `/barde lang fr` / `lang en` | Changes the addon's language (the interface reloads). |
| `/barde ecoute` | Turns the listening to nearby bards off or on. |
| `/barde auto [accuracy]` | GM only: the song plays itself with the given accuracy (90 % by default), for testing. Typing it again stops it. |
| `/applaud` (`/applaudir` in French) | Applauds near a concert's purse (an ovation for the bard). |

### Testing each feature with the GM commands

| Feature to test | How |
|---|---|
| Playing a song | Learn the profession (Book of Artisans, or `.barde apprendre`), `.barde luth`, then `/barde`, pick a song, "Play". |
| Workshop, qualities, tuning | `.barde competence 300`, then the Workshop. For ready-made instruments: `.barde instruments 4 3`. |
| Bard camp | Workshop → "Accordage" (tuning) tab → "Fabriquer un camp" (craft a camp). Materials: `.additem 2592 4` (wool), `.additem 2319 2` (medium leather), `.additem 4471 1` (flint and tinder). |
| Playing together (duo) | `.barde duo 1` (virtual partner), or two accounts in the same group. The preparation window opens. |
| Concert, purse, ovations | Play at a camp, a tavern or a city; a second account clicks the purse or types `/applaud`. |
| Compositions and scrolls | Improv → Record → Compose. To copy onto a scroll: `.additem 39354 1` (Light Parchment). |
| Specialties | `.barde competence 200` (180 minimum), then the songbook's "Spécialité" (Specialty) button. Changing costs 10 gold: `.modify money 100000`. |
| Legendary quest | `.barde competence 300`, `.barde instruments 4 3`, then `.barde legende tout`. Step 2 materials: `.additem 12360 10` (arcanite bar), `.additem 7080 5` (essence of water), `.additem 7077 1` (Heart of Fire), then "Hand in" in the quest window and "Forge the legend". |
| Titles | Earned by playing; the server checks them at every login. |
| Reset (testing) | `.barde legende reset` for the quest. |

`.additem` and `.modify money` are game commands (GM), not profession commands.

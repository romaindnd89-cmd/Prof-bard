# mod-barde

Un métier de **barde** pour AzerothCore (WoW 3.3.5) : on joue des airs dans un mini-jeu de rythme pour obtenir des chants (des améliorations), seul ou à plusieurs, on fabrique ses instruments, on donne des concerts et on gravit un prestige jusqu'à un instrument légendaire.

*English: see [README.en.md](README.en.md).*

- Installation : [INSTALL.md](INSTALL.md)
- Tout ce que le métier apporte (texte d'annonce) : [ANNONCE-DISCORD.md](ANNONCE-DISCORD.md)
- Valeurs des chants : [docs/valeurs-des-buffs.md](docs/valeurs-des-buffs.md)
- Détail par version : [docs/](docs/) (`v0.3-ensemble`, `v0.4-atelier`, `v0.5-scene`, `v0.6-creation`, `v1.0-prestige`)

## Comment ça marche

Le jeu de rythme tourne sur le PC du joueur, dans l'addon `Barde`, parce que le décalage réseau le rendrait injouable s'il était jugé par le serveur. Le serveur, lui, ne fait confiance à rien :

1. Le joueur ouvre le carnet (`/barde`) et choisit un air et un instrument.
2. Le serveur vérifie qu'il peut jouer (instrument, compétence, état), envoie la partition à l'addon par message d'addon (préfixe `BARDE`) et note l'heure.
3. L'addon fait jouer le morceau (touches D F J K) et renvoie les totaux : parfaits, bons, ratés, tenues, combo, score.
4. Le serveur refuse tout résultat impossible (durée, totaux de notes, combo, score), calcule lui-même la justesse, puis applique le chant.

## Contenu du dépôt

| Chemin | Rôle |
|---|---|
| `src/` | Le module C++ (AzerothCore) : airs, sessions, chants, atelier, camp, concerts, duels, ensembles, compositions, titres, spécialités, quête légendaire. |
| `conf/mod_barde.conf.dist` | Tous les réglages et leurs valeurs par défaut. |
| `data/sql/db-world/`, `data/sql/db-characters/` | Les tables et les données (airs, instruments, paliers, formateur, objets, camp). |
| `addon/Barde/` | L'addon de jeu (Lua 5.1, API 3.3.5), à copier dans `Interface\AddOns` du client. Sons et textures sont générés par les outils. |
| `tools/` | Les générateurs : DBC et patch client (`barde_dbc.py`), SQL des instruments et des airs, sons, textures, traductions de l'addon. |
| `scripts/windows/` | Les scripts qui compilent et installent sous Windows (à adapter à vos chemins). |
| `docs/` | La conception, par version. |

## Prérequis

- Un serveur AzerothCore (3.3.5a) que vous compilez vous-même, avec les modules statiques.
- Python 3 (aucune bibliothèque externe) pour les outils.
- Les fichiers `Spell.dbc`, `Item.dbc`, `SpellItemEnchantment.dbc`, `AnimationData.dbc` et `CharTitles.dbc` de votre serveur : les outils y ajoutent les lignes du barde et fabriquent le patch client `patch-ZO.MPQ`. **Ces fichiers contiennent des données du jeu : ils ne sont pas dans ce dépôt**, chacun les génère à partir des siens.

## Compatibilité

Développé et testé sur un serveur CoA (AzerothCore, client 3.3.5). Les identifiants utilisés sont réservés dans la plage 1950xxx (sorts, objets) et 1950501 à 1950504 (améliorations) : vérifiez qu'ils sont libres chez vous. Les formateurs et les modèles utilisés par certains objets sont ceux de ce serveur : voir [INSTALL.md](INSTALL.md) pour les adapter.

## Licence

GNU Affero General Public License v3.0, comme AzerothCore. Voir `LICENSE`.

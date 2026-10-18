# Valeurs des buffs d'instrument

Valeurs pour un serveur niveau 60 (CoA), réglées dans `tools/instruments.json` (colonnes `min` et `max`), qui alimente la table
`mod_barde_instrument` (`min_solo`, `max_solo`) et les sorts du client. On peut aussi les changer directement dans la base, sans recompiler.
Un air donne `min` pour le premier du carnet et `max` pour le plus dur, entre les deux en proportion de son rang.
Le duo multiplie par 1,6, le trio par 2 (v0.3). Les valeurs sont des entiers : le jeu n'accepte pas de décimales pour ces effets.

Choix de conception (17 octobre 2026) : pour que le métier vaille la peine d'être joué, le solo atteint **le niveau d'un buff de classe**
au plus dur des airs. Le chant est un sort à part : il s'ajoute aux buffs de classe (aucun `spell_group` ne les relie pour l'instant).
Un seul chant à la fois par barde.

| Instrument | Effet | Solo (premier air → plus dur) | Duo | Trio | Repères sur le serveur |
|---|---|---|---|---|---|
| Luth | mana / 5 s | 6 → 33 | 53 | 66 | Bénédiction de sagesse rang 6, Appel du vent rang 6, Instinct du bosquet rang 6 : 33. Élixir de régénération puissante : 30. Flacon Pure Mojo : 45. |
| Harpe | PV / 5 s | 10 → 45 | 72 | 90 | Peu de repères (potion de sang de troll : 20). |
| Flûte | vitesse % | 5 → 12 | 19 | 24 | Pas de buff de vitesse durable chez les classes. |
| Cromorne | dégâts infligés % | 2 → 5 | 8 | 10 | Buffs de dégâts de groupe des classes : 3 %. **À surveiller** : le solo dépasse la classe. |
| Vièle | armure | 150 → 1 200 | 1 920 | 2 400 | Inner Fire rang 5 et 6 : 1 170 à 1 395. Élixirs : 450. |
| Piano | résistance aux magies | 10 → 60 | 96 | 120 | Auras de résistance de classe : 60 à 70. |
| Orgue portatif | hâte % (mêlée, distance et sorts) | 2 → 5 | 8 | 10 | Wrath of Air, Swift Retribution : 3 à 5 %. Pas d'expérience (trop fort). |
| Ocarina | coup critique % | 1 → 4 | 6 | 8 | Chef de meute, aura du sélénien : 3 %. **À surveiller.** |
| Tympanon | endurance | 10 → 54 | 86 | 108 | Mot de pouvoir : Robustesse rang 6 : 54 à 100. |

Les repères viennent de `Spell.dbc` du serveur. Les chiffres de la harpe, du cromorne et de l'ocarina reposent surtout sur le barème
Classic, faute de buff comparable durable dans la base.

Différence avec le cahier des charges : le cahier prévoit que le chant ne se cumule pas avec un buff de classe du même effet (règle du plus fort,
`spell_group_stack_rules`). Ce n'est pas encore fait : tant que ce n'est pas décidé, le chant s'ajoute au buff de classe. À trancher avant la v0.3.

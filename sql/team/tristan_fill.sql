// GENRE

INSERT INTO genre
VALUES 
  (1, 'Action'),
  (2, 'Beat em up'),
  (3, 'Shooter'),
  (4, 'Geschicklichkeit'),
  (5, 'Jump n Run'),
  (6, 'Open World'),
  (7, 'Musik'),
  (8, 'Tanz'),
  (9, 'RPG'),
  (10, 'Simulation'),
  (11, 'Sport'),
  (12, 'Strategie'),
  (13, 'Rennspiel'),
  (14, 'Survival'),
  (15, 'Open-World-Survival'),
  (16, 'Multiplayer Online Battle Arena');

// DEVELOPER

INSERT INTO developer
VALUES 
  (1, 'Studio Wildcard'), 
  (2, 'Firaxis Games'), 
  (3, 'Netherrealm Studios'), 
  (4, 'Forest Anderson'), 
  (5, 'Treyarch'),
  (6, 'Nintendo'),
  (7, 'CD Project'),
  (8, 'Riot Games'),
  (9, 'Psyonix'),
  (10, 'Ubisoft Montreal'),
  (11, 'Porcelain Fortress'),
  (12, 'Behaviour Interactive'),
  (13, 'Larian Studios'),
  (14, 'DICE'),
  (15, 'Ghost Games'),
  (16, 'Ubisoft');

// PUBLISHER

INSERT INTO publisher
VALUES
  (1, 'Studio Wildcard'),
  (2, '2K'),
  (3, 'Warner Bros. Games'),
  (4, 'Forest Anderson'),
  (5, 'Activision'),
  (6, 'CD Project'),
  (7, 'Psyonix'),
  (8, 'Ubisoft'),
  (9, 'Porcelain Fortress'),
  (10, 'Larian Studios'),
  (11, 'Electronic Arts'),
  (12, 'Riot Games');

// GAME

INSERT INTO game
VALUES
  (1,'ARK: Survival Evolved',15,'16',1,1,'2017-08-27','Als ein nackte/r Mann/Frau frierend und hungrig auf einer mysteriösen Insel gestrandet, musst du jagen, sammeln, Gegenstände fertigen, Früchte anpflanzen und einen Unterschlupf bauen, um zu überleben. Benutze Geschick und List, um auf ARK lebende Dinosaurier und urzeitliche Lebewesen zu töten, auszubrüten und zu reiten und verbünde dich mit Hunderten von Spielern oder spiele lokal!','["Einzelspieler", "Mehrspieler", "MMO", "Hardcore Mechanics", "Explore and Discover"]'),
  (2,'Civilization VI',12,'12',2,2,'2016-10-21','Civilization VI ist die neueste Ausgabe der prämierten Reihe Civilization. Geh mit deinem Reich auf Expansionskurs, bring deine Kultur voran und fordere die großen Anführer der Menschheitsgeschichte heraus.','[\"Einzelspieler\", \"Online-PvP\", \"LAN-PvP\", \"PvE\"]'),
  (3,'Mortal Kombat 11',2,'18',3,3,'2019-04-23','Mit den neuen benutzerdefinierten Charaktervariationen hast du eine beispiellose Kontrolle, um die Kämpfer anzupassen und zu deinen eigenen zu machen. Die neue Grafik-Engine, die jeden augenrausfallenden, schädelbrechenden Moment zur Schau stellt, bringt dich so nah an den Kampf, dass du ihn fühlen kannst. Mit einer Reihe neuer und wiederkehrender Klassik-Kämpfer setzt Mortal Kombats bester kinematografischer Story-Modus die epische Saga seit 25 Jahren fort.','[\"Einzelspieler\", \"Online-PvP\", \"PvE\", \"Splitscreen\", \"Blood and Gore\"]'),
  (4,'Veloren',9,'0',4,4,'2018-01-01','Veloren ist ein quelloffenes Computerrollenspiel mit Voxel-Technik, das unter der GPLv3 lizenziert ist. Das Spiel ist unter anderem von Cube World, Minecraft und The Legend of Zelda: Breath of the Wild inspiriert. Im Gegensatz zu kommerziellen Titeln geschieht sowohl die Entwicklung des Spieles als auch die Finanzierung laufender Kosten durch die Community.[1] Der Launcher Airshipper, durch den das Spiel heruntergeladen und aktualisiert wird, steht für Windows, macOS sowie Linux zum freien Download zur Verfügung. Zusätzlich ist das Spiel in diversen Linux-Paketmanagern, etwa dem Arch User Repository,[2] verfügbar. Das Projekt wird in der Programmiersprache Rust umgesetzt.','[\"Einzelspieler\", \"Mehrspieler\", \"PvE\", \"PvP\", \"Free to Play\", \"Explore and Discover\"]'),
  (5,'Call of Duty: Black Ops 2',3,'18',5,5,'2012-11-13','Als neunter Teil der Call-of-Duty-Serie knüpft er direkt an die Geschehnisse des Vorgängertitels Call of Duty: Black Ops an. Die Handlung spielt teils in den 1980er Jahren und im Jahre 2025. Der Spieler kann unter anderem durch die neuen Strike-Force-Modi die Handlung durch eigene Entscheidungen beeinflussen. Das Setting soll sich in einzelnen Abschnitten an Echtzeit-Strategiespielen orientieren.','[\"Einzelspieler\", \"Mehrspieler\", \"FPS\", \"Co-Op\", \"PvE\"]'),
  (6,'Just Dance',8,'0',16,8,'2009-11-12','In Just Dance versucht der Spieler, alle Bewegungen des On-Screen-Tänzers zu imitieren. Spieler erhalten Punkte je nachdem, wie gut sie sich bewegt haben.','[\"Einzelspieler\", \"Mehrspieler\", \"Versus\", \"Tracking\"]'),
  (7,'Cyberpunk 2077',9,'18',7,6,'2020-12-10','Cyberpunk 2077 ist ein Open-World-Action-Adventure-RPG, das in Night City spielt – einer gefährlichen Metropole, deren Bewohner von Macht, Glamour und Körpermodifikationen besessen sind.','[\"Einzelspieler\", \"PvE\", \"FPS\"]'),
  (8,'League of Legends',16,'12',8,12,'2009-10-27','League of Legends ist ein teambasiertes Strategiespiel, in dem zwei Teams mit je fünf starken Champions gegeneinander antreten, um die jeweils andere Basis zu zerstören.','[\"Einzelspieler\", \"Mehrspieler\", \"PvP\", \"PvE\"]');
  /*Test Data - editing required*/
  (9,'Rocket League',8,'0',16,8,'2009-11-12','In Just Dance versucht der Spieler, alle Bewegungen des On-Screen-Tänzers zu imitieren. Spieler erhalten Punkte je nachdem, wie gut sie sich bewegt haben.','[\"Einzelspieler\", \"Mehrspieler\", \"Versus\", \"Tracking\"]'),
  (10,'Legends of Runeterra',8,'0',16,8,'2009-11-12','In Just Dance versucht der Spieler, alle Bewegungen des On-Screen-Tänzers zu imitieren. Spieler erhalten Punkte je nachdem, wie gut sie sich bewegt haben.','[\"Einzelspieler\", \"Mehrspieler\", \"Versus\", \"Tracking\"]'),
  (11,'Tom Clancys Rainbow Six: Siege',8,'0',16,8,'2009-11-12','In Just Dance versucht der Spieler, alle Bewegungen des On-Screen-Tänzers zu imitieren. Spieler erhalten Punkte je nachdem, wie gut sie sich bewegt haben.','[\"Einzelspieler\", \"Mehrspieler\", \"Versus\", \"Tracking\"]'),
  (12,'No Time To Relax',8,'0',16,8,'2009-11-12','In Just Dance versucht der Spieler, alle Bewegungen des On-Screen-Tänzers zu imitieren. Spieler erhalten Punkte je nachdem, wie gut sie sich bewegt haben.','[\"Einzelspieler\", \"Mehrspieler\", \"Versus\", \"Tracking\"]'),
  (13,'Divinity: Original Sin 2',8,'0',16,8,'2009-11-12','In Just Dance versucht der Spieler, alle Bewegungen des On-Screen-Tänzers zu imitieren. Spieler erhalten Punkte je nachdem, wie gut sie sich bewegt haben.','[\"Einzelspieler\", \"Mehrspieler\", \"Versus\", \"Tracking\"]'),
  (14,'Star Wars: Battlefront 2',8,'0',16,8,'2009-11-12','In Just Dance versucht der Spieler, alle Bewegungen des On-Screen-Tänzers zu imitieren. Spieler erhalten Punkte je nachdem, wie gut sie sich bewegt haben.','[\"Einzelspieler\", \"Mehrspieler\", \"Versus\", \"Tracking\"]'),
  (15,'Need For Speed: Heat',8,'0',16,8,'2009-11-12','In Just Dance versucht der Spieler, alle Bewegungen des On-Screen-Tänzers zu imitieren. Spieler erhalten Punkte je nachdem, wie gut sie sich bewegt haben.','[\"Einzelspieler\", \"Mehrspieler\", \"Versus\", \"Tracking\"]'),
  (16,'Minecraft',8,'0',16,8,'2009-11-12','In Just Dance versucht der Spieler, alle Bewegungen des On-Screen-Tänzers zu imitieren. Spieler erhalten Punkte je nachdem, wie gut sie sich bewegt haben.','[\"Einzelspieler\", \"Mehrspieler\", \"Versus\", \"Tracking\"]'),


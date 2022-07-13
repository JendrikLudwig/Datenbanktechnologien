# Projekt Datenbanktechnologien (GameBase)
Von Jendrik Ludwig, Tristan Grobasch, Johannes Jäger

# Inhalt
 - [Beschreibung](#beschreibung)
 - [Nutzung des Frontendes](#nutzung-des-frontendes)
 - [Installation](#installation)
 - [Techstack](#tech-stack)
 - [Features](#features)
 - [Seiten](#seiten)
 - [API-Schnittstellen](#api-schnittstellen)



## Beschreibung

Das Projekt "GameBase" entstand im Rahmen des Moduls "Datenbanktechnologien" der Hochschule Fulda im Sommersemester 2022 durch Jendrik Ludwig, Johannes Jäger und Tristan Grobasch. GameBase ist eine Datenbank, welche plattformübergreifend Benutzer und Spiele und deren Verbindungen erfasst und durch ein entsprechendes Frontend visualisiert. Das Ziel ist es, die Datengrundlagen von Spieleplattformen wie "Steam" oder "Origin" zu verknüpfen und eine universelle Erfassung dieser Daten zu schaffen.

In der folgenden README wird nur das Frontend des Projektes thematisiert. Ein Github Repository mit allen anderen relevanten Dateien ist unter folgendem Link auffindbar:
- [Datenbankentechnologien Repo](https://github.com/JendrikLudwig/Datenbanktechnologien)

Ausgangslage dieser `README.md` (im o.g. Repository) ist der Ordner [web](https://github.com/JendrikLudwig/Datenbanktechnologien/tree/main/web).

## Nutzung des Frontendes
Sie können sich mit folgenden Daten im Webfrontend anmelden:
- E-Mail: miroslawa.reichmann@example.com
- Passwort: 85ca9d569762f02f36000944d9462d7b21a368a1

## Installation


### Anpassen der Datenbankverbindung
Bitte erstellen Sie für die Anbindung der Datenbank einen neuen Nutzer nach folgenden Daten:
- Nutzername: frontend
- Passwort: datenbanktechnologien123!
- Berechtigungen: DBA

### 🟥  ODER  🟥

Passen Sie die Daten in folgender Datei an:
```path
./web/src/lib/db/mysql.js
```

```javasript
import mysql from 'mysql2/promise';

export const mysqlconn = await mysql.createConnection({ 
    host: 'localhost',                                  # Host-Adresse der Datenbank
    port:'3306',                                        # Part der Datenbank
    user: 'frontend',                                   # UserName
    password: 'datenbanktechnologien123!',              # Passwort
    database: 'datenbanktechnologien_grojäglud'         # Datenbank (Bitte nicht verändern)
});
```
### Aufsetzen des Webfrontends
Vergewissern Sie sich, das Sie sich im Ordner `web` befinden
Öffnen Sie Ihre Kommandozeile/Bash

Installieren Sie die `node_modules` über folgende Kommandos:

```bash
  npm install
```

Starten Sie den Server:
```bash
  npm start
```



## Tech-Stack

### Wahl des Tech-Stacks

Für die Umsetzung unseres Web-Frontends haben wir uns für folgenden Tech-Stack entschieden:
- Backend/Frontend: [SvelteKit](https://kit.svelte.dev/) / [Svelte](https://svelte.dev/)

### SvelteKit / Svelte

Svelte is a radical new approach to building user interfaces. Whereas traditional frameworks like React and Vue do the bulk of their work in the browser, Svelte shifts that work into a compile step that happens when you build your app.

Das JavaScript-Webframework Svelte erlaubt es uns, in einer Syntax zu schreiben, die auf dem klassischen HTML-DOM beruht und genau wie dieser funktioniert.

```
  Valider HTML Code ist gleichzeitig auch valider Svelte Code
```

Durch das komponentenbasierte Arbeiten und die Möglichkeit, nicht zu komplizierte JavaScript-Funktionen nutzen zu müssen (wie etwa in React), sahen wir Svelte als  eine gute Möglichkeit, unsere Projektarbeit in einem modernen Webframework umsetzen zu können.

Die einzelnen Seiten und Komponenten werden in `.svelte` Dateien angelegt, während das Routing und API Handling von SvelteKit in klassischen `.js` od `.json.js` Dateien umgesetzt ist.

### Ordnerstruktur

Alle von uns angefertigten und für das Frontend wichtigen Dateien befinden sich im Ordner `src`

```
web
└── src  
    ├── comp                # Ausgelagerte Komponenten (.svelte Datein)
    ├── lib                 # Ressourcen wie etwa Bilder, Schriftarten oder Logindaten für die Datenbank
    ├── routes              # Hier findet das Routing statt.
        ├── api             # Alle Endpunkte für die API des Projektes liegen hier
        └── ... .svelte     # Alle Svelte Dateien in diesem Ordner sind Seiten, die sich über den Browser erreichen lassen (add.svelte => localhost:3000/add)
    ├── stores              # Stores sind Variablen, die während der Laufzeit in einem Projekt gespeichert und zwischen anderen Komponenten geteilt werden können.
    └── app.html            # Grundgerüst der App (Nicht wichtig)
```


## Features
Folgende Features sind in unserem Frontend umgesetzt:
- Anmelden in die Webapplikation über Nutzerdaten in der Datenbank
- Anzeigen und Durchsuchen aller Spiele in der Datenbank
- Detailansicht jedes Spiels
- Hinzufügen von eigenen Spielen über eigene Eingabemaske
- Löschen von Spielen aus der Datenbank



## Seiten

### Login
Anmelden in das Webfrontend über Nutzerdaten
- EMail-Adresse
- Passwort

```
  http://localhost:3000/login
```

### Start
Übersicht der wichtigsten Funktionen
```
  http://localhost:3000
```

### Spieleliste/Suche
Anzeigen und Durchsuchen aller in der Datenbank vorhandenen Spiele
```
  http://localhost:3000/games
```

### Spiel-Einzelansicht
Ansicht aller relevanten Daten eines Spiels
```
  http://localhost:3000/games/[Spiele ID]
```

### Hinzufügen
Eingabemaske, um ein neues Spiel in die Datenbank eintragen zu können
```
  http://localhost:3000/add
```
   
    

## API-Schnittstellen
Folgende API-Endpunkte sind im Backend programmiert
- [Code Aller Endpunkte](https://github.com/JendrikLudwig/Datenbanktechnologien/tree/main/web/src/routes/api) `web/src/routes/api/*`
#### Anmelden

```http
  POST /api/login.json
```
Anmelden eines Nutzers (Liefert User Object zur Validierung)

| Parameter | Typ      | Beschreibung               |
| :-------- | :------- | :------------------------- |
| `mail`    | `string` | Email des Nutzers |
| `password`| `string` | Passwort des Nutzers |

#### Umgebungsdaten

Liefert Informationen über vorhandene Daten in der Datenbank (alle Genre, alle Launcher, alle Features, alle Entwickler, alle Publisher)
```http
  GET /api/environment.json
```

#### Spieldaten

Liefert alle Spiele in der Datenbank
```http
  GET /api/games.json
```
Fügt ein Spiel hinzu
```http
  POST /api/games.json
```
| Parameter | Typ      | Beschreibung               |
| :-------- | :------- | :------------------------- |
| `input_desc`    | `string` | Beschreibung des Spiels |
| `input_dev`| `integer` | ID des Entwicklers |
| `input_features`| `string` | JSON Array der Features |
| `input_fsk`| `string` | (0, 6, 12, 16, 18) FSK Freigabe des Spiels |
| `input_genre`| `string` | Genre ID des Spiels |
| `input_name`| `string` | Name des Spiels |
| `input_pub`| `string` | ID des Publishers |
| `input_release`| `string` | Releasedate des Spiels |
| `launcher`| `Object` | Array mit Objekten aus ID und url (LauncherID und Link zur Plattform) |




Liefert Daten für ein bestimmtes Spiel
```http
  GET /api/games/[ID].json
```

Löschen eines Spiels
```http
  DELETE /api/games/[ID].json
```




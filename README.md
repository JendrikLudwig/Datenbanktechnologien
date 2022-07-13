# Projekt Datenbanktechnologien (GameBase)
Von Jendrik Ludwig, Tristan Grobasch, Johannes Jäger

## Beschreibung

Dieses Projekt entsteht im Rahmen des Moduls Datenbanktechnologien der Hochschule Fulda im Sommer Semester 2022

In der folgenden README wird nur das Frontend des Projektes thematisiert. Ein Github Repository mit allen anderen relevanten Datein ist unter folgendem Link auffindbar:
- [Datenbankentechnologien Repo](https://github.com/JendrikLudwig/Datenbanktechnologien)

Ausgangslage dieser `README.md` (im o.g. Repository) ist der Ordner [web](https://github.com/JendrikLudwig/Datenbanktechnologien/tree/main/web).

## Wahl des Tech-Stacks

Für die Umsetzung unseres Web-Frontends haben wir uns für folgenden Tech-Stack entschieden:
- Backend/Frontend: [SvelteKit](https://kit.svelte.dev/) / [Svelte](https://svelte.dev/)

### SvelteKit / Svelte

Svelte is a radical new approach to building user interfaces. Whereas traditional frameworks like React and Vue do the bulk of their work in the browser, Svelte shifts that work into a compile step that happens when you build your app.

Das Javascript-Webframework Svelte erlaubt es uns in einer Syntax zu schreiben, die auf dem klassischen HTML-DOM beruht und genau wie dieser funktioniert.

```
  Valider HTML Code ist gleichzeitig auch valider Svelte Code
```

Durch das komponentenbasierte Arbeiten und die Möglichkeit nicht zu verkomplizierte Javascript-Funktionen nutzen zu müssen (wie etwa in React.) sahen wir Svelte als  eine gute Möglichkeit, unsere Projektarbeit in einem modernen Webframework umsetzen zu können.

Die Einzelnen Seiten und Komponenten werden in `.svelte` Datein angelegt, während das Routing und API handling von SvelteKit in klassischen `.js` od `.json.js` Datein umgesetzt ist.

## Ordnerstruktur

Alle von uns angefertigten und für das frontend wichtigen Datein befinden sich im Ordner `src`

```
.
└── src  
    ├── comp                # Ausgelagerte Komponenten (.svelte Datein)
    ├── lib                 # Ressourcen wie etwa Bilder, Schriftarten oder Logindaten für die Datenbank
    ├── routes              # Hier findet das Routing statt.
        ├── api             # Alle Endpunkte für die API des Projektes liegen hier
        └── ... .svelte     # Alle Svelte Datein in diesem Ordner sind Seiten die sich über den Browser erreichen lassen (add.svelte => localhost:3000/add)
    ├── stores              # Stores sind Variablen die während der laufzeit in einem Projekt gespeichert werden und zwischen anderen Komponenten geteilt werden können.
    └── app.html            # Grundgerüst der App (Nicht wichtig)
```


## Features
Folgende Features sind in unserem Frontend umgesetzt:
- Light/dark mode toggle
- Live previews
- Fullscreen mode
- Cross platform




## Installation

Install my-project with npm

```bash
  npm install my-project
  cd my-project
```
    
    

## API Reference

#### Get all items

```http
  GET /api/items
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `api_key` | `string` | **Required**. Your API key |

#### Get item

```http
  GET /api/items/${id}
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `string` | **Required**. Id of item to fetch |

# luccalug.it

Sito del Luccalug - Lucca Linux User Group: <https://luccalug.it>

Sito statico generato con [Hugo](https://gohugo.io), senza tema esterno: layout, CSS e JavaScript sono tutti in questo repository.

## Sviluppo in locale

Serve **Hugo extended 0.169.0** (la stessa versione usata in CI, vedi `HUGO_VERSION` in `.github/workflows/deploy.yml`).

```sh
git clone https://github.com/Luccalug/luccalug.it
cd luccalug.it
hugo server -D          # anteprima su http://localhost:1313, bozze incluse
```

Build come in produzione:

```sh
hugo --minify --baseURL "https://luccalug.it/"
```

L'output finisce in `public/`; le immagini elaborate in `resources/_gen/`. Entrambe le cartelle sono ignorate da git.

## Struttura

| Cartella | Contenuto |
| --- | --- |
| `content/` | Pagine e articoli in Markdown (`blog/`, `archivio/`, `tags/`, pagine singole) |
| `layouts/` | Template, partial (`partials/`) e shortcode (`shortcodes/`) |
| `assets/` | CSS e immagini elaborate da Hugo (ridimensionamento, WebP, fingerprint) |
| `static/` | File copiati così come sono (font, favicon, `CNAME`, `humans.txt`) |
| `.github/workflows/` | Build, controlli e deploy |

## Scrivere un articolo

Crea un file in `content/blog/` con un front matter come questo:

```yaml
---
title: "Titolo dell'articolo"
slug: "titolo-dell-articolo"
date: 2026-11-04
author: "Il Direttivo"
tags: ["serata-a-tema", "software-libero"]
description: "Una o due frasi (massimo ~160 caratteri) per i motori di ricerca e le anteprime social."
image: "/images/blog/titolo-dell-articolo/locandina.png"   # facoltativa, file in assets/
---
```

- L'URL diventa `/blog/AAAA/MM/slug/`.
- **Tag**: minuscoli e con il trattino (`stampa-3d`), riusando quelli esistenti (vedi `/tags/`). Per dare a un tag un titolo diverso da quello automatico (sigle, marchi) crea `content/tags/<tag>/_index.md` con un `title`.
- **Immagini**: mettile in `assets/images/blog/<slug>/` e usa lo shortcode `figure`. Per l'immagine in cima all'articolo aggiungi `loading="eager"`:

  ```text
  {{< figure loading="eager" src="images/blog/<slug>/locandina.png" alt="Descrizione" >}}
  ```

- `image` nel front matter è l'immagine per le anteprime social: Hugo la converte in 1200×630.

Shortcode disponibili in `layouts/shortcodes/` (ognuno ha la documentazione in testa al file): `badge`, `details`, `download`, `eventi`, `evento`, `figure`, `gallery`/`gallery-img`, `link-esterno`, `mappa`, `member`, `note`, `tabs`/`tab`, `terminal`, `youtube`, `colonne`/`colonna`.

## Calendario

Gli eventi sono nel front matter di `content/calendario.md` (`events`). Da lì vengono generati la tabella "Prossimi eventi" (solo eventi futuri) e il file `calendario.ics`. Il sito viene ricostruito ogni notte, così gli eventi passati spariscono dalla tabella da soli.

## Pagine in bozza

`draft: true` esclude una pagina dalla pubblicazione (si vede solo con `hugo server -D`). Al momento sono in bozza:

- `content/archivio/statuto/statuto-vigente.md`, in attesa del testo approvato;
- `content/privacy.md`, in attesa dell'approvazione del Direttivo (il link nel footer compare quando viene pubblicata).

## CI e deploy

A ogni push su `master`, e ogni notte, GitHub Actions:

1. controlla il Markdown (markdownlint) e l'ortografia (cspell, con il dizionario italiano);
2. fa la build e controlla i link (lychee);
3. pubblica `public/` sul branch `gh-pages`, servito da GitHub Pages.

Per lanciare cspell in locale serve il dizionario italiano:

```sh
npm install --no-save @cspell/dict-it-it
npx cspell "content/**/*.md"
```

## Licenza

I contenuti del sito sono distribuiti con licenza [Creative Commons Attribuzione 3.0](LICENSE), salvo dove indicato diversamente.

## Contribuire

Vuoi scrivere un articolo o migliorare il sito? Apri una issue o una pull request, oppure [contattaci](https://luccalug.it/contatti/).

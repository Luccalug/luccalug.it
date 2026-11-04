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
| `layouts/` | Template nella struttura di Hugo 0.146+: partial in `_partials/`, shortcode in `_shortcodes/`, render hook in `_markup/` |
| `assets/` | CSS e immagini elaborate da Hugo (ridimensionamento, WebP, fingerprint) |
| `static/` | File copiati così come sono (font, favicon, `CNAME`, `humans.txt`) |
| `archetypes/` | Modelli usati da `hugo new content` |
| `.github/` | Workflow di build, controlli e deploy; configurazione di Dependabot |

## Scrivere un articolo

Il modo più semplice è `hugo new content blog/titolo-dell-articolo.md`: crea il file in bozza (`draft: true`) con il front matter già pronto. Il risultato è un front matter come questo:

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
- **Tag**: minuscoli e con il trattino (`stampa-3d`), riusando quelli esistenti (vedi `/tags/`). Per dare a un tag un titolo diverso da quello automatico (sigle, marchi) crea `content/tags/<tag>/_index.md` con un `title`. La pagina di un tag usato da un solo articolo non viene indicizzata dai motori di ricerca finché non ne ha almeno due. Per accorpare un tag in un altro, sostituiscilo negli articoli e aggiungi il vecchio indirizzo agli `aliases` del tag di destinazione (es. `content/tags/sito/_index.md`).
- **Immagini**: mettile in `assets/images/blog/<slug>/` e usa lo shortcode `figure`. Il testo alternativo `alt` è obbligatorio, e un'immagine che non esiste fa fallire la build. Viene pubblicata solo la versione WebP ridimensionata, mai il file originale. Per l'immagine in cima all'articolo aggiungi `loading="eager"`:

  ```text
  {{< figure loading="eager" src="images/blog/<slug>/locandina.png" alt="Descrizione" >}}
  ```

- `image` nel front matter è l'immagine per le anteprime social: Hugo la converte in 1200×630.
- **Data di ultima modifica**: non viene presa da git. Se cambi il contenuto di un articolo o di una pagina già pubblicati (non per correzioni di link, tag o refusi) aggiungi `lastmod: AAAA-MM-GG` nel front matter; senza, vale `date`. Finisce nel sitemap e nei metadati `article:modified_time`/`dateModified`.

Shortcode disponibili in `layouts/_shortcodes/` (ognuno ha la documentazione in testa al file): `badge`, `details`, `download`, `eventi`, `evento`, `iscrizione-calendario`, `figure`, `gallery`/`gallery-img`, `link-esterno`, `mappa`, `member`, `note`, `tabs`/`tab`, `terminal`, `youtube`, `colonne`/`colonna`.

## Calendario

Gli eventi sono nel front matter di `content/calendario.md`: gli incontri settimanali in `recurring`, gli altri eventi in `events`. I campi sono spiegati in un commento in testa al file. Da lì vengono generati la tabella "Prossimi eventi" (solo eventi futuri), il file `calendario.ics` e le schede degli eventi negli articoli. Il sito viene ricostruito ogni notte, così gli eventi passati spariscono dalla tabella da soli. Quando aggiungi o modifichi un evento aggiorna anche `lastmod` in testa al file.

Gli incontri settimanali si scrivono una volta sola, come regola (giorno della settimana, orario, luogo, titolo, data di inizio ed eventualmente di fine). Il sito genera un evento per ogni settimana fino a 12 settimane dopo la build, quindi le nuove date compaiono da sole con la build notturna. Un evento in `events` nello stesso giorno sostituisce l'incontro e prende dalla regola quello che non scrive: una serata a tema basta scriverla con `date`, `summary`, `description` e `url`; un incontro annullato con `date`, `status: cancelled` e il motivo in `description`. Se cambiano sede o orario da una certa data in poi, chiudi la regola con `until` e aggiungine una nuova con `from`: modificare la regola cambierebbe anche gli incontri passati.

Per annullare un evento non toglierlo e non cambiarne il titolo: aggiungi `status: cancelled` e scrivi il motivo in `description`. In tabella resta barrato, con l'etichetta "Annullato", e chi ha importato il calendario lo vede annullato. Nel file `.ics` ogni evento è identificato dalla data: se due eventi cadono nello stesso giorno la build si ferma e chiede di dare a uno dei due un campo `id`. Un evento con `id` si aggiunge all'incontro settimanale di quel giorno invece di sostituirlo.

Per mostrare in un articolo la scheda di un evento del calendario basta `{{< evento data="2026-11-23" >}}` (o `id="…"` per un evento con `id`): titolo, orario, luogo, descrizione, link e stato vengono dal calendario, quindi non vanno ripetuti e restano aggiornati, anche se l'evento viene annullato. Nel calendario aggiungi all'evento `url` con l'indirizzo dell'articolo, così in tabella il titolo diventa un link. Finché l'evento non è passato, e se non è annullato, la scheda ha anche il link "Aggiungi al calendario" a un file `.ics` con solo quell'evento (es. `/calendario/2026-11-23.ics`), generato nella build. Gli eventi passati che non sono in calendario usano la forma completa (`titolo`, `data`, `luogo`…), documentata in testa a `layouts/_shortcodes/evento.html`.

La sezione "Aggiungi il Calendario" della pagina usa lo shortcode `iscrizione-calendario`, che genera dall'indirizzo del file `.ics` i pulsanti per iscriversi con Google Calendar e Apple Calendario (`webcal://`) e, con `mostra="indirizzo"`, l'indirizzo da incollare negli altri programmi. Chi si iscrive riceve da solo gli aggiornamenti; il file scaricato invece resta fermo al momento del download.

## Pagine in bozza

`draft: true` esclude una pagina dalla pubblicazione (si vede solo con `hugo server -D`). Al momento sono in bozza:

- `content/archivio/statuto/statuto-vigente.md`, in attesa del testo approvato;
- `content/privacy.md`, in attesa dell'approvazione del Direttivo (il link nel footer compare quando viene pubblicata).

## CI e deploy

A ogni push su `master`, ogni notte e su ogni pull request, GitHub Actions:

1. controlla il Markdown (markdownlint) e l'ortografia (cspell, con il dizionario italiano);
2. fa la build e controlla i link (lychee): un link interno o un'ancora rotti fanno fallire la build, un link esterno rotto viene solo segnalato;
3. solo su `master`, se i controlli passano: pubblica `public/` sul branch `gh-pages`, servito da GitHub Pages.

Le action sono fissate allo SHA del commit (con la versione in commento) e Dependabot apre ogni settimana una PR per aggiornarle (`.github/dependabot.yml`).

Per lanciare cspell in locale serve il dizionario italiano:

```sh
npm install --no-save @cspell/dict-it-it
npx cspell "content/**/*.md"
```

## Licenza

I contenuti del sito sono distribuiti con licenza [Creative Commons Attribuzione 4.0 Internazionale (CC BY 4.0)](LICENSE) ([sintesi in italiano](https://creativecommons.org/licenses/by/4.0/deed.it)), salvo dove indicato diversamente.

## Contribuire

Vuoi scrivere un articolo o migliorare il sito? Apri una issue o una pull request, oppure [contattaci](https://luccalug.it/contatti/).

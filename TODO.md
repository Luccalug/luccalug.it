# TODO – luccalug.it

Cose rimaste aperte dopo la review tecnica del sito del 4 novembre 2026 e i sette giri di correzioni dello stesso giorno.

- Tutti i finding di gravità **Critica, Alta e Media** sono stati corretti o messi in bozza in attesa di una decisione (vedi [§7](#7-già-fatto)).
- Restano **2 voci di gravità Bassa** nel codice (B16 e B20, quest'ultima rinviata), alcune osservazioni minori (Info), le azioni che spettano al Direttivo, due PR aperte da valutare e alcune verifiche in produzione.

Legenda. Gravità: **Bassa** = miglioria; **Info** = osservazione. Sforzo: **S** = meno di un'ora, **M** = mezza giornata, **L** = più giorni.
I riferimenti `file:riga` sono aggiornati allo stato della cartella di lavoro del 4/11/2026.

## Indice

1. [Prima di tutto: commit, PR aperte, verifiche rimaste](#1-prima-di-tutto-commit-pr-aperte-verifiche-rimaste)
2. [Azioni per il Direttivo e per chi gestisce il repo](#2-azioni-per-il-direttivo-e-per-chi-gestisce-il-repo)
3. [Verifiche da fare dopo il primo deploy](#3-verifiche-da-fare-dopo-il-primo-deploy)
4. [Interventi nel codice ancora da fare](#4-interventi-nel-codice-ancora-da-fare)
5. [Miglioramenti strutturali](#5-miglioramenti-strutturali)
6. [Falsi positivi noti](#6-falsi-positivi-noti)
7. [Già fatto](#7-già-fatto)
8. [Come ripetere le verifiche](#8-come-ripetere-le-verifiche)

---

## 1. Prima di tutto: commit, PR aperte, verifiche rimaste

I giri 3–5 sono nel commit `5257c79`, pushato e pubblicato il 4/11: le verifiche fatte in produzione sono nel [§3](#3-verifiche-da-fare-dopo-il-primo-deploy).

- [ ] **Committare e pushare** le ultime modifiche, non ancora committate: pulizia di cspell (`cspell.json`, vedi [§6](#6-falsi-positivi-noti)), `Gulli` → `GULLi` in `content/blog/da-obs-alla-webcam.md`, licenza CC BY 4.0 (`LICENSE`, `README.md`, vedi [§2.3](#23-licenza)), calendario conforme a RFC 5545 (B19) e feed RSS (vedi [§7](#7-già-fatto)) e questo `TODO.md`.
- [x] **PR #3 di Dependabot** ("ci: bump the actions group with 4 updates"), unita in `master` con il commit `92dfb5f`: `actions/checkout` 5.1.0 → 7.0.1, `DavidAnson/markdownlint-cli2-action` 23.2.0 → 25.0.0, `streetsidesoftware/cspell-action` 8.4.0 → 9.2.0, `actions/cache` 4.3.0 → 6.1.0. Il run del push (`41893761789`) ha passato lint e link check e ha fatto il deploy.
- [ ] **PR #2** (contributore esterno, aperta il 21/9, "Pause the marquee on hover and focus"): quello che propone c'è già con M4, cioè pausa con hover e con `:focus-within` (`assets/css/main.css:350-355`) più il pulsante pausa. La PR aggiunge in più solo `tabindex="0"` alla barra, che rende raggiungibile con Tab un elemento non interattivo, e modifica `layouts/partials/marquee.html`, spostato in `layouts/_partials/` con B12. Proposta: chiuderla ringraziando e spiegando che la funzione è già presente.
- [ ] **PR di prova con un link interno sbagliato** (es. `[x](/blog/non-esiste/)`): che sulle PR il deploy venga saltato è già verificato con la PR #3; resta da vedere che il job `link-check` fallisca. In locale gli stessi `args` trovano sia la pagina mancante sia l'ancora mancante.
- [ ] Provare home, un articolo e un articolo con eventi nel [Rich Results Test](https://search.google.com/test/rich-results) e nel [Schema Markup Validator](https://validator.schema.org/) (B7). In produzione i blocchi JSON-LD ci sono e sono JSON valido, ma non sono stati validati con gli strumenti di Google.
- [ ] (Facoltativo) Eseguire actionlint su `.github/workflows/deploy.yml`: in locale è stato bloccato perché scarica ed esegue codice esterno. Il workflow è stato controllato con il parsing YAML, verificando che ogni `uses:` sia uno SHA di 40 caratteri, e dai run riusciti su push e PR.

## 2. Azioni per il Direttivo e per chi gestisce il repo

### 2.1 Informativa privacy (`content/privacy.md`, in bozza)

La pagina è scritta ma ha `draft: true`, quindi non viene pubblicata. Il link "Privacy" nel footer compare da solo quando la pagina esce dalla bozza (`layouts/_partials/footer.html`).

- [ ] Aggiungere **sede legale e codice fiscale** dell'associazione nel paragrafo "Titolare del trattamento".
- [ ] Far rileggere il testo a chi segue gli aspetti legali dell'associazione.
- [ ] Togliere `draft: true` e aggiornare `date`.

Fatti già verificati e usati nel testo:

- GitHub Pages registra l'IP dei visitatori per sicurezza ([documentazione GitHub Pages, "Data collection"](https://docs.github.com/en/pages/getting-started-with-github-pages/what-is-github-pages#data-collection)).
- GitHub aderisce all'EU-U.S. Data Privacy Framework ([GitHub Privacy Statement](https://docs.github.com/en/site-policy/privacy-policies/github-general-privacy-statement)).
- Le decisioni di adeguatezza UE per il Regno Unito (dove ha sede OpenStreetMap Foundation) sono state rinnovate il 19/12/2025 fino al 27/12/2031 ([Hunton](https://www.hunton.com/privacy-and-cybersecurity-law-blog/european-commission-renews-uk-data-adequacy-decisions), [eucrim](https://eucrim.eu/news/commission-renewed-adequacy-decisions-for-data-transfers-to-the-uk/)).
- Il sito non usa cookie. In `localStorage` salva solo le preferenze scelte dall'utente: chiavi `luccalug-mode`, `luccalug-scheme` e `luccalug-marquee`.

Se in futuro si aggiunge qualcosa che carica risorse di terzi (embed, font remoti, statistiche), l'informativa va aggiornata.

### 2.2 Statuto (`content/archivio/statuto/statuto-vigente.md`, in bozza)

Il testo pubblicato fino al 4/11 aveva tutti gli indizi di un segnaposto:

- data `1997-01-01`, mentre la prima edizione del Linux Day Luccalug è del 2007;
- 8 articoli generici per 218 parole in tutto;
- introdotto nel commit della migrazione `5127a2d` ("New website!", 29/5/2026);
- l'art. 8 non prevede la devoluzione del patrimonio ad altri ETS, che il Codice del Terzo Settore (art. 9, D.Lgs. 117/2017) richiede a un'APS.

- [ ] Recuperare il testo approvato dall'assemblea e sostituire il contenuto, con la data reale e magari il PDF tramite lo shortcode `download`.
- [ ] Togliere `draft: true` e il commento che spiega la bozza.

### 2.3 Licenza

Fino al 4/11 `LICENSE` era la **Creative Commons Attribution 3.0 Unported**: presente dal 2020 (commit `6fbd040`), rimossa nel commit della migrazione `5127a2d` e ripristinata nel primo giro di correzioni.

- [x] Licenza aggiornata a **CC BY 4.0** il 4/11: `LICENSE` contiene il testo ufficiale ([legalcode.txt](https://creativecommons.org/licenses/by/4.0/legalcode.txt)), e il paragrafo "Licenza" del `README.md` rimanda anche alla sintesi in italiano.
- [ ] Valutare con il Direttivo due punti:
  - le licenze CC non sono pensate per il codice (template, CSS, JS). Un'opzione comune è affiancare una licenza software, ad es. MIT, per `layouts/`, `assets/` e la configurazione;
  - il cambio vale per chi detiene i diritti. Gli articoli di singoli soci restano sotto CC BY 3.0 finché i loro autori non sono d'accordo con il passaggio, e i contenuti già pubblicati restano comunque disponibili anche sotto CC BY 3.0, perché le licenze CC sono irrevocabili.
- [ ] (Facoltativo) Indicare la licenza anche nel footer del sito, con un link alla pagina della CC BY 4.0: oggi è scritta solo nel repo.

### 2.4 Repository GitHub

- [ ] Rimuovere il secret **`PERSONAL_TOKEN`** da Settings → Secrets and variables → Actions, se esiste ancora: era usato dai workflow del 2020–2022 (commit `d51e25d` e `7d91117`) e oggi non serve.
- [ ] (Facoltativo) Rifare `gh auth login` sulla macchina di sviluppo: il token salvato risponde `401 Bad credentials`, quindi l'API delle Pages non è interrogabile da riga di comando.

## 3. Verifiche da fare dopo il primo deploy

- [x] **Primo run della CI** (run `41885086424`, push di `5c607e8`, 4/11): lint, link check e deploy riusciti; il deploy è partito solo dopo gli altri due job.
  - [x] Spell check: il run del push `5257c79` segnalava 42 parole nei file toccati, tutte nomi propri o termini legittimi. Sistemato il 4/11, vedi [§6](#6-falsi-positivi-noti).
- [x] **Deploy dei giri 3–5** (run `41892329714`, push di `5257c79`, 4/11): lint, i due step di link check e deploy riusciti. Verificato in produzione:
  - sitemap con 90 URL, di cui 8 datati 4/11 (prima del push: 80). Sono 8 e non 11 come previsto perché i tag `reti`, `radio` e `decentralizzazione` dell'articolo Reticulum hanno un solo articolo, quindi ora sono fuori dal sitemap;
  - `/archivio/`, le sue sottosezioni e i tag con un solo articolo (es. `/tags/rust/`) hanno `noindex` e non sono nel sitemap; i tag con più articoli (es. `/tags/eventi/`) restano indicizzati;
  - i 13 vecchi indirizzi dei tag accorpati reindirizzano al tag giusto;
  - gli originali delle immagini non sono più pubblicati (es. `locandina-reticulum.png` e `/images/luccalug.png` rispondono 404) e la home usa il logo in WebP;
  - JSON-LD presente: `Organization` e `WebSite` in home, `BlogPosting` ed `Event` nell'articolo Reticulum;
  - `/blog/page/2/` ha il titolo "Blog – pagina 2 - Luccalug".
- [x] **Trigger sulle PR e Dependabot**: subito dopo il push Dependabot ha aperto la PR #3; il suo run (`41892518058`) ha eseguito lint e link check, e il deploy è risultato "skipped".
- [ ] **Build notturna** (`cron: '30 3 * * *'`). Il 5/11 controllare in Actions che il run pianificato ci sia. GitHub disattiva i workflow pianificati dei repo pubblici dopo 60 giorni senza attività: se succede, riattivarlo da Actions.
- [x] **Redirect dei vecchi URL**: verificati il 4/11 tutti i 18 vecchi indirizzi, ognuno con la sua pagina di redirect e destinazione che risponde 200 (comando in [§8](#8-come-ripetere-le-verifiche)).
- [x] **HTTPS forzato**: `http://luccalug.it/` risponde con `Location: https://luccalug.it/` (verificato il 4/11).
- [ ] **Search Console**: controllare il rapporto "Non trovata (404)" e chiedere la nuova scansione delle pagine con redirect. Inviare di nuovo `https://luccalug.it/sitemap.xml`.
- [ ] **Anteprime social**: provare 2–3 link (home, articolo Reticulum, pagina Linux Day) con il [Facebook Sharing Debugger](https://developers.facebook.com/tools/debug/) e il [LinkedIn Post Inspector](https://www.linkedin.com/post-inspector/), e mandarli su WhatsApp/Telegram. Le og:image ora sono JPEG 1200×630 da 52–120 KB.
- [ ] **Core Web Vitals reali** su [PageSpeed Insights](https://pagespeed.web.dev/): i valori misurati il 4/11 sono di laboratorio (Lighthouse).
- [ ] **Test manuale con lettore di schermo** (NVDA su Windows o Orca su Linux): menu, selettore del tema, pulsante pausa della barra in alto, tab nella pagina Linux Day, galleria, mappa da attivare.
- [ ] **Calendario** (dopo il deploy di B19):
  - passare `https://luccalug.it/calendario.ics` nel [validatore iCalendar](https://icalendar.org/validator.html); in locale è già stato controllato con la libreria Python `icalendar` (vedi [§8](#8-come-ripetere-le-verifiche));
  - importarlo in Google Calendar e in un client Apple, e controllare che gli incontri siano alle 21:00 sia prima sia dopo il cambio dell'ora (es. 19/10 e 26/10);
  - vedere come i due client mostrano gli annullati del 12/10 e del 2/11 (`STATUS:CANCELLED` più il prefisso "[Annullato]" nel titolo). Alcuni client nascondono gli eventi annullati: va bene lo stesso.

## 4. Interventi nel codice ancora da fare

| ID | Area | Gravità | Cosa | Sforzo |
| --- | --- | --- | --- | --- |
| [B16](#b16--header-di-sicurezza-e-cache) | Sicurezza/Perf | Bassa | Header di sicurezza e cache non configurabili | M–L |
| [B20](#b20--pagina-404) | SEO | Bassa | 404 con titolo in inglese e canonical (rinviato) | S |
| [Info](#osservazioni-minori-info) | Varie | Info | Contatore finto, feed dei tag, favicon, `lang`, `theme-color` | S |

### B16 – Header di sicurezza e cache

**Problema** (verificato con `curl -I` in produzione): GitHub Pages non permette header personalizzati.

- Nessun CSP, HSTS, `X-Content-Type-Options`, `Referrer-Policy`, `Permissions-Policy` o `frame-ancestors`.
- `cache-control: max-age=600` anche sul CSS con fingerprint.
- Compressione solo gzip.

Il rischio è basso, perché il sito è statico, senza form né login.

**Opzioni, dalla più semplice:**

1. **Solo meta tag:** `<meta name="referrer" content="strict-origin-when-cross-origin">`. Una CSP via `<meta http-equiv>` richiede prima di spostare il JavaScript inline in un file: oggi sono inline gli script di head, tema, barra in alto, contatore, tab, galleria, mappa e 404. L'ideale è un unico `assets/js/main.js` con fingerprint, così la CSP può essere `script-src 'self'`. Restano stili inline (`member.html`, la 404 e il `<noscript>`): o si spostano nel CSS o serve `style-src 'unsafe-inline'`. `frame-ancestors` non si può impostare via meta.
2. **Cloudflare davanti a GitHub Pages:** HSTS, brotli e regole per gli header e per la cache lunga di `/css/*` e `/images/*_hu_*`.
3. **Cambio host** (Cloudflare Pages, Netlify, Codeberg Pages…) con un file `_headers`, ad esempio:

   ```text
   /*
     Strict-Transport-Security: max-age=31536000
     X-Content-Type-Options: nosniff
     Referrer-Policy: strict-origin-when-cross-origin
     Content-Security-Policy: default-src 'self'; frame-src https://www.openstreetmap.org https://www.youtube-nocookie.com; img-src 'self' data:; style-src 'self' 'unsafe-inline'; frame-ancestors 'none'
   /css/*
     Cache-Control: public, max-age=31536000, immutable
   ```

**Come verificare:** `curl -sI https://luccalug.it/` e <https://securityheaders.com/>; con la CSP attiva, la console del browser non deve mostrare violazioni su home, articolo con galleria, Linux Day (tab), Contatti (mappa) e 404.

### B20 – Pagina 404

**Rinviato** su richiesta il 4/11: da riprendere più avanti.

**Problema:** il `<title>` è "404 Page not found - Luccalug" (titolo predefinito di Hugo, in inglese) e la pagina ha `canonical` e `og:url` verso `/404.html`.

**Correzione proposta:**

```go-html-template
{{- /* layouts/_partials/page-title.html, prima del return */ -}}
{{- if eq .Kind "404" }}{{ $title = "Pagina non trovata" }}{{ end -}}
```

```go-html-template
{{- /* layouts/404.html, in testa: niente canonical né og:url */ -}}
{{ define "canonical" }}{{ end }}
```

Il blocco `canonical` esiste già in `layouts/baseof.html` grazie alla correzione M6.

**Come verificare:** `grep -o '<title>[^<]*\|rel="canonical"' public/404.html` deve dare solo il titolo italiano; GitHub Pages continua a servirla con status 404.

### Osservazioni minori (Info)

- [ ] **Contatore visitatori finto** (`layouts/_partials/footer.html:9-20`): mostra 1337 + 7 al giorno + un numero casuale, presentato come "Visitatori". È coerente con lo stile retrò, ma è un dato inventato: dichiararlo come scherzo (es. "Visitatori (più o meno)") o toglierlo.
- [ ] **Feed dei tag**: ogni tag ha il suo feed (44); se non servono, `outputs.term = ["HTML"]` in `hugo.toml`. Il resto della voce sui feed è fatto, vedi il settimo giro nel [§7](#7-già-fatto).
- [ ] **Favicon**: c'è solo `static/images/luccalug-favicon.png` (291×291), usata anche come `apple-touch-icon`, che dovrebbe essere 180×180. Aggiungere `favicon.ico` 32×32 e un PNG 180×180, generabili con Hugo Pipes (`Resize`).
- [ ] **Testo in inglese senza `lang="en"`** (WCAG 3.1.2): titoli dei talk in `content/linux-day.md` (es. "Hosting your digital life…") e badge del footer (`footer.html:4-6`).
- [ ] **`theme-color` non si aggiorna quando si cambia tema** (trovato durante le correzioni): lo script in `layouts/_partials/head.html:90` lo imposta solo al caricamento, mentre `setMode`/`setScheme` (`layouts/_partials/theme-switcher.html:34`) non lo toccano. Spostare la tabella dei colori in una funzione condivisa e richiamarla anche al cambio di tema.
- [ ] **Pagina di test** `content/blog/test-shortcode.md`: è in bozza, quindi non viene pubblicata, ma compare nel blog con `hugo server -D`. Valutare di spostarla fuori da `blog/`.

## 5. Miglioramenti strutturali

### 5.1 Un solo file per gli eventi

Oggi gli eventi sono scritti due volte: in `content/calendario.md` (`events`) e negli shortcode `evento` dentro gli articoli. L'articolo Reticulum, per esempio, ripete data e luogo della voce del 23/11.

Proposta: un'unica sorgente, cioè il front matter del calendario oppure `data/eventi.yaml`, ogni evento identificato dalla data o da un `id` (come già oggi nel `.ics`), da cui generare:

- tabella "Prossimi eventi" e `calendario.ics` (già oggi);
- card nell'articolo: `{{< evento id="2026-11-23-reticulum" >}}`;
- JSON-LD `Event` nelle pagine degli articoli: oggi lo genera lo shortcode `evento` (B7), ricavando l'orario dal testo di `luogo`; con il file unico avrebbe ora di inizio e di fine esplicite;
- eventuale box "Prossimo incontro" in home.

### 5.2 Deploy con `actions/deploy-pages`

Sostituire `peaceiris/actions-gh-pages` (push sul branch `gh-pages` con `contents: write`) con il deploy ufficiale:

- `actions/upload-pages-artifact` + `actions/deploy-pages`;
- permessi `pages: write` e `id-token: write`, niente più scrittura sul repo;
- niente branch `gh-pages` che cresce a ogni deploy;
- in Settings → Pages impostare "Source: GitHub Actions".

### 5.3 Hosting con header configurabili

Vedi B16 (opzioni 2 e 3): HSTS, CSP, cache lunga per gli asset con fingerprint, brotli.

## 6. Falsi positivi noti

- **lychee segnala `https://www.fsf.org/`** (`HandshakeFailure`, 2 occorrenze in `stallman-a-firenze`): con curl e nei browser il sito risponde 200; è il client TLS di lychee che non negozia con il loro server. Non serve correggere il contenuto.
- **`hugo --printUnusedTemplates`** segnala `archivio/single.html` come inutilizzato perché l'unico documento d'archivio (lo statuto) è in bozza: tornerà in uso appena viene pubblicato. Non va rimosso. Segnala anche gli shortcode `colonne`, `colonna` e `youtube`, tenuti apposta per usi futuri.
- **cspell**: dal 4/11 ignora i blocchi di codice (```` ``` ````), il codice inline, il contenuto dello shortcode `terminal` e le elisioni subito prima di un link (`dall'[Internet Archive]`); nomi propri e parole valide sono nell'elenco `words` di `cspell.json`. Su tutto `content/` non resta nessuna segnalazione ("Stephano" Tesi è il nome corretto, confermato il 4/11). Corretto `Gulli` in `GULLi` in `da-obs-alla-webcam.md`. Il controllo resta non bloccante (`strict: false`); ora che l'elenco è pulito si può rendere bloccante con `strict: true`, al costo di dover aggiungere a `cspell.json` ogni nuovo nome proprio.

## 7. Già fatto

**Primo giro (quick win), 4/11/2026:**

- **A1** – HTTPS forzato su GitHub Pages (fatto dal maintainer).
- **A2** – 13 alias per i vecchi URL del sito Mainroad (`/post/…`, `/linuxday/…`, `/associazione/`, `/attività/`).
- **A3** – Statuto in bozza.
- **M5** – Voce di menu attiva (`pageRef` + `HasMenuCurrent`).
- **M8** – Inter dichiarato una volta sola, rimossi i file `inter-600-*` duplicati.
- **M10** e **M12** (permessi) – Hugo 0.169.0 in CI in una variabile unica, versione nella chiave della cache, permessi minimi.
- **B1–B3** – `unsafe = false`, `timeZone = "Europe/Rome"`, `locale = "it-IT"`.
- **M3** – Selettore degli schemi colore non più raggiungibile da tastiera quando è chiuso.
- **M2** – Contrasto AA in tutte le combinazioni tema/schema, verificato con axe: da 129 violazioni a 0.
- **M11** (dizionario) – Dizionario italiano per cspell.

**Secondo giro, 4/11/2026:**

- **M9** – Mappa OSM caricata solo su richiesta.
- **M1** – Informativa privacy (in bozza) e link nel footer condizionato alla pubblicazione.
- **M4** – Pulsante pausa per la barra scorrevole. Corretto anche `prefers-reduced-motion`, che non funzionava per l'ordine delle regole CSS.
- **M6** – Canonical corretti sulle pagine paginate.
- **M7** – og:image 1200×630 in JPEG.
- **B5** – Tag duplicati uniti con alias, titoli leggibili, `/tags/` su una pagina.
- **B6** – Suffisso corto nei title, description mancanti, prefisso "Tag:" per i tag.
- **B8** – `loading="eager"` e `fetchpriority` per l'immagine in cima.
- **M13** – Calendario con soli eventi futuri, build notturna, `DTSTAMP` stabile.
- **M14** – Pagina Linux Day aggiornata.
- **B11** – Tolto `.Params.date`, deprecato.
- **B15** – `localStorage` protetto e scritto solo su scelta dell'utente.
- **B17** – README, LICENSE, `.gitignore`.
- **B18** – Link esterni rotti sostituiti: da 18 errori a 2 falsi positivi.

Il commit `5c607e8` con i primi due giri è stato pushato e pubblicato il 4/11.

**Terzo giro, 4/11/2026** (commit `5257c79`):

- **B4** – `lastmod` non viene più da git: `enableGitInfo = false` e `[frontmatter] lastmod = ["lastmod", "date"]` in `hugo.toml`. Senza `lastmod` nel front matter vale `date`. Aggiunto `lastmod` solo dove il contenuto è cambiato davvero: articolo CFP Linux Day 2026 (18/10, avviso di chiusura), articolo schemesh (12/10, serata rinviata), Linux Day e Calendario (4/11), Chi siamo e Contatti (29/5). Nella build, i URL del sitemap datati oggi passano da 80 a 11; l'articolo Arduino del 2011 ha `article:modified_time` e `dateModified` uguali alla data di pubblicazione. Il `DTSTAMP` di `calendario.ics` ora viene dal `lastmod` del calendario, da aggiornare quando cambiano gli eventi (c'è un commento nel file). Tolto `fetch-depth: 0` dalla CI. Regola documentata nel README. Le 5 pagine dell'archivio senza documenti pubblicati ora non hanno `<lastmod>` nel sitemap (vedi B21).
- **M11** – Il workflow gira anche sulle `pull_request`. Il deploy parte solo se `github.ref == 'refs/heads/master'`, quindi né dalle PR né dai run manuali su altri branch. Nuovo step bloccante per link interni e ancore (lychee `--offline --include-fragments` con `--remap` verso `./public`); il controllo dei link esterni resta non bloccante. `concurrency` è diventato `pages-${{ github.ref }}`: con il vecchio gruppo unico `pages` e `cancel-in-progress`, una PR avrebbe cancellato un deploy di master in corso.
- **M12** – Tutte le action fissate allo SHA del commit con la versione in commento (checkout v5.1.0, cache v4.3.0, markdownlint-cli2-action v23.2.0, cspell-action v8.4.0, actions-hugo v3.2.1, lychee-action v2.9.0, actions-gh-pages v4.1.0; SHA confrontati con l'API di GitHub). Aggiunto `.github/dependabot.yml`: controllo settimanale, una sola PR per tutte le action, prefisso `ci`.

**Quarto giro, 4/11/2026** (commit `5257c79`):

- **B21** – Il sitemap esclude le pagine con `sitemap: disable: true` e le sezioni senza pagine pubblicate; queste ultime hanno anche `<meta name="robots" content="noindex">`. Oggi riguarda `/archivio/` e le sue 4 sottosezioni, che tornano da sole appena viene pubblicato un documento (provato con `hugo -D`: statuto e archivio ricompaiono). Il template del sitemap è passato da 4 cicli quasi uguali a nessuno, perché Hugo calcola già il `lastmod` delle liste: per tutti gli altri URL l'output è identico.
- **B10** – Un'immagine mancante fa fallire la build (`img.html`, `gallery-img.html`; per la galleria vale anche `static/`), e così una `figure` o una `gallery-img` senza `alt`; `alt=""` resta possibile per le immagini decorative. I messaggi indicano file e riga. `width` passato come stringa non dà più errore.
- **B9** – Solo WebP: niente più `<picture>` né fallback PNG/JPEG, e gli originali non vengono mai pubblicati. Anche la galleria usa WebP (miniatura 400 px, immagine grande al massimo 1600 px). La seconda og:image, il logo quadrato, passa da PNG di 294 KB a JPEG di 40 KB. Build: **da 17 MB a 5,9 MB**. Tolta la regola CSS `picture { display: contents; }`, non più usata.
- **B13** – Tolti il selettore CSS morto `.terminal-dot-red` e la regola vuota `.terminal-dots::before`; unite le regole duplicate di `.terminal-dots` e `.gallery-item:focus-visible`; rimosso `static/images/luccalug.png`, copia identica e mai usata di `assets/images/luccalug.png`. Nuovo `archetypes/blog.md` con tutto il front matter degli articoli; `archetypes/default.md` in YAML. Tenuti apposta gli shortcode `colonne`, `colonna`, `youtube` e `data/members.toml`, per usi futuri (ad es. la sezione Consiglio Direttivo). La pagina "Chi siamo" non contiene nomi scritti a mano, quindi non c'era niente da sostituire con `members.toml`.
- **B14** – `type="button"` su tutti i `<button>`; `aria-label="Articoli vicini"` sul secondo `<nav>` degli articoli; `role="img"` sulle cifre della 404; `<img>` del visualizzatore creata via JS invece di `src=""`; paginazione senza `aria-label`, con «/» in `aria-hidden` e `rel="prev"`/`rel="next"` (CSS limitato ai figli diretti, altrimenti lo `<span>` prendeva lo stile dei riquadri); il titolo "Archivio" della sidebar non è più un `<h3>` prima dell'`<h1>` ma un paragrafo con lo stesso aspetto; `<section aria-label>` al posto di `<div role="region">` in galleria e terminale. Nuovo render hook `layouts/_markup/render-heading.html`: le emoji dei titoli sono `aria-hidden` e gli id non iniziano più con `-` (`#scrivici` invece di `#-scrivici`; nessun link puntava ai vecchi id). html-validate (`standard` + `a11y`): da 998 problemi a 18, tutti nelle pagine di redirect generate da Hugo per gli alias (senza `<body>` per costruzione). Confronto di screenshot prima/dopo con Chromium su 7 pagine: uguali a parte il contatore visite casuale; la galleria si apre, mette il focus su "Chiudi" e si chiude con Esc.
- **B7** – In home un `@graph` con `Organization` (nome, nome esteso, descrizione, logo, email, Telegram in `sameAs`) e `WebSite` (con `inLanguage`, tolto dall'Organization). Gli articoli sono `BlogPosting` con `description`, `url`, `mainEntityOfPage`, `image`, `keywords` e `publisher`; gli articoli di "Il Direttivo" hanno come autore l'associazione, gli altri una `Person`. Lo shortcode `evento` emette un `Event` (15 nel sito) con data, orario e fuso orario ricavati da `luogo` ("… - ore 21:00", "… - dalle 10:00 alle 18:30"), luogo, descrizione, immagine e URL. Organizer e stato dell'evento non vengono indicati, perché non sono noti con certezza per tutti gli eventi. Email e profili social sono in `hugo.toml` (`params.email`, `params.social`). Gli autori restano i nickname attuali.
- **B12** – Template spostati nella struttura di Hugo 0.146+: `_partials/`, `_shortcodes/`, `home.html`, e i file di `_default/` direttamente in `layouts/`. Le build con e senza bozze sono **identiche** prima e dopo lo spostamento (`diff -r`), e `--printUnusedTemplates` segnala gli stessi template di prima.
- README aggiornato: struttura delle cartelle, `hugo new content`, regole per `alt` e immagini.

**Quinto giro, 4/11/2026** (commit `5257c79`):

- **B5 (resto), tag usati una volta** – Due interventi:
  - **Automatico:** le pagine dei tag con un solo articolo hanno `noindex` e sono fuori dal sitemap; tornano da sole quando un secondo articolo usa il tag. La regola è in `layouts/_partials/indexable.html`, condivisa da `head.html` e `sitemap.xml` insieme a quella delle sezioni vuote (B21). Oggi riguarda 22 tag su 44.
  - **Accorpamenti ovvi**, con alias dai vecchi indirizzi: `crittografia` → `sicurezza`, `open-movie` → `blender`, `inkscape` → `grafica`, `call-for-papers` → `linux-day`, `licenze` e `gnu` → `software-libero`, `community` e `luccalug` → `associazione`, `meta`, `storia`, `statistiche` e `retrocomputing` → `sito`. `incontri` è andato in `eventi` e non in `associazione`, perché sull'unico articolo che lo usava (Django) indica l'incontro, cioè un evento. Tolti `content/tags/call-for-papers/_index.md` e `content/tags/gnu/_index.md`; creati gli `_index.md` dei tag di destinazione che non l'avevano, con lo stesso titolo di prima. Tag totali: da 57 a 44.
- **B6 (resto), description lunghe** – Riscritte le 9 description oltre i 160 caratteri (ora 140–159), senza `lastmod` perché il testo degli articoli non cambia.
- **B6 (resto), pagine 2 e successive** – Il titolo diventa "Blog – pagina 2 - Luccalug" (o "Tag: Eventi – pagina 2 - …") e la description finisce con "Pagina 2 di 7.". Il numero di pagina viene da `_partials/paginator.html` ed è calcolato solo per blog e tag, cioè le liste i cui template paginano: chiamare il paginatore su `/tags/` farebbe generare pagine `/tags/page/N/`, che invece sono redirect.
- Verifiche: link interni 0 errori su 3598; nessuna description oltre 160 caratteri; markdownlint 0 problemi; html-validate solo sulle pagine di redirect.

**Sesto giro, 4/11/2026** (da committare, vedi [§1](#1-prima-di-tutto-commit-pr-aperte-verifiche-rimaste)):

- **cspell** – Il run del push `5257c79` segnalava 42 parole nei file toccati, e su tutto `content/` erano 135. Ora sono 0: cspell ignora codice e shortcode `terminal`, le parole valide sono in `cspell.json`, e `Gulli` è diventato `GULLi`. Dettagli nel [§6](#6-falsi-positivi-noti).

**Settimo giro, 4/11/2026** (da committare, vedi [§1](#1-prima-di-tutto-commit-pr-aperte-verifiche-rimaste)):

- **B19** – `calendario.ics` conforme a RFC 5545. Il template `layouts/single.ical.ics` raccoglie le righe in una lista e le stampa alla fine:
  - **CRLF e righe lunghe:** ogni riga termina con CRLF e viene spezzata a 75 byte dal nuovo partial `_partials/ical-fold.html`, che lavora carattere per carattere e quindi non taglia mai le lettere accentate o le emoji. È stata scelta questa strada invece dei pezzi da 36 caratteri proposti nella review, che con caratteri da 3–4 byte potevano superare il limite.
  - **Fuso orario:** blocco `VTIMEZONE` per Europe/Rome e `DTSTART;TZID=Europe/Rome:…`; l'orario non passa più da UTC. Il blocco coincide con il database IANA dal 2024 al 2034 (confronto ogni 30 minuti con `zoneinfo`).
  - **Annullati:** nuovo campo `status: cancelled`, che dà `STATUS:CANCELLED` e il prefisso "[Annullato]" nel titolo, per i client che ignorano `STATUS`. In tabella il titolo è barrato, con il badge rosso "Annullato". I due eventi annullati sono tornati al titolo originale, ricavato dalla storia git: 12/10 "Serata a tema: Schemesh con Max", 2/11 "Incontro ordinario". Un valore diverso da `cancelled` blocca la build.
  - **UID:** ora è solo la data (`2026-11-23@luccalug.it`), non più data e titolo come proposto nella review: così cambiare titolo, orario o stato aggiorna l'evento nei calendari che lo hanno già. Se due eventi cadono nello stesso giorno la build si ferma e chiede un campo `id` per uno dei due. Gli UID sono cambiati tutti una volta: chi è abbonato al calendario vede gli eventi sostituiti, chi lo reimporta a mano li ha doppi.
  - **In più:** un evento senza `time` è di tutto il giorno (`VALUE=DATE`), invece di andare dalle 00:00 alle 02:00; `REFRESH-INTERVAL` e `X-PUBLISHED-TTL` chiedono ai client di aggiornarsi ogni giorno, come la build notturna; `location` e `description` sono facoltativi; `ical-escape.html` usa `return`. I campi degli eventi sono spiegati in un commento in testa a `content/calendario.md` e nel README.
  - Verifiche: in una copia del sito, eventi di prova con apostrofo, `&`, `<`, `;`, `\`, emoji, titolo di oltre 150 byte, orario "9:00" ed evento senza orario; la libreria Python `icalendar` 7.3.0 legge il file senza errori e ricompone i testi spezzati identici all'originale; tutti gli incontri risultano alle 21:00 locali (19:00 UTC fino al 19/10, 20:00 UTC dal 26/10); a parte `calendario.ics`, la build è identica a prima (`diff -r`).
- **Feed RSS** – Nuovo `layouts/rss.xml`, basato su quello di Hugo 0.169.0:
  - il feed della home (`/feed.xml`) contiene solo gli articoli del blog, 61 come `/blog/feed.xml`. Prima conteneva anche Calendario, Linux Day, Chi siamo e Contatti, e il calendario tornava in cima ogni volta che si aggiornava il suo `lastmod`. Il feed della home è quello che trovano i lettori di feed partendo da `luccalug.it`; il link "RSS Feed" del footer punta invece a `/blog/feed.xml`. Privacy e statuto non ci finiranno quando verranno pubblicati;
  - titolo e descrizione del canale sono in italiano, uguali a quelli della pagina ("Blog - Luccalug", "Tag: Eventi - Luccalug"), invece di "Blog on …" e "Recent content in …". La descrizione viene dal nuovo partial `_partials/page-description.html`, usato anche da `head.html`;
  - verifiche: tutte le pagine HTML sono identiche a prima (`diff -r`); negli altri 51 feed cambiano solo titolo e descrizione del canale, gli articoli sono gli stessi; tutti i feed sono XML valido, anche minificati.

## 8. Come ripetere le verifiche

```sh
# Build come la CI
hugo --minify --baseURL "https://luccalug.it/" -d /tmp/luccalug-public

# Link interni e ancore (offline, come lo step bloccante della CI): atteso 0 errori
lychee --offline --include-fragments --root-dir /tmp/luccalug-public \
  --remap '^https://luccalug\.it/(.*)$ file:///tmp/luccalug-public/$1' \
  --index-files index.html --no-progress '/tmp/luccalug-public/**/*.html'

# Link esterni (online): atteso solo il falso positivo fsf.org
lychee --config .lychee.toml --root-dir /tmp/luccalug-public --no-progress '/tmp/luccalug-public/**/*.html'

# Validazione HTML (su build non minificata)
hugo -d /tmp/luccalug-raw
echo '{"extends":["html-validate:standard","html-validate:a11y"],"rules":{"no-inline-style":"off","attribute-boolean-style":"off","void-style":"off","no-trailing-whitespace":"off"}}' > /tmp/htmlvalidate.json
npx html-validate@11 --config /tmp/htmlvalidate.json $(find /tmp/luccalug-raw -name index.html -not -path '*/page/*')

# Markdown e ortografia
npx markdownlint-cli2 'content/**/*.md'
npm install --no-save @cspell/dict-it-it && npx cspell --no-progress 'content/**/*.md'

# Lighthouse mobile su una pagina
npx lighthouse https://luccalug.it/ --form-factor=mobile --only-categories=performance,accessibility,best-practices,seo --view

# Template inutilizzati e deprecazioni
hugo --printUnusedTemplates --logLevel info -d /tmp/luccalug-public 2>&1 | grep -E 'WARN|deprecat'

# Date nel sitemap (in produzione o nella build): nessuna data deve raccogliere quasi tutti gli URL
curl -s https://luccalug.it/sitemap.xml | grep -o '<lastmod>[^<]*' | cut -c10-19 | sort | uniq -c | sort -rn | head

# Calendario: atteso 0 righe senza CRLF e 0 righe oltre i 75 byte
grep -c -v $'\r$' /tmp/luccalug-public/calendario.ics
LC_ALL=C awk '{sub(/\r$/,"")} length($0)>75' /tmp/luccalug-public/calendario.ics | wc -l
# Calendario letto da una libreria iCalendar: un evento per riga, con orario in UTC
uv run --no-project --with icalendar python3 -c "
import icalendar, sys
for e in icalendar.Calendar.from_ical(open(sys.argv[1], 'rb').read()).walk('VEVENT'):
    s = e.decoded('DTSTART'); print(e['UID'], s, e.get('STATUS', ''), e['SUMMARY'])
" /tmp/luccalug-public/calendario.ics

# Redirect dei vecchi URL in produzione: ogni riga deve avere una destinazione e 200
for p in post/hello-web post/arduracing post/i-gestori-di-pacchetti post/luccalug-reboot post/obs2cam \
         post/serateatema2020 post/serateatema2022 post linuxday linuxday/2016 linuxday/2019 associazione \
         tags/serate-a-tema tags/hardware tags/guida tags/annuncio tags/avvisi tags/page/2; do
  t=$(curl -s "https://luccalug.it/$p/" | grep -o 'url=[^"]*' | head -1 | cut -c5-)
  printf "%-30s %-60s %s\n" "/$p/" "${t:-NESSUN REDIRECT}" "$([ -n "$t" ] && curl -s -o /dev/null -w '%{http_code}' "$t")"
done
```

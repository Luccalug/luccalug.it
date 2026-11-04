---
title: "Calendario"
# Aggiornare quando si aggiungono o cambiano eventi: è anche il DTSTAMP di calendario.ics.
lastmod: 2026-11-05
description: "Calendario degli eventi e incontri del Luccalug"
outputs:
  - HTML
  - MD
  - ical
# Questi eventi sono l'unica fonte per la tabella qui sotto, per il file
# calendario.ics e per le schede negli articoli: in un articolo basta
# {{< evento data="2026-11-23" >}} e il resto viene da qui.
#
# EVENTI SETTIMANALI (recurring). Ogni regola genera un evento a settimana,
# da "from" fino a "until" o, senza "until", fino a 12 settimane dopo la
# build: il sito viene ricostruito ogni notte, quindi le nuove date compaiono
# da sole. Campi:
#   weekday      giorno della settimana, in inglese: monday, tuesday, …
#                (obbligatorio)
#   from         prima data, AAAA-MM-GG (obbligatorio)
#   until        ultima data (facoltativo)
#   time, duration, summary, location, description, url: come negli eventi
#   id           solo se due regole cadono nello stesso giorno della settimana
# Per cambiare luogo o orario da una certa data in poi non modificare la
# regola, che cambierebbe anche gli incontri passati: chiudila con "until"
# e aggiungine una nuova con "from".
#
# EVENTI SINGOLI (events). Un evento nello stesso giorno di un incontro
# settimanale lo sostituisce, e prende dalla regola quello che non scrive:
#   - una serata a tema scrive summary, description e url, e prende orario,
#     durata e luogo;
#   - per annullare un incontro bastano date, status: cancelled e il motivo
#     in description.
# Campi:
#   date         AAAA-MM-GG (obbligatorio)
#   time         HH:MM, ora di Lucca; senza, l'evento dura tutto il giorno
#   duration     durata, es. "4h" o "8h30m" (predefinita "2h")
#   summary      titolo (obbligatorio, se non viene dalla regola)
#   location     luogo
#   description  descrizione
#   url          pagina con i dettagli: un articolo del sito, con l'indirizzo
#                che si vede nel browser ("/blog/2026/11/reticulum-ripensare-la-rete/"),
#                o un sito esterno. In tabella il titolo diventa un link.
#   status       "cancelled" per un evento annullato: resta in calendario,
#                barrato in tabella e come annullato nel file .ics.
#                Il titolo resta quello originale.
#   id           solo per un evento in più nello stesso giorno di un altro,
#                es. "2026-11-23-reticulum": un evento con id si aggiunge
#                all'incontro settimanale invece di sostituirlo. Senza, l'UID
#                nel file .ics è la data, così chi ha già l'evento lo vede
#                aggiornato quando cambiano titolo, orario o stato. Negli
#                articoli: {{< evento id="2026-11-23-reticulum" >}}.
recurring:
  - weekday: monday
    from: "2026-09-07"
    time: "21:00"
    duration: "3h"
    summary: "Incontro ordinario"
    location: "Foro Boario, Lucca"
    description: "Incontro settimanale del Luccalug"
events:
  - date: "2026-09-21"
    summary: "Serata a tema: Negative Space Programming con Zanna"
    description: "Serata sul Negative Space Programming a cura di Zanna: come vincolare il codice per rendere impossibili i comportamenti indesiderati, dallo sviluppo alla produzione"
    url: "/blog/2026/09/code-shibari-programmando-lo-spazio-negativo/"
  - date: "2026-10-12"
    summary: "Serata a tema: Schemesh con Max"
    status: cancelled
    description: "Il Foro Boario è occupato da un altro evento per tutta la settimana. La serata su schemesh è rimandata a lunedì 19 ottobre"
  - date: "2026-10-19"
    summary: "Serata a tema: Schemesh con Max"
    description: "Serata su schemesh, la shell nata dalla fusione di una shell Unix con un REPL Lisp, a cura di Max"
    url: "/blog/2026/09/schemesh-la-shell-che-avreste-sempre-voluto/"
  - date: "2026-10-24"
    time: "10:00"
    duration: "8h30m"
    summary: "Linux Day 2026"
    location: "PRISMA Prato, via Galcianese 34, Prato"
    description: "Linux Day Prato 2026, organizzato da Luccalug, GOLEM, GULLi e PLUG: 18 talk su due tracce, ingresso gratuito. Programma: https://day.linux.prato.it/#schedule"
    url: "https://day.linux.prato.it/"
  - date: "2026-11-02"
    status: cancelled
    description: "Associazione chiusa per Lucca Comics"
  - date: "2026-11-23"
    summary: "Serata a tema: Reticulum con Mugnozzo"
    description: "Serata su Reticulum a cura di Mugnozzo: lo stack di rete libero per costruire reti decentralizzate, cifrate e resilienti, oltre Internet e senza infrastrutture centralizzate"
    url: "/blog/2026/11/reticulum-ripensare-la-rete/"
---

## 📅 Prossimi Eventi

{{< eventi >}}

## 🔔 Aggiungi il Calendario

Iscriviti al calendario del Luccalug: gli eventi compaiono nel tuo calendario e si aggiornano da soli, con le nuove serate a tema, i cambi di orario e gli annullamenti.

{{< iscrizione-calendario >}}

Con altri programmi, come [Thunderbird](https://www.thunderbird.net/it/), [Nextcloud](https://nextcloud.com/it/) o [ICSx⁵](https://f-droid.org/packages/at.bitfire.icsdroid/) su Android, cerca l'opzione per aggiungere un calendario da URL, o in abbonamento, e incolla l'indirizzo {{< iscrizione-calendario mostra="indirizzo" >}}.

## 🔁 Incontri Regolari

Ci incontriamo **ogni lunedì**, dalle **21:00 in poi**, presso il [Foro Boario di Lucca](https://osm.org/go/xX4710WmM).

Gli incontri sono aperti a tutti e non richiedono iscrizione.

## 📢 Resta Aggiornato

Seguici sul [blog]({{< ref "blog" >}}) o su [Telegram](https://t.me/luccalug) per non perdere nessun evento!

Oppure [scrivici al nostro indirizzo mail](mailto:luccalug@protonmail.com)

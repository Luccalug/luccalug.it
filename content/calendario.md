---
title: "Calendario"
# Aggiornare quando si aggiungono o cambiano eventi: è anche il DTSTAMP di calendario.ics.
lastmod: 2026-11-04
description: "Calendario degli eventi e incontri del Luccalug"
outputs:
  - HTML
  - MD
  - ical
# Campi di ogni evento:
#   date         AAAA-MM-GG (obbligatorio)
#   time         HH:MM, ora di Lucca; senza, l'evento dura tutto il giorno
#   duration     durata, es. "4h" o "8h30m" (predefinita "2h")
#   summary      titolo (obbligatorio)
#   location     luogo
#   description  descrizione
#   status       "cancelled" per un evento annullato: resta in calendario,
#                barrato in tabella e come annullato nel file .ics.
#                Il titolo resta quello originale.
#   id           solo se ci sono due eventi nello stesso giorno: identificativo
#                stabile, es. "2026-11-23-reticulum". Senza, l'UID nel file
#                .ics è la data, così chi ha già l'evento lo vede aggiornato
#                quando cambiano titolo, orario o stato.
events:
  - date: "2026-09-07"
    time: "21:00"
    duration: "4h"
    summary: "Incontro ordinario"
    location: "Foro Boario, Lucca"
    description: "Incontro settimanale del Luccalug"
  - date: "2026-09-14"
    time: "21:00"
    duration: "4h"
    summary: "Incontro ordinario"
    location: "Foro Boario, Lucca"
    description: "Incontro settimanale del Luccalug"
  - date: "2026-09-21"
    time: "21:00"
    duration: "4h"
    summary: "Serata a tema: Negative Space Programming con Zanna"
    location: "Foro Boario, Lucca"
    description: "Serata sul Negative Space Programming a cura di Zanna"
  - date: "2026-09-28"
    time: "21:00"
    duration: "4h"
    summary: "Incontro ordinario"
    location: "Foro Boario, Lucca"
    description: "Incontro settimanale del Luccalug"
  - date: "2026-10-05"
    time: "21:00"
    duration: "4h"
    summary: "Incontro ordinario"
    location: "Foro Boario, Lucca"
    description: "Incontro settimanale del Luccalug"
  - date: "2026-10-12"
    time: "21:00"
    duration: "4h"
    summary: "Serata a tema: Schemesh con Max"
    status: cancelled
    location: "Foro Boario, Lucca"
    description: "Il Foro Boario è occupato da un altro evento per tutta la settimana. La serata su schemesh è rimandata a lunedì 19 ottobre"
  - date: "2026-10-19"
    time: "21:00"
    duration: "4h"
    summary: "Serata a tema: Schemesh con Max"
    location: "Foro Boario, Lucca"
    description: "Serata su schemesh, la shell nata dalla fusione di una shell Unix con un REPL Lisp, a cura di Max"
  - date: "2026-10-24"
    time: "10:00"
    duration: "8h30m"
    summary: "Linux Day 2026"
    location: "PRISMA Prato, via Galcianese 34, Prato"
    description: "Linux Day Prato 2026, organizzato da Luccalug, GOLEM, GULLi e PLUG: 18 talk su due tracce, ingresso gratuito. Programma: https://day.linux.prato.it/#schedule"
  - date: "2026-10-26"
    time: "21:00"
    duration: "4h"
    summary: "Incontro ordinario"
    location: "Foro Boario, Lucca"
    description: "Incontro settimanale del Luccalug"
  - date: "2026-11-02"
    time: "21:00"
    duration: "4h"
    summary: "Incontro ordinario"
    status: cancelled
    location: "Foro Boario, Lucca"
    description: "Associazione chiusa per Lucca Comics"
  - date: "2026-11-09"
    time: "21:00"
    duration: "4h"
    summary: "Incontro ordinario"
    location: "Foro Boario, Lucca"
    description: "Incontro settimanale del Luccalug"
  - date: "2026-11-16"
    time: "21:00"
    duration: "4h"
    summary: "Incontro ordinario"
    location: "Foro Boario, Lucca"
    description: "Incontro settimanale del Luccalug"
  - date: "2026-11-23"
    time: "21:00"
    duration: "4h"
    summary: "Serata a tema: Reticulum con Mugnozzo"
    location: "Foro Boario, Lucca"
    description: "Serata su Reticulum a cura di Mugnozzo: lo stack di rete libero per costruire reti decentralizzate, cifrate e resilienti, oltre Internet e senza infrastrutture centralizzate"
  - date: "2026-11-30"
    time: "21:00"
    duration: "4h"
    summary: "Incontro ordinario"
    location: "Foro Boario, Lucca"
    description: "Incontro settimanale del Luccalug"
  - date: "2026-12-07"
    time: "21:00"
    duration: "4h"
    summary: "Incontro ordinario"
    location: "Foro Boario, Lucca"
    description: "Incontro settimanale del Luccalug"
  - date: "2026-12-14"
    time: "21:00"
    duration: "4h"
    summary: "Incontro ordinario"
    location: "Foro Boario, Lucca"
    description: "Incontro settimanale del Luccalug"
  - date: "2026-12-21"
    time: "21:00"
    duration: "4h"
    summary: "Incontro ordinario"
    location: "Foro Boario, Lucca"
    description: "Incontro settimanale del Luccalug"
  - date: "2026-12-28"
    time: "21:00"
    duration: "4h"
    summary: "Incontro ordinario"
    location: "Foro Boario, Lucca"
    description: "Incontro settimanale del Luccalug"
---

## 📅 Prossimi Eventi

{{< eventi >}}

{{< download url="/calendario.ics" tipo="ics" testo="Scarica il calendario iCal" >}}

## 🔁 Incontri Regolari

Ci incontriamo **ogni lunedì**, dalle **21:00 in poi**, presso il [Foro Boario di Lucca](https://osm.org/go/xX4710WmM).

Gli incontri sono aperti a tutti e non richiedono iscrizione.

## 📢 Resta Aggiornato

Seguici sul [blog]({{< ref "blog" >}}) o su [Telegram](https://t.me/luccalug) per non perdere nessun evento!

Oppure [scrivici al nostro indirizzo mail](mailto:luccalug@protonmail.com)

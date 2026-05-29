---
title: "Test di tutti gli Shortcode"
date: 2026-03-19
author: "Il Direttivo"
tags: ["test", "shortcode", "sviluppo"]
draft: true
---

Questo post testa **tutti gli shortcode** disponibili nel sito. È in bozza (`draft: true`) e non verrà pubblicato.

---

## Note (esistente)

{{< note type="info" >}}
Questo è un box **informativo**. Supporta il Markdown.
{{< /note >}}

{{< note type="warning" >}}
Attenzione: questo è un **avviso**.
{{< /note >}}

{{< note type="danger" >}}
Questo è un messaggio di **pericolo**.
{{< /note >}}

{{< note type="tip" >}}
Un suggerimento utile: usa `hugo server -D` per vedere le bozze.
{{< /note >}}

---

## Figure (esistente)

{{< figure src="images/luccalug.png" alt="Logo del Luccalug" caption="Il nostro logo ufficiale" >}}

---

## Details (nuovo)

{{< details summary="Cos'è un LUG?" >}}
Un **Linux User Group** (LUG) è un'associazione locale di appassionati di GNU/Linux e software libero. I LUG organizzano incontri, workshop, install party e molto altro.

- Promuovono il software libero
- Aiutano i principianti
- Creano comunità
{{< /details >}}

{{< details summary="Come posso partecipare?" >}}
Semplice! Vieni a uno dei nostri **incontri del lunedì** al Foro Boario di Lucca, dalle 21:00 in poi. Non serve prenotazione, non serve esperienza. Porta un computer se vuoi, ma non è obbligatorio!
{{< /details >}}

---

## Badge (nuovo)

Tecnologie che usiamo: {{< badge testo="GNU/Linux" >}} {{< badge testo="FLOSS" colore="green" >}} {{< badge testo="Hugo" colore="alt" >}} {{< badge testo="Neocities" colore="warm" >}} {{< badge testo="Deprecato" colore="red" >}}

---

## Link Esterno (nuovo)

Risorse utili: {{< link-esterno url="https://www.kernel.org/" testo="Linux Kernel" >}} - {{< link-esterno url="https://www.fsf.org/" testo="Free Software Foundation" >}} - {{< link-esterno url="https://www.linuxday.it/" testo="Linux Day Italia" >}}

---

## Terminal (nuovo)

{{< terminal title="Installare Hugo su Arch Linux" >}}
$ sudo pacman -S hugo
$ hugo version
hugo v0.157.0+extended linux/amd64
{{< /terminal >}}

{{< terminal title="Creare un nuovo sito Hugo" >}}
$ hugo new site mio-sito
$ cd mio-sito
$ hugo server -D
{{< /terminal >}}

---

## Evento (nuovo)

{{< evento titolo="Incontro ordinario" data="2026-03-23" luogo="Foro Boario, Lucca" descrizione="Incontro settimanale del lunedì sera" >}}

{{< evento titolo="Linux Day 2026" data="2026-10-24" luogo="Da definire, Lucca" descrizione="La principale manifestazione italiana dedicata a GNU/Linux" url="https://www.linuxday.it/" >}}

---

## Tabs (nuovo)

{{< tabs >}}
{{< tab name="Arch Linux" >}}

```bash
sudo pacman -S hugo
```

Il modo più semplice su Arch: direttamente dai repository ufficiali.
{{< /tab >}}
{{< tab name="Ubuntu/Debian" >}}

```bash
sudo apt install hugo
```

Oppure scarica il `.deb` dall'ultima release su GitHub per avere la versione più recente.
{{< /tab >}}
{{< tab name="Fedora" >}}

```bash
sudo dnf install hugo
```

Disponibile nei repository ufficiali di Fedora.
{{< /tab >}}
{{< /tabs >}}

---

## Gallery (nuovo)

{{< gallery >}}
{{< gallery-img src="/images/luccalug.png" alt="Logo Luccalug" >}}
{{< gallery-img src="/images/luccalug.png" alt="Logo Luccalug (copia 2)" >}}
{{< gallery-img src="/images/luccalug.png" alt="Logo Luccalug (copia 3)" >}}
{{< /gallery >}}

---

## YouTube (nuovo)

{{< youtube id="wvQ0N56pW74" title="Linus Torvalds: Nvidia, Fuck You!" >}}

---

## Colonne (nuovo)

{{< colonne >}}
{{< colonna >}}

### Arch Linux

Rolling release, minimalista, per utenti avanzati. Pacman come gestore pacchetti.
{{< /colonna >}}
{{< colonna >}}

### Ubuntu

Release semestrali, user-friendly, grande comunità. APT come gestore pacchetti.
{{< /colonna >}}
{{< colonna >}}

### Fedora

Cutting-edge, sponsorizzata Red Hat, focus su innovazione. DNF come gestore pacchetti.
{{< /colonna >}}
{{< /colonne >}}

---

## Download (nuovo)

{{< download url="/files/statuto.pdf" testo="Statuto dell'Associazione" dimensione="120 KB" tipo="pdf" >}}

{{< download url="/files/volantino.zip" testo="Materiale promozionale" dimensione="2.3 MB" tipo="zip" >}}

{{< download url="https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/" testo="Debian 12 - Immagine ISO" dimensione="628 MB" tipo="iso" >}}

---

## Mappa (nuovo)

{{< mappa lat="43.8432" lon="10.5030" zoom="17" titolo="Foro Boario, Lucca" >}}

---

## Member (esistente)

{{< member name="Tux" role="Mascotte" >}}

---

Tutti gli shortcode funzionano! 🐧

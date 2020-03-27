---
title: "Redirezionare l'output di OBS su webcam virtuale"
lead: ""
description: ""
date: "2020-03-27T14:42:15+01:00"
thumbnail: "thumb/obs2cam.jpg"
categories:
  - "Guide"
  - "Progetti"
tags:
  - "obs"
  - "v4l"
  - "v4l2loopback"
  - "v4l2sink"
  - "streaming"
toc: true
sidebar: false
mathjax: false
draft: false
---
In questo post mostreremo come redirezionare l'output di OBS verso un device v4l di loopback in modo da avere un flusso video totalmente controllabile per tutte quelle applicazioni che sfruttano input da webcam (videoconferenze ecc).

<!--more-->

[Cos'è OBS?](https://it.wikipedia.org/wiki/Open_Broadcaster_Software)

Questa guida nasce a seguito di alcuni esperimenti partiti nel lontano 2016 [insieme ai ragazzi del Gulli](https://twitter.com/gulli_linux/status/784131414434471936) con l'obbiettivo di creare uno streaming unificato dei vari Linux Day organizzati in Toscana quell'anno.
A seguito dei vari smanettamenti, soddisfatti dalle potenzialità di OBS, emerse la curiosità di sfruttarlo al di fuori delle piattaforme di streaming che già supporta e impiegarlo anche con programmi come Skype, Hangout e simili per arricchire il proprio flusso video a favore degli altri partecipanti (immaginate una lezione online dove un professore può cambiare diverse webcam, aggiungere immagini o scritte al volo, indipendentemente dalla piattaforma).

Visto il periodo di quarantena e l'aumento forzato della didattica digitale, ho deciso di riprendere in mano la questione e ho finalmente trovato una soluzione funzionale e semplice.

NB: La guida funziona solo su Linux ed è stata testata con Solus Budgie 4.1, Ubuntu 18.04LTS e Archlinux, **per Windows** consiglio di guardare [questo progetto](https://github.com/CatxFish/obs-virtual-cam).

## Cosa andremo a fare
* Andremo a creare una webcam virtuale di loopback, ovvero un device v4l che riporta in output il video che riceve in input rispettando il formato di una webcam reale.

* Utilizzeremo OBS per generare il contenuto video 

* Il Plugin per OBS v4l2sink fungerà da ponte per portare l'output di OBS alla webcam virtuale.

Schematizzando:
> OBS --[v4l2sink]--> /dev/videoX (creata con v4l2loopback) --> Skype/Hangout/altro

## Installazione
- Installiamo ffmpeg e OBS utilizzando i ppa del progetto

        sudo apt-get install ffmpeg
        sudo add-apt-repository ppa:obsproject/obs-studio
        sudo apt-get update
        sudo apt-get install obs-studio

Per le altre distro guardate il vostro package manager o le istruzioni ufficiali https://obsproject.com/wiki/install-instructions#linux

- Installiamo v4l2loopback

        sudo apt-get install v4l2loopback-dkms v4l2loopback-utils

Per le altre distro guardate il vostro package manager o le istruzioni per la compilazione dalla [repo](https://github.com/umlaeute/v4l2loopback)

- Installiamo v4l2sink

        wget https://github.com/CatxFish/obs-v4l2sink/releases/latest/download/obs-v4l2sink.deb
        sudo apt install ./obs-v4l2sink.deb
  
Per le altre distro guardate il vostro package manager o le istruzioni per la compilazione dalla [repo](çhttps://github.com/CatxFish/obs-v4l2sink)

## Uso
Carichiamo il module v4l2loopback

        sudo modprobe v4l2loopback video_nr=42 card_label="obs-cam" exclusive_caps=1
        v4l2-ctl -d /dev/video42 -c timeout=3000

Dovrebbe essersi creato il device __/dev/video42__

        Aprite OBS -> Strumenti -> v4l2sink 

Nella finestra che compare indicate il path del device appena creato (nel nostro caso /dev/video42), lasciate il campo "video format" invariato.

Cliccate su start

Fatto! Lo stream video è redirezionato, provate il funzionamento con [questo sito](https://webcamtests.com/)

## Troubleshooting

### Format not supported
Se cliccando su "start streaming" vi compare l'errore "format not supported" provate a reinstallare v4l2loopback compilandolo direttamente dalla repository ufficiale

### Shifting dell'immagine/colori
Se l'immagine emessa dalla webcam virtuale è shiftata o presenta una modifica nei colori potrebbe esserci un problema nella configurazione video di OBS, eseguite la configurazione automatica dal menu "Strumenti" oppure dalle impostazioni cliccate sulla tab "Avanzate" e modificate il formato video in "I444" e lo spazio colore in "601"

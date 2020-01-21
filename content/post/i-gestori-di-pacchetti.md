---
title: "I gestori di pacchetti"
description: "Un'introduzione ai più comuni package manager"
lead: "Un'introduzione ai più comuni package manager"
date: "2020-01-21T13:46:08+01:00"
thumbnail: "thumb/package.png"
sidebar: false
categories:
  - "Linux"
tags:
  - "Linux"
draft: false
toc: true
mathjax: false
---

Senza alcun dubbio, da quando ho cominciato ad appassionarmi al mondo di GNU/Linux e a provare le varie distribuzioni, uno degli aspetti che mi ha affascinato maggiormente è stato l’uso dei gestori pacchetti (package manager).

Arrivando da Windows, il meccanismo di installazione ed aggiornamento mi è piaciuto all’istante, in quanto permette di aggiornare completamente il sistema in pochi semplici passaggi, sia da terminale che tramite un’interfaccia grafica.
<!--more-->

Le distribuzioni GNU/Linux possono essere suddivise in base alla tipologia di pacchetto adottata, dove con il termine pacchetto si intende un archivio compresso, contenente i file di un dato programma e le informazioni relative alle sue dipendenze, i permessi dei file da installare ed eventuali script pre e post installazione. Esistono, inoltre, alcuni pacchetti (chiamati metapacchetti) che hanno lo scopo di facilitare l’installazione di altri, strettamente correlati tra loro. Talvolta, i gruppi di pacchetti sono gestiti direttamente dal gestore: un esempio di metapacchetto o gruppo di pacchetti è quello dei Desktop Environment (GNOME, KDE ecc..).

**I principali formati di pacchetti sono:**

* RPM (Red Hat e derivate, Fedora CEntOS OpenSUSE, SLES, ecc…);
* DEB (Debian e derivate, Ubuntu e derivate, Mint, ecc…).
Questa immagine rende bene l’idea: [Linux Distribution Timeline](https://upload.wikimedia.org/wikipedia/commons/1/1b/Linux_Distribution_Timeline.svg)

Altre distribuzioni hanno dei formati meno standard, ma personalizzati per i propri gestori pacchetti; ad esempio, ArchLinux usa file con estensione pkg.tar.xz. Altre ancora, prediligono la compilazione dei pacchetti e la risoluzione delle dipendenze manuali.

I vari formati dei pacchetti vengono, quindi, presi in gestione dai package manager adottati. Ecco i principali:

**Gestori pacchetti da linea di comando:**

* rpm (RedHat/CEntOS/Fedora/OpenSUSE)
* yum (CEntOS/Fedora)
* zypper (OpenSUSE)
* dpkg (Debian/Ubuntu e derivate)
* apt (Debian/Ubuntu)
* pacman (ArchLinux)

**Gestori pacchetti da interfaccia grafica:**

* Synaptic (Debian, Ubuntu)
* YaST2 (OpenSUSE)
* packagekit (multi distribuzione ArchLinux, Fedora, ecc..)

La scelta tra interfaccia grafica o linea di comando è sicuramente influenzata dai gusti e dalle abitudini dell’utente ma, di sicuro, una volta ottenuta la giusta dimestichezza, la seconda via risulta sempre più rapida e immediata e, con il tempo e la pratica, anche chi preferisce le interfacce grafiche non ne potrà fare a meno.

I gestori pacchetti recuperano i pacchetti dai repository, ovvero server su Internet appositamente creati e contenenti i pacchetti, suddivisi per versione della distribuzione e architettura del sistema. Normalmente, i repository sono preconfigurati in fase di installazione, ma l’utente è libero di modificarli o di aggiungerne di personalizzati, così da poter installare altri pacchetti che la distribuzione non mette a disposizione. È bene tener presente che l’aggiunta di repository esterni deve sempre essere fatta con molta cautela, in quanto i rischi sono molteplici: infatti, dall’installazione di pacchetti esterni possono derivare sia l’instabilità del sistema che conflitti di versioni (nel caso in cui sul repository esterno siano presenti pacchetti in comune con quelli di base) oppure, nel peggiore dei casi, l’installazione di pacchetti malevoli, se il repository non è fidato.

Alcuni tra i repository più noti forniscono chiavi per la verifica delle firme dei pacchetti, proprio come quelli dei repository ufficiali. È, quindi, buona norma documentarsi su come abilitare correttamente tali repository e su come abilitarne la verifica.
Tra i repository non ufficiali più famosi ci sono [EPEL(Red Hat/CEntOS)](https://fedoraproject.org/wiki/EPEL), [RepoForge](http://repoforge.org/) (ex RPMForge per Red Hat CEntOS, ecc..), [repo-ck](http://repo-ck.com) (ArchLinux), i [Repository di Google](https://www.google.com/linuxrepositories) per le proprie App come Chrome, Earth e molti altri ancora.

Quali sono, dunque, le funzioni dei gestori di pacchetti?

* Aggiornamento completo del sistema o del singolo pacchetto;
* Verifica delle dipendenze dei pacchetti;
* Installazione e rimozione dei pacchetti;
* Ricerche di pacchetti all’interno dei repository;
* Elencare i pacchetti installati;
* Effettuare un backup della lista dei pacchetti installati (in vista di una successiva installazione su un nuovo sistema);
* Rimozione dal sistema dei pacchetti non più necessari (solitamente dipendenze di altri pacchetti non più presenti);
* Pulizia delle cache dei pacchetti archiviati localmente (utile per liberare spazio su disco);
* Verificare quale pacchetto ha installato un certo file.

e molto altro ancora.

Certi gestori pacchetti, come yum, hanno la possibilità di essere estesi nelle loro funzionalità grazie ad appositi plug-in; ad esempio, sono funzionalità aggiuntive:

la creazione di uno snapshot LVM del filesystem prima dell’aggiornamento(richiede una installazione su volumi logici LVM);
la verifica dell’integrità dei pacchetti installati e dei file installati da essi;
la ricerca dei mirror più veloci (i mirror altro non sono che fonti diverse e geolocalizzate dei repository).

Un’altra interessante peculiarità di alcuni gestori pacchetti (come yum) è la gestione dei delta. Il delta non è un pacchetto completo, bensì una patch da applicare alla versione precedente del pacchetto, così da ottenere la versione più aggiornata.

L’uso dei delta, da un lato, diminuisce il tempo e il traffico di download, dall’altro, aumenta, di poco, il tempo di applicazione degli aggiornamenti, poiché il pacchetto finale viene “costruito” localmente con l’applicazione del delta. Si noti, però, che se l’utente non aggiorna spesso e la versione locale è troppo vecchia per l’applicazione del delta, il gestore pacchetti opta per il download di quello più aggiornato.


Ecco alcuni degli esempi che mi vengono in mente (certo non potrei elencarli tutti!):

### Pacman
*Aggiornamento dell’elenco pacchetti*
```sh
pacman -Sy
```

*Elenco degli aggiornamenti disponibili (dopo aver aggiornato l’elenco)*
```sh
pacman -Qu
```

*Installazione di un pacchetto*
```sh
pacman -S firefox
```

*Rimozione di un pacchetto*
```sh
pacman -R firefox
```

*Backup della lista pacchetti*
```sh
pacman -Qqen > listapacchetti
```
*Re-installazione dei pacchetti da una lista*
```sh
pacman -S - < listapacchetti
```

*Pulizia dei pacchetti non più installati (ad esempio, le vecchie versioni o vecchie dipendenze) dalla cache dei pacchetti*
```sh
pacman -Sc
```

*Pulizia completa della cache dei pacchetti*
```sh
pacman -Scc
```

*Rimozione dei pacchetti installati, ma non più richiesti*
```sh
pacman -Qdt
```

### RPM

*Elencare i pacchetti installati*
```sh
rpm -qa
```
*Elencare i file installati da un pacchetto*
```sh
rpm -ql firefox
```
*Ottenere il pacchetto che ha installato il file*
```sh
rpm -qf /usr/bin/firefox
```

### YUM
*Aggiornamento dell’elenco dei pacchetti ed elenco degli aggiornamenti disponibili*
```sh
yum check-update
```

*Aggiornamento del sistema*
```sh
yum update
```

*Installazione di un pacchetto*
```sh
yum install firefox
```

*Rimozione di un pacchetto*
```sh
yum remove firefox
```

*Installazione di un gruppo di pacchetti*
```sh
yum groupinstall "KDE"
```

*Rimozione di un gruppo di pacchetti*
```sh
yum groupremove “KDE”
```

*Pulizia completa della cache dei pacchetti*
```sh
yum clean all
```

*Elenco degli aggiornamenti specificando quali sono quelli sicurezza*
```sh
yum check-update --security
```

*Verifica dell’integrità dei pacchetti e dei file installati (richiede il plugin yum-plugin-verify) tutti i pacchetti*
```sh
yum verify all
```

*singolo pacchetto*
```sh
yum verify firefox
```

### zypper
*Aggiornamento del sistema*
```sh
zypper up
```
*Aggiornamento della lista dei pacchetti ed elenco degli aggiornamenti*
```sh
zypper lu
```
*Installazione di un pacchetto*
```sh
zypper in firefox
```

## dpkg
*Elencare i pacchetti installati*
```sh
dpkg -l
```

*Rimuovere un pacchetto*
```sh
dpkg -r firefox
```

*Elencare i file installati da un pacchetto*
```sh
dpkg -L firefox
```

*Riconfigurare un pacchetto*
```sh
dpkg --configure firefox
```

### APT
*Aggiornamento dell’elenco dei pacchetti*
```sh
apt-get update
```

*Aggiornamento del sistema*
```sh
apt-get upgrade
```

*Installazione di un pacchetto*
```sh
apt-get install firefox
```

*Rimozione di un pacchetto*
```sh
apt-get remove firefox
```

*Rimozione di un pacchetto e delle relative configurazioni*
```sh
apt-get --purge remove firefox
```

*Pulizia della cache dei pacchetti non installati sul sistema*
```sh
apt-get autoclean
```

*Pulizia completa della cache dei pacchetti*
```sh
apt-get clean
```


## Link utili
[ArchLinux Wiki - pacman](https://wiki.archlinux.org/index.php/Pacman)  
[The Debian GNU/Linux FAQ - Capitolo 8 - Gli strumenti di gestione dei pacchetti Debian](https://www.debian.org/doc/manuals/debian-faq/ch-pkgtools.it.html)  
[CEntOS Wiki - RPM](https://wiki.centos.org/PackageManagement/Rpm)(contiene altri link molto utili)  
[Managing Software with yum](https://www.centos.org/docs/4/html/yum/)  
[CEntOS Wiki - Yum and RPM tricks](https://wiki.centos.org/TipsAndTricks/YumAndRPM)  

Infine, ricordate sempre che il terminale vi è amico e se avete bisogno di informazioni su un comando potete sempre utilizzare il comando man
```sh
man yum
```


_**Claudio con la revisione di Davide e Alek**_

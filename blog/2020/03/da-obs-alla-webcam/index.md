# Da OBS alla webcam virtuale

**Data:** 27/03/2020

**Autore:** Il Direttivo

**Tag:** guide, video

---


{{< figure src="images/blog/da-obs-alla-webcam/obs2cam.jpg" alt="Schema OBS verso webcam virtuale" caption="OBS come sorgente per una webcam virtuale via v4l2loopback" >}}

In questo post mostreremo come redirezionare l'output di OBS verso un device v4l di loopback in modo da avere un flusso video totalmente controllabile per tutte quelle applicazioni che sfruttano input da webcam (videoconferenze ecc).

Questa guida nasce a seguito di alcuni esperimenti partiti nel lontano 2016 insieme ai ragazzi del Gulli con l'obiettivo di creare uno streaming unificato dei vari Linux Day organizzati in Toscana quell'anno. A seguito dei vari smanettamenti, soddisfatti dalle potenzialità di OBS, emerse la curiosità di sfruttarlo al di fuori delle piattaforme di streaming che già supporta e impiegarlo anche con programmi come Skype, Hangout e simili per arricchire il proprio flusso video a favore degli altri partecipanti (immaginate una lezione online dove un professore può cambiare diverse webcam, aggiungere immagini o scritte al volo, indipendentemente dalla piattaforma).

Visto il periodo di quarantena e l'aumento forzato della didattica digitale, ho deciso di riprendere in mano la questione e ho finalmente trovato una soluzione funzionale e semplice.

{{< note type="warning" >}}
La guida funziona solo su Linux ed è stata testata con Solus Budgie 4.1, Ubuntu 18.04 LTS e Arch Linux. Per Windows consiglio di guardare [questo progetto](https://github.com/CatxFish/obs-virtual-cam).
{{< /note >}}

## Cosa andremo a fare

- Creare una webcam virtuale di loopback, ovvero un device v4l che riporta in output il video che riceve in input rispettando il formato di una webcam reale.
- Utilizzare OBS per generare il contenuto video.
- Il plugin per OBS **v4l2sink** fungerà da ponte per portare l'output di OBS alla webcam virtuale.

Schematizzando:

```text
OBS -[v4l2sink]-> /dev/videoX (creata con v4l2loopback) -> Skype/Hangout/altro
```

## Installazione

Installiamo ffmpeg e OBS utilizzando i PPA del progetto:

{{< terminal title="Installazione OBS (Ubuntu/Debian)" >}}
sudo apt-get install ffmpeg
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt-get update
sudo apt-get install obs-studio
{{< /terminal >}}

Per le altre distro guardate il vostro package manager o le istruzioni ufficiali: [https://obsproject.com/wiki/install-instructions#linux](https://obsproject.com/wiki/install-instructions#linux)

Installiamo v4l2loopback:

{{< terminal title="Installazione v4l2loopback (Ubuntu/Debian)" >}}
sudo apt-get install v4l2loopback-dkms v4l2loopback-utils
{{< /terminal >}}

Per le altre distro guardate il vostro package manager o le istruzioni per la compilazione dalla [repo](https://github.com/umlaeute/v4l2loopback).

Installiamo v4l2sink:

{{< terminal title="Installazione v4l2sink (Ubuntu/Debian)" >}}
wget https://github.com/CatxFish/obs-v4l2sink/releases/latest/download/obs-v4l2sink.deb
sudo apt install ./obs-v4l2sink.deb
{{< /terminal >}}

Per le altre distro guardate il vostro package manager o le istruzioni per la compilazione dalla [repo](https://github.com/CatxFish/obs-v4l2sink).

## Uso

Carichiamo il modulo v4l2loopback:

{{< terminal title="Caricamento del modulo e verifica del device" >}}
sudo modprobe v4l2loopback video_nr=42 card_label="obs-cam" exclusive_caps=1
v4l2-ctl -d /dev/video42 -c timeout=3000
{{< /terminal >}}

Dovrebbe essersi creato il device **/dev/video42**.

Aprite OBS → **Strumenti** → **v4l2sink**.

Nella finestra che compare, indicate il path del device appena creato (nel nostro caso `/dev/video42`), lasciate il campo "video format" invariato.

Cliccate su **Start**.

Fatto! Lo stream video è redirezionato. Provate il funzionamento con [questo sito](https://webcamtests.com/).

## Troubleshooting

### Format not supported

Se cliccando su "start streaming" compare l'errore "format not supported", provate a reinstallare v4l2loopback compilandolo direttamente dalla repository ufficiale.

### Shifting dell'immagine/colori

Se l'immagine emessa dalla webcam virtuale è shiftata o presenta una modifica nei colori, potrebbe esserci un problema nella configurazione video di OBS. Eseguite la configurazione automatica dal menu "Strumenti", oppure dalle impostazioni cliccate sulla tab "Avanzate" e modificate il formato video in `I444` e lo spazio colore in `601`.


# Cosino - Recensione

**Data:** 25/11/2013

**Autore:** Il Direttivo

**Tag:** open-hardware, recensione, embedded

---


Abbiamo già scritto parecchi articoli sulla nostra nuova stampante 3D: una Prusa i3 con una modifica al piatto per aumentare l'area di stampa. Il controller di basso livello è Arduino, nota scheda Open Hardware.

Ma è il caso di spendere qualche parola anche su **Cosino**, mini-computer che usiamo per il controllo della stampa ad "alto livello", ovvero l'interfaccia tra uomo e macchina.

Per questo tipo di controllo si usa di solito un PC che, connesso via USB al controller di basso livello, permette di lanciare e controllare la stampa. Il problema legato a questo utilizzo della stampante è che il PC deve restare a essa collegato durante tutto il processo di stampa; e sappiamo che in alcuni casi questa può durare parecchie ore.

{{< figure src="images/blog/recensione-cosino/cosino.jpg" alt="La scheda Cosino" caption="Cosino: mini-computer industriale modulare compatibile con Arduino Mega 2560" >}}

Cosino risolve questo problema. Vi abbiamo installato sopra **Octoprint**, un sistema operativo che gestisce un server di stampa con interfaccia web. Questo significa che la stampa può essere avviata e controllata da qualsiasi dispositivo dotato di un browser web. Parliamo quindi anche di smartphone e tablet.

## Cos'è Cosino

Ma Cosino non è un semplice controller per stampanti 3D: è una **scheda industriale modulare per la prototipazione rapida**. È inoltre totalmente compatibile con il mondo Arduino Mega 2560. Quindi un programma già scritto per Arduino può essere trasferito su Cosino senza doverne cambiare una virgola.

È importante sottolineare che il progetto non si limita ad Arduino. Vi sono infatti molte altre estensioni disponibili (ad esempio GSM, GPRS, RFID, ecc.).

Il progetto cura sia l'hardware che il software e comprende anche una serie di tutorial e un forum per aiutare coloro che usano Cosino.

Scopo ulteriore del progetto è quello di aiutare chi ha realizzato un prototipo con Cosino nell'industrializzazione del proprio prodotto e dell'eventuale vendita.

{{< note type="tip" >}}
Tutti i dati tecnici e le informazioni si possono trovare su [http://cosino.it](http://cosino.it).
{{< /note >}}


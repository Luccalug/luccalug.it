---
title: "Arduracing"
description: ""
lead: ""
date: "2020-01-21T20:48:01+01:00"
thumbnail: "thumb/arduracing.jpg"
categories:
  - "Progetti"
tags:
  - "arduino"
draft: false
toc: true
sidebar: false
mathjax: true

---


Arduracing è un progetto che aspira alla creazione di una robot car in grado di muoversi autonomamente all’ interno di un circuito.
<!--more-->  

Il robot utilizza 4 sensori di distanza ad infrarossi per determinare la distanza dalle pareti laterali e frontali.
Attraverso questi dati è in gradi di estrapolare la distanza e l’angolo delle curve. Il robot è in grado di sterzare e viaggiare a velocità variabile in avanti ed indietro. Il telaio è realizzato con il Lego. Il progetto è stato presentato durante il Linux Day 2011 a Lucca ed ha dato risultati soddisfacenti, sono ovviamente stati individuati degli errori di progettazione che sono espressi nella sezione conclusioni.

## Principio di funzionamento

Il funzionamento si basa sul seguente schema geometrico: Posizionando due sensori di distanza paralleli alla vettura ai lati della stessa è possibile attraverso semplici formule goniometriche ricavare l’angolo di inclinazione della retta C, che non rappresenta altro che una linearizzazione del tratto di curva.

$$\alpha = (d1-d2/l)$$

Ovviamente avendo a disposizione le distanze d1 e d2 è possibile anche conoscere a che distanza si trova l’ostacolo oltre alla sua inclinazione.

![Principio funzionamento Arduracing](/img/ardualpha.jpg)

Questo tipo di approccio permette al robot di differenziarsi da un classico line-follower in quanto è in grado di conoscere in anticipo le curve e quanto siano più o meno strette. In questo modo è in grado di regolare la propria velocità o eseguire manovre correttive nel caso ad esempio, che si trovi sul lato della pista corrispondente all’interno curva.

## Casi particolari

Uno dei casi in cui l’algoritmo sopra espresso fallisce è espresso nella figura sottostante: In questo caso i due sensori “vedono” uno l’interno della pista e l’altro l’esterno. Sotto stimando l’angolo di sterzo necessario ad evitare l’interno curva.

Per ovviare a questo problema nell’esempio si calcola l’angolo utilizzando il sensore laterale destro ed il posteriore destro.

![Funzionamento interno curva](/img/ardualpha2.jpg)

Un altro caso problematico si manifesta quando la parete interna è quasi parallela all’auto: in questo frangente si utilizzano i sensori laterali per evitare che l’auto sia avvicini troppo. Un ulteriore raffinazione dell’algoritmo sviluppato valuta non solo la distanza laterale ma anche la velocità di avvicinamento ai bordi in modo da poter sfruttare maggiormente la pista.

## Hardware

* 1 x Arduino UNO
* 1 x Sparkfun Motor-Shield
* 4 x sensori distanza sharp
* 1 x servomotore
* 4 x resistenze
* 5 x condensatori
* 1 x modellino LEGO

## Filtri RC

Una prima analisi dei sensori di distanza ha evidenziato un notevole rumore sul segnale in uscita, per questo abbiamo deciso di costruire dei semplici filtri passa-basso passivi per ridurre le perturbazioni con una frequenza superiore a quella di taglio. Inoltre è stato connesso in serie all’alimentazione dei sensori un condensatore elettrolitico al fine di evitare una tensione di alimentazione instabile.

![sensori](/img/sensori.jpg)

## Telaio

Il telaio rappresenta la parte più complessa dal punto di vista realizzativo pratico e come meglio presentato nelle conclusioni, anche il punto di maggior debolezza del robot. Per realizzarlo è stato utilizzato il LEGO e i vari componenti sono stati fissati a mezzo di colla a caldo. Durante la sua realizzazione si sono manifestati diversi problemi: i principali sono stati gli attriti degli ingranaggi che generavano una quantità notevole di energia dissipata e lo sterzo in cui erano presenti innumerevoli “giochi”.

Per risolvere questi due problemi siamo ricorsi ad un motore che comprendesse già un rapporto di riduzione e lo sterzo è stato quanto più semplificato, togliendo ad esempio il sistema di ammortizzatori, presente nella prima versione del robot.

![sterzo](/img/sterzo.jpg)

## Circuito di prova

Il circuito è realizzato per gran-parte in cartone, la base è stata realizzata con fogli di 100×80 cm di spessore 3 mm, mentre le pareti sono realizzate con delle bande ritagliate alte circa 30 cm di cartoncino meno spesso. Al fine di rendere la struttura più resistente agli urti del robot sono stati costruiti con materiale plastico e colla a caldo dei pilastri all’esterno delle pareti come evidente in foto.

![Circuito di prova](/img/pista.jpg)

## Software

La parte software è stata poco curata a causa dell’avvicinarsi dell’evento a cui dovevo presentare il progetto. In particolare non sono riuscito a sviluppare una funzione per “frenare” prima delle curve.

Le parti principali del codice verranno illustrate in una serie di articoli che gli dedicherò all’interno del blog.

Di seguito è riportato il sorgente utilizzato per la dimostrazione:

```C
#define sinistra 1
#define destra 0
#define avanti HIGH
#define indietro LOW
#define POT_MIN 110
#define N_misure 15
#define S 125
#define D 35
#define C 80
Servo myservo;                  // create servo object to control a servo
// a maximum of eight servo objects can be created
int pos = 90;
int pwm_a = 10;                 //PWM control for motor outputs 1 and 2 is on digital pin 10
int pwm_b = 11;                 //PWM control for motor outputs 3 and 4 is on digital pin 11
int dir_a = 12;                 //direction control for motor outputs 1 and 2 is on digital pin 12
int dir_b = 13;                 //direction control for motor outputs 3 and 4 is on digital pin 13
float AS, PD, AD, PS;
int dist_P_min, dist_P_max, dist_P_media, angolo_curva, dir_curva, inizio_curva;
int dist_A_min, dist_A_max, dist_A_media, rapporto;
int t;
int blocco = 0;
void setup()
{
    // initialize the serial communication:
    Serial.begin(9600);
    // initialize servo and motor-shield
    myservo.attach(9);
    pinMode(pwm_b, OUTPUT);
    pinMode(dir_b, OUTPUT);
    // seti initial value for the motor
    digitalWrite(dir_b, HIGH);
    analogWrite(pwm_b, 0);
}
void aggiorna()
{
    //vengono effettuate tutte le misure e ricalcolate le variabili
    AS = 0;
    AD = 0;
    PS = 0;
    PD = 0;
    int i = 0;
    for (i = 0; i < N_misure; i++) {
        AS += 2076.0 / (constrain(analogRead(A2), 80, 530) - 11.0);
        AD += 2076.0 / (constrain(analogRead(A4), 80, 530) - 11.0);
        PS += 9462.0 / (constrain(analogRead(A1), 80, 550) - 16.92);
        PD += 9462.0 / (constrain(analogRead(A3), 80, 550) - 16.92);
    }
    AS /= N_misure;
    AD /= N_misure;
    PS /= N_misure;
    PD /= N_misure;
    PD += 1.5;
    PD = constrain(PD, 0, 150);
    dist_P_min = min(PD, PS);
    dist_P_max = max(PD, PS);
    dist_P_media = (PD + PS) / 2;
    dist_A_min = min(AD, AS);
    dist_A_max = max(AD, AS);
    dist_A_media = (AD + AS) / 2;
    if ((PD - PS) > 0)
        dir_curva = 0;
    else
        dir_curva = 1;
    int angolo_curva_c = 9 - atan(abs(PD - PS) / 15.5) * (2 / 3.14) * 9;
    int angolo_curva_d = 9 - atan(abs(PD - 18) / AD) * (2 / 3.14) * 9;
    int angolo_curva_s = 9 - atan(abs(PS - 18) / AS) * (2 / 3.14) * 9;
    //restituisce un valore da 0 a 10 per l'angolo
    if (AS < AD) {
        angolo_curva = max(angolo_curva_c, angolo_curva_s);
    } else {
        angolo_curva = max(angolo_curva_d, angolo_curva_c);
    }
}
void debug()
{
    Serial.print(AS);
    Serial.print("|");
    Serial.print(AD);
    Serial.print("|");
    Serial.print(PS);
    Serial.print("|");
    Serial.print(PD);
    Serial.print("|");
    Serial.println(angolo_curva);
}
void manuale()
{
    int a, b;
    if (Serial.available() > 1) {
        a = Serial.read();
        b = (Serial.read() - 48);
        switch (a) {
            case 'D':
                sterzo(destra, b);
                break;
            case 'S':
                sterzo(sinistra, b);
                break;
            case 'A':
                motore(avanti, b, 0);
                break;
            case 'R':
                motore(indietro, b, 0);
                break;
        }
    }
}
int stato()
{
    //la funzione ritorna lo stato della vettura: 0 rettilineo, 1 curva, 2 collisione
    if (dist_P_min < 19 || dist_A_min < 5) {
        blocco++;
    } else
        blocco = 0;
    if (blocco > 25)
        return 2;
    if (dist_P_min > 35)
        return 0;
    else
        return 1;
}
void motore(boolean dir, int potenza, int angolo)
{
    // la funzione compensa il maggior sforzo richiesto al motore con ruote sterzate e fissa il minimo della potenza
    // la potenza deve avere un valore intero tra 0 e 10
    potenza = constrain(potenza, 0, 10);
    if (potenza != 0)
        potenza =
            constrain(map
                    (potenza + angolo / 2 + 1, 1, 10, POT_MIN, 254),
                    POT_MIN, 214);
    digitalWrite(dir_b, dir);
    analogWrite(pwm_b, potenza);
    //analogWrite(pwm_b, 0);
    //Serial.println(dir);
}
void sterzo(int dir, int angolo)
{
    int a = 0;
    // la funzione richiede in ingresso la direzione e l'angolo di sterzata
    // l'angolo deve avere un valore tra 0 e 10
    angolo = constrain(angolo, 0, 10);
    if (dir == sinistra)
        a = map(angolo, 0, 10, C, S);
    if (dir == destra)
        a = map(angolo, 0, 10, C, D);
    myservo.write(a);
}
void sposta(int dir, int potenza, int tempo)
{
    motore(avanti, potenza, 4);
    if (dir == sinistra) {
        sterzo(sinistra, 4);
        delay(tempo);
        sterzo(destra, 4);
        delay(tempo);
        sterzo(sinistra, 0);
    }
    if (dir == destra) {
        sterzo(destra, 4);
        delay(tempo);
        sterzo(sinistra, 4);
        delay(tempo);
        sterzo(sinistra, 0);
    }
}

void loop()
{
    int x;
    aggiorna();
    float V_AS, V_AD;
    V_AS = AS;
    V_AD = AD;
    if (dist_P_min > 60) {
        delay(20);
        aggiorna();
        if (AD > V_AD - 0.2) {
            sterzo(destra, (AD - V_AD) * 5);
            delay(20);
        }
        if (AS > V_AS - 0.2) {
            sterzo(sinistra, (AS - V_AS) * 5);
            delay(20);
        }
    }
    switch (stato()) {
        case 0:
            motore(avanti, map(pow(dist_P_min / 10, 2), 0, 200, 1, 10), 0);
            if (AS < 6) {
                sterzo(destra, 5);
                break;
            }
            if (AD < 6) {
                sterzo(sinistra, 5);
                break;
            }
            if (AS < 7) {
                sterzo(destra, 3);
                break;
            }
            if (AD < 7) {
                sterzo(sinistra, 3);
                break;
            }
            if (AS < 8) {
                sterzo(destra, 2);
                break;
            }
            if (AD < 8) {
                sterzo(sinistra, 2);
                break;
            }
            if (V_AS > 14 && dir_curva == destra && angolo_curva > 5
                    && dist_P_min > 60)
                sposta(sinistra, 1, 80);
            if (V_AD > 14 && dir_curva == sinistra && angolo_curva > 5
                    && dist_P_min > 60)
                sposta(destra, 1, 80);
            sterzo(sinistra, 0);
            break;
        case 1:
            //curva
            //inizio_curva=((10-angolo_curva)*7)+5;
            if ((dir_curva == destra && AS < 9)
                    || (dir_curva == sinistra && AD < 9) || (dist_P_media < 41)
                    || (dir_curva == destra && PS < 27)
                    || (dir_curva == sinistra && PD < 27)) {
                if (dist_P_media > 25) {
                    sterzo(dir_curva, angolo_curva);
                    motore(avanti,
                            constrain((dist_P_min / 30) -
                                angolo_curva / 3, 1, 10),
                            angolo_curva);
                } else {
                    sterzo(dir_curva, 10);
                    motore(avanti, 1, 10);
                }
            } else {
                sterzo(sinistra, 0);
            }
            break;
        case 2:
            //blocco
            motore(indietro, 1, 10);
            delay(30);
            if (dir_curva == sinistra)
                sterzo(destra, 10);
            if (dir_curva == destra)
                sterzo(sinistra, 10);
            while ((dist_P_min < 19) || (dist_A_min < 6)) {
                aggiorna();
            }
            sterzo(sinistra, 0);
            motore(avanti, 1, 0);
            break;
    }
}
```

## Messa in pista

{{< youtube IuIp-CHJQyI>}}

## Problemi

Durante la fase di test si sono evidenziati alcuni problemi che vado ad elencare in ordine di gravità.

1. **Telaio poco rigido**  
Il telaio si è rivelato troppo poco rigido e durante i vari test ci si è spesso accorti che l’allineamento dei sensori non era corretto.

2. **Sensori**  
Nonostante i filtri applicato il rumore sui sensori è ancora presente, una possibile soluzione sarebbe quella di comprare sensori di qualità maggiore.

3. **Trasmissione**  
Pur avendo utilizzato al minimo il numero di ingranaggi LEGO, la trasmissione potrebbe essere migliorata utilizzando ingranaggi metallici ed inserito anche un differenziale.

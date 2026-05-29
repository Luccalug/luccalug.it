---
title: "Serata a tema: OpenSCAD - disegnare in 3D programmando"
slug: "serata-openscad-disegnare-in-3d-programmando"
date: 2012-11-19
author: "matteo"
tags: ["serata-a-tema", "openscad", "stampa-3d", "open-hardware"]
description: "Serata dedicata a OpenSCAD nel ciclo Pillole di Free Software: modellazione 3D tramite geometria solida costruttiva (CSG) con esempi pratici."
---

**Lunedì 10 dicembre 2012, per Pillole di Free Software, serata dedicata a OpenSCAD**

[OpenSCAD](http://www.openscad.org/) è un software per creare oggetti CAD 3D. Stiamo parlando di un software libero e disponibile per Linux/UNIX, MS Windows e Mac OS X.

{{< figure src="images/blog/serata-openscad-disegnare-in-3d-programmando/openscad-logo.png" alt="Logo di OpenSCAD" caption="Il logo di OpenSCAD" >}}

Esso non si focalizza sulla modellazione artistica tipica di software come Blender, bensì mantiene un legame più stretto con la progettazione CAD.

OpenSCAD è qualcosa di simile a un compilatore 3D che legge un file script per descrivere un oggetto e renderizzarlo. Questo garantisce un controllo completo al designer e permette di modificare con semplicità ogni passaggio nel processo di modellazione o di creare modelli definiti da parametri configurabili.

Il programma offre principalmente due tecniche di modellazione:

- Geometria solida costruttiva (CSG, vedi sotto)
- Estrusione di perimetri 2D

Come formato di scambio per i perimetri 2D è utilizzato il formato DXF, dal quale è inoltre possibile leggere dei parametri. OpenSCAD può leggere e creare modelli 3D nel formato STL e OFF.

## Geometria Solida Costruttiva (CSG)

La geometria solida costruttiva, abbreviata spesso in **CSG**, è un modello di rappresentazione di oggetti 3D, di tipo volume-based. In questo approccio le forme vengono costruite a partire da una famiglia di solidi geometrici elementari, chiamati *primitive*, come ad esempio il parallelepipedo, il cilindro, la sfera, il cono, il toro.

Per costruire volumi complessi a partire da questi volumi elementari si fa uso di operazioni booleane, che derivano dalle operazioni sugli insiemi:

- **Somma** (unione)
- **Sottrazione** (differenza)
- **Intersezione**

Il procedimento che porta a ottenere il solido finale può essere organizzato in uno schema, chiamato **albero CSG**: ogni foglia rappresenta un solido e a ogni nodo corrisponde un'operazione booleana, mentre in cima troviamo l'oggetto finale.

{{< figure src="images/blog/serata-openscad-disegnare-in-3d-programmando/csg-tree.png" alt="Esempio di albero CSG" caption="L'albero CSG mostra come i solidi primitivi vengono combinati tramite operazioni booleane" >}}

## Un esempio: il cilindro

Vediamo come creare una forma primitiva. Sperimentiamo con un cilindro modificando vari parametri:

```openscad
cylinder(h = 10, r1 = 10, r2 = 20, center = false);
cylinder(h = 20, r1 = 20, r2 = 10, center = true);
```

Adesso proviamo a vedere cosa succede unendo i due oggetti o intersecandoli:

```openscad
union() {
  cylinder(h = 10, r1 = 10, r2 = 20, center = false);
  cylinder(h = 20, r1 = 20, r2 = 10, center = true);
}

difference() {
  cylinder(h = 10, r1 = 10, r2 = 20, center = false);
  cylinder(h = 20, r1 = 20, r2 = 10, center = true);
}
```

## La serata: modellare un anemometro passo per passo

Nel corso dell'incontro vedremo come modellare passo passo un **anemometro** completo, partendo dalle primitive e combinandole con le operazioni CSG. Sarà un ottimo modo per mettere in pratica i concetti illustrati e capire come OpenSCAD rende la progettazione 3D ripetibile e parametrizzabile.

{{< note type="info" >}}
Ricordiamo che è ancora valida la promozione **tessera 2012/2013 + maglietta LuccaLUG a soli € 20,00**! È possibile iscriversi al LuccaLUG anche la sera stessa degli incontri.
{{< /note >}}

{{< evento titolo="Serata a tema: OpenSCAD" data="2012-12-10" luogo="Sede del LuccaLUG, Lucca" descrizione="Serata del ciclo Pillole di Free Software dedicata a OpenSCAD: modellazione 3D con geometria solida costruttiva, con esempio pratico di un anemometro." >}}

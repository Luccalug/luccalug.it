![Hugo deploy](https://github.com/Luccalug/luccalug.it/workflows/Hugo%20deploy/badge.svg)
# Luccalug.it
Sito ufficiale di Luccalug

## Infrastruttura
* Sito generato con [Hugo](https://www.gohugo.io) 
* Il tema è [Mainroad](https://www.github.com/vimux/mainroad) a cui è stata applicata quache piccola modifica e al quale contribuiamo attivamente
* Tutti i post sono scritti seguendo lo standard [Commonmark](https://commonmark.org/)
* Sito servito direttamente da Github Pages
* La generazione del sito e il deploy avvengono automaticamente ad ogni commit attraverso Github Actions (vedi [deploy.yml](https://github.com/Luccalug/luccalug.it/blob/master/.github/workflows/deploy.yml) per la configurazione). Il branch "gh-pages" è quello che viene servito e che quindi contiene i file generati.

## Testare localmente il sito
Se volete contribuire al sito o capire come funziona bastano pochi semplici passi per averlo in locale
1. Installa Hugo e Git, molto probabilmente già presenti nei repo della tua distro
2. Clona il branch [master] di questa repo compresi i submodule

    git clone --recursive https://github.com/Luccalug/luccalug.it

3. Entra nella cartella e genera il sito

    cd luccalug.it  
    hugo serve -D
4. Visita localhost:1313

enjoy :D

## Contribuire
Vuoi contribuire al sito con articoli, fix o miglioramenti?  

[Contattaci!](https://www.luccalug.it/contatti/)

oppure

1. [Fai un fork](https://github.com/Luccalug/luccalug.it/fork)
2. Crea un branch 

    git checkout -b my-new-feature

3. Fai il commit

    git commit -am 'Add some feature'

4. Fai il push

    git push origin my-new-feature

5. Crea una pull request


## Licenza
![https://licensebuttons.net/l/by/3.0/it/88x31.png](https://licensebuttons.net/l/by/3.0/it/88x31.png)

Tutti i contenuti sono sotto CC-BY 3.0 Italia


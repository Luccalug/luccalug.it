---
title: "{{ replace .File.ContentBaseName "-" " " | strings.FirstUpper }}"
slug: "{{ .File.ContentBaseName }}"
date: {{ .Date | time.Format "2006-01-02" }}
author: "Il Direttivo"
tags: []
# Una o due frasi, massimo ~160 caratteri: motori di ricerca e anteprime social.
description: ""
# Immagine per le anteprime social, in assets/ (facoltativa).
# image: "/images/blog/{{ .File.ContentBaseName }}/locandina.png"
# Solo se il contenuto cambia dopo la pubblicazione:
# lastmod: AAAA-MM-GG
draft: true
---

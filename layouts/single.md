{{- /*
  Markdown output format for single pages.
  Renders the original Markdown source with frontmatter-style header.
*/ -}}
# {{ .Title }}
{{ if not .Date.IsZero }}
**Data:** {{ .Date.Format "02/01/2006" }}
{{ end -}}
{{ with .Params.author }}
**Autore:** {{ . }}
{{ end -}}
{{ with .Params.status }}
**Stato:** {{ . }}
{{ end -}}
{{ with .Params.tags }}
**Tag:** {{ delimit . ", " }}
{{ end }}
---

{{ .RawContent }}

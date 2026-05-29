{{- /*
  Markdown output for the homepage.
  Lists all sections and their pages.
*/ -}}
# {{ .Title }}

{{ .RawContent }}

---
{{ range .Site.Menus.main }}
- [{{ .Name }}]({{ .URL }})
{{- end }}

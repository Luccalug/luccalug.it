{{- /*
  Markdown output for section list pages.
*/ -}}
# {{ .Title }}

{{ .RawContent }}
{{ range .Pages }}
- [{{ .Title }}]({{ .Permalink }}index.md){{ if not .Date.IsZero }} ({{ .Date.Format "02/01/2006" }}){{ end }}
{{- end }}

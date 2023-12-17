{{- with .Values.prism.users }}
  {{- range . }}
    {{- $salt := .salt | default (randAlphaNum 8) }}
    {{- $hash := .hash | default (printf "%s\x01%s" .password $salt | sha1sum) }}
{{ .name }}\x01{{ $hash }}\x01{{ $salt }}\x01{{ (.level | int) }}
  {{- end }}
{{- end }}

{{- range .Values.maplist -}}
{{- maplist . $.Values.maplistRaw }}
{{- end -}}

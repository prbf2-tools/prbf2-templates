{{- range .Values.reservedSlots }}
reservedSlots.addNick {{ . | quote }}
{{- end }}

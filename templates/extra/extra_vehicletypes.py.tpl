from collections import OrderedDict

import realityconfig_public as rconfig
import realityconstants as rconstants
import realityscoring as rscoring


{{- with .Values.acsysCustomTypes }}
{{- range . }}
VEHICLE_TYPE_{{ .name }} = {{ .id }}
{{- end }}


rconfig.C["TICKETS"] = rconfig.C["TICKETS"] + {
{{- range . }}
    VEHICLE_TYPE_{{ .name }}: rconfig.C["TICKETS"][rconstants.VEHICLE_TYPE_{{ .base }}],
{{- end }}
}

rscoring.WORTHSCHEMA["vehicles"] = rscoring.WORTHSCHEMA["vehicles"] + {
{{- range . }}
    VEHICLE_TYPE_{{ .name }}: rscoring.WORTHSCHEMA["vehicles"][rconstants.VEHICLE_TYPE_{{ .base }}],
{{- end }}
}

# Custom type vehicles must be included at the begining
# because they are matched in order (first match)
rconstants.vehicleTypeMap = OrderedDict([
{{- range $_, $typ :=  . }}
    {{- range $typ.include }}
    ({{ . | quote }}, VEHICLE_TYPE_{{ $typ.name }}),
    {{- end }}
{{- end }}
] + rconstants.vehicleTypeMap.items())
{{- end }}

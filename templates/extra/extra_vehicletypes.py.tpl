from collections import OrderedDict

import realityconfig_public as rconfig
import realityconstants as rconstants
import realityscoring as rscoring


{{- with .Values.acsysCustomTypes }}
{{- range . }}
VEHICLE_TYPE_{{ .name }} = {{ .id }}
{{- end }}


rconfig.C["TICKETS"] = dict(rconfig.C["TICKETS"].items() + {
{{- range . }}
    VEHICLE_TYPE_{{ .name }}: rconfig.C["TICKETS"][rconstants.VEHICLE_TYPE_{{ .base }}],
{{- end }}
}.items())

rscoring.WORTHSCHEMA["vehicles"] = dict(rscoring.WORTHSCHEMA["vehicles"].items() + {
{{- range . }}
    VEHICLE_TYPE_{{ .name }}: rscoring.WORTHSCHEMA["vehicles"][rconstants.VEHICLE_TYPE_{{ .base }}],
{{- end }}
}.items()

# Custom type vehicles must be included at the begining
# because they are matched in order (first match)
rconstants.vehicleTypeMap = OrderedDict([
{{- range $_, $typ := . }}
    {{- range $typ.include }}
    ({{ . | quote }}, VEHICLE_TYPE_{{ $typ.name }}),
    {{- end }}
{{- end }}
] + rconstants.vehicleTypeMap.items())
{{- end }}

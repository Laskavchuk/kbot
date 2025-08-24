{{/* Generate full name */}}
{{- define "helm.fullname" -}}
{{ .Release.Name }}-{{ .Chart.Name }}
{{- end }}

{{/* Generate labels */}}
{{- define "helm.labels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* Selector labels */}}
{{- define "helm.selectorLabels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
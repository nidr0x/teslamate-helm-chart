{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "teslamate.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "teslamate.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- $separator := default "-" .Values.global.nameSeparator -}}
{{- $maxLength := default 63 .Values.global.nameMaxLength -}}

{{- if .Values.fullnameOverride -}}
  {{- .Values.fullnameOverride | trunc $maxLength | trimSuffix $separator -}}
{{- else if .Values.global.prependReleaseName -}}
  {{- printf "%s%s%s" .Release.Name $separator $name | trunc $maxLength | trimSuffix $separator -}}
{{- else if contains $name .Release.Name -}}
  {{- .Release.Name | trunc $maxLength | trimSuffix $separator -}}
{{- else -}}
  {{- printf "%s%s%s" .Release.Name $separator $name | trunc $maxLength | trimSuffix $separator -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "teslamate.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "teslamate.labels" -}}
helm.sh/chart: {{ include "teslamate.chart" . }}
{{ include "teslamate.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "teslamate.selectorLabels" -}}
app.kubernetes.io/name: {{ include "teslamate.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

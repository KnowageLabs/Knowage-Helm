{{/*
Expand the name of the chart.
*/}}
{{- define "knowage.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "knowage.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "knowage.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "knowage.labels" -}}
helm.sh/chart: {{ include "knowage.chart" . }}
{{ include "knowage.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "knowage.selectorLabels" -}}
app.kubernetes.io/name: {{ include "knowage.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "knowage.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "knowage.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}



{{- define "knowage.domain" -}}
{{- regexReplaceAll "/.+$" ( regexReplaceAll "^https://" .Values.knowage.completeExternalUrl "" ) "" -}}
{{- end -}}



{{/*
Create the name of the TLS certificate
*/}}
{{- define "knowage.tls" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "tls" }}
{{- end }}



{{/*
Create the name of the ingress of the main app
*/}}
{{- define "knowage.ingress" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "main" }}
{{- end }}

{{/*
Create the name of the service of the main app
*/}}
{{- define "knowage.service" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "main" }}
{{- end }}

{{/*
Create the name of the deployment of the main app
*/}}
{{- define "knowage.deployment" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "main" }}
{{- end }}

{{/*
Create the name of the pod of the main app
*/}}
{{- define "knowage.pod" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "main" }}
{{- end }}

{{/*
Create the name of the persistent volume claim of the main app
*/}}
{{- define "knowage.pvc" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "main" }}
{{- end }}

{{/*
Create the name of the persistent volume of the main app
*/}}
{{- define "knowage.volume" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "main" }}
{{- end }}

{{/*
Create the name of the config map
*/}}
{{- define "knowage.config" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "config" }}
{{- end }}



{{/*
Create the name of the service of the Python app
*/}}
{{- define "knowage.python.service" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "python" }}
{{- end }}

{{/*
Create the name of the deployment of the Python app
*/}}
{{- define "knowage.python.deployment" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "python" }}
{{- end }}

{{/*
Create the name of the pod of the Python app
*/}}
{{- define "knowage.python.pod" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "python" }}
{{- end }}




{{/*
Create the name of the service of the R app
*/}}
{{- define "knowage.r.service" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "r" }}
{{- end }}

{{/*
Create the name of the deployment of the R app
*/}}
{{- define "knowage.r.deployment" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "r" }}
{{- end }}

{{/*
Create the name of the pod of the R app
*/}}
{{- define "knowage.r.pod" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "r" }}
{{- end }}





{{/*
Create the name of the service of the main db
*/}}
{{- define "knowage.db.service" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "db" }}
{{- end }}

{{/*
Create the name of the deployment of the main db
*/}}
{{- define "knowage.db.deployment" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "db" }}
{{- end }}

{{/*
Create the name of the pod of the main db
*/}}
{{- define "knowage.db.pod" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "db" }}
{{- end }}

{{/*
Create the name of the persistent volume claim of the main db
*/}}
{{- define "knowage.db.pvc" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "db" }}
{{- end }}

{{/*
Create the name of the persistent volume of the main db
*/}}
{{- define "knowage.db.volume" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "db" }}
{{- end }}




{{/*
Create the name of the service of the cache db
*/}}
{{- define "knowage.cache.service" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "cache" }}
{{- end }}

{{/*
Create the name of the deployment of the cache db
*/}}
{{- define "knowage.cache.deployment" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "cache" }}
{{- end }}

{{/*
Create the name of the pod of the cache db
*/}}
{{- define "knowage.cache.pod" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "cache" }}
{{- end }}

{{/*
Create the name of the persistent volume claim of the main db
*/}}
{{- define "knowage.cache.pvc" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "cache" }}
{{- end }}

{{/*
Create the name of the persistent volume of the main db
*/}}
{{- define "knowage.cache.volume" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "cache" }}
{{- end }}



{{/*
Create the name of the secret for the main database
*/}}
{{- define "knowage.db.secret" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "db-secret" }}
{{- end }}

{{/*
Create the name of the secret for the cache database
*/}}
{{- define "knowage.cache.secret" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "cache-db-secret" }}
{{- end }}



{{/*
Create the name of the secret for the main app
*/}}
{{- define "knowage.secret" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "secret" }}
{{- end }}



{{/*
Create the name of the service of the foodmart db
*/}}
{{- define "knowage.foodmart.service" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "foodmart" }}
{{- end }}

{{/*
Create the name of the deployment of the foodmart db
*/}}
{{- define "knowage.foodmart.deployment" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "foodmart" }}
{{- end }}

{{/*
Create the name of the pod of the foodmart db
*/}}
{{- define "knowage.foodmart.pod" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "foodmart" }}
{{- end }}



{{/*
Create the name of the service of the reverse proxy
*/}}
{{- define "knowage.proxy.service" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "proxy" }}
{{- end }}

{{/*
Create the name of the deployment of the reverse proxy
*/}}
{{- define "knowage.proxy.deployment" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "proxy" }}
{{- end }}

{{/*
Create the name of the pod of the reverse proxy
*/}}
{{- define "knowage.proxy.pod" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "proxy" }}
{{- end }}

{{/*
Create the name of the reverse proxy
*/}}
{{- define "knowage.proxy.config" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "proxy" }}
{{- end }}



{{/*
Create the name of the service of Hazelcast
*/}}
{{- define "knowage.hazelcast.service" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "hazelcast" }}
{{- end }}

{{/*
Create the name of the deployment of Hazelcast
*/}}
{{- define "knowage.hazelcast.deployment" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "hazelcast" }}
{{- end }}

{{/*
Create the name of the pod of Hazelcast
*/}}
{{- define "knowage.hazelcast.pod" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "hazelcast" }}
{{- end }}

{{/*
Create the name of the config of Hazelcast
*/}}
{{- define "knowage.hazelcast.config" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "hazelcast" }}
{{- end }}

{{ default true    .Values.knowage.installSampleData }}
{{ default true    .Values.knowage.deployMetadataDb }}
{{ default true    .Values.knowage.deployCacheDb }}
{{ default false   .Values.knowage.deployIngress }}
{{ default false   .Values.knowage.deployCustomReverseProxy }}

{{- define "knowage.db.port" -}}
{{- if .Values.knowage.deployMetadataDb }}
{{- print 3306 }}
{{- else }}
{{- print .Values.knowage.db.port }}
{{- end}}
{{- end}}

{{- define "knowage.cache.port" -}}
{{- if .Values.knowage.deployCacheDb }}
{{- print 3306 }}
{{- else }}
{{- print .Values.knowage.cache.port }}
{{- end}}
{{- end}}

{{- /*
#
# Knowage, Open Source Business Intelligence suite
# Copyright (C) 2022 Engineering Ingegneria Informatica S.p.A.
# 
# Knowage is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Knowage is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
# 
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
*/}}
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
{{- regexReplaceAll "/.+$" ( regexReplaceAll ":\\d+" ( regexReplaceAll "^https?://" .Values.knowage.completeExternalUrl "" ) "" ) "" -}}
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

{{/*
Create the name of the config of Hazelcast
*/}}
{{- define "knowage.python.config" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "python" }}
{{- end }}

{{/*
Create the name of the service for the ingress
*/}}
{{- define "knowage.ingress.service" -}}
{{- if eq ( default .Values.knowage.deployCustomReverseProxy false ) true -}}
{{- include "knowage.proxy.service" . -}}
{{ else }}
{{- include "knowage.service" . -}}
{{- end -}}
{{- end }}

{{/*
Create the name of the service for the ingress
*/}}
{{- define "knowage.ingress.port" -}}
443
{{- end }}

{{/*
Create the name of the service for the ingress
*/}}
{{- define "knowage.imagePullPolicy" -}}
{{- if .Values.knowage.imagePullPolicy -}}
{{ print .Values.knowage.imagePullPolicy }}
{{- else -}}
IfNotPresent
{{- end -}}
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

{{/*
OAuth2
*/}}

{{/*
Create the name of the secret for the main app
*/}}
{{- define "knowage.oauth2.secret" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "oauth2" }}
{{- end }}

{{/*
Manage various configuration of OAuth2
*/}}
{{- if eq .Values.knowage.oauth2.type "PKCE" -}}
{{- fail "Not implemented yet" }}
{{- else if eq .Values.knowage.oauth2.type "AUTHORIZATION_CODE" -}}
{{- fail "Not implemented yet" }}
{{- else if eq .Values.knowage.oauth2.type "IMPLICIT" -}}
{{- end}}

{{/*
TLS
*/}}

{{/*
Create the name of the TLS certificate of the main app
*/}}
{{- define "knowage.tls.main.name" -}}
{{ printf "%s-tls-%s" (include "knowage.fullname" .) "main" }}
{{- end }}

{{/*
Generate certificates for the AS
*/}}
{{- define "knowage.tls.main.cert" -}}
{{- $currTlsAs := lookup "v1" "Secret" .Release.Namespace ( include "knowage.tls.main.name" . ) -}}
{{- if $currTlsAs -}}
tls.crt: {{ index $currTlsAs.data "tls.crt" }}
tls.key: {{ index $currTlsAs.data "tls.key" }}
{{- else -}}
{{- $tlsAsAltNames := list ( printf "%s.%s" (include "knowage.service" .) .Release.Namespace ) ( printf "%s.%s.svc" (include "knowage.service" .) .Release.Namespace ) -}}
{{- $tlsAsCa := genCA (include "knowage.service" .) 365 -}}
{{- $tlsAsCert := genSignedCert ( include "knowage.service" . ) nil $tlsAsAltNames 365 $tlsAsCa -}}
tls.crt: {{ $tlsAsCert.Cert | b64enc }}
tls.key: {{ $tlsAsCert.Key | b64enc }}
{{- end -}}
{{- end -}}

{{/*
Create the name of the TLS certificate of the reverse proxy
*/}}
{{- define "knowage.tls.proxy.name" -}}
{{ printf "%s-tls-%s" (include "knowage.fullname" .) "proxy" }}
{{- end }}

{{/*
Generate certificates for reverse proxy
*/}}
{{- define "knowage.tls.proxy.cert" -}}
{{- $currTlsProxy := lookup "v1" "Secret" .Release.Namespace ( include "knowage.tls.proxy.name" . ) -}}
{{- if $currTlsProxy -}}
tls.crt: {{ index $currTlsProxy.data "tls.crt" }}
tls.key: {{ index $currTlsProxy.data "tls.key" }}
{{- else -}}
{{- $tlsProxyAltNames := list ( printf "%s.%s" (include "knowage.proxy.deployment" .) .Release.Namespace ) ( printf "%s.%s.svc" (include "knowage.proxy.deployment" .) .Release.Namespace ) -}}
{{- $tlsProxyCa := genCA (include "knowage.proxy.deployment" .) 365 -}}
{{- $tlsProxyCert := genSignedCert ( include "knowage.proxy.deployment" . ) nil $tlsProxyAltNames 365 $tlsProxyCa -}}
tls.crt: {{ $tlsProxyCert.Cert | b64enc }}
tls.key: {{ $tlsProxyCert.Key | b64enc }}
{{- end -}}
{{- end -}}

{{/*
Priority class
*/}}

{{/*
Primary services.
*/}}
{{- define "knowage.priorityclass.primary" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "primary" }}
{{- end }}

{{/*
Secondary services.
*/}}
{{- define "knowage.priorityclass.secondary" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "secondary" }}
{{- end }}

{{/*
Network policies.
*/}}

{{/*
Deny all.
*/}}
{{- define "knowage.networkpolicy.deny-all" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "deny-all" }}
{{- end }}

{{/*
For Python.
*/}}
{{- define "knowage.networkpolicy.python" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "python" }}
{{- end }}

{{/*
For R.
*/}}
{{- define "knowage.networkpolicy.r" -}}
{{ printf "%s-%s" (include "knowage.fullname" .) "r" }}
{{- end }}


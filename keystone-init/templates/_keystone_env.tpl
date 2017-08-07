{{- /* Generate a list of environment vars for Keystone Auth */}}
{{- define "keystone_env" -}}
- name: OS_AUTH_URL
{{- if eq (kindOf .url) "map" }}
  valueFrom:
    secretKeyRef:
      name: "{{ .url.secret_name }}"
      key: "{{ .url.secret_key | default "OS_AUTH_URL" }}"
{{- else }}
  value: "{{ .url }}"
{{- end }}
- name: OS_USERNAME
{{- if eq (kindOf .username) "map" }}
  valueFrom:
    secretKeyRef:
      name: "{{ .username.secret_name }}"
      key: "{{ .username.secret_key | default "OS_USERNAME" }}"
{{- else }}
  value: "{{ .username }}"
{{- end }}
- name: OS_PASSWORD
{{- if eq (kindOf .password) "map" }}
  valueFrom:
    secretKeyRef:
      name: "{{ .password.secret_name }}"
      key: "{{ .password.secret_key | default "OS_PASSWORD" }}"
{{- else }}
  value: "{{ .password }}"
{{- end }}
- name: OS_USER_DOMAIN_NAME
{{- if eq (kindOf .user_domain_name) "map" }}
  valueFrom:
    secretKeyRef:
      name: "{{ .user_domain_name.secret_name }}"
      key: "{{ .user_domain_name.secret_key | default "OS_USER_DOMAIN_NAME" }}"
{{- else }}
  value: "{{ .user_domain_name }}"
{{- end }}
- name: OS_PROJECT_NAME
{{- if eq (kindOf .project_name) "map" }}
  valueFrom:
    secretKeyRef:
      name: "{{ .project_name.secret_name }}"
      key: "{{ .project_name.secret_key | default "OS_PROJECT_NAME" }}"
{{- else }}
  value: "{{ .project_name }}"
{{- end }}
- name: OS_PROJECT_DOMAIN_NAME
{{- if eq (kindOf .project_domain_name) "map" }}
  valueFrom:
    secretKeyRef:
      name: "{{ .project_domain_name.secret_name }}"
      key: "{{ .project_domain_name.secret_key | default "OS_PROJECT_DOMAIN_NAME" }}"
{{- else }}
  value: "{{ .project_domain_name }}"
{{- end }}
{{- end -}}

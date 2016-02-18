#!jinja|yaml

{% from "linux/map.jinja" import linux_settings with context -%}
{% set sysctls = linux_settings.sysctls -%}
{% for s,v in sysctls.items() -%}
{{ s }}:
  sysctl.present:
    - value: {{ v }}
{% endfor %}

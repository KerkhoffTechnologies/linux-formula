#!jinja|yaml

{% from "linux/map.jinja" import linux_settings with context -%}
{% set modules = linux_settings.modules -%}
{% for m,v in modules.items() -%}
linux-module-{{ m }}-{{ v.ensure|default('present') }}:
  kmod:
    - {{ v.ensure|default('present') }}
    - name: {{ m }}
    - persist: {{ v.persist|default(False) }}
    {% if v.ensure == 'absent' and v.comment is defined -%}
    - comment: v.comment
    {% endif -%}
{% endfor %}

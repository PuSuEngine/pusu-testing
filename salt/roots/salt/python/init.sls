{% for pkg in pillar["pkgs"]["python"] %}
{{ pkg }}:
    pkg.installed
{% endfor %}

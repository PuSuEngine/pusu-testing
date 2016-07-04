{{ pillar["pkgs"]["golang"] }}:
  pkg.installed

{% if grains['os'] == 'Ubuntu' %}
/etc/profile.d/golang.sh:
  file.managed:
    - source: salt://golang/golang-ubuntu.sh
{% endif %}

{{ pillar["pkgs"]["supervisor"] }}:
  pkg:
    - installed
  service:
    - running

/etc/supervisor/conf.d/:
  file.directory:
    - makedirs: True
    - user: root
    - group: root

include:
  - golang
  - git

/etc/supervisor/conf.d/pusud.conf:
  file.managed:
    - source: salt://pusud/pusud.conf

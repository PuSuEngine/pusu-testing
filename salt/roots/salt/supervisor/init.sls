{{ pillar["pkgs"]["supervisor"] }}:
  pkg:
    - installed
  service:
    - running

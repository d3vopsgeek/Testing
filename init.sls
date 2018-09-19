{% from "map.jinja" import option with context %}

git:
  pkg.installed:
     - name: git

install-vim:
  pkg.installed:
     - name: {{ option.pkg }}

install-tree:
  pkg.installed:
     - name: tree

install-telnet:
  pkg.installed:
     - name: telnet






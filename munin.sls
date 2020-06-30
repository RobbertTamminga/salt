munin:
    pkg.installed:
        - name: munin-node
    
    file.managed:
        - name: /etc/munin/munin-node.conf
        - source: salt://munin-node.conf
        - replace: True
    
    service.running:
        - name: munin-node
        - enable: True
        - reload: True
        - pkg: munin-node
        
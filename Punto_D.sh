---
# tasks file for 2PRecuperatorio

 - name: "Rol: 2PRecuperatorio"
   debug:
     msg: "Inicio de tareas dentro del Rol: 2PRecuperatorio"

- name: "Crear directorios en /tmp/bianucci/"
  file:
    path: "/tmp/bianucci/{{ item }}"
    state: directory
    mode: '0775'
    recurse: yes
  with_items:
    - "alumno"
    - "equipo"

- name: "Agrego archivo desde template"
  template:
    src: datos_alumno.j2
    dest: /tmp/bianucci/datos_alumno.txt

- name: "Agrego archivo desde template"
  template:
    src: datos_equipo.j2
    dest: /tmp/bianucci/datos_equipo.txt


vim index.html
docker login -u juancruzbianucci
vim dockerfile
sudo vgextend vg_datos /dev/sde6
sudo lvextend -L +800M /dev/mapper/vg_datos-lv_docker
sudo resize2fs /dev/mapper/vg_datos-lv_docker

docker build -t juancruzbianucci/web2-bianucci:latest .
docker push juancruzbianucci/web2-bianucci:latest
sudo vim index.html
doc

docker build -t juancruzbianucci/web2-bianucci:latest .
docker push juancruzbianucci/web2-bianucci:latest


sudo fdisk /dev/sdc
n
e



n

+10M
n


t
6
8e
t
5
8e
wq

sudo fdisk /dev/sdd
n


+512M
t
82
n



t
8e
wq
sudo fdisk /dev/sde
n
e



n

+2G
n


t
6
8e
t
5
8e
wq

sudo pvcreate /dev/sdc5
sudo pvcreate /dev/sdc6
sudo pvcreate /dev/sdd2
sudo pvcreate /dev/sde5
sudo pvcreate /dev/sde6
sudo vgcreate vg_datos /dev/sdc5 /dev/sdc6 /dev/sdd2
sudo vgcreate vg_temp /dev/sde5
sudo lvcreate -L +5M vg_datos -n lv_docker
sudo lvcreate -l +100%FREE vg_datos -n lv_multimedia
sudo lvcreate -l +100%FREE vg_temp -n lv_swap
sudo mkfs.ext4 /dev/mapper/vg_datos-lv_docker
sudo mkfs.ext4 /dev/mapper/vg_datos-lv_multimedia
sudo mkswap /dev/mapper/vg_temp-lv_swap
sudo mkswap /dev/sdd1
sudo swapon /dev/mapper/vg_temp-lv_swap
sudo swapon /dev/sdd1
sudo mount /dev/mapper/vg_datos-lv_docker /var/lib/docker/
cd /
sudo mkdir multimedia
sudo mount /dev/mapper/vg_datos-lv_multimedia /multimedia/


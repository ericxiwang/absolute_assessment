# System authorization information
auth  --useshadow  --enablemd5
# System bootloader configuration
bootloader --location=mbr
# Partition clearing information
clearpart --all --initlabel
# Use text mode install
text
# Firewall configuration
firewall --disable
# Run the Setup Agent on first boot
firstboot --disable
# System keyboard
keyboard us
# System language
lang en_US
network  --bootproto=static --device=eth0 --gateway={{ gateway }} --hostname={{ hostname }} --ip={{ ip }} --nameserver=8.8.8.8 --netmask=255.255.255.0
# Reboot after installation
reboot
#Root password
rootpw password
# SELinux configuration
selinux --permissive
# System timezone
timezone  America/Vancouver
# Install OS instead of upgrade
install
# Clear the Master Boot Record
zerombr
clearpart --none --initlabel --drives=vda --all
part /boot --fstype="ext4" --ondisk=vda --size=250
part pv.01 --fstype="lvmpv" --ondisk=vda --size=1024 --grow
volgroup bicentos --pesize=4096 pv.01
logvol /  --fstype="ext4" --size=1024 --name=root --vgname=bicentos --grow
services --enabled=network,sshd/sendmail
%packages
@core
%end
%pre
%end
%post
/usr/sbin/groupadd -r eric --gid=1001
/usr/sbin/useradd -r -m -g eric --uid=1001 eric
/usr/sbin/usermod -aG wheel eric
mkdir --mode=700 /home/eric/.ssh
cat >> /home/eric/.ssh/authorized_keys << "PUBLIC_KEY"
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCx1eaHdI+9LL5xC1sggg6QzOJk1H5rnNESoDy8yXozC3Pre1xgWNDb4l8/P9WuuopcAtGwMnZ4WJ4Jpvz0ePAqNKP9LDBKqbkl4Ae4K8c9OR8UWkM5OUUIiRaA8PX7DUVpr20dKhzkwoCXyd44oGPQ1yPz3FQAGY6oT1RWBZjYYSI0DZ9Bfbm6jhUZxkPa1nLF47+E2qfj/MIfT1wdlKBBssfnM8mSD5ggsk8C4KCxTE6yPPVw6EhP0dnMqETejCXY/+gj5Vukr1gdxgWU/Jb+XeNGwRnqJRJ5KZo9EXlb7doi3U0F/ck1t4HRhAkilFIfnmGWeMugrwYmDLs5facd eric.wang@gmail.com
PUBLIC_KEY
chmod 600 /home/eric/.ssh/authorized_keys
chown -R eric:eric /home/eric/.ssh/
echo 'PermitRootLogin no' >> /etc/ssh/sshd_config
echo 'UseDNS no' >> /etc/ssh/sshd_config
echo '%wheel  ALL=(ALL)       NOPASSWD: ALL' >> /etc/sudoers.d/eric
/usr/bin/yum -y update
%end

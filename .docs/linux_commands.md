# Commands for working in Linux

## User and Groups

Adding a user, create home dir (-m), and add to group (-g)
```
useradd -g sudo -m newuser
```

### ssh access

Add the publudc key to the authorized keys file to access via ssh

```
cat id_rsa.pub >> ~/.ssh/authorized_keys
```

## If you want to create an admin non-root user

edit the sudoer file 

```
sudo visudo

user_name ALL=(ALL) NOPASSWD:ALL
```

### If you need to build things

Install development tools

```
sudo apt install build-essential
```

## Pretty print your PATH

```
echo -e ${PATH//:/\\n}
```

## Exploring and modifying storage

My favoirt source of information on how to do this kind of stuff is in the
ArchLinux docs [SOURCE NEEDED]

See storage devices
```
lsblk
```

Get a detailed summary of each drive
```
fdisk -l
```

Modify a disk partition

```
fdisk /dev/sda
```

Remember
- g = new (GBT) partion table
- n = new partion 

#!/bin/bash

set_partitions(){
# Variables
DISK_DEVICE="/dev/sda"                  # Replace with your DISK_DEVICE
PARTITION_ROOT_SIZE="+4G"               # Size of the root partition    keep the + simbol
PARTITION_HOME_SIZE="+4G"               # Size of the home partition   keep the + simbol
PARTITION_BOOT_SIZE="+1G"               # Size of the boot partition   keep the + simbol
ROOT_PARTITION_NUMBER="1"
HOME_PARTITION_NUMBER="2"
BOOT_PARTITION_NUMBER="3"
FS_TYPE="ext4"

# Create the partitions
echo "Creating partitions"

echo -e "n\np\n$ROOT_PARTITION_NUMBER\n\n$PARTITION_ROOT_SIZE\nn\np\n$HOME_PARTITION_NUMBER\n\n$PARTITION_HOME_SIZE\nn\np\n$BOOT_PARTITION_NUMBER\n\n$PARTITION_BOOT_SIZE\nw" | fdisk $DISK_DEVICE

# Format the partitions
mkfs.$FS_TYPE ${DISK_DEVICE}${ROOT_PARTITION_NUMBER}
mkfs.$FS_TYPE ${DISK_DEVICE}${HOME_PARTITION_NUMBER}
mkfs.vfat ${DISK_DEVICE}${BOOT_PARTITION_NUMBER}          # Boot partition is often formatted as FAT32

echo "Partitions created and formatted:"
echo "  - Root partition: ${DISK_DEVICE}${ROOT_PARTITION_NUMBER} with size $PARTITION_ROOT_SIZE"
echo "  - Home partition: ${DISK_DEVICE}${HOME_PARTITION_NUMBER} with size $PARTITION_HOME_SIZE"
echo "  - Boot partition: ${DISK_DEVICE}${BOOT_PARTITION_NUMBER} with size $PARTITION_BOOT_SIZE"
sleep 2

clear

echo "Partition table:"
lsblk $DISK_DEVICE
}


exit 0
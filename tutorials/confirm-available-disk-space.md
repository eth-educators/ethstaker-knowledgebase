# Confirm Available Disk Space

Even if you have a large SSD there are cases where Ubuntu is reporting only 200GB free.

There are cases where Ubuntu is provisioning only 200GB of a larger SSD causing users to run out of disk space when syncing their node.

The error message is similar to:

`Fatal: Failed to register the Ethereum service: write /var/lib/goethereum/geth/chaindata/383234.ldb: no space left on device`

To address this issue, assuming you have an SSD that is larger than 200GB, expand the space allocation for the LVM by following these steps:

```
sudo lvdisplay # <-- Check your logical volume size

sudo lvm 
lvextend -l +100%FREE /dev/ubuntu-vg/ubuntu-lv
lvextend -l +100%FREE -r /dev/ubuntu-vg/ubuntu-lv
exit

sudo resize2fs /dev/ubuntu-vg/ubuntu-lv
df -h # <-- Check results
```

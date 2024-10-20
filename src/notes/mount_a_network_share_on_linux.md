# How To Mount A Network Share On Linux

Using the `mount(1)` command:
```
$ sudo mkdir /mnt/network
$ sudo mount -t cifs -o vers=1.0,user=jfox //192.168.1.1/usb2_sda1 /mnt/network
```

You will be prompted for your password.

You can also pass the option `creds=<path_to_creds>` where the creds file is:
```
username=jfox
password=<password>
```

Just make sure to do `chmod 400 <creds>` to make it read-only and secure.

[Source](https://www.linode.com/docs/guides/linux-mount-smb-share/)

# How To Safely And Efficiently Backup Large Files

You want to back up a large amount of data, (e.g. to a network share) and you want to only copy things if the source file has changed.

Use [`rsync(1)`](https://www.samba.org/ftp/rsync/rsync.html), e.g.:
```shell
# -c: --checksum (for checking if destination files have changed)
# -r: --recursive
# -z: --compress
# -b: --backup
# -v: --verbose
$ rsync -crzbv ~/Data /mnt/network/
```

Or, if you want to save multiple backup versions:
```shell
$ rsync -crzv --backup-dir=/mnt/network/ --suffix="_$(date -I)" ~/Data /mnt/network
```

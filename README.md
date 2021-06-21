# artzip
A script for splitting files and encrypt them separately, and then combine them into one encrypted file

## Basic syntax:
```
artzip --create FILE KEY/KEYFILE SED_DICT
artzip --extract FILE.az KEY/KEYFILE SED_DICT random_keys
```

## Scheme of work:
File clangd is 5 MB size \
\
We split this file into chunks one megabyte at a time \
\
Set the encryption key, for example 123 \
\
We take the sed's dictionary\
\
Replace \
1 on X \
2 on Y \
3 on Z \
\
Using XYZ as the current key \
\
We encrypt each piece with "**KEY + RANDOM**" \
\
We randomly encrypt for each piece using the old 123 key, convert it to base64 and save it to the random\_keys file \
\
Combine all chunks into one file wih `cat >>`

## Needed binaries:
```
head
tail
grep
sed
openssl
bash
zip
unzip
split
tr
du
```

#!/usr/bin/env python

from base64 import b85decode

file = open('pip.txt', 'rb')
text = file.read()

with open('pip.zip', "wb") as fp:
    fp.write(b85decode(text.replace(b"\n", b"")))
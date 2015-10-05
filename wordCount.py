#!/usr/bin/env python

import fileinput

for line in fileinput.input():
    words = line.strip().split(' ')
    for word in words:
        if '<' not in word and '>' not in word:
            print word

import math
import re
from itertools import zip_longest

def encode(plaintext):
  if (plaintext == ''):
    return ''
  plaintext = re.sub(r'[^a-z0-9]', "", plaintext.lower())
  size = math.ceil(math.sqrt(len(plaintext)))
  return ' '.join([''.join(s) for s in transpose(chunk(plaintext, size))])

def transpose(a):
  max_len = max(len(i) for i in a)
  return [[i[o] if len(i) > o else '' for i in a] for o in range(max_len)]

def chunk(text, size):
  return [text[i:i+size] for i in range(0, len(text), size)]

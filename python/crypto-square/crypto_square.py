import math
import re

def encode(plaintext):
  if (plaintext == ''):
    return ''
  pt = re.sub(r'[^a-z0-9]', "", plaintext.lower())
  n = math.ceil(math.sqrt(len(pt)))
  at = chunk(pt, n)
  print(at)
  tt = list(zip(*at))
  print(tt)
  st = [''.join(ss) for ss in tt]
  print(st)
  return ' '.join(st)

def chunk(text, size):
  return [text[i:i+size] for i in range(0, len(text), size)]

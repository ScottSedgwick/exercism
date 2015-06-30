SUBLIST   = 0
SUPERLIST = 1
EQUAL     = 2
UNEQUAL   = 3

def contains(lst, sublst):
    n = len(sublst)
    return any((sublst == lst[i:i+n]) for i in range(len(lst)-n+1))

def check_lists(l1, l2):
  if (l1 == l2):
    return EQUAL
  if (contains(l1, l2)):
    return SUPERLIST
  if (contains(l2, l1)):
    return SUBLIST
  return UNEQUAL

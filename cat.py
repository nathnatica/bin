#!/usr/bin/python

from __future__ import print_function
import sys
from optparse import OptionParser

class CatCommand:
  def __init__(self):
    self.count = 1
  
  def run(self, i, options):
    #set default options
    e = ""

    for line in i:
      #modify printed line according to options
      if options.showend:
        line = line.rstrip()
        e = "$\n"

      if options.shownum:
        line = "{0} {1}".format(self.count, line)
        e = ""

      self.count += 1
      print(line, end=e)


def main():
  #set up options
  usage = "Usage: %prog [OPTION]...[FILE]..."
  parser = OptionParser(usage=usage)
  parser.add_option("-E", dest="showend", action="store_true", help="Show $ at line endings")
  parser.add_option("-n", dest="shownum", action="store_true", help="Show line numbers")
  (options, args) = parser.parse_args()  

  c = CatCommand()

  if len(args) > 1:
    for a in args:
      f = open(a, "r")
      c.run(f, options)

  else:
    c.run(sys.stdin, options)

if __name__ == "__main__":
  main()

#!/usr/bin/env groovy
//padding file names with left zeroes
//	ex) aaa1.txt -> aaa00001.txt
//argv 0 - directory with target files

import static groovy.io.FileType.FILES

if (!args) {
  println "needs target directory path"
  return
}

def dir = new File(args[0])
dir.eachFileRecurse(FILES) {
  before = it.name
  temp = before.replaceAll("%20","")
  def matcher = temp =~ "([0-9]+)"
  target = matcher[0][1]
  replace = target.padLeft(5, "0")
  after = before.replaceFirst(target, replace)
  "mv ${before} ${after}".execute(null, dir)
}

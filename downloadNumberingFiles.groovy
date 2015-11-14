#!/usr/bin/env groovy
// argv 0 - sample file url(with trailing numbering format)
// 	ex) http://.....xxx005.txt
//argv 1 - max loop count(last trailing number of file)
//argv 2 - save directory name

if (args.size() != 3) {
  println "argument size is not 3"
  return
}

file = args[0]
maxSize = args[1]
targetDirectory  = args[2]

workingDir = new File(targetDirectory)
workingDir.mkdir()

start = file.lastIndexOf('/')
last = file.lastIndexOf('.')
target = file[start..last]
name = target.replaceAll("%20","")


def matcher = name =~ "[^/]([0-9]{2,4}).{0,10}\\."
numbers = matcher[0][1]
iMaxSize = maxSize as int


for (i in 0..iMaxSize) {
  replace = (""+i).padLeft(numbers.size(), "0")
  longName = file[start..last]
  replace = longName.replaceFirst(numbers, replace)
  nFile = file.replaceFirst(longName, replace)
  println nFile
  "curl -O $nFile".execute(null, workingDir).waitFor()
}


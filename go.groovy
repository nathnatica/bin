#!/usr/bin/env groovy
//ex1)go [jp|uk|us] [fsc|bsc] [02020(screen id)]	<< opens screen definition excel(front/admin)
//ex2)go [jp|uk|us] table	<< opens table definition excel
//ex3)go [jp|uk|us] code		<< opens code definition excel

import static groovy.io.FileType.FILES
import GoConstants

if (!args) {
  println "needs args"
  println "ex1)go [jp|uk|us] [fsc|bsc] [02020(screen id)]"
  println "ex2)go [jp|uk|us] table"
  println "ex3)go [jp|uk|us] code"
  return
}

def baseMap = [ jp:GoConstants.baseJP, uk:GoConstants.baseUK, us:GoConstants.baseUS ]

def path = baseMap[args[0]]
if (!path) {
  println "no base for ${args[0]}"
  return
}

def check1 = args[1]
def check2

if (check1) {
	if (check1.equals("fsc")) {
		path = path + GoConstants.midPathToFrontScreen 
		check2 = args[2]
	} else if (check1.equals("bsc")) {
		path = path + GoConstants.midPathToFrontAdmin 
		check2 = args[2]
	} else if (check1.equals("table")) {
		path = path + GoConstants.midPathTable 
		check1 = GoConstants.tableDefFileNamePart
		check2 = GoConstants.tableDefFileNamePart
	} else if (check1.equals("code")) {
		path = path + GoConstants.midPathToCode 
		check1 = GoConstants.codeDefFileNamePart
		check2 = GoConstants.codeDefFileNamePart
	} else {
	  println "no path for ${args[1]}"
	  return
	}
} else {
  println "needs args[1]"
  return
}


def found = false
def searchPath = new File(path)
searchPath.eachFileRecurse(FILES) {
	if (!found && it.name.toLowerCase().contains(check1) && (it.name.endsWith("xls") || it.name.endsWith("xlsx")) && it.name.replaceAll('-','').contains(check2)) {
		found = true
		println it.name
		def input
		System.in.withReader {
			println "> open? [y/n]"
			input = it.readLine()
		}
		if (input.equals("y")) {
			"explorer ${it}".execute(null, searchPath)
		}
		return
	}
}



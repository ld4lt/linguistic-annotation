# python 3
# read required-features.md, write required-features-tab.md

import re

# inference rules*
# NIF 2.1 <= NIF (* use if undefined)
# NIF 2.0 <= NIF
# POWLA <= LAF
# MAF, SemAF, SynAF <= LAF; if LAF=(-) or LAF=-

# clear:
# NIF
def autocomplete(keys,dict):
	for k in keys:
		if not k in dict:
			print(k,dict)
			if k in [ "NIF 2.0", "NIF 2.1" ] :
				if "NIF" in dict:
					dict[k]=dict["NIF"]
			if k in ["POWLA"]:
				if "LAF" in dict:
					dict[k]=dict["LAF"]
			if k in ["MAF","SynAF","SemAF"]:
				if "LAF" in dict and not "+" in dict["LAF"]:
					dict[k]=dict["LAF"]
				# MAF etc. are LAF sub-vocabularies
	if "NIF" in dict:
		dict.pop("NIF")
	return dict

def spellout(feat, keys,dict,output):
	print(feat)
	print(dict)
	dict=autocomplete(keys,dict)
	print(dict)
	print()
	if(len(dict)>0):
		output.write("| "+feat+" |")
		for k in keys:
			if k in dict:
				output.write(" "+dict.get(k)+" |")
			else:
				output.write("   |")
		output.write("\n")

feat=""
keys=["Web Annotation", "NIF", "NIF 2.0" ,"NIF 2.1","CoNLL-RDF","Ligt","ISO and derivatives", "POWLA","LAF","MAF","SynAF","SemAF"]
vals=["+","-","(+)", "(-)"]
dict={} # current key-value pairs

with open("required-features-tab.md","w") as output:
	output.write("| feats |")
	for k in keys:
		output.write(" "+k+" |")
	output.write("\n|---|")
	for k in keys:
		output.write("---|")
	output.write("\n")
	with open("required-features.md","r") as input:
		line=input.readline()
		while(line):
			line=line.strip()
			if(line.startswith("###")):
				spellout(feat,keys,dict,output)
				dict={}
				feat=re.sub(r"^[#]+\s","",line)
			else:
				for v in vals:
					if ": `"+v+"`" in line:
						for k in keys:						
							if line.startswith(k+": `"+v+"`") or re.match(r"^.*"+k+":\s*`["+v+"]+`.*",line):
								dict[k]=v;
						k=re.sub(r"^([^:]+):.*",r"\1",line).strip()
						if(not k in keys):
							print("warning: unknown key \""+k+"\" in",line)
			line=input.readline()

	if len(dict)>0:
		spellout(feat,keys,dict,output)
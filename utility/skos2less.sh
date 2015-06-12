#!/usr/bin/env bash
array=( sv  sl  sk  ro  pl  pt  nl  pl  mt  lv  it  lt  hu  it  hu  fr  fi  et  es  el  de  bg  da  cs  bg )
for i in "${array[@]}"
do
  java -classpath saxon-9.1.0.8b-patch.jar \
       net.sf.saxon.Transform -s:null.xml -xsl:skos2less.xsl -o:../less/lang-$i.less lang=$i
done

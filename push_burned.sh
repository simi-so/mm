#!/bin/bash

# Erstellt von allen *.puml Diagrammdefinitionen in ../diagrams die SVG-Grafiken in ../doc/dia

export LANG=de_CH.UTF-8

rm puml_output/*

FILES=puml/src/*
for f in $FILES
do
  echo "****************** Processing $f ***********************************************************"
  
  name_suffix=$(echo $f | cut -d/ -f3) # split filepath with delimiter /, and pick 3rd element of result array
  name=$(echo $name_suffix | cut -d. -f1) # split filename with delimiter ., and pick first element of result array
  out=puml_output/${name}.png

  cat $f | docker run --rm -i puml_burner > $out
done

git add puml_output/*
git commit -m 'Skript: PUML-Diagramme regeneriert und beigefügt'
git push
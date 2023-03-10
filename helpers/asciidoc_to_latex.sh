#!/usr/bin/env bash

# rvm use ruby-3
# asciidoctor --version
# Asciidoctor 2.0.18

for i in ./manuscript/asciidoc/ch-*.adoc
do
  echo "=== $i ==="
  out_dir=./manuscript/tex
  name=$(basename --suffix=.adoc "$i").tex
  asciidoctor --backend docbook5 --out-file - "$i" | pandoc -f docbook -t latex --wrap=none -o "$out_dir/$name"
done

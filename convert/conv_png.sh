#!/bin/bash

mkdir new;
  echo "Start convert png to jpg."; 
  for f in *.png; 
    do
      echo "Converting file $f";
      convert "$f" "new/${f%.jpg}.jpg";
      echo "Converting file $f png complete";
    done;
  echo "Converting png to jpg complete.";
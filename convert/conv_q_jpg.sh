#!/bin/bash

mkdir new;
  echo "Start convert."; 
  for f in *.jpg; 
    do
      echo "Converting file $f";
      convert "$f" -quality 75 "new/${f%.jpg}.jpg";
      echo "Converting file $f complete";
    done;
  echo "Converting complete.";
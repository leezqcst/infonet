#!/bin/bash
for lstm_size in 50 100 200
do
  for crf_type in none simple linear simple_bilinear
  do
    for dropout in 0.25 0.5
    do
      for learning_rate in .01 .001
      do
        for embedding_size in 50 100 200
        do
          (( i++ ))
          echo "========================================================="
          echo "Experiment" $i ":"\
          python -u ace_segmentation.py -n 1000 -b 400 \
          --lstm_size $lstm_size\
          --crf_type $crf_type\
          --dropout $dropout\
          --learning_rate $learning_rate\
          --embedding_size $embedding_size
          echo "========================================================="

          # run it
          python -u ace_segmentation.py -n 1000 -b 400 \
          --lstm_size $lstm_size\
          --crf_type $crf_type\
          --dropout $dropout\
          --learning_rate $learning_rate\
          --embedding_size $embedding_size
        done
      done
    done
  done
done

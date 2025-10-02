#!/bin/bash

OUTPUT="transcript.txt"
> "$OUTPUT"

for i in {1..5}; do
  echo "===== Example $i =====" | tee -a "$OUTPUT"

  echo "\$ cat test/test${i}.snek" | tee -a "$OUTPUT"
  cat "test/test${i}.snek" | tee -a "$OUTPUT"
  echo | tee -a "$OUTPUT"

  echo "\$ make test/test${i}.run" | tee -a "$OUTPUT"
  make "test/test${i}.run" 2>&1 | tee -a "$OUTPUT"
  echo | tee -a "$OUTPUT"

  echo "\$ cat test/test${i}.s" | tee -a "$OUTPUT"
  cat "test/test${i}.s" | tee -a "$OUTPUT"
  echo | tee -a "$OUTPUT"

  echo "\$ ./test/test${i}.run" | tee -a "$OUTPUT"
  ./test/test${i}.run | tee -a "$OUTPUT"

  rm "test/test${i}.run"
  rm "test/test${i}.s"
  echo | tee -a "$OUTPUT"
done

echo "Transcript written to $OUTPUT"

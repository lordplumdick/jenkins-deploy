#!/bin/bash
ls -la
if [ $? -eq 0 ]
then
  echo "The script ran ok"
  exit 0
else
  echo "The script failed" >&2
  exit 1
fi
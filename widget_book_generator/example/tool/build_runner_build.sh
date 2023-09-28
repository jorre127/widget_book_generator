#!/bin/bash

CURRENT=`pwd`
DIR_NAME=`basename "$CURRENT"`
if [ $DIR_NAME == 'tool' ]
then
  cd ..
fi

dart run build_runner build --delete-conflicting-outputs
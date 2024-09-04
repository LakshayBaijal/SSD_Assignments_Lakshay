#!/bin/bash

mkdir -p temp_activity

touch temp_activity/temp{1..50}.sh

cd temp_activity

rename 's/\.sh$/.txt/' temp{1..25}.sh

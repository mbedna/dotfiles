#!/bin/bash
. env.sh
java -cp $cl_path org.javasoft.Compiler "$@" 

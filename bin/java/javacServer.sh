#!/bin/bash
# If using relative paths then start javacServer in project directory
. env.sh
java -cp $cl_path org.javasoft.CompilerServer "$@"

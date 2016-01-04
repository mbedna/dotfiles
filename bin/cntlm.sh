#!/bin/bash
export http_proxy=http://localhost:3128/
export https_proxy=http://localhost:3128/
export HTTP_PROXY=http://localhost:3128/
export HTTPS_PROXY=http://localhost:3128/
CNTLM_DIR=/cygdrive/c/programs/cntlm
$CNTLM_DIR/cntlm -c $CNTLM_DIR/cntlm.ini & 

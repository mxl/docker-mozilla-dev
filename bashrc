#!/usr/bin/env bash

source /root/.cargo/env

REPO_NAME=comm-central
REPO="http://hg.mozilla.org/$REPO_NAME"
REPO_DIR="$SRC_DIR/$REPO_NAME"
CHECKOUT='python client.py checkout'
MOZCONFIG="$REPO_DIR/mozconfig"
MOZCONFIG_CLEAR="rm -f $MOZCONFIG"
ENABLE_MAIL="echo 'ac_add_options --enable-application=mail' >> $MOZCONFIG"
ENABLE_DEBUG="echo 'ac_add_options --enable-debug' >> $MOZCONFIG"

alias src-clone="hg clone $REPO $REPO_DIR && cd $REPO_DIR && $CHECKOUT"
alias src-update="cd $REPO_DIR && $CHECKOUT"
alias build-mail="$MOZCONFIG_CLEAR && $ENABLE_MAIL && cd $REPO_DIR && ./mozilla/mach build"
alias build-mail-debug="$MOZCONFIG_CLEAR && $ENABLE_MAIL && $ENABLE_DEBUG && cd $REPO_DIR && SHELL=/bin/bash ./mozilla/mach build"


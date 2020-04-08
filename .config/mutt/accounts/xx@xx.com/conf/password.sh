#!/bin/bash
gpg --no-tty -q -d ${BASH_SOURCE%/*}/password.gpg


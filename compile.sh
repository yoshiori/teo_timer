#!/bin/sh
fswatch *.coffee | xargs -n 1 coffee -c

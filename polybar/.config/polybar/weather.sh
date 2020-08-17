#!/bin/bash

base_url="wttr.in/?"
format="format=%C"

w=$(curl -s $base_url$format)

echo "   ${w}  "

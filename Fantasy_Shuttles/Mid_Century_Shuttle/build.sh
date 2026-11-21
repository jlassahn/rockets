#!/bin/sh

openscad="$HOME/apps/OpenSCAD.app/Contents/MacOS/OpenSCAD make_parts.scad"

set -x
mkdir -p build
$openscad -o build/pod.stl -D 'part="pod"'
$openscad -o build/orbiter_nose.stl -D 'part="orbiter_nose"'
$openscad -o build/orbiter_tail.stl -D 'part="orbiter_tail"'
$openscad -o build/booster_nose.stl -D 'part="booster_nose"'
$openscad -o build/booster_tail.stl -D 'part="booster_tail"'


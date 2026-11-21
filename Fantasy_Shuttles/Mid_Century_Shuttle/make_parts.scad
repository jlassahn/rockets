$fa = 1;
$fs = 0.5;
$fn = 0;

part = "";

use <Printed_Parts.scad>

if (part == "pod") pod();
if (part == "orbiter_nose") orbiter_nose();
if (part == "orbiter_tail") orbiter_tail();
if (part == "booster_nose") booster_nose();
if (part == "booster_tail") booster_tail();

// TODO orbiter mount

#!/bin/bash

cd src/
make
cd ..

# 1) run SPA
./spa Prades_qi.config

# 2) plot output
R --vanilla --slave --args "figures/qi/" FALSE FALSE "qi" <./plot.R

# argument 5: output figure directory
# argument 6: SDE?
# argument 7: plot parameter correlations (time consuming)?
# argument 8: defoliated or nondefoliated?


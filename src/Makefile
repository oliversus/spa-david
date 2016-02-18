###############################

###### Compiler choice #####
#
# to use the gnu compiler..
#
FC = gfortran
#for normal...
#FCFLAGS = -cpp -ffree-line-length-none 
#for debugging...
FCFLAGS = -cpp -fbounds-check -fimplicit-none -ffree-line-length-none -frange-check -ftree-vectorizer-verbose=0 -ggdb -O0 -Wall -std=gnu -pedantic
#for profiling...
#FCFLAGS = -cpp -p -g -ffree-line-length-none 

# to use the intel compiler...
#FC = ifort
#for normal......
#FCFLAGS = -fpp -vec-report=0 
#for debugging...FCFLAGS = -fpp -check all -debug-parameters all -ftrapuv -g -fpe0 -implicitnone -O0 -p -stand f03 -traceback -vec-report=0 
#for profiling...FCFLAGS = -fpp -p -g 
#
##############################

spa_SOURCES = enkf.f90  enkf_declarations.f90  all_declarations.f90  allocate_carbon.f90  canopy.f90  config_tools.f90 \
              leaf.f90  light.f90  log_tools.f90  main.f90  math_tools.f90  \
              scale_declarations.f90  soil_air.f90  soil_functions.f90  spa_cmd_line.f90 spa_config.f90  \
              spa_initialise.f90  spa_io.f90  spa_io_csv.f90 

spa:	$(spa_SOURCES:%.f90=%.o)
	$(FC) -o $@ $^
	mv spa ../

clean:
	rm -f *.mod *.o ../spa make_dep

%.o:	%.f90
	$(FC) $(FCFLAGS) -c $< -o $@

Makefile:	make_dep

make_dep:	$(spa_SOURCES)
		./f90_dependencies.py $^ > $@

-include make_dep

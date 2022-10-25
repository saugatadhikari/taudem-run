# Pit Removal
mpiexec --hostfile hostfile -np 3 pitremove DEM_Region_Largest.tif

# D8-flow direction
mpiexec --hostfile hostfile -n 7 d8flowdir -p src_dir_Region_Largest.tif -sd8 Region_Largestsd8.tif -fel DEM_Region_Largestfel.tif

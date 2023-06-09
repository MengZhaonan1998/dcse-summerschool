#!/bin/bash
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=48
#SBATCH --exclusive
#SBATCH --time=00:10:00
#SBATCH --mem-per-cpu=3GB

#SBATCH --account=education-eemcs-courses-summerschool2023
#SBATCH --reservation=summerschool2023
#SBATCH --partition=compute


source env.sh
module li

cd build
matrix=$1

likwid-topology


echo "############ Running without LIKWID ################"
export OMP_NUM_THREADS=${SLURM_CPUS_PER_TASK}
export OMP_PLACES=cores
export OMP_PROC_BIND=close
./spmv_driver.x --matrixFilename="${matrix}"

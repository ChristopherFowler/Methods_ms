#!/bin/bash

#SBATCH -o /lustre/red/vendor-nvidia/mhill2/LBPM/Methods_ms/Blender_PM/lbpm-%j.out
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --gpu-bind=per_task:1
#SBATCH --gpus=a100:8
#SBATCH --mem=1TB
#SBATCH -t 04:00:00
#SBATCH --account=vendor-nvidia
#SBATCH --qos=vendor-nvidia
#SBATCH --partition=gpu
#SBATCH --mail-type=none

date 
hostname
ulimit -a
##env

pwd
cd /lustre/red/vendor-nvidia/mhill2/LBPM/Methods_ms/Blender_PM/BCC

# NEW
module load cuda/11.0.207 gcc/9.3.0 openmpi/4.0.5 valgrind/3.15.0


# OLD
#module load cuda/10.0.130 gcc/7.3.0 openmpi/3.0.5

module load hdf5/1.8.20

export HPC_SILO_INC=/lustre/red/vendor-nvidia/mhill2/build_Silo/include
export HPC_SILO_LIB=/lustre/red/vendor-nvidia/mhill2/build_Silo/lib


module load cmake/3.19.1 doxygen/1.8.3.1
module list

nvidia-smi
echo "avalible cuda devices: "$CUDA_VISIBLE_DEVICES
export CUDA_VISIBLE_DEVICES="0"
echo "selected cuda devices: "$CUDA_VISIBLE_DEVICES
##export HDF5_DISABLE_VERSION_CHECK="1"
export UCX_NET_DEVICES=mlx5_0:1,mlx5_1:1,mlx5_2:1,mlx5_3:1,mlx5_6:1,mlx5_7:1,mlx5_8:1,mlx5_9:1
##export UCX_NET_DEVICES=mlx5_0:1,mlx5_1:1,mlx5_2:1,mlx5_3:1
##export UCX_NET_DEVICES=mlx5_0:1,mlx5_1:1

export UCX_MEMTYPE_CACHE=n
export UCX_TLS=rc,rdmacm,cuda_copy

## UCX_LOG_LEVEL=DEBUG
#
## export NCCL_DEBUG=INFO
# get verion info 
## ucx_info -d

# kick LBPM
### 
srun --mpi=pmix_v3 /lustre/red/vendor-nvidia/mhill2/LBPM/LBPM-UNC-2/sample_scripts/bin/Blender_to_LBM unit_test_1.db
##srun --mpi=pmix_v3 --distribution=block -mca pml ucx --mca btl ^vader,tcp,openib,uct  ./lbpm_random_force_simulator serial.db

srun --mpi=pmix_v3 /lustre/red/vendor-nvidia/mhill2/LBPM/LBPM-UNC-2/sample_scripts/bin/lbpm_random_force_simulator unit_test_1.db

#srun --mpi=pmix_v3  valgrind --leak-check=full ./lbpm_random_force_simulator serial.db
exit 0

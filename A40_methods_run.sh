
#Test {
#    // test_dir ="/Users/cpf/Desktop/build-6-2/Testing/"
#    test_dir ="./"
#    unit_test = 1 // Will print out specific files for analysis
#    // 0 -- default; does not produce print files
#    // 1 BCC case, force-driven 1e-4 -- make sure to turn off two-phase functionality -- test against analytical permeability
#    // 2 Parallel plates, Poiseuille flow - force-driven -- can test against analytical profile; with offset walls
#    // 3 Parallel plates, Poiseuille flow - pressure-driven -- can test against analytical profile; with offest walls
#    // 4 Bubble test, force-driven or no-forcing -- useful to test averaging theorems and agreement of geometry quantities
#    // 5 Parallel plates, capillary bridge -- no-forcing -- can test against analytical profile; with offest walls
#    // 6 Inclined parallel plates, capillary bridge -- no forcing -- can test against analytical profile; vary the inclination
#    // 7 Ink bottle; drainage and imbibition processes; compare to known analytical solutions
#    // 8 Bubble on Plate
#    // 9 nw Bubble on Solid Sphere
#    // 10 nw Bubble Adjacent to Solid Sphere
#
#    // 11 weak scaling - MLUP
#    // 12 strong scaling
#    // 13 kernel characterization
#    // 14 communication characterization  -- This architecture is why NCCL should support multiple streams
#    // 15 cf Summit performance w/ HPG performance w/ theoretical performance <<<<<<<
#    // 16 (optional) project performance onto Grace-Hopper w/ theoretical performance
#}


start=$(date +%s)
echo "Beginning methods ms test cases"
echo "BCC:"
cd /lustre/red/vendor-nvidia/mhill2/LBPM/Methods_ms/Blender_PM/BCC
pwd
cp /lustre/red/vendor-nvidia/mhill2/LBPM/Methods_ms/input_databases/unit_test_1.db .
cp /lustre/red/vendor-nvidia/mhill2/LBPM/Methods_ms/slurm_scripts/lbpm-ut1.sbatch .
jid=$(sbatch lbpm-ut1.sbatch | cut -d ' ' -f4)
jstate="initial state"
echo $jid
while [ $jid ]; do
   echo "waiting for 120s slurm job:"$jid
   sleep 120
   jstate=$(sacct -j $jid -n -o JobID)
   if [[ -n $jstate ]]; then
      jid=""
   fi
done


echo "ink_bottle30:"
cd /lustre/red/vendor-nvidia/mhill2/LBPM/Methods_ms/Blender_PM/ink_bottle30  
pwd
cp /lustre/red/vendor-nvidia/mhill2/LBPM/Methods_ms/input_databases/unit_test_7a.db .
cp /lustre/red/vendor-nvidia/mhill2/LBPM/Methods_ms/slurm_scripts/lbpm-ut7a.sbatch .
jid=$(sbatch lbpm-ut7a.sbatch | cut -d ' ' -f4)
jstate="initial state"
echo $jid
while [ $jid ]; do
   echo "waiting for 120s slurm job:"$jid
   sleep 120
   jstate=$(sacct -j $jid -n -o JobID)
   if [[ -n $jstate ]]; then
      jid=""
   fi
done

#
#echo "ink_bottle60:"
#cd /lustre/red/vendor-nvidia/mhill2/LBPM/Methods_ms/Blender_PM/ink_bottle60  
#pwd
#cp /lustre/red/vendor-nvidia/mhill2/LBPM/Methods_ms/input_databases/unit_test_7b.db .
#cp /lustre/red/vendor-nvidia/mhill2/LBPM/Methods_ms/slurm_scripts/lbpm-ut7b.sbatch .
#jid=$(sbatch lbpm-ut7b.sbatch | cut -d ' ' -f4)
#jstate="initial state"
#echo $jid
#while [ $jid ]; do
#   echo "waiting for 120s slurm job:"$jid
#   sleep 120
#   jstate=$(sacct -j $jid -n -o JobID)
#   if [[ -n $jstate ]]; then
#      jid=""
#   fi
#done
#
#
#echo "pressurepp:"
#cd /lustre/red/vendor-nvidia/mhill2/LBPM/Methods_ms/Blender_PM/pressurepp  
#pwd
#cp /lustre/red/vendor-nvidia/mhill2/LBPM/Methods_ms/input_databases/unit_test_3.db .
#cp /lustre/red/vendor-nvidia/mhill2/LBPM/Methods_ms/slurm_scripts/lbpm-ut3.sbatch .
#jid=$(sbatch lbpm-ut3.sbatch | cut -d ' ' -f4)
#jstate="initial state"
#echo $jid
#while [ $jid ]; do
#   echo "waiting for 120s slurm job:"$jid
#   sleep 120
#   jstate=$(sacct -j $jid -n -o JobID)
#   if [[ -n $jstate ]]; then
#      jid=""
#   fi
#done
#
#
#echo "slant0/offset0:"
#cd /lustre/red/vendor-nvidia/mhill2/LBPM/Methods_ms/Blender_PM/slant0/offset0  
#pwd
#cp /lustre/red/vendor-nvidia/mhill2/LBPM/Methods_ms/input_databases/unit_test_5.db .
#cp /lustre/red/vendor-nvidia/mhill2/LBPM/Methods_ms/slurm_scripts/lbpm-ut5.sbatch .
#sbatch lbpm-ut5.sbatch
#jid=$(sbatch lbpm-ut5.sbatch | cut -d ' ' -f4)
#jstate="initial state"
#echo $jid
#while [ $jid ]; do
#   echo "waiting for 120s slurm job:"$jid
#   sleep 120
#   jstate=$(sacct -j $jid -n -o JobID)
#   if [[ -n $jstate ]]; then
#      jid=""
#   fi
#done
#
#
#echo "slant0/offset2:"
#cd /lustre/red/vendor-nvidia/mhill2/LBPM/Methods_ms/Blender_PM/slant0/offset2  
#pwd
#cp /lustre/red/vendor-nvidia/mhill2/LBPM/Methods_ms/input_databases/unit_test_5.db .
#cp /lustre/red/vendor-nvidia/mhill2/LBPM/Methods_ms/slurm_scripts/lbpm-ut5.sbatch .
#jid=$(sbatch lbpm-ut5.sbatch | cut -d ' ' -f4)
#jstate="initial state"
#echo $jid
#while [ $jid ]; do
#   echo "waiting for 120s slurm job:"$jid
#   sleep 120
#   jstate=$(sacct -j $jid -n -o JobID)
#   if [[ -n $jstate ]]; then
#      jid=""
#   fi
#done
#
#
#echo "slant0/offset4:"
#cd /lustre/red/vendor-nvidia/mhill2/LBPM/Methods_ms/Blender_PM/slant0/offset4  
#pwd
#cp /lustre/red/vendor-nvidia/mhill2/LBPM/Methods_ms/input_databases/unit_test_5.db .
#cp /lustre/red/vendor-nvidia/mhill2/LBPM/Methods_ms/slurm_scripts/lbpm-ut5.sbatch .
#jid=$(sbatch lbpm-ut5.sbatch | cut -d ' ' -f4)
#jstate="initial state"
#echo $jid
#while [ $jid ]; do
#   echo "waiting for 120s slurm job:"$jid
#   sleep 120
#   jstate=$(sacct -j $jid -n -o JobID)
#   if [[ -n $jstate ]]; then
#      jid=""
#   fi
#done
#
#
#echo "slant15:"
#cd /lustre/red/vendor-nvidia/mhill2/LBPM/Methods_ms/Blender_PM/slant15
#pwd
#cp /lustre/red/vendor-nvidia/mhill2/LBPM/Methods_ms/input_databases/unit_test_6.db .
#cp /lustre/red/vendor-nvidia/mhill2/LBPM/Methods_ms/slurm_scripts/lbpm-ut6.sbatch .
#jid=$(sbatch lbpm-ut6.sbatch | cut -d ' ' -f4)
#jstate="initial state"
#echo $jid
#while [ $jid ]; do
#   echo "waiting for 120s slurm job:"$jid
#   sleep 120
#   jstate=$(sacct -j $jid -n -o JobID)
#   if [[ -n $jstate ]]; then
#      jid=""
#   fi
#done
#
#echo -n "complete. "
#end=$(date +%s)
#echo "Elapsed Time: $(($end-$start)) seconds"
#

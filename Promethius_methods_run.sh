
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
echo "Test 1a: BCC Blender Serial:"
cd /Users/cpf/Desktop/Methods_ms/Blender_PM/BCC
pwd
#rm LBM.visit
cp /Users/cpf/Desktop/Methods_ms/input_databases/unit_test_1a.db .
cp /Users/cpf/Desktop/Methods_ms/slurm_scripts/lbpm-ut1.sbatch .
#mpirun -np 1 ./../../../build-6-2/tests/Blender_to_LBM unit_test_1a.db
#mpirun -np 1 ./../../../build-6-2/tests/lbpm_random_force_simulator unit_test_1a.db
#cp LBM.visit ~/
#cp -r vis* ~/

echo "Test 1b: BCC Blender Parallel:"
cd /Users/cpf/Desktop/Methods_ms/Blender_PM/BCC
pwd
#rm LBM.visit
cp /Users/cpf/Desktop/Methods_ms/input_databases/unit_test_1b.db .
cp /Users/cpf/Desktop/Methods_ms/slurm_scripts/lbpm-ut1.sbatch .
#mpirun -np 8 ./../../../build-6-2/tests/Blender_to_LBM unit_test_1b.db
#mpirun -np 8 ./../../../build-6-2/tests/lbpm_random_force_simulator unit_test_1b.db
#cp LBM.visit ~/
#cp -r vis* ~/

echo "Test 1c: BCC RayCasting Serial:"
cd /Users/cpf/Desktop/Methods_ms/RayCasting/BCC
pwd
#rm LBM.visit
cp /Users/cpf/Desktop/Methods_ms/input_databases/unit_test_1c.db .
cp /Users/cpf/Desktop/Methods_ms/slurm_scripts/lbpm-ut1.sbatch .
#mpirun -np 1 ./../../../build-6-2/tests/RayCast unit_test_1c.db
#mpirun -np 1 ./../../../build-6-2/tests/lbpm_random_force_simulator unit_test_1c.db
#cp LBM.visit ~/
#cp -r vis* ~/

echo "Test 1d: BCC RayCasting Parallel:"
cd /Users/cpf/Desktop/Methods_ms/RayCasting/BCC
pwd
#rm LBM.visit
cp /Users/cpf/Desktop/Methods_ms/input_databases/unit_test_1d.db .
cp /Users/cpf/Desktop/Methods_ms/slurm_scripts/lbpm-ut1.sbatch .
#mpirun  -np 8 ./../../../build-6-2/tests/RayCast unit_test_1d.db
#mpirun  -np 8 ./../../../build-6-2/tests/lbpm_random_force_simulator unit_test_1d.db
#cp LBM.visit ~/
#cp -r vis* ~/

echo "Test 2a: Parallel plates, Forced Poiseuille flow - no offset"
cd /Users/cpf/Desktop/Methods_ms/Blender_PM/slant0/offset0
pwd
cp /Users/cpf/Desktop/Methods_ms/input_databases/unit_test_2.db .
cp /Users/cpf/Desktop/Methods_ms/slurm_scripts/lbpm-ut2.sbatch .
#mpirun -np 1 ./../../../../build-6-2/tests/Blender_to_LBM unit_test_2.db
#mpirun -np 1 ./../../../../build-6-2/tests/lbpm_random_force_simulator unit_test_2.db

echo "Test 2b: Parallel plates, Forced Poiseuille flow - offset 0.2"
cd /Users/cpf/Desktop/Methods_ms/Blender_PM/slant0/offset2
pwd
cp /Users/cpf/Desktop/Methods_ms/input_databases/unit_test_2.db .
cp /Users/cpf/Desktop/Methods_ms/slurm_scripts/lbpm-ut2.sbatch .
#mpirun -np 1 ./../../../../build-6-2/tests/Blender_to_LBM unit_test_2.db
#mpirun -np 1 ./../../../../build-6-2/tests/lbpm_random_force_simulator unit_test_2.db

echo "Test 3: Parallel plates, Pressure-Gradient Driven Poiseuille flow - no offset"
cd /Users/cpf/Desktop/Methods_ms/Blender_PM/slant0/offset0
pwd
cp /Users/cpf/Desktop/Methods_ms/input_databases/unit_test_3.db .
cp /Users/cpf/Desktop/Methods_ms/slurm_scripts/lbpm-ut3.sbatch .
#mpirun -np 1 ./../../../../build-6-2/tests/Blender_to_LBM unit_test_3.db
#mpirun -np 1 ./../../../../build-6-2/tests/lbpm_random_force_simulator unit_test_3.db

echo "Test 4: Bubble"
cd /Users/cpf/Desktop/Methods_ms/RayCasting/Bubble
pwd
#rm LBM.visit
cp /Users/cpf/Desktop/Methods_ms/input_databases/unit_test_4.db .
cp /Users/cpf/Desktop/Methods_ms/slurm_scripts/lbpm-ut6.sbatch .
#mpirun -np 1 ./../../../build-6-2/tests/RayCast unit_test_4.db
#mpirun -np 1 ./../../../build-6-2/tests/lbpm_random_force_simulator unit_test_4.db
#cp LBM.visit ~/
#cp -r vis* ~/

echo "Test 5a: Parallel plates, capillary Bridge - no offset"
cd /Users/cpf/Desktop/Methods_ms/Blender_PM/slant0/offset0
pwd
#rm LBM.visit
cp /Users/cpf/Desktop/Methods_ms/input_databases/unit_test_5.db .
cp /Users/cpf/Desktop/Methods_ms/slurm_scripts/lbpm-ut5.sbatch .
#mpirun -np 1 ./../../../../build-6-2/tests/Blender_to_LBM unit_test_5.db
#mpirun -np 1 ./../../../../build-6-2/tests/lbpm_random_force_simulator unit_test_5.db
#cp LBM.visit ~/
#cp -r vis* ~/


echo "Test 5b: Parallel plates, capillary Bridge - offset 0.2"
cd /Users/cpf/Desktop/Methods_ms/Blender_PM/slant0/offset2
pwd
rm LBM.visit
cp /Users/cpf/Desktop/Methods_ms/input_databases/unit_test_5.db .
cp /Users/cpf/Desktop/Methods_ms/slurm_scripts/lbpm-ut5.sbatch .
mpirun -np 1 ./../../../../build-6-2/tests/Blender_to_LBM unit_test_5.db
mpirun -np 1 ./../../../../build-6-2/tests/lbpm_random_force_simulator unit_test_5.db
cp LBM.visit ~/
cp -r vis* ~/


echo "Test 6: Parallel plates, capillary Bridge - slanted"
cd /Users/cpf/Desktop/Methods_ms/Blender_PM/slant15/offset0
pwd
cp /Users/cpf/Desktop/Methods_ms/input_databases/unit_test_6.db .
cp /Users/cpf/Desktop/Methods_ms/slurm_scripts/lbpm-ut6.sbatch .
#mpirun -np 1 ./../../../../build-6-2/tests/Blender_to_LBM unit_test_6.db
#mpirun -np 1 ./../../../../build-6-2/tests/lbpm_random_force_simulator unit_test_6.db

echo "Test 7 ink_bottle30:"
cd /Users/cpf/Desktop/Methods_ms/Blender_PM/ink_bottle30
pwd
cp /Users/cpf/Desktop/Methods_ms/input_databases/unit_test_7a.db .
cp /Users/cpf/Desktop/Methods_ms/slurm_scripts/lbpm-ut7a.sbatch .
#mpirun -np 1 ./../../../../build-6-2/tests/Blender_to_LBM unit_test_7a.db
#mpirun -np 1 ./../../../../build-6-2/tests/lbpm_random_force_simulator unit_test_7a.db

echo "Test 9: Bubble on solid sphere"
cd /Users/cpf/Desktop/Methods_ms/RayCasting/BubbleOnSolidSphere
pwd
#rm LBM.visit
cp /Users/cpf/Desktop/Methods_ms/input_databases/unit_test_9.db .
cp /Users/cpf/Desktop/Methods_ms/slurm_scripts/lbpm-ut9.sbatch .
#mpirun -np 1 ./../../../build-6-2/tests/RayCast unit_test_9.db
#mpirun -np 1 ./../../../build-6-2/tests/lbpm_random_force_simulator unit_test_9.db
#cp LBM.visit ~/
#cp -r vis* ~/ 

echo "Test 10: Bubble adjacent to solid sphere"
cd /Users/cpf/Desktop/Methods_ms/RayCasting/BubbleAdjacentSolidSphere
pwd
#rm LBM.visit
cp /Users/cpf/Desktop/Methods_ms/input_databases/unit_test_10.db .
cp /Users/cpf/Desktop/Methods_ms/slurm_scripts/lbpm-ut10.sbatch .
#mpirun -np 1 ./../../../build-6-2/tests/RayCast unit_test_10.db
#mpirun -np 1 ./../../../build-6-2/tests/lbpm_random_force_simulator unit_test_10.db
#cp LBM.visit ~/
#cp -r vis* ~/

echo "========================================"
echo "========================================"
echo "Simulations complete. "
end=$(date +%s)
echo "Elapsed Time: $(($end-$start)) seconds"
#

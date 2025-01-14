## Make the topo files using the making_topo_file.py code (give it the gene list.txt)

## The code needs a folder on which topo files are kept and a folder in which list of topo files is kept. It makes a folder RACIPE_output and keeps the outputs ( kde plots, selected relative stability paramters, state frequency and z normalised steady states) in it. 


num_of_parameters=10000  ## no of parametres

## Paths
path_to_codes_folder="/home/abhiram/Desktop/Hcodes/codes"
path_to_list_of_topo_files="/home/abhiram/Desktop/filenamesH.txt"
path_to_topo_file_folder="/home/abhiram/Desktop/Racipe_to_simulate_H/"
path_to_RACIPE_output_folder="/home/abhiram/Desktop/HiloopH/"
path_to_RACIPE="/home/abhiram/Desktop/RACIPEfolder/RACIPE"

while read network_identifier; do

    # iterating over all the network instances for which RACIPE needs to be run
    #-num_paras $num_of_parameters -seed is the specifying the seed value (though even after fixing it, Racipe paramters are still different for different runs!)

	echo Running on the network: $network_identifier
	path_to_topo_file=$path_to_topo_file_folder$network_identifier.topo
#############################
	## RUN 1
	path_to_run_folder=$path_to_RACIPE_output_folder$network_identifier/run_1/
	path_to_run_topo_file=$path_to_run_folder$network_identifier.topo
	mkdir -p $path_to_run_folder
	cp $path_to_topo_file $path_to_run_folder
	cd $path_to_run_folder
	$path_to_RACIPE $network_identifier.topo -num_paras $num_of_parameters -seed 1 -num_stability 5 & 
        cd $path_to_codes_folder
	
#############################
	## RUN 2
	path_to_run_folder=$path_to_RACIPE_output_folder$network_identifier/run_2/
	path_to_run_topo_file=$path_to_run_folder$network_identifier.topo
	mkdir -p $path_to_run_folder
	cp $path_to_topo_file $path_to_run_folder
	cd $path_to_run_folder
	$path_to_RACIPE $network_identifier.topo -num_paras $num_of_parameters -seed 2 -num_stability 5 & 
        cd $path_to_codes_folder
	
#############################
	## RUN 3
	path_to_run_folder=$path_to_RACIPE_output_folder$network_identifier/run_3/
	path_to_run_topo_file=$path_to_run_folder$network_identifier.topo
	mkdir -p $path_to_run_folder
	cp $path_to_topo_file $path_to_run_folder
	cd $path_to_run_folder
	$path_to_RACIPE $network_identifier.topo -num_paras $num_of_parameters -seed 3 -num_stability 5
        cd $path_to_codes_folder

############################
done < $path_to_list_of_topo_files

# python3 ./code_z_score_transformation.py

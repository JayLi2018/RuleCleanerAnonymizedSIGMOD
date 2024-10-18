#!/bin/bash


declare -i repetitions=5
dfactors=(0.1 0.3 0.5 0.7)
dabsolutes=(4 6 8 10 12 14)
bad_cnts=(3 6 9 12 15 18 21 24)
declare -i rseed

# 			echo "global_runs: $global_runs"

# x=1
# while [ $x -le $repetitions ]
# do
# 	for d in ${dfactors[@]}
# 	do
# 		python main.py -e experiment_results_folders/deletion_factor_lf_1014/ -U lf -x 123 -T 0 -s 200 -r 0.5 -G information_gain -D ${d} \
# 		-K /home/opc/chenjie/RBBM/rbbm_src/labelling_func_src/src/pickled_funcs_720 -n youtube -k true -P 5432
# 	done
# 	x=$(( $x+1 ))
# done

# python main.py -e experiment_results_folders/deletion_factor_lf_1014/ -U lf -x 123 -T 0 -s 200 -r 0.5 -G information_gain -D 0 \
# -K /home/opc/chenjie/RBBM/rbbm_src/labelling_func_src/src/pickled_funcs_720 -n youtube -k true -P 5432

# x=1
# while [ $x -le $repetitions ]
# do
# 	rseed=$(shuf -i 1-1000 -n 1)
# 	for d in ${dabsolutes[@]}
# 	do
# 		python main.py -e experiment_results_folders/deletion_factor_lf_1014_absolute_2/ -U lf -x ${rseed} -T 0 -s 200 -r 0.5 -G information_gain -b absolute -W ${d} \
# 		-K /home/opc/chenjie/RBBM/rbbm_src/labelling_func_src/src/pickled_funcs_720 -n youtube -k true -P 5432
# 	done
# 	python main.py -e experiment_results_folders/deletion_factor_lf_1014_absolute_2/ -U lf -x ${rseed} -T 0 -s 200 -r 0.5 -G information_gain -D 0 \
# 	-K /home/opc/chenjie/RBBM/rbbm_src/labelling_func_src/src/pickled_funcs_720 -n youtube -k true -P 5432
# 	x=$(( $x+1 ))
# done

# x=1
# while [ $x -le $repetitions ]
# do
# 	rseed=$(shuf -i 1-1000 -n 1)
# 	for d in ${dabsolutes[@]}
# 	do
# 		python main.py -e experiment_results_folders/witan_refinements_amazon/ -U lf -x ${rseed} -T 0 -s 200 -r 0.5 -G information_gain -b absolute -W ${d} \
# 		-z true -n amazon -P 5432
# 	done
# 	python main.py -e experiment_results_folders/witan_refinements_amazon/ -U lf -x ${rseed} -T 0 -s 200 -r 0.5 -G information_gain -D 0 \
# 	-z true -n amazon -P 5432
# 	x=$(( $x+1 ))
# done



x=1
while [ $x -le $repetitions ]
do
	rseed=$(shuf -i 1-1000 -n 1)
	for b in ${bad_cnts[@]}
	do
		for d in ${dabsolutes[@]}
		do
			python main.py -e experiment_results_folders/deletion_factor_lf_1014_absolute_change_bad_lf_cnt/ -U lf -x ${rseed} -T 0 -s 200 -r 0.5 -G information_gain -b absolute -W ${d} \
			-K /home/opc/chenjie/RBBM/rbbm_src/labelling_func_src/src/pickled_funcs_youtube_30_bad_${b} -n youtube -k true -P 5432
		done
		python main.py -e experiment_results_folders/deletion_factor_lf_1014_absolute_change_bad_lf_cnt/ -U lf -x ${rseed} -T 0 -s 200 -r 0.5 -G information_gain -D 0 \
		-K /home/opc/chenjie/RBBM/rbbm_src/labelling_func_src/src/pickled_funcs_youtube_30_bad_${b} -n youtube -k true -P 5432
	done

	x=$(( $x+1 ))
done

# x=1
# while [ $x -le $repetitions ]
# do
# 	rseed=$(shuf -i 1-1000 -n 1)
# 	python main.py -e experiment_results_folders/deletion_factor_lf_1014_absolute_change_bad_lf_cnt/ -U lf -x ${rseed} -T 0 -s 200 -r 0.5 -G information_gain -b absolute -W 4 \
# 	-K /home/opc/chenjie/RBBM/rbbm_src/labelling_func_src/src/pickled_funcs_720 -n youtube -k true -P 5432
# 	# python main.py -e experiment_results_folders/deletion_factor_lf_1014_absolute_change_bad_lf_cnt/ -U lf -x ${rseed} -T 0 -s 200 -r 0.5 -G information_gain -D 0 \
# 	# -K /home/opc/chenjie/RBBM/rbbm_src/labelling_func_src/src/pickled_funcs_youtube_30_bad_${b} -n youtube -k true -P 5432
# 	x=$(( $x+1 ))
# done



  # -h, --help            show this help message and exit
  # -U, --use_case    use case of the run, is it for dc or lf? (default: dc)
  # -e, --experiment_name 
  #                       the name of the experiment, the results will be stored in the directory named with experiment_name_systime (default: test_blah)
  # -R, --repeatable  repeatable? (default: true)
  # -x, --seed        if repeatable, specify a seed number here (default: 123)
  # -X, --seed_file   if repeatable, specify a seed number here (default: seeds.txt)
  # -E, --retrain_every_percent 
  #                       retrain over every (default: 1*100), the default order is sorted by treesize ascendingly
  # -A, --retrain_accuracy_thresh 
  #                       when retrain over every retrain_every_percent, the algorithm stops when the fix rate is over this threshold (default: 1)
  # -T, --pre_filter_thresh 
  #                       prefilter those DCs that have number of tuples involved in violations above this thresh (default: 0)
  # -l, --log_level   loglevel: debug/info/warning/error/critical (default: debug)
  # -s, --user_input_size 
  #                       user input size total (the complaint size is decided by user_input_size*complaint_ratio) and confirm size is decided by user_input_size-complaint_size(default: 20)
  # -r, --complaint_ratio 
  #                       user input complaint ratio (default: 0.5)
  # -G, --strategy    method used to repair the rules (naive, information_gain, optimal) (default: information_gain)
  # -D, --deletion_factor 
  #                       this is a factor controlling how aggressive the algorithm chooses to delete the rule from the rulset (default: 0.5)
  # -W, --deletion_absolute_threshold 
  #                       this is threshold for absolute tree size increase (default: 10)
  # -b, --deletion_type 
  #                       deletion type (ratio/absolute) (default: ratio)
  # -d, --dbname      database name which stores the dataset, (default: label)
  # -P, --port        database port, (default: 5433)
  # -p, --password    database password, (default: 5432)
  # -u, --user        database user, (default: postgres)
  # -f, --lf_source   the source of labelling function (intro / system generate) (default: undefined)
  # -O, --number_of_funcs 
  #                       if if_source is selected as system generate, how many do you want(default: 20)
  # -i, --run_intro   do you want to run the intro example with pre selected user input? (default: false)
  # -z, --run_amazon  do you want to run amazon with witan funcs? (need to put dataset_name as amazon) (default: false)
  # -w, --run_painter 
  #                       do you want to run painter_architect with witan funcs? (need to put dataset_name as painter_architect (default: false)
  # -o, --run_professor 
  #                       do you want to run professor_teacher with witan funcs? (need to put dataset_name as professor_teacher (default: false)
  # -k, --load_funcs_from_pickle 
  #                       (flag indicating if we want to load functions from a pickle file default: false)
  # -K, --pickle_file_name 
  #                       (if load_funcs_from_pickle, then heres the pickle file name : placeholder_name)
  # -M, --training_model_type 
  #                       the model used to get the label: majority/snorkel (default: snorkel)
  # -n, --dataset_name 
  #                       dataset used in the use case of labelling functions (default: youtube)
  # -C, --dc_file     holoclean needs a input text file which contains the denial constraints, this will be the file inside dc_dir (default: /home/opc/chenjie/RBBM/rbbm_src/muse/data/mas/tax_rules.txt)
  # -S, --semantic_version 
  #                       muse semantic version (ind/stage/end/step) (default: ind)
  # -t, --table_name  the table name from database cr that you want to work with (default: tax)
  # -F, --desired_dcs_file 
  #                       the ground truth DCs that so called user think is correct (default: /home/opc/chenjie/RBBM/rbbm_src/dc_src/user_desired_dcs.txt)
  # -I, --user_specify_pairs 
  #                       user specify pairs of violations to repair? (default: True)
  # -B, --repeatable_muse 
  #                       run all 3 algoritns with repeatable muse? (default: False)
  # -a, --repeatable_strats 
  #                       what strats to run when its repeatable_muse? (default: information_gain,naive,optimal)

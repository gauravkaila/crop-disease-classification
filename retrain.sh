#!/bin/sh

# Current date and time
dt=$(date '+%d/%m/%Y %H:%M:%S')

# Load the estimated number of files from the previous retraining 
file='/home/ubuntu/crop_classification_updated/resources/last_estimate.txt'
last_estimate=$(cat "$file") 

# Difference between current number of files and last_estimate
diff=0

# Count the number of files in the current run
count1=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Anthracnose | wc -l)
count2=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Alternaria_Stem_and_fruit_Canker | wc -l)
count3=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Copper_deficiency_in_tomato | wc -l)
count4=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Late_blight_tomato | wc -l)
count5=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Potassium_deficiency_in_tomato | wc -l)
count6=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Sulfur_deficiency_in_tomato | wc -l)
count7=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Tomato_Mosaic_Virus | wc -l)
count8=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Curly_top | wc -l)
count9=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Leaf_mold | wc -l)
count10=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Potato_virus | wc -l)
count11=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Thrips_on_tomato | wc -l)
count12=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Tomato_ring_spot_Virus | wc -l)
count13=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Aphids_on_tomato | wc -l)
count14=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Cutworm_on_tomato | wc -l)
count15=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Magnesium_deficiency_in_tomato | wc -l)
count16=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Powdery_mildew | wc -l)
count17=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Tobacco_Caterpillar_on_tomato | wc -l)
count18=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Tomato_Spotted_Wilt | wc -l)
count19=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Damping_off | wc -l)
count20=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Manganese_deficiency_in_tomato | wc -l)
count21=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Red_Spider_Mites | wc -l)
count22=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Tobacco_Etch | wc -l)
count23=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Tomato_White_Fly | wc -l)
count24=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Bacterial_Wilt_of_Tomato | wc -l)
count25=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Early_blight_of_tomato | wc -l)
count26=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Molybdenum_deficiency_in_tomato | wc -l)
count27=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Root_Knot_nematode | wc -l)
count28=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Tomato_Alfalfa_Mosaic_Virus | wc -l)
count29=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Blossom_end_rot_tomato_disease | wc -l)
count30=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Fusarium_Crown_and_Root_Rot | wc -l)
count31=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Nitrogen_deficiency_in_tomato | wc -l)
count32=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Septoria_leaf_spot | wc -l)
count33=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Tomato_bushy_stunt_virus | wc -l)
count34=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Verticillium_wilt | wc -l)
count35=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Boron_deficiency_in_tomato | wc -l)
count36=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Fusarium_wilt | wc -l)
count37=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Phosphorus_deficiency_in_tomato | wc -l)
count38=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Serpentine_leaf_miner | wc -l)
count39=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Tomato_Fern_Leaf | wc -l)
count40=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/white_grubs_of_tomato | wc -l)
count41=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Calcium_deficiency_in_tomato | wc -l)
count42=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Iron_deficiency_in_tomato | wc -l)
count43=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Pith_necrosis | wc -l)
count44=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Southern_blight | wc -l)
count45=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Tomato_fruit_borer | wc -l)
count46=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Zinc_deficiency_in_tomato | wc -l)
count47=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Tomato_Yellow_Leaf_Curl_Virus | wc -l)
count48=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Bacterial_Spot_Speck_of_Tomato | wc -l)
count49=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Tomato_healthy_flowers | wc -l)
count50=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Tomato_healthy_leaves | wc -l)
count51=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Tomato_healthy_stem | wc -l)
count52=$(sudo ls ~/crop_classification_updated/data_dir/train_dir/Tomato_healthy_fruits | wc -l)

# Calculate the difference between current number of files and the previous retraining 
result1=`expr $count1 - $last_estimate`
result2=`expr $count2 - $last_estimate`
result3=`expr $count3 - $last_estimate`
result4=`expr $count4 - $last_estimate`
result5=`expr $count5 - $last_estimate`
result6=`expr $count6 - $last_estimate`
result7=`expr $count7 - $last_estimate`
result8=`expr $count8 - $last_estimate`
result9=`expr $count9 - $last_estimate`
result10=`expr $count10 - $last_estimate`
result11=`expr $count11 - $last_estimate`
result12=`expr $count12 - $last_estimate`
result13=`expr $count13 - $last_estimate`
result14=`expr $count14 - $last_estimate`
result15=`expr $count15 - $last_estimate`
result16=`expr $count16 - $last_estimate`
result17=`expr $count17 - $last_estimate`
result18=`expr $count18 - $last_estimate`
result19=`expr $count19 - $last_estimate`
result20=`expr $count20 - $last_estimate`
result21=`expr $count21 - $last_estimate`
result22=`expr $count22 - $last_estimate`
result23=`expr $count23 - $last_estimate`
result24=`expr $count24 - $last_estimate`
result25=`expr $count25 - $last_estimate`
result26=`expr $count26 - $last_estimate`
result27=`expr $count27 - $last_estimate`
result28=`expr $count28 - $last_estimate`
result29=`expr $count29 - $last_estimate`
result30=`expr $count30 - $last_estimate`
result31=`expr $count31 - $last_estimate`
result32=`expr $count32 - $last_estimate`
result33=`expr $count33 - $last_estimate`
result34=`expr $count34 - $last_estimate`
result35=`expr $count35 - $last_estimate`
result36=`expr $count36 - $last_estimate`
result37=`expr $count37 - $last_estimate`
result38=`expr $count38 - $last_estimate`
result39=`expr $count39 - $last_estimate`
result40=`expr $count40 - $last_estimate`
result41=`expr $count41 - $last_estimate`
result42=`expr $count42 - $last_estimate`
result43=`expr $count43 - $last_estimate`
result44=`expr $count44 - $last_estimate`
result45=`expr $count45 - $last_estimate`
result46=`expr $count46 - $last_estimate`
result47=`expr $count47 - $last_estimate`
result48=`expr $count48 - $last_estimate`
result49=`expr $count49 - $last_estimate`
result50=`expr $count50 - $last_estimate`
result51=`expr $count51 - $last_estimate`
result52=`expr $count52 - $last_estimate`

# Retrain the model if all the classes have exceded the difference variable else do nothing
if  [ "$result1" -gt "$diff" ] && [ "$result2" -gt "$diff" ] && [ "$result3" -gt "$diff" ] && [ "$result4" -gt "$diff" ] && \
    [ "$result5" -gt "$diff" ] && [ "$result6" -gt "$diff" ] && [ "$result7" -gt "$diff" ] && [ "$result8" -gt "$diff" ] && \
    [ "$result9" -gt "$diff" ] && [ "$result10" -gt "$diff" ] && [ "$result11" -gt "$diff" ] && [ "$result12" -gt "$diff" ] && \
    [ "$result13" -gt "$diff" ] && [ "$result14" -gt "$diff" ] && [ "$result15" -gt "$diff" ] && [ "$result16" -gt "$diff" ] && \
    [ "$result17" -gt "$diff" ] && [ "$result18" -gt "$diff" ] && [ "$result19" -gt "$diff" ] && [ "$result20" -gt "$diff" ] && \
    [ "$result21" -gt "$diff" ] && [ "$result22" -gt "$diff" ] && [ "$result23" -gt "$diff" ] && [ "$result25" -gt "$diff" ] && \
    [ "$result26" -gt "$diff" ] && [ "$result27" -gt "$diff" ] && [ "$result28" -gt "$diff" ] && [ "$result29" -gt "$diff" ] && \
    [ "$result30" -gt "$diff" ] && [ "$result31" -gt "$diff" ] && [ "$result32" -gt "$diff" ] && [ "$result33" -gt "$diff" ] && \
    [ "$result34" -gt "$diff" ] && [ "$result35" -gt "$diff" ] && [ "$result36" -gt "$diff" ] && [ "$result37" -gt "$diff" ] && \
    [ "$result38" -gt "$diff" ] && [ "$result39" -gt "$diff" ] && [ "$result40" -gt "$diff" ] && [ "$result41" -gt "$diff" ] && \
    [ "$result42" -gt "$diff" ] && [ "$result43" -gt "$diff" ] && [ "$result44" -gt "$diff" ] && [ "$result45" -gt "$diff" ] && \
    [ "$result46" -gt "$diff" ] && [ "$result47" -gt "$diff" ] && [ "$result48" -gt "$diff" ] && [ "$result24" -gt "$diff" ] && \
    [ "$result49" -gt "$diff" ] && [ "$result50" -gt "$diff" ] && [ "$result51" -gt "$diff" ] && [ "$result52" -gt "$diff" ]
then
    # Write to mycustom.log
    echo "ooooooooooooooooooooooooooooooooooooooooooooooooo" >> ~/cron.log
    echo "Creating a new model at : $dt" >> ~/cron.log
    
    # Retrain the model
    sh /home/ubuntu/crop_classification_updated/train_mobilenet.sh
    
    # Test whether the new model has a better test accuracy than the previous model
    python retrain_compare.py
    echo '' >> ~/cron.log
    echo "ooooooooooooooooooooooooooooooooooooooooooooooooo" >> ~/cron.log
    
    # Replace the value in the last_estimate.txt with the current number of files in each class (approx.)
    echo $count1 > '/home/ubuntu/crop_classification_updated/resources/last_estimate.txt'
else
	echo "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" >> ~/cron.log
    echo "Not creating a new model at : $dt" >> ~/cron.log
    echo "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" >> ~/cron.log
fi


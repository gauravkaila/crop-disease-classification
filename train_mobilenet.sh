IMAGE_SIZE=224
ARCHITECTURE="mobilenet_0.50_${IMAGE_SIZE}"

python /home/ubuntu/crop_classification_updated/scripts/retrain.py \
  --bottleneck_dir=/home/ubuntu/crop_classification_updated/tf_files/bottlenecks \
  --how_many_training_steps=4000 \
  --model_dir=/home/ubuntu/crop_classification_updated/tf_files/models/ \
  --summaries_dir=tf_files/training_summaries/"${ARCHITECTURE}" \
  --output_graph=tf_files/retrained_graph.pb \
  --output_labels=tf_files/retrained_labels.txt \
  --architecture="${ARCHITECTURE}" \
  --image_dir=/home/ubuntu//crop_classification_updated/data_dir/train_dir

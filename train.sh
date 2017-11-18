IMAGE_SIZE=299
ARCHITECTURE="inception_v3"

tensorboard --logdir tf_files/training_summaries &
python -m scripts.retrain \
  --bottleneck_dir=tf_files/bottlenecks \
  --how_many_training_steps=8000 \
  --model_dir=tf_files/models/ \
  --summaries_dir=tf_files/training_summaries/"${ARCHITECTURE}" \
  --output_graph=tf_files/retrained_graph_inception.pb \
  --output_labels=tf_files/retrained_labels_inception.txt \
  --architecture="${ARCHITECTURE}" \
  --image_dir=/home/ubuntu/crop_classification_updated/data_dir/train_dir \
  --learning_rate=0.1 \
  --train_batch_size=100

python /home/ubuntu/crop_classification_updated/scripts/quantize_graph.py \
  --input=/home/ubuntu/crop_classification_updated/tf_files/optimized_graph.pb \
  --output=/home/ubuntu/crop_classification_updated/tf_files/rounded_graph.pb \
  --output_node_names=final_result \
  --mode=weights_rounded
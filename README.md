## Folder structure
KisanLab_CPU-|
				              |-Kisan_app-|
				              |                      |- model: directory containing model files for API
				              |                      |- templates
				              |                      |- static
				              |-tf_files-|
				              |                      |- models: directory containing model files for training
				              |                      |- bottlenecks: feature files for each image for each class. required for faster training		              
				              |-data_dir: contains sub-folders with images of each class
				              |-scripts: contains python files for training the models, evaluation and quantization
				              |-train.sh: bash script to run the training for inceptionV3 model
				              |-train_mobilenet.sh: bash script to run the training for the mobilenet model
				              |-retrain.sh: bash script to re-train the model on new images
				              |-retrain_compare.sh: utility script for retrain.sh	                                      

## Training the image-classification model

### Activate the python virtualenv (run from root)
source py35/bin/activate

### Change the dir to crop_classifcation_updated
cd KisanLab_CPU

### Train the inceptionV3 model (more accurate, larger size, slow to train)
sh train.sh

or 

### Train the mobilenet model (less accurate, smaller size, fast to train)
sh train_mobilenet.sh

## API

Kisan_app folder contains all the files for the API. 

### How to run the API?

### Start the server (run from root)
source py35/bin/activate

### Change dir to server dir
cd crop_classification_updated/kisan_app

### Start the server (logging occurs in nohup.out file)
nohup gunicorn app:app -b localhost:8000 &

### Access API via curl cmd
curl -F file=@/path/to/your/image http://ec2-13-127-39-214.ap-south-1.compute.amazonaws.com/api_call

#### Output (in json)

[
{
"Prediction1": "tomato fruit borer", 
"Confidence1": "0.490311", 
"Confidence2": "0.258647", 
"Prediction2": "cutworm on tomato"
}
]

or 

### Access the web-api via the public IP of the ec2 instance

#### Output
![alt text](https://raw.githubusercontent.com/gauravkaila/KisanLab_CPU/master/sample.png)

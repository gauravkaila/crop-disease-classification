#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Aug 30 20:17:41 2017

@author: gaurav.kaila
"""

from flask import Flask,request,redirect,url_for,render_template,send_from_directory,\
    jsonify
from PIL import Image
from utils import load_graph,read_tensor_from_image_file,load_labels
import tensorflow as tf
import numpy as np
import os
from werkzeug import secure_filename
from werkzeug.contrib.fixers import ProxyFix
import time
import shutil
from sklearn.externals import joblib
import json
from django.contrib.admin.templatetags.admin_list import result_list

app = Flask(__name__)

app.config['UPLOAD_FOLDER'] = "static"
app.config['ALLOWED_EXTENSIONS'] = set(['jpg', 'jpeg'])
app.config['JSON_SORT_KEYS'] = False

# LOAD THE TENSORFLOW GRAPH WHEN SERVER STARTS
# load the model and labels file
model_file = "/home/ubuntu/crop_classification_updated/kisan_app/model/retrained_graph_inception_8000.pb"
label_file = "/home/ubuntu/crop_classification_updated/kisan_app/model/retrained_labels_inception_8000.txt"

# load the graph
graph = load_graph(model_file)

# input and output layer
input_layer = "Mul"
output_layer = "final_result"
input_name = "import/" + input_layer
output_name = "import/" + output_layer
input_operation = graph.get_operation_by_name(input_name);
output_operation = graph.get_operation_by_name(output_name);

# start the tensorflow session
sess = tf.Session(graph=graph) 

# load data dictionary for saving incoming images to the correct data folder
data_dict = joblib.load('/home/ubuntu/crop_classification_updated/kisan_app/data_dict.pkl')
@app.route('/')
def index():
   return render_template('upload.html')

@app.route('/upload/<filename>')
def send_image(filename):
    return send_from_directory("static", filename)

@app.route('/upload',methods = ['POST'])
def uploader():
    f = request.files['file']
    filename = secure_filename(f.filename)
    f.save(os.path.join(app.config['UPLOAD_FOLDER'],str(filename)))
    image = Image.open(os.path.join(app.config['UPLOAD_FOLDER'],str(filename)))
    #image_resized = image.resize([299,299], Image.ANTIALIAS)
    
    file_name = (os.path.join(app.config['UPLOAD_FOLDER'],str(filename)))
    input_height = 299
    input_width = 299
    input_mean = 128
    input_std = 128
    
    t = read_tensor_from_image_file(file_name,
                                    input_height=input_height,
                                    input_width=input_width,
                                    input_mean=input_mean,
                                    input_std=input_std)
    
    results = sess.run(output_operation.outputs[0],
                        {input_operation.outputs[0]: t})
    results = np.squeeze(results)

    top_k = results.argsort()[-5:][::-1]
    labels = load_labels(label_file)
    for i in top_k:
      print(labels[i], results[i])
      
    # Save images to their original data directory if probability of prediction > threshold --- for retraining
    #if results[top_k[0]]>0.70:
    #    shutil.copy(os.path.join(app.config['UPLOAD_FOLDER'],str(filename)), "/home/ubuntu/crop_classification_updated/data_dir/train_dir/{0}/{1}".format(data_dict[labels[top_k[0]]],filename))
    #    print ('Saving image to: /home/ubuntu/crop_classification_updated/data_dir/train_dir/{0}/{1}'.format(data_dict[labels[top_k[0]]],filename))
    
    return render_template('image.html',prediction1 = labels[top_k[0]],confidence1 = results[top_k[0]],prediction2 = labels[top_k[1]],confidence2 = results[top_k[1]], image = str(filename))   

@app.route('/api_call',methods = ['POST'])
def api_call():
    f = request.files['file']
    filename = secure_filename(f.filename)
    f.save(os.path.join(app.config['UPLOAD_FOLDER'],str(filename)))
    image = Image.open(os.path.join(app.config['UPLOAD_FOLDER'],str(filename)))
    #image_resized = image.resize([299,299], Image.ANTIALIAS)
    
    file_name = (os.path.join(app.config['UPLOAD_FOLDER'],str(filename)))
    input_height = 299
    input_width = 299
    input_mean = 128
    input_std = 128
    
    t = read_tensor_from_image_file(file_name,
                                    input_height=input_height,
                                    input_width=input_width,
                                    input_mean=input_mean,
                                    input_std=input_std)
    
    results = sess.run(output_operation.outputs[0],
                        {input_operation.outputs[0]: t})
    results = np.squeeze(results)

    top_k = results.argsort()[-5:][::-1]
    labels = load_labels(label_file)
    for i in top_k:
      print(labels[i], results[i])
      
    # Save images to their original data directory if probability of prediction > threshold --- for retraining
    #if results[top_k[0]]>0.70:
    #    shutil.copy(os.path.join(app.config['UPLOAD_FOLDER'],str(filename)), "/home/ubuntu/crop_classification_updated/data_dir/train_dir/{0}/{1}".format(data_dict[labels[top_k[0]]],filename))
    #    print ('Saving image to: /home/ubuntu/crop_classification_updated/data_dir/train_dir/{0}/{1}'.format(data_dict[labels[top_k[0]]],filename))
    result_list = [{
        'Prediction1':'%s'%(labels[top_k[0]]),
         'Confidence1':'%s'%(results[top_k[0]]),
         'Prediction2':'%s'%(labels[top_k[1]]),
         'Confidence2':'%s'%(results[top_k[1]])
         }]
    
    return jsonify(result_list)

app.wsgi_app = ProxyFix(app.wsgi_app)
if __name__ == '__main__':
    app.run(debug=True)

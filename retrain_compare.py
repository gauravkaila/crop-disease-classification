from sklearn.externals import joblib
import shutil

accuracy_list = joblib.load('/home/ubuntu/crop_classification_updated/resources/accuracy_list.pkl')
if all(acc < accuracy_list[-1] for acc in accuracy_list[0:-2]):
    shutil.move("/home/ubuntu/crop_classification_updated/tf_files/retrained_graph.pb", "/home/ubuntu/crop_classification_updated/kisan_app/model/retrained_graph.pb")
    shutil.move("/home/ubuntu/crop_classification_updated/tf_files/retrained_labels.txt", "/home/ubuntu/crop_classification_updated/kisan_app/model/retrained_labels.txt")
    with open("/home/ubuntu/cron.log","a") as logfile:
        logfile.write('Replacing old model with the new model. New model accuracy : {0}'.format(accuracy_list[-1]))
else:
    with open("/home/ubuntu/cron.log","a") as logfile:
        logfile.write('Mantaining old model as new model accuracy : {0}'.format(accuracy_list[-1]))
    
        
        
        
        
        
import tensorflow as tf
import numpy as np

print(tf.__version__)

from tensorflow.contrib.learn.python.learn.datasets import base

# Data files
KPOP_TRAINING = "kpop_training.csv"
KPOP_TEST = "kpop_test.csv"

# Load datasets.
training_set = base.load_csv_with_header(filename=KPOP_TRAINING,
                                         features_dtype=np.float32,
                                         target_dtype=np.int)
test_set = base.load_csv_with_header(filename=KPOP_TEST,
                                     features_dtype=np.float32,
                                     target_dtype=np.int)

# Specify that all features have real-value data
feature_name = "kpop_features"
feature_columns = [tf.feature_column.numeric_column(feature_name, 
                                                    shape=[6])]
classifier = tf.estimator.LinearClassifier(
    feature_columns=feature_columns,
    n_classes=3,
    model_dir="/Documents/NUWireless/kpop_model")

def input_fn(dataset):
    def _fn():
        features = {feature_name: tf.constant(dataset.data)}
        label = tf.constant(dataset.target)
        return features, label
    return _fn

# Fit model.
classifier.train(input_fn=input_fn(training_set),
               steps=1000)
print('fit done')

# Evaluate accuracy.
accuracy_score = classifier.evaluate(input_fn=input_fn(test_set), 
                                     steps=100)["accuracy"]
print('\nAccuracy: {0:f}'.format(accuracy_score))

# Export the model for serving
feature_spec = {'kpop_features': tf.FixedLenFeature(shape=[6], dtype=np.float32)}

serving_fn = tf.estimator.export.build_parsing_serving_input_receiver_fn(feature_spec)

classifier.export_savedmodel(export_dir_base='/Documents/NUWireless' + '/export', 
                            serving_input_receiver_fn=serving_fn)
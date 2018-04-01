# Copyright 2017 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Modified by Aryton Hoi and Matthew Todd
# for Northeastern Wireless Club's 3rd annual Hackathon

import tensorflow as tf
import numpy as np

print(tf.__version__)

from tensorflow.contrib.learn.python.learn.datasets import base

# Data files
KPOP_TRAINING = "training_data.csv"
KPOP_TEST = "testing_data.csv"

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
    model_dir=".lyrics_train")

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

classifier.export_savedmodel(export_dir_base='./model_dir' + '/export',
                            serving_input_receiver_fn=serving_fn)
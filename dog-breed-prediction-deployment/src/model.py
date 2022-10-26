# -*- coding: utf-8 -*-
# Indentation: Jupyter Notebook

'''
Dog Breed Prediction
'''

__version__ = 1.0
__author__ = "Sourav Raj"
__author_email__ = "souravraj.iitbbs@gmail.com"

from keras.models import Sequential
from keras.layers import Dense, Dropout, Flatten, Conv2D, MaxPool2D
from keras.optimizers import Adam


def model_creation(input_shape:tuple, output_shape:int):
    # Building the Model
    model = Sequential()

    model.add(Conv2D(filters = 64, kernel_size = (5,5), activation ='relu', input_shape = (224,224,3)))
    model.add(MaxPool2D(pool_size=(2,2)))

    model.add(Conv2D(filters = 32, kernel_size = (3,3), activation ='relu', kernel_regularizer = 'l2'))
    model.add(MaxPool2D(pool_size=(2,2)))

    model.add(Conv2D(filters = 16, kernel_size = (7,7), activation ='relu', kernel_regularizer = 'l2'))
    model.add(MaxPool2D(pool_size=(2,2)))

    model.add(Conv2D(filters = 8, kernel_size = (5,5), activation ='relu', kernel_regularizer = 'l2'))
    model.add(MaxPool2D(pool_size=(2,2)))

    model.add(Flatten())
    model.add(Dense(128, activation = "relu", kernel_regularizer = 'l2'))
    model.add(Dense(64, activation = "relu", kernel_regularizer = 'l2'))
    model.add(Dense(output_shape, activation = "softmax"))
    
    return model

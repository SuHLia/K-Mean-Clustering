#!/usr/bin/env python
# coding: utf-8

# In[1]:


# import the required Libraries
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans
from sklearn.preprocessing import StandardScaler
import pandas as pd
import numpy as np


# In[2]:


#Import the driver data
Driver_data = pd.read_csv('driver-data.csv')
print(Driver_data.head())

#check missing data
print('the total number of nan is:', Driver_data.isnull().sum().sum())

# set features and label
X = Driver_data.drop(['id'], axis = 1)
y = Driver_data['id']

##We scale our independant variables 
# sc = StandardScaler()
#X = sc.fit_transform(X)

# use Kmeans clutering : 2groups
model = KMeans(n_clusters= 2,random_state = 0)
kmeans = model.fit(X)

print('kmeans_labels:', kmeans.labels_)
print('kmeans_cluster_centers:', kmeans.cluster_centers_)

# viz the cluster
colormap = np.array(['red', 'blue'])
plt.scatter(X.mean_dist_day, X.mean_over_speed_perc, c= colormap[model.labels_], s = 40)
plt.title('KMeans Cluster')
plt.show()


# In[ ]:





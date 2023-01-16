# Heirarchial Clustering w Shot tracking data


# Importing the Libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

#Impoting the shot tracking dataset with pandas

shooting_dataset = pd.read_csv('Input_Final_2.csv')

X = shooting_dataset.iloc[:, [3,5,7,9]].values

#Using the dendrogram to find the optimal number of clusters
import scipy.cluster.hierarchy as sch
dendrogram = sch.dendrogram(sch.linkage(X,method = 'ward'))
plt.title('Dendrogram')
plt.xlabel('Players')
plt.ylabel('Euclidean Distances')
plt.show()

#Fitting hierarchial clustering to the shooting dataset
from sklearn.cluster import AgglomerativeClustering

hc = AgglomerativeClustering(n_clusters = 6, affinity= 'euclidean', linkage = 'ward')
y_hc = hc.fit_predict(X)

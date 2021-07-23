# Estate Price Predictor
AI course project that'll predict estate price by it's info like : location , area , rooms , ...
 
In this project we have Three column as input :
- X coordinate
- Y coordinate
- Price
 
That the **X coordinate** and **Y coordinate** are input and the **Price** is the output of the application
 
|    x    |    y    |  price   |
| :-----: | :-----: | :------: |
| 37.3081 | 49.5835 | 30000000 |
|   ...   |   ...   |   ...    |
 
---
 
![ui.jpeg](https://github.com/CenaAshoori/Estate-Price-Predictor/blob/main/doc/ui.jpeg)
![ui.jpg](https://github.com/CenaAshoori/Estate-Price-Predictor/blob/main/doc/ui.jpg)
---
 
We have data that store in csv format and with **Sklearn** library in python we going to read data with **Pandas** library and use this rows as input for **LinearRegression** class that is one of the **sklearn** libraries. and then this class makes a relation between the raws and the output of the data and the result is some rule that will help us to predict the unknown estate price.
 
```python
import pandas as pd
from sklearn.tree import DecisionTreeClassifier
from sklearn.linear_model import LinearRegression
 
estate_data = pd.read_csv("estate_all.csv")
input_data = estate_data.drop(columns = ['price'])
output_data = estate_data['price']
model = LinearRegression()
model.fit(input_data , output_data)
 
```
We want to this model predict the price of the estate so all the columns is input except the **price** column . and then we call fit method on the model and pass input and output to the model and it’ll create a relation between the input and the output, and then we have a model that can predict.
 
```python
model.predict([[x_test , y_test]])
```
---
And also we check in this application that if the input data wasn't close to our real data, we shouldn't predict that estate because of this prediction probably is not good estimation.
 
 ```python
 x = estate_data['x']
y = estate_data['y']

def is_possible(x_test,y_test):
    for i in range(len(x)):
        dist = ((x[i]-x_test)**2 + (y[i]-y_test)**2)**0.5
        p = estate_data["price"][i]
        if dist < 0.02 :
            print(dist)
            prediction = model.predict([[x_test , y_test]])
            print(prediction)
            # format the price and seperate with ","
            print("{:,}".format(int(prediction[0])))
            return True
    return False

is_possible(37.2665,49.5815)
 ```
---
 
The issue of this project is data because calculating data from those of sites that already have information about estate is almost impossible and they'll load data dynamically and use react to load data and because of that we should have crawler that can load dynamic objects.
 
---
 
 
 
 


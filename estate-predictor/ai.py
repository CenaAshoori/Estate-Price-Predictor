import pandas as pd
from sklearn.tree import DecisionTreeClassifier

estate_data = pd.read_csv("estate_all.csv")
input_data = estate_data.drop(columns = ['price'])
output_data = estate_data['price']
model = DecisionTreeClassifier()
model.fit(input_data , output_data)


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
            print(str(prediction[0])[::-1].replace('000','000,')[::-1])
            return True
            
    print("your test Coordinate is too far away from our data")
    return False

is_possible(33.9938,51.4367)
import pandas as pd
from sklearn.tree import DecisionTreeClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score

estate_data = pd.read_csv("estate.csv")
input_data = estate_data.drop(columns = ['price'])
output_data = estate_data['price']
in_train , in_test ,out_train , out_test = train_test_split(input_data , output_data , test_size=0.1)
model = DecisionTreeClassifier()
model.fit(in_train , out_train)
prediction = model.predict(in_test)
print("Accuracy:",accuracy_score(out_test, prediction))
print(prediction)
in_test
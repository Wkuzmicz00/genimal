from transformers import BertTokenizer, BertForSequenceClassification
import pandas as pd
import numpy as np

from sklearn.preprocessing import MinMaxScaler
from scipy.spatial import distance

from torch import nn

import os

class PersonalityClassifier():

    def check_personality(self, user_text):
        result_json = self._calculate_distances(user_text)
        result_json = self._calculate_percent(result_json)
        result_json = self._add_image_path(result_json)

        result_json = sorted(result_json, key=lambda x: float(x['percent']), reverse=True)
        return result_json[:5]

    def _calculate_distances(self, user_text) -> list:
        result = []

        personality = self._detect(user_text)
        personality = np.array(list(personality.values()))
        big_five_labels, big_five_data = self._big_five_standard()

        for i in range(len(big_five_data)):
            result.append({"name": big_five_labels[i], "distance": distance.cosine(big_five_data[i], personality)})
        
        return result

    def _add_image_path(self, data):
        for i in range(len(data)):
            path = os.path.abspath(f"./../ui/assets/animal_images/{data[i]['name'].lower()}.png")
            path = r"file:///" + path
            data[i]['image_path'] = path

        return data

    def _calculate_percent(self, data) -> list:
        max_distance = max(item["distance"] for item in data)

        for item in data:
            item["percent"] = str(round(((max_distance - item["distance"]) / max_distance) * 100, 2))
            del item["distance"]

        return data

    def _detect(self, text):
        tokenizer = BertTokenizer.from_pretrained("Minej/bert-base-personality")
        model = BertForSequenceClassification.from_pretrained("Minej/bert-base-personality")

        inputs = tokenizer(text, truncation=True, padding=True, return_tensors="pt")
        outputs = model(**inputs)
        predictions = outputs.logits.squeeze().detach().numpy()
        print(predictions)
        sigmoid = nn.Sigmoid()
        predictions = sigmoid(outputs.logits.squeeze()).detach().numpy()
        print(predictions)

        scaler = MinMaxScaler(feature_range=(0, 1))
        predictions_normalized = scaler.fit_transform(predictions.reshape(-1, 1)).squeeze()
        print(predictions_normalized)

        label_names = ['Extroversion', 'Neuroticism', 'Agreeableness', 'Conscientiousness', 'Openness']
        result = {label_names[i]: predictions_normalized[i] for i in range(len(label_names))}

        return result

    def _big_five_standard(self) -> tuple:
        big_five = pd.read_csv('data/animal_big_five.csv')
        big_five = np.array(big_five)
        big_five_labels = big_five[:,0]
        big_five_data = big_five[:,1:]
        big_five_data

        scaler = MinMaxScaler(feature_range=(0, 1))
        scaler.fit(big_five_data)
        big_five_data = scaler.transform(big_five_data)

        return (big_five_labels, big_five_data)




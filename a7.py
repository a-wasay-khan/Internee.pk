import pandas as pd
from nltk.sentiment import SentimentIntensityAnalyzer
import nltk
import matplotlib.pyplot as plt

data = pd.read_csv("company_reviews.csv")

print(data.head(5))
print(data.columns)  # <-- See what columns are available

# If reviews are in a column named "reviews", rename it:
data["feedback_text"] = data["description"].astype(str)

sia = SentimentIntensityAnalyzer()

# Apply sentiment scoring
data["compound_score"] = data["feedback_text"].apply(lambda x: sia.polarity_scores(x)['compound'])

# Classify as Positive / Neutral / Negative
def classify_sentiment(score):
    if score >= 0.05:
        return "Positive"
    elif score <= -0.05:
        return "Negative"
    else:
        return "Neutral"

data["sentiment"] = data["compound_score"].apply(classify_sentiment)

sentiment_counts = data['sentiment'].value_counts()
plt.bar(sentiment_counts.index, sentiment_counts.values)
plt.title("Intern Feedback Sentiment Distribution")
plt.xlabel("Sentiment")
plt.ylabel("Number of Feedbacks")
plt.show()

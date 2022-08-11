import json
import tweepy
import requests

def lambda_handler(event, context):
    CONSUMER_KEY = ""
    CONSUMER_SECRET = "" 
        
    ACCESS_TOKEN = ""  
    ACCESS_TOKEN_SECRET = "" 
        
    auth = tweepy.OAuthHandler(CONSUMER_KEY, CONSUMER_SECRET)
    auth.set_access_token(ACCESS_TOKEN, ACCESS_TOKEN_SECRET)
    twitter = tweepy.API(auth)
    
    URL = "https://zenquotes.io/api/today"
    response = requests.get(URL)
    if response.status_code == 200:
        data = response.json()
        tweet = data[0]['q'] + " - " +data[0]['a']
    post_tweet = twitter.update_status(tweet) 


    return {
        'body': json.dumps('tweet sent')
    }

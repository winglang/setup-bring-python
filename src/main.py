from wing import *

def handler(event, context):
  print(event)
  print(context)

  payload = from_function_event(event)
  
  client = lifted("store")
  client.put("my-key", payload)
  
  return {
    "statusCode": 200,
    "body": "Hello!"
  }

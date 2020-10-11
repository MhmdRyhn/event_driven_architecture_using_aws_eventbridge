import json

import boto3


def lambda_handler(event, context):
    client = boto3.client('events')
    event_to_put = {
        "source": "aws-lambda-function"
    }
    event_to_put.update(**event)
    response = client.put_events(
        Entries=[
            {
                'Source': 'learn.eventbridge',
                'Detail': json.dumps(event_to_put),
                'DetailType': 'Learning Eventbridge',
                'EventBusName': 'default'
            },
        ]
    )
    return {
        'statusCode': 200,
        'body': json.dumps(response)
    }

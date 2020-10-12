import json
import os
import uuid
from datetime import datetime

import boto3


def lambda_handler(event, context):
    try:
        app_name = os.environ['app_name']
        environment = os.environ['environment']
        dynamodb_table_name = os.environ['dynamodb_table_name']
    except KeyError as ex:
        return {
            'statusCode': 500,
            'body': json.dumps('Environment variable `{}` not set.'.format(str(ex)))
        }
    resource = boto3.resource("dynamodb")
    table = resource.Table('{}-{}-{}'.format(app_name, environment, dynamodb_table_name))
    if event.get('source') == 'learn.eventbridge':
        try:
            response = table.put_item(
                Item={
                    'id': str(uuid.uuid4()),
                    'created_at': datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
                    'data': event['detail']
                }
            )
            return {
                'statusCode': 200,
                'body': json.dumps('Event detail has been saved into DynamoDB table successfully.')
            }
        except KeyError as ex:
            return {
                'statusCode': 500,
                'body': json.dumps('Key `{}` is not found in the event.'.format(str(ex)))
            }
        except Exception as ex:
            return {
                'statusCode': 500,
                'body': json.dumps(str(ex))
            }
    return {
        'statusCode': 403,
        'body': json.dumps('Event generated from unexpected source.')
    }

import json
import uuid
from datetime import datetime

import boto3


def lambda_handler(event, context):
    resource = boto3.resource("dynamodb")
    table = resource.Table("test-table")
    if event['source'] == 'learn.eventbridge':
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
        except KeyError:
            return {
                'statusCode': 500,
                'body': json.dumps('`detail` key is not found in `event`')
            }
        except Exception as ex:
            return {
                'statusCode': 500,
                'body': json.dumps(str(ex))
            }

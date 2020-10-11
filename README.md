# Event Driven Architecture Using AWS EventBridge
This repo demonstrates how services interact with each other using AWS EventBridge. For demo purpose, we are considering 
AWS Lambda functions as different services. When an EventBridge sits between services, this makes the application more 
distributed. The system implemented here does the following:

One Lambda function will put some events in an AWS EventBridge's event bus. There are some rule that matches the event 
and route the matched event to the target(s), in this case another Lambda function. 


# Deploying the infrastructure
To deploy the code and infrastructure, just execute the **build.sh** script (`./build.sh`). Make sure the script has the 
executable permission. Before executing, allow the script the executable permission by running `sudo chmod +x build.sh`

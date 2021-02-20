import sys
import datetime

message = f"Hello GreenGrass! Current time: {str(datetime.datetime.now())}."

# Print the message to stdout.
print(message)

# Append the message to the log file.
with open('/tmp/Greengrass_HelloWorld.log', 'a') as f:
    print(message, file=f)

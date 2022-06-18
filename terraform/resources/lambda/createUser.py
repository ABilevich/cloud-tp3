def main (event, context):
	print ("In lambda handler")

	resp = {
		"statusCode": 200,
		"headers": {
			"Access-Control-Allow-Origin": "*",
		},
		"body": "Hortz es el único"
	}

	return resp
def handler(event, context):
	resp = {
		"statusCode": 200,
		"headers": {
			"Access-Control-Allow-Origin": "*",
		},
		"body": "Hortz >> Hertz"
	}

	return resp
package main

import (
	"context"
	"fmt"
	"lambda/logger"
	"log"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
)

func handler(ctx context.Context, request events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
	log.Println("Lambda hit via API Gateway")
	logger.CwDispatch("-> Log to custom CloudWatch log group")
	return events.APIGatewayProxyResponse{
		StatusCode: 200,
		Body:       fmt.Sprintf("Hello from Lambda!"),
	}, nil
}

func main() {
	lambda.Start(handler)
}

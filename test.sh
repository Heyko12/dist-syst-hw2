#!/bin/sh

java -jar /app.jar &
sleep 5

echo "Testing PUT /put"
put_response=$(curl -s -X POST "http://localhost:8080/put?key=testKey&value=testValue")
if [ "$put_response" != "Value saved" ]; then
    echo "PUT test failed. Expected \"Value saved\", got: \"$put_response\""
    exit 1
fi
echo "PUT test passed"

echo "Testing GET /get"
get_response=$(curl -s -X GET "http://localhost:8080/get?key=testKey")
if [ "$get_response" != "testValue" ]; then
    echo "GET test failed. Expected \"testValue\", got: \"$get_response\""
    exit 1
fi
echo "GET test passed"

wait
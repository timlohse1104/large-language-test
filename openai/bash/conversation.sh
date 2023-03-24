#!/bin/bash

# $1: Conversation message

if [ -z "$1" ]
then
    echo "No message was provided." >&2
    exit 1
else
    curl https://api.openai.com/v1/chat/completions \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $OPENAI_API_KEY" \
        -d '{
            "model": "gpt-3.5-turbo",
            "messages": [{"role": "user", "content": "'"$1"'"}],
            "temperature": 0.7
        }'
fi
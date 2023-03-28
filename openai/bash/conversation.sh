#!/bin/bash

# $1: Conversation message

# Set api key and input params
MODEL_ENGINE="gpt-3.5-turbo"
STOP_COMMAND="#stop"

echo "--------------------- NEW CHAT ---------------------"

# Start chat with OpenAI model
while true; do
  read -p "You: " INPUT_TEXT
  if [[ "$INPUT_TEXT" == "$STOP_COMMAND" ]]; then
    echo "Stopping chat..."
    break
  fi

  # Call OpenAI api to receive a response
  RESPONSE=$(curl https://api.openai.com/v1/chat/completions \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $OPENAI_API_KEY" \
        -d '{
            "model": "gpt-3.5-turbo",
            "messages": [{"role": "user", "content": "'"$INPUT_TEXT"'"}],
            "temperature": 0.7
        }')

    echo "$RESPONSE"
  # Extract api answer and prompt it
  ANSWER=$(echo "$RESPONSE" | jq -r '.choices[0].message.content')
  echo "AI: $ANSWER"
done

echo "----------------------------------------------------"
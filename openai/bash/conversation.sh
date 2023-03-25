#!/bin/bash

# $1: Conversation message

# Set api key and input params
MODEL_ENGINE="gpt-3.5-turbo"
MODEL_PROMPT="Moin, lass quatschen."
STOP_COMMAND="#stop"

echo "--------------------- NEW CHAT ---------------------"

# Starten Sie den Chat mit dem OpenAI-Modell
while true; do
  read -p "You: " INPUT_TEXT
  if [[ "$INPUT_TEXT" == "$STOP_COMMAND" ]]; then
    echo "Stopping chat..."
    break
  fi

  # Rufen Sie die OpenAI-API auf, um eine Antwort zu erhalten
  RESPONSE=$(curl https://api.openai.com/v1/chat/completions \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $OPENAI_API_KEY" \
        -d '{
            "model": "gpt-3.5-turbo",
            "messages": [{"role": "user", "content": "'"$INPUT_TEXT"'"}],
            "temperature": 0.7
        }')

    echo "$RESPONSE"
  # Extrahieren Sie die Antwort aus der API-Antwort und geben Sie sie aus
  ANSWER=$(echo "$RESPONSE" | jq -r '.choices[0].message.content')
  echo "AI: $ANSWER"
done

echo "----------------------------------------------------"
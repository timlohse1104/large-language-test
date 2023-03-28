# large-language-test

Testing repo to experiment with large language models.

## Prerequisites

- Set openai api key
  `export OPENAI_API_KEY="<openai_api_key>`

## Versions

### Bash

#### Prerequisites

- Install jq
  `brew install jq` or `apt-get install jq`

#### Usage

1. Start conversation
   `bash ./openai/bash/conversation`

2. Chat with ai
   `You: <your_input>`

3. Receive ai response
   `AI: <ai_response>`

4. End conversation
5. `You: #stop`

### JavaScript

#### Prerequisites

- Install Node.js

#### Usage

1. Start conversation
   `node ./openai/js/conversation.js`

2. Chat with ai
   `You: <your_input>`

3. Receive ai response
   `AI: <ai_response>`

4. End conversation
   `You: #stop`


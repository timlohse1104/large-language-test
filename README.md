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

2. Customize chat
   `Do you want to modify the chat? (y/n): y`
   If `n` is selected the chat begins without customization.

3. Customize system behaviour
   `What do you want the chat to be?: `
   E.g. `Always answer in german with bavarian accent.`, the AI will always follow those rules.

4. Customize answer temperature
   `Enter the desired temperature (0-5, default: 0.5): `
   E.g. `0`, the following chat will be nearly deterministic. `5`, the chat will be very random.

5. Chat with ai
   `You: <your_input>`

6. Receive ai response
   `AI: <ai_response>`

7. End conversation
   `You: #stop`


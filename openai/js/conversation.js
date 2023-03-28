import { Configuration, OpenAIApi } from 'openai';
import readline from 'readline';

const MODEL_ENGINE = 'gpt-3.5-turbo';
const STOP_COMMAND = '#stop';
let SYSTEM_CONFIG = '';
let TEMPERATURE = 0.5;

// Set up OpenAI API client
const configuration = new Configuration({
  apiKey: process.env.OPENAI_API_KEY,
});
const openai = new OpenAIApi(configuration);

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

// Configure chat with the OpenAI model
async function configureChat() {
  return new Promise((resolve) => {
    rl.question('Do you want to modify the chat? (y/n): ', (configInput) => {
      if (configInput === 'y') {
        // Configure SYSTEM_CONFIG
        rl.question('What do you want the chat to be?: ', (input) => {
          if (input) {
            SYSTEM_CONFIG = input;
          }
          // Configure TEMPERATURE
          rl.question('Enter the desired temperature (0-5, default: 0.5): ', (tempInput) => {
            if (tempInput) {
              const temp = parseFloat(tempInput);
              if (!isNaN(temp) && temp >= 0 && temp <= 5) {
                TEMPERATURE = temp;
                console.log('Temperature set to ' + temp + '.');
              } else {
                console.log('Invalid temperature value. Using default temperature 0.5.');
              }
            }
            resolve();
          });
        });
      } else if (configInput === 'n') {
        console.log('Using default chat configuration...');
        resolve();
      } else {
        console.log('Invalid input. Please enter y or n.');
        configureChat().then(resolve);
      }
    });
  });
}

// Start chat with the OpenAI model
async function startChat() {
  await configureChat();
  console.log('--------------------- NEW CHAT ---------------------');
  chatLoop();
}

function chatLoop() {
  rl.question('You: ', async (input) => {
    if (input === STOP_COMMAND) {
      console.log('Stopping chat...');
      console.log('----------------------------------------------------');
      rl.close();
    } else if (input) {
      // Call the OpenAI API to get a response
      const completion = await openai.createChatCompletion({
        model: MODEL_ENGINE,
        messages: [
          { role: 'system', content: SYSTEM_CONFIG },
          { role: 'user', content: input },
        ],
        n: 1,
        stop: STOP_COMMAND,
        temperature: TEMPERATURE,
      });

      const ANSWER = completion.data.choices[0].message.content.trim();
      console.log(`AI: ${ANSWER}`);

      // Prompt for next input
      chatLoop();
    } else {
      chatLoop();
    }
  });
}

startChat();


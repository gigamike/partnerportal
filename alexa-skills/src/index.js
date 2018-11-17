'use strict';
const request = require('request');
const Alexa = require("alexa-sdk");

exports.handler = function(event, context, callback) {
  const alexa = Alexa.handler(event, context);
  alexa.registerHandlers(handlers);
  alexa.execute();
};

/*
* https://github.com/MerryOscar/voice-devs-lessons/blob/master/04-complex-conversations/lambda/index.js
*/
const handlers = {
  'NewSession': function () {
    this.emit(':ask', 'Hello Mik Galon, Welcome to Partner Portal Alexa Skills App By Gigamike. You can ask me to shop and add it on your partner portal cart. Would you like to shop?', 'You can ask me to shop and add it on your partner portal cart. Would you like to shop?');
  },
  'LaunchRequest': function () {
    this.emit(':ask', 'Hello Mik Galon, Welcome to Partner Portal Alexa Skills App By Gigamike. You can ask me to shop and add it on your partner portal cart. Would you like to shop?', 'You can ask me to shop and add it on your partner portal cart. Would you like to shop?');
  },
  'SearchCaptureIntent': function () {
    var url = `https://hackathon.gigamike.net/api/search?keyword=Tide%2520Liquid%2520Detergent`;
    request.get(url, (error, response, body) => {
      this.emit(':ask', 'Item found. How many you want to order?', 'Item found. How many you want to order?');
    });
  },
  'AddCartCaptureIntent': function () {
    var url = `https://hackathon.gigamike.net/api/cart-add?user_id=13&product_id=26&quantity=1`;
    request.get(url, (error, response, body) => {
      this.emit(':ask', 'Item added! Would you like to shop more?', 'Item added! Would you like to shop more?');
    });
  },
  'HelloWorldIntent': function () {
    this.emit('SayHello');
  },
  'SayHello': function () {
    this.response.speak('Hello Partner Portal Alexa Skills App By Gigamike.');
    this.emit(':responseReady');
  },
  'AMAZON.HelpIntent': function () {
    const speechOutput = 'This is the Partner Portal Alexa Skills App By Gigamike.';
    const reprompt = 'Say hello, to hear me speak.';

    this.response.speak(speechOutput).listen(reprompt);
    this.emit(':responseReady');
  },
  'AMAZON.CancelIntent': function () {
    this.response.speak('Goodbye!. Thankyou for using Partner Portal App By Gigamike.');
    this.emit(':responseReady');
  },
  'AMAZON.StopIntent': function () {
    this.response.speak('See you later!. Thankyou for using Partner Portal Alexa Skills App By Gigamike.');
    this.emit(':responseReady');
  }
};

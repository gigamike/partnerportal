/*
const http = require('http');

var options = {
  host: 'aws2018.gigamike.net',
  path: '/api-videos/?order=upload_date&direction=DESC&limit=1'
}
var request = http.request(options, function (res) {
  var data = '';
  res.on('data', function (chunk) {
    data += chunk;
  });
  res.on('end', function () {
    var video = JSON.parse(data);
    console.log(video);
    console.log(video[0]['id']);
  });
});
request.on('error', function (e) {
    console.log(e.message);
});
request.end();
*/

const request = require('request');
const url = `http://aws2018.gigamike.net/api-videos/?order=upload_date&direction=DESC&limit=1`;
request.get(url, (error, response, body) => {
 var video = JSON.parse(body);
 var videoId = video[0]['id'];
 console.log("https://s3.amazonaws.com/vlogpress-output/" + videoId + "/mpeg-dash4-8");
});

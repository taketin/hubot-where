# Description:
#   where is hubot?
#
# Commands:
#   hubot where?
spawn = require('child_process').spawn

module.exports = (robot) ->
  robot.respond /where\?$/i, (msg) ->
    cli_talk = spawn('hostname')
    cli_talk.stdout.on 'data', (data) ->
      msg.send "I'm at "+data
    cli_talk.stderr.on 'data', (data) ->
      console.log('cli_talk stderr: ' + data)
      msg.send data+''

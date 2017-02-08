# Assassin-ruby
Ruby script for playing the game assassin via Google forms and Slack. Simplay allows all potential players to add a weapon, location and their Slack tag to the ppol. Script then shuffles these fields and will post a private message to each user with their 'target' and contract.

Comprehensive rules for assassin can be found here:

https://en.wikipedia.org/wiki/Assassin_(game)

The script can be setup to print the list of contracts to the console in case of human failure, or to run silently (allowing the organiser to take part in ther game should they choose to).

## Requirements

You will need Ruby installed on the machine you wish to run this on. You will also need a valid Google account with Drive access. Finally all participants will need a valid slack account with appropriate '@' tags in order to receive their contract (the concept could be easily adapted to work with emails, should you wish to not use Slack).

## Setup

You will need to either copy or create your own Google form like this example: https://goo.gl/forms/WdTw1whiTgg4QfmM2

The names of the fields doesn't matter however the **order** does.

Before you run the script, you will need to adjust the hook field and ws field with the appropriate headers.

The hook field requires a Slack webhook integration. Details on setting one of these up can be found here:
https://api.slack.com/incoming-webhooks

The ws field will require the **ID** of the Google sheet that is created by the signup form. This can be found in the URL of the sheet like this:

https://docs.google.com/spreadsheets/d/**{id}**/edit#gid=...

Copy and poaste the appropriate ID string into your script.

The program works through use of the powerful "google_drive" gem, information on which can be found here: https://github.com/gimite/google-drive-ruby. On first run, the generate.rb script will attempt to sort access permissions with your drive account, and store it in a config file . Run the script and follow thew onscreen instructions from there. After this has been done, the script should work on each subsequent running.

Please note you will manually have to clear out the form spreadsheet each time you wish to run a new game.

Have fun!

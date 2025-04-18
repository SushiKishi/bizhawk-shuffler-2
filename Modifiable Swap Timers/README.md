# Modifiable Swap Timers

## Plugin for Bizhawk Shuffler 2

This plugin allows you to change the minimum and maximum swap timers during a Shuffler game without having to close/restart your session to go back to the settings screen. The most likely use for this is as a donation incentive or other viewer interaction. For example, at the start of stream, games may swap every 30-60 seconds. For every $X viewers donate, or Y followers, or Z whatevers, the timers can slowly tic down so that the games swap faster and faster.

Please note that the plugin cannot actually handle interacting with your Twitch, YouTube, or any other chat or bot. It is up to you to create chat commands or whatever is needed for your bot to generate a simple text file containing the number of seconds you desire. This plugin will simply read those text files and feed the information to the Bizhawk Shuffler.

## Instructions

[Download the most recent version here.](https://github.com/SushiKishi/bizhawk-shuffler-2/raw/refs/heads/releases/Modifiable%20Swap%20Timers/Modifiable%20Swap%20Timers%20v1.00.zip) (v1.00)

*In your Chat Bot or other similar software*
1. Set up an an action to create two text files for the plugin. Each text file should contain only one thing: either the minimum or the maximum number of seconds you want between game swaps. These files can be saved anywhere on your computer, so long as you know where to find them later.

Online or cloud-based chat bots probably can't do this, though if you know of examples to the contrary, let me know. I haven't used cloud-based bots because I need local file interaction for things like this so I'm out of the loop. If you're looking for recommendations, Mix It Up and Firebot are two good options that I've used, and their support channels on Discord have been very friendly and helpful.

*In Bizhawk Shuffler*
1. Download the most recent version, or any of the versions listed above.
2. Extract the modified-shuffle-timers.lua file into your Bizhawk Shuffler's plugins folder
3. Activate the plugin on the settings screen
4. Set both your minimum and maximum swap file timers inside the plugin settings.


## FAQs

Q: What happens if my minimum and maximum times are the same/reversed/0?
A: The plug-in will swap them around as needed. If the timers are the same, the Shuffler will simply shuffle at the same interval each time.  If you set either time to 0, then on a 0-second swap, the game will swap, well instantly. Setting both numbers to 0 is unplayable and not for the photosensitive.

Q: I got an error.
A: I tried to add error messages to help explain what happened. Check the lua console.

Q: I got an error and your error message wasn't helpful.
A: Post an issue or whatever it's called here on the Git, or send a *FRIENDLY* to @SushiKishi on the social media platform of your choice.

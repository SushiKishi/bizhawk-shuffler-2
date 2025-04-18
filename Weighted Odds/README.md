# Weighted Odds Shuffle

## Unofficial Mod for Bizhawk Shuffler 2

This is an **unofficial modification** for the Bizhawk Shuffler 2. It can't be replicated as a plugin*, and modifies the main code of the Shuffler directly.  This mod was last updated on 4/17/2025. If the Shuffler has been updated since then, then the latest version of the mod will not contain any of those updates.

It adds a Weighted Odds shuffler feature to the Shuffler. This can help the Shuffler to "feel" more random, even though it mathematically isn't.  The more swaps you go without playing a game, the more likely that game is to be chosen over time.

## Instructions

[Download the most recent version here.](https://github.com/SushiKishi/bizhawk-shuffler-2/raw/refs/heads/releases/Weighted%20Odds/Weighted%20Odds%20Shuffle%20v2025.04.17) (v2025.04.17)

*In Bizhawk Shuffler*
1. Download the most recent version, or any of the versions listed above.
2. Extact the files directly into your Bizhawk-shuffler-2 folder
		--This will overwrite your shuffler.lua and setupform.lua files, which contain the main code for the Shuffler.
3. Run the Shuffler as normal
4. Choose the Weighted Odds option as your Shuffle Order


## FAQs

Q: So how does this work?

A: Each game starts with one 'lottery ticket.' When a game is selected and played, it loses all of its tickets. When a game is NOT selected, it gains one ticket.  The Shuffler pulls a random number from all the assigned tickets to pick the next game.

If you are playing a 6 game Shuffler, and somehow by chance the games are picked exactly in order, then the odds of each game being chosen are as follows:
|        |                     | Shuffler Start | Swap 1: Game 1 | Swap 2: Game 2 | Swap 3: Game 3 | Swap 4: Game 4 | Swap 5: Game 5 |
|--------|---------------------|----------------|----------------|----------------|----------------|----------------|----------------|
| Game 1 | Random Shuffle Odds | 1/6 - ~16.6%   | None           | 1/10 - 10%     | 1/10 - 10%     | 1/10 - 10%     | 1/10 - 10%     |
|        | Weighted Odds       | 1/6 - ~16.6%   | None           | 1/13 - ~7.6%   | 2/15 - ~13.3%  | 3/16 - 18.75%  | 4/16 - 25%     |
| Game 2 | Random Shuffle Odds | 1/6 - ~16.6%   | 1/6 - ~16.6%   | None           | 1/6 - ~16.6%   | 1/6 - ~16.6%   | 1/6 - ~16.6%   |
|        | Weighted Odds       | 1/6 - ~16.6%   | 2/10 - 20%     | None           | 1/15 - ~6.7%   | 2/16 - 12.5%   | 3/16 - 18.75%  |
| Game 3 | Random Shuffle Odds | 1/6 - ~16.6%   | 1/6 - ~16.6%   | 1/6 - ~16.6%   | None           | 1/6 - ~16.6%   | 1/6 - ~16.6%   |
|        | Weighted Odds       | 1/6 - ~16.6%   | 2/10 - 20%     | 3/13 - ~23%    | None           | 1/16 - 6.25%   | 2/16 - 12.5%   |
| Game 4 | Random Shuffle Odds | 1/6 - ~16.6%   | 1/6 - ~16.6%   | 1/6 - ~16.6%   | 1/6 - ~16.6%   | None           | 1/6 - ~16.6%   |
|        | Weighted Odds       | 1/6 - ~16.6%   | 2/10 - 20%     | 3/13 - ~23%    | 4/15 - ~26.7%  | None           | 1/16 - 6.25%   |
| Game 5 | Random Shuffle Odds | 1/6 - ~16.6%   | 1/6 - ~16.6%   | 1/6 - ~16.6%   | 1/6 - ~16.6%   | 1/6 - ~16.6%   | None           |
|        | Weighted Odds       | 1/6 - ~16.6%   | 2/10 - 20%     | 3/13 - ~23%    | 4/15 - ~26.7%  | 5/16 - 31.25%  | None           |
| Game 6 | Random Shuffle Odds | 1/6 - ~16.6%   | 1/6 - ~16.6%   | 1/6 - ~16.6%   | 1/6 - ~16.6%   | 1/6 - ~16.6%   | 1/6 - ~16.6%   |
|        | Weighted Odds       | 1/6 - ~16.6%   | 2/10 - 20%     | 3/13 - ~23%    | 4/15 - ~26.7%  | 5/16 - 31.25%  | 6/16 - 37.5%   |


Q: I got an error.

A: You can post an Issue here on the git or send a friendly message/tag/ping to @SushiKishi on your social media platform of choice. Just know that there's not a lot that can be done in terms of getting you back to playing quickly other than using the official release of the Shuffler, and that their dev team and any support options available likely can't help you.

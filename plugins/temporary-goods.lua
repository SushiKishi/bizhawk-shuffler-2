local plugin = {}

plugin.name = "Temporary Goods"
plugin.author = "SushiKishi"
plugin.settings =
{
	
}

plugin.description =
[[
	The short version is that this plugin makes it easier for you to hotswap games into, out of, and then BACK INTO the Shuffler game list. If a game's filename begins with "_TempGoods_." (i.e. _TempGoods_Donkey Kong.nes), then even if you hit the "complete game" hotkey, the Shuffler will -not mark it complete.-
    
    Why would mark a game complete if you don't want it to be marked completed by the Shuffler? Because you may want to take the game out of the game list 1) temporary, and 2) without having to alt-tab and manually move the file out of the game directory.

    Why would you want to remove a game from the game list temporary?  If the game is an incentive, i.e. "Donate $X to add one loop of Donkey Kong to the shuffler."  If you complete your one loop, then mark the game complete, you can't add Donkey Kong back to the game list unless you add Donkey Kong (Copy).nes to the folder.  Then Donkey Kong (Copy) (2).nes...you get the idea. This plugin works around all of that. Now, you can use the same hot key you use for other games to mark an incentive complete, and add the incentive back into the list easily, as well.
        
    If you would like the plugin to also put your Temporary Goods back -into- the game list automatically, it can do so, but you'll need to set up your StreamDeck / Twitch Bot / Trigger Deployment System of choice to output a text file to the <PluginFolder>\TempGoods\restore directory. The plugin will make this folder on first launch, or you can create it manually.
    
    On every Game Swap, the plugin will look in <Plugin Folder>\TempGoods\restore directory for any text files. It will attempt to load the file name saved on the first line of that file back into the game list. Using the same example, if you wanted to have a viewer interaction to add Donkey Kong.nes to the game list, the workflow from your bot should be as follows:

    --Your viewer redeems the rewards (donates, channel points, whatever)
    --Your bot saves a text file (with any file name, ending in .txt) to the <Plugin Folder>\TempGoods\restore\ directory, containing one line of text: 'Donkey Kong.nes' (without the quotations)
    --The next time the Shuffler swaps games, the plugin will check the \restore\ directory, find the text file, and attempt to move 'Donkey Kong.nes' back into your game directory (and handle the _TempGoods_ prefix too)
    --The plugin will force an update of the game list, then continue the game swap.

    The Plugin is set up so it won't add the same game to the Game List twice, so you can use the same Twitch/Bot/Whatever command to add the game back to the game list -and- keep a count of the amount of redemptions, e.g.:

    --Twitch Command outputs text file to add Donkey Kong.nes to the game list
    --Same command adds +1 to your "Donkey Kong Loops" counter
    --If this command is run twice back-to-back, you'll get 2 loops on the tracker, but only one Donkey Kong game in your game list.

    
]]


function plugin.on_setup(data, settings)
    
    --initialize some variables
    data.LastGame = "No Last Game"
    data.TempGoodsDir = PLUGINS_FOLDER .. '/TempGoods'
    data.StorageDir = PLUGINS_FOLDER .. '/TempGoods/storage'
    data.RestoreDir = PLUGINS_FOLDER .. '/TempGoods/restore'
    
    
    --make directories
    make_dir(data.StorageDir)
    make_dir(data.RestoreDir)


end --end on_setup


--Fires when a game is marked complete, but *before the game is swapped out*
function plugin.on_complete(data, settings)

    --when a game is marked complete, save the game about to be marked complete
    data.LastGame = config.current_game

end --on_complete

--Fires *after a game is swapped out*
function plugin.on_game_load(data, settings)

    --OK, so the plugin doesn't -prevent- a game from being marked complete, it simply removes it from the completed game table for you
    --Because this happens after a game is marked completed, if the last game in the shuffler is a Temporary Good, it will still trigger the "Shuffler Complete!" text!
    if string.find(data.LastGame, '_TempGoods_') then
        table.remove(config.completed_games)
        

    end
	
    

end --end on_game_load

--Fires right before swapping games. Used to update the game list and restore TempGoods back to the game list.
function plugin.on_game_save(data, settings)

    

    local WorkingList = '__filelist.txt'
    local RestorationFiles = get_dir_contents(data.RestoreDir, data.TempGoodsDir .. '/' .. WorkingList, false)
    
    print(table.concat(RestorationFiles, '\n'))

    for _,filename in ipairs(RestorationFiles) do

        local extension = filename:match("%.[^.]+$")
        

        if extension == '.txt' then
            
            --local FileContents = io.open(data.RestoreDir .. '/' .. filename, "r")
            --local GameName = '/_TempGoods_' .. FileContents:read()
            --os.rename(data.StorageDir .. GameName, GAMES_FOLDER .. GameName)
            --os.remove(data.RestoreDir .. '/' .. filename) --remove the text file so we don't try to add the game again.

        end

    end -- end iterate over filenames
    
    


end --end on_game_save

return plugin

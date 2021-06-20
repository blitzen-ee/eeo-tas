## Preface
Everybody Edits: Offline (EEO) is a recreation of Everybody Edits (EE), adapted by Seb135 and LuciferX for singleplayer due to Adobe ending support for Flash.

## About
eeo-tas is a tool assisted speedrun client for ee-offline

## Features
## commands
* /fps: same as old command but now shows velocity
* /tick: toggle game ticks on or off 
* /state save <0-9>: save a game state
* /state load <0-9>: load a game state 
* /record start: start input recording
* /record end: stop input recording
* /loadtas: load a .eetas file for replay
* /playsegment: play the loaded .eetas file and freeze at the end 
* /playtas: play the loaded .eetas file

## Work flow
1. enter a world you want to create a TAS for. This can either be a campaign or custom level.
2. use the command /tick to toggle ticks off
3. reset the level with /reset
4. save the game state with /tas state save
5. start recording inputs with /tas start. increment the game tick by tick with shift + C
	a. if you mess up, reload the game state with /tas state load 
	b. clear the input buffer with another /tas start 
6. when you get a good segment, enter /tas end to stop the recording. This will prompt you to save a file (.eetas).
7. repeat this process until you've recorded all the segments for a level.
8. combine the .eetas files in a text editor.
9. re-enter the level you created a tas for.
10. enter /tas load. This will prompt you to enter a .eetas file to replay.
11. enter /tas play to replay your inputs!
12. ???
13. profit

## Dev Notes
* commands are implemented in UI2.as
* State/PlayState.as:tick controls game ticks

### Save States
### .eetas file 

## Known Issues
* RNG related events aren't consistent when reloading a state
* loading doesn't reload coins collected 
* lava, poison, curses work on realtime not ticks
* save states kind of work? there are more internal values that need to be saved!

## Future work 
* better UI for creating TAS
* real time input recording

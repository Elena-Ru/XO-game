# XO-game
 Tic-tac-toe game with 3 modes: 
 - game with AI
 - game with second person
 - "blind" game with AI
 
 Gameboard size 3x3 cells.
 
![mainView](https://user-images.githubusercontent.com/10026372/210193419-4d1c0e37-6ca7-4343-b393-343bdfe20dc7.jpg)

___________________________
If your choice was "game with AI", the gameboard view will appear. 
At this mode human always start first with X.
Label displays the name of the player, who should make a turn, at the left top corner.

After human turn the AI puts O in one of the possible cell.
Before every turn the game checks if there is a 🏆. In this case the label with result displays on the game view.

If you want to restart game, you should tap on "Restart" button. 

![gameAI](https://user-images.githubusercontent.com/10026372/210194883-963e9078-da4e-4dac-b145-6f0f6bf94382.jpg)

___________________________
In "Game for 2" mode Player with Х-mark always start first. Then the second Playeyr should make his turn with O-mark. 

![gameFor2](https://user-images.githubusercontent.com/10026372/210195158-fca87530-6428-4c27-af17-e9ad14d0ba0a.jpg)

___________________________

In "Blind game" mode first player put on the gameboard 5 Х-marks, then second player do it with O-marks.

![startBlind](https://user-images.githubusercontent.com/10026372/210195665-70984c90-0b93-4eba-b521-dda2ef9c672b.jpg)

Then game start with already set turns of the players. You need to tap on the "Green Arrow" button at the top right corner to provide turn-by-turn game.

If the cell is the same for both players, the current turn player mark will be displayed (cell (2,2) in view 3).
![blindGame1](https://user-images.githubusercontent.com/10026372/210196039-cbd0d90c-16ed-4c79-b299-75343a4b0e13.jpg)

![blindGame2](https://user-images.githubusercontent.com/10026372/210197292-dcbee6c3-b91d-4895-80d6-4981b5dff5a0.jpg)

If all marks already set and there is no winner, the game will continue in "Game for 2" mode. It means that players should set their mark turn-by-turn. 

![noWinner](https://user-images.githubusercontent.com/10026372/210197646-17f1cfc3-2227-4c9e-9af7-2b8bebc8056d.jpg)

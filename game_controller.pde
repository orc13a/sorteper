// Which player's turn it is (index in allPlayers array) 
int playersTurnIndex = 0;
// Which player the player is gonna pick a card from (index in allPlayers array) 
int playerPickFromIndex = 1; // Always one more then playersTurnIndex to get the next player in the array
// What round it is
int gameRound = 1;

// Function that controls the game itself
void game() {
  // Set background
  gameBackgroundImage.resize(width, height);
  image(gameBackgroundImage, (width / 2), (height / 2));
  
  if (nextPlayerAlert == true) {
    nextPlayer();
  }
  
  // Whitch player's turn it is
  Player playersTurn = allPlayers.get(playersTurnIndex);
  // Which player the player is gonna pick a card from
  Player playerPickFrom = allPlayers.get(playerPickFromIndex);
  
  // Checks and sets playerPickFromIndex to next opponet with cards in their hand
  if (playerPickFrom.finish == true && playerPickFrom.cards.size() == 0) {
    // While playerPickFrom has no cards and is not playersTurn, then will we go on to the next player
    while (playerPickFrom.finish == true && playerPickFrom.cards.size() == 0 && playerPickFromIndex != playersTurnIndex) {  
      playerPickFrom = allPlayers.get(playerPickFromIndex);
      
      // If we have been througt all the players do we start over
      if (playerPickFromIndex == (playersAmount - 1)) {
        playerPickFromIndex = 0;
      } else {
        playerPickFromIndex++;
      }
    }
  }
  
  // Game mecanichs that should only be displayed if the game is not paused or anything like that
  if (nextPlayerAlert == false) {
    // Checks if the gmae should display only players hand or also an opponets hand
    if (gameRound == 1) {
      playersTurn.displayHandFront(playersTurn);
    } else {
      playerPickFrom.displayHandBack(playerPickFrom);
      playersTurn.displayHandFront(playersTurn);
    }
    
    pairSelect(playersTurn);
  }
  
  // Display the game UI (user interface)
  gameUI(playersTurn);
}

void mousePressed() {
  // Whitch player's turn it is
  Player playersTurn = allPlayers.get(playersTurnIndex);
  // Which player the player is gonna pick a card from
  Player playerPickFrom = allPlayers.get(playerPickFromIndex);
  
  if (nextPlayerAlert == false) {
    nextPlayerButtonPress();
    
    for (int i = 0; i < playersTurn.cards.size(); i++) {
      Card card = playersTurn.cards.get(i);
      card.handSelect();
    }
  }
  
  if (nextPlayerAlert == true) {
    nextPlayerButtonPressed();
  }
}

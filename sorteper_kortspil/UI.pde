void gameUi(Player spillersTur) { // UI = user interface
  //Player spiller = alleSpillere.get(playersTurn);
  Player spiller = spillersTur;

  // Viser hvilkens spillers tur det er
  fill(owOrange);
  stroke(owOrange);
  rect(190, 60, 300, 60, 10, 10, 0, 0);
  
  fill(255);
  stroke(owOrange);
  strokeWeight(2.5);
  rect(190, 85, 300, 50, 10, 10, 10, 10);
  
  fill(0);
  textAlign(LEFT);
  textSize(16);
  text("Spiller", 50, 52);
  
  textSize(25);
  text(spiller.username, 50, 95);
  textAlign(CENTER);
  //--
  
  // Viser spillerens antal par
  
  //--
}

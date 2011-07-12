// MintDuino NoteBook 1 – Reflex Game version 7.0
int ledGameLight = 7;  //Digital Pin 7 for LED anode connection
int ledPlayer1 = 5;    //Digital Pin 1 for Player 1 LED
int ledPlayer2 = 6;    //Digital Pin 2 for Player 2 LED
int button1 = 4;       //Digital Pin 4 for Player 1 button
int button2 = 3;       //Digital Pin 5 for Player 2 button
int state2 = 0;
int state1 = 0;
int ledWait = 5000;    //Wait time will be a minimum of 5 seconds

void setup() {
  pinMode(ledGameLight, OUTPUT);
  pinMode(ledPlayer1, OUTPUT);
  pinMode(ledPlayer2, OUTPUT);
  pinMode(button1, INPUT); // is this needed?
  pinMode(button2, INPUT); // is this needed?
  randomSeed(analogRead(1)); //use Analog Pin 1 to generate a random number
}

void loop(){
  state2 = digitalRead(button2);    // Read the state of the pushbutton value

  if (state2 == HIGH) {     // Check if the pushbutton is pressed
    digitalWrite(ledPlayer1, LOW);    // Turn LED off:    
    digitalWrite(ledPlayer2, LOW);    // Turn LED off:    
    delay (2000);
    beginGame();     

  } 
  else {
    // turn LED off:
    digitalWrite(ledPlayer1, HIGH);    // Turn LED on
    digitalWrite(ledPlayer2, HIGH);    // Turn LED on    
  }
}
void beginGame(){     // Only called when the button state is HIGH (pressed)

  // three fast blinks
  for (int count = 0; count < 3; count++) {
    digitalWrite(ledGameLight, HIGH);
    delay(500);
    digitalWrite(ledGameLight, LOW);
    delay(500);
  }

  // Now generate a wait time before Game Light turns on
  ledWait = 5000;  //reset value to minimum of 5 seconds
  ledWait = ledWait + random(5000); // add random value 0-5000 milliseconds

  //Turn on Game Light after Wait Time expires
  delay(ledWait);
  digitalWrite(ledGameLight, HIGH);
  delay(100);
  digitalWrite(ledGameLight, LOW);

  int gameOver = 0;

  while (!gameOver) {
    //determine which player button was pressed first
    int button1State = digitalRead(button1);
    int button2State = digitalRead(button2);

    if (button1State != button2State) {

      delay(5); // pause, then take another reading
      if (button1State == HIGH && digitalRead(button1) == HIGH) {
        Player1Win();
        gameOver = 1;
      }

      if (button2State == HIGH && digitalRead(button2) == HIGH) {
        Player2Win();
        gameOver = 1;
      }
    } 
    else {
      if (button1State == HIGH && button2State == HIGH) {
        // tie
        itsATie();
        gameOver = 1;
      }
    }

  }

  // Start game over

}

// Tie
void itsATie() {
  
  for (int i = 0; i < 3; i++) {
    digitalWrite(ledPlayer1, HIGH);
    digitalWrite(ledPlayer2, HIGH);
    delay(250);
    digitalWrite(ledPlayer1, LOW);
    digitalWrite(ledPlayer2, LOW);
    delay(250);
  }
}

// Player 1 won, light its LED
//
void Player1Win() {
  digitalWrite(ledPlayer1, HIGH);
  digitalWrite(ledPlayer2, LOW);
  delay(4000);
  digitalWrite(ledPlayer1, LOW);
}

// Player 2 won, light its LED
//
void Player2Win() {
  digitalWrite(ledPlayer2, HIGH);
  digitalWrite(ledPlayer1, LOW);
  delay(4000);
  digitalWrite(ledPlayer2, LOW);
}










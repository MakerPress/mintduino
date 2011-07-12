// MintDuino NoteBook 1 – Sub-Task 4

int ledPin = 7;  // Digital Pin 7 for LED anode connection
int ledPlayer1 = 5;
int ledPlayer2 = 6;
int button1 = 4;
int button2 = 3;

void setup() {
  pinMode(ledPin, OUTPUT);
  pinMode(ledPlayer1, OUTPUT);
  pinMode(ledPlayer2, OUTPUT);
}
void loop() {
  int state1 = digitalRead(button1);
  if (state1 == HIGH) {  // determine when button is pressed
    lightLED1(); // if button is pressed, call the lightLED function 
  }
  int state2 = digitalRead(button2);
  if (state2 == HIGH) {
    lightLED2();
  }
}

void lightLED1(){  // only called when the button state is HIGH (pressed)
  digitalWrite(ledPlayer1, HIGH);
  delay(1000);
  digitalWrite(ledPlayer1, LOW);

}

void lightLED2(){  // only called when the button state is HIGH (pressed)
  digitalWrite(ledPlayer2, HIGH);
  delay(1000);
  digitalWrite(ledPlayer2, LOW);
}
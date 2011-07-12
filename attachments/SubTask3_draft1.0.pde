// MintDuino NoteBook 1 – Sub-Task 3

int ledPin = 7; // Digital Pin 7 for LED anode connection
int button = 4; // Use pin 4 for the button

void setup() {
    pinMode(ledPin, OUTPUT);
    digitalWrite(ledPin, LOW);
}

void loop() {
   int state = digitalRead(button);
   if (state == HIGH) { // determine if button is pressed or not
     lightLED();        // if it is, light the LED
   }
}

void lightLED(){ // only called when the button state is HIGH (pressed)
  digitalWrite(ledPin, HIGH);
  delay(1000);
  digitalWrite(ledPin, LOW);
}

// MintDuino NoteBook 1 – Sub-Task 1
int ledPin = 7;  //Digital Pin 7 for LED anode connection
void setup() {
         pinMode(ledPin, OUTPUT);
}
void loop() {
        digitalWrite(ledPin, HIGH);
        delay(250);
        digitalWrite(ledPin, LOW);
        delay(250);
}

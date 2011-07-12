// MintDuino NoteBook 1 – Sub-Task 2
int ledPin = 7;         // Digital Pin 7 for LED anode connection
int ledWaitMin = 2000;  // Set minimum wait time to 2000 milliseconds

void setup() {

    // use noise on pin 1 to generate a random number
    randomSeed(analogRead(1));

    pinMode(ledPin, OUTPUT);
}
void loop() {

    // add random time of 0-5 seconds
    int ledWait = ledWaitMin + random(5000);

    // three fast blinks
    for (int count = 0; count < 3; count++) {
        digitalWrite(ledPin, HIGH);
        delay(250);
        digitalWrite(ledPin, LOW);
        delay(250);
    }

    delay(ledWait);  // random amount of time passes
    digitalWrite(ledPin, HIGH);

    delay(2000); // wait 2 seconds after random lighting
    digitalWrite(ledPin, LOW);

    delay(5000);    // wait 5 seconds before resetting
}

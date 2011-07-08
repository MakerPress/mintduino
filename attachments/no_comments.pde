int ledPin = 7;
void setup() {
	 pinMode(ledPin, OUTPUT);
}
void loop() {
	digitalWrite(ledPin, HIGH);
	delay(250);
	digitalWrite(ledPin, LOW);
	delay(250);
}


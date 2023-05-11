// SCUFFED DEVELOPMENT - Demo 3 - v0.4
// SIMULATION OF WHAT A COMPLETE SYSTEM W/ THE ARDUINO WOULD PRODUCE
// Situation of Simulation - One-way parking lot: One way in/One way out

// Initiates pins on Arduino to read trig and echo data
const int trig_pin = 9;
const int echo_pin = 10;

// Variables for duration and distance
long duration, distance;
int parking_count = 0;

// If the distance is less than a specific parameter in cm, car passed by
void detect_car_in(long distance) {
   if (distance < 45)
       parking_count = parking_count + 1;
}

void detect_car_out(long distance) {
   if (distance < 45)
       parking_count = parking_count - 1;
}

// Sets up pins to take input and produce output
void setup() {
  pinMode(trig_pin, OUTPUT); 
  pinMode(echo_pin, INPUT);
  Serial.begin(9600);
}

// Loops forever
// Calculates the distance an object is from the sensor
// Prints distance to serial monitor
void loop() { 
  digitalWrite(trig_pin, LOW);
  delayMicroseconds(2);
  digitalWrite(trig_pin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trig_pin, LOW);

  // How long echo takes to echo off object and return to sensor
  duration = pulseIn(echo_pin, HIGH);

  // Distance = speed * time
  // The distance from an object is half the total distance
  distance = duration * 0.034 / 2;

  Serial.print("Distance (cm):");
  Serial.println(distance);

  // Sensor 1 - Detects cars going in - count++
  detect_car_in(distance);

  // Sensor 2 - Detects cars leaving - count--
  // detect_car_out(distance);

  
  Serial.print("Parking Lot (Number of cars): ");
  Serial.println(parking_count);
  
  // Delays are for simulation purposes
  delay(1000);
}
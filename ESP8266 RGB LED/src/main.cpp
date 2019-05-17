
#include "mynetwork.h"
String proccessData(String data);

//KY016 3-color LED module
int redpin = D0; // select the pin for the red LED
int greenpin = D1 ;// select the pin for the green LED
int bluepin = D2; // select the pin for the blue LED

int sensorPin = A0; // select the input pin for the potentiometer
int sensorValue = 0; // variable to store the value coming from the sensor

int val;
void setup () {
  pinMode (redpin, OUTPUT);
  pinMode (bluepin, OUTPUT);
  pinMode (greenpin, OUTPUT);
  Serial.begin (115200);

  mynetwork_init();
}
void loop ()
{
  sendUDP(proccessData(readAllUDP())) ;
}
String proccessData(String data)
{
  String replay ;
  // if it's empty return nothing
  if(data.length() == 0) return replay ;

  if( data.indexOf("rgb;set;") >= 0 )
  {
    data.replace("rgb;set;","");
    //sensorValue = data.toInt();
    // String hexstring = "42f4f4";
       long number = (long) strtol( &data[0], NULL, 16);
       int r = number >> 16;
       int g = number >> 8 & 0xFF;
       int b = number & 0xFF;
       analogWrite (redpin, r);
       analogWrite (greenpin, g);
       analogWrite (bluepin, b);

  }

  return replay ;
}

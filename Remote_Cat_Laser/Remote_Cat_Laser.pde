import processing.serial.*;
import net.java.games.input.*;
import org.gamecontrolplus.*;
import org.gamecontrolplus.gui.*;
import cc.arduino.*;
import org.firmata.*;

ControlDevice cont;
ControlIO control;
Arduino arduino;
float thumbX;
float thumbY;
int offsetX = 0;
int offsetY = 0;
float fov = .08;
boolean inverted = false;
int movement_factor = 1;

void setup() {
  // set canvas size
 size(1440, 800);
 control = ControlIO.getInstance(this);
 cont = control.getMatchedDevice("xbox_config");
 // no controller found
 if (cont == null) {
 //println("not today chump"); // write better exit statements than me
 System.exit(-1);
 }
 // println(Arduino.list());
 arduino = new Arduino(this, Arduino.list()[4], 57600);
 arduino.pinMode(10, Arduino.SERVO);
 arduino.pinMode(3, Arduino.SERVO);
}

public void getUserInput() {
 // if buttons for inversion (back,menu) are pressed, flip controls accordingly
 if (cont.getButton("invertTrue").pressed()) {
   movement_factor= -abs(movement_factor);
 }
 if (cont.getButton("invertFalse").pressed()) {
   movement_factor= abs(movement_factor);
 }
 
 // widens and narrows the range of motion, also increases and slows movement speed (left and right bumpers)
 if (cont.getButton("widen").pressed()) {
  fov+=.0025;
 }
 if (cont.getButton("narrow").pressed()) {
   fov-=.0025;
 }
 // limit the fov range to reasonable values for the servos
 if (fov > 1){
   fov = 1;
 }
 if (fov < .02){
   fov = .02;
 }
 
 
 // moves lasers resting point up and down (y,a)
 if (cont.getButton("yup").pressed()) {
   offsetY-=movement_factor;
 }
 if (cont.getButton("ydown").pressed()) {
   offsetY+=movement_factor;
 }
 // dont exceed safe limit for y value
 if (offsetY > 80){
   offsetY = 80;
 }
 if (offsetY < -80){
   offsetY = -80;
 }
 
 // moves lasers resting point left and right (x,b)
 if (cont.getButton("xleft").pressed()) {
   offsetX+=movement_factor;
 }
 if (cont.getButton("xright").pressed()) {
   offsetX-=movement_factor;
 }
 // dont exceed safe limit for x value
 if (offsetX > 80){
   offsetX = 80;
 }
 if (offsetX < -80){
   offsetX = -80;
 }

 // map x and y values to a 0-100 range, apply the resting point offset, and control inversion if it applies
 thumbX = map(cont.getSlider("xaxis").getValue(), -movement_factor/fov, movement_factor/fov, offsetX, 180+offsetX);
 thumbY = map(cont.getSlider("yaxis").getValue(), -movement_factor/fov, movement_factor/fov, offsetY, 180+offsetY);
 
 // final safe zone limiter
 if (thumbX < 10){
   thumbX = 10;
 }
 if (thumbX > 170){
   thumbX = 170;
 }
 if (thumbY > 170){
   thumbY = 170;
 }
 if (thumbY < 10){
   thumbY = 10;
 }
 
}

void draw() {
 // get input from the controller
 getUserInput();
 // adjusts the canvas background color
 background(thumbX,100,255);
 background(thumbY,100,255);
 // send servero positions to arduino
 arduino.servoWrite(10, (int)thumbX);
 arduino.servoWrite(3, (int)thumbY);
}

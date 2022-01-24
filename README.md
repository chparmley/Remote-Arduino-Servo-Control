# Remote Arduino Servo Control
Java powered Xbox1 Controller interface for servos movement via an Arduino Uno.
Bluetooth/Wifi/Wired as long the computer recognizes it as a controller.
Button map is calibrated for an Xbox1 Controller (Newer with usb-c).
Others will likely work but untested.

Processing, an application needed to run the application:
https://processing.org/download

Arduino IDE:
https://www.arduino.cc/en/software

Open the Arduino IDE and select:
File->Examples->Firmata->StandardFirmata

Flash this example sketch to the Arduino Uno or equally capable board.

From within the Processing application:
1. File->Open
2. Then navigate to this cloned repository and select Remote_Cat_Laser.pde


# Controls
Right Stick: analog turrent movement

Left/Right Bumper: movement speed and FOV

Y,A,X,B: move the lasers resting location up,down,left, and right respectively

Back/Menu: turn on/off control inversion

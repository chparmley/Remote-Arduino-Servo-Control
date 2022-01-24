# Remote Arduino Servo Control
Java powered Xbox1 Controller interface for servos movement via an Arduino Uno.
Bluetooth/Wifi/Wired as long the computer recognizes it as a controller.
Button map is calibrated for an Xbox1 Controller (Newer with usb-c).
Others will likely work but untested.

Processing, an application needed to run the application:
https://processing.org/download

Arduino IDE:
https://www.arduino.cc/en/software

Ensure servo pwm connection wires are plugged into ports 3 and 10 of the Arduino.

Open the Arduino IDE and select:
1. File->Examples->Firmata->StandardFirmata
2. Flash this example sketch to the Arduino Uno or equally capable board.

From within the Processing application:
1. File->Open
2. Then navigate to this cloned repository and select Remote_Cat_Laser.pde. 
3. [PENDING STEP!]--> the correct com ports index needs to be set. need to come back and convey this well.
4. Ensure the Arduino Uno is connected via USB to the PC.
5. Click the play button to run the app within processing and enjoy!


# Controls
Right Stick: analog turrent movement

Left/Right Bumper: movement speed and FOV

Y,A,X,B: move the lasers resting location up,down,left, and right respectively

Back/Menu: turn enable or disable control inversion

<h1>:point_right: Project idea </h1>
<h4>The main idea of this project is that we control the stepper motor speed through three switches. First one to stop the stepper motor, Second one to activate the half-speed mode, and the third one to activate the full-speed mode. Also, the current mode of stepper motor will be displayed on the seven-segment.</h4>

<h1>:point_right: Components Used </h1>
<ul><h4>
  <li> 8086 MicroProcessor </li>
  <li> 82551 PPI </li>
  <li> 74HC373 Latch </li>
  <li> ULN2003A Motor Driver </li>
  <li> UniPolar Stepper Motor </li>
  <li> (3) Switches </li>
  <li> 7-Segment Common Cathode Display </li>
  <li> Potentiometer</li>
  <li> ADC0804</li>
  </h4>
</ul>

<h1>:point_right: 8086 Microprocessor </h1>
<h4>Intel 8086 is a 16-bit processor designed by Intel. It is a processor that handles a 16-bit word at a time. The data is stored inside the processor in the registers and the different addresses are stored in it. We use it to control the speed of stepper motor.</h4>
<img src="https://user-images.githubusercontent.com/42392736/103960593-2cc65000-515b-11eb-9f09-f7ef19612bad.jpeg" width="450" height="450">

<h1>:point_right: Stepper motor </h1>
<h4>A stepper motor is a DC electric motor that divides a full rotation into a number of equal steps.</h4>
<h3>A stepper motor has the following features:</h3>
<ul><h4>
  <li> Both-direction rotation </li>
  <li> precision angular incremental changes</li>
  <li> capability for digital control </li>
  <li> holding torque at zero speed </li>
  <li> Unipolar Stepper motor </li>
  <li> repetition of accurate motion or velocity profiles </li>
  </h4>
</ul>

<h3>Why have we choosen the Unipolar stepper motor:</h3>
<h4>Unipolar stepping motors have a center tap wired to the positive supply on each of two windings. The two ends of each winding are alternately grounded to reverse the direction of the magnetic field. The rotor would require proportionally more poles for higher angular resolutions. 30 degree per step mot4or is a common permanent magnet motor design. Control sequences in the windings spin the motor. The magnet is rotated one step at a time and the two halves of each winding are never energized at the same time.</h4>
<img src="https://user-images.githubusercontent.com/42392736/103959149-92184200-5157-11eb-8fca-cd4cdd7c1ea3.jpg" width="450" height="300">

<h1>:point_right: ULN2003A Motor driver </h1>
<h4>The ULN2003A is an array of seven NPN Darlington transistors capable of 500 mA, 50 V output. It features common-cathode flyback diodes for switching inductive loads.</h4>
<img src="https://user-images.githubusercontent.com/42392736/103940688-6e90cf80-5136-11eb-93fb-060149a6cfc3.jpeg" width="350" height="350">
<h3>The connection between stepper motor and ULN2003A motor driver:</h3>
<h4>If the driver take high inpit the output to stepper motor will be low becouse of NPN transistors, then the coil in stepper motor will be energized because 2,5 of motor connected to supply.</h4>
<img src="https://user-images.githubusercontent.com/42392736/103941080-04c4f580-5137-11eb-8321-8c2f3d31264e.jpeg" width="600" height="370">
<h4>The figure below illustrate the word wich we give to driver to move the stepper motor to the corresponding angle:  </h4>
<img src="https://user-images.githubusercontent.com/42392736/103947644-1ad7b380-5141-11eb-9261-b989cc38ce3f.jpeg" width="480" height="200">
<img src="https://user-images.githubusercontent.com/42392736/103946104-e531cb00-513e-11eb-8143-d49ae5924278.PNG" width="500" height="500">

<h1>:point_right: 74HC373 Latch</h1> 
<h4>The "74HC373 Latch" used here is an octal D-type transparent latch with 3-State outputs. This device features enable (LE) and output enable (OE) inputs, this feature is common to all types of latches. When LE is HIGH, data at the inputs enter the latches. In this condition the latches are transparent, a latch output will change each time
its corresponding D-input changes. When LE is LOW the latches store the information that was present at the inputs.</h4>
<h4>The purpose for The "74HC373 Latch" is to latch the address of the wanted port needed to be accessed at the "8255A PPI" Microcontroller which is sent from the Microprocessor and then send the data to this port. The Microprocessor send the address of the wanted port needed to be accessed at the "8255A PPI" to the "74HC373 Latch" and then enable latch (LE), the "74HC373 Latch" will latch D1 nad D2, then the microprocessor send the data to the wanted port in "8255A PPI" through the "74HC373 Latch".</h4>
<img src="https://user-images.githubusercontent.com/42392736/103951933-32ff0100-5148-11eb-8927-67fb7010e5b0.jpg" width="350" height="300">

<h1>:point_right: Programmable peripheral interface 8255A</h1>
<h4>PPI 8255 is a general purpose programmable I/O device designed to interface the CPU with its outside world. It consists of three 8-bit bidirectional I/O ports i.e. PORT A, PORT B and PORT C. We can assign different ports as input or output functions. It consists of 40 pins each port has 8 pins and operates in +5V regulated power supply.</h4>
<img src="https://user-images.githubusercontent.com/42392736/103838041-b95a0b00-5094-11eb-9662-3358d5a6b94b.png" width="250" height="400">
<h4>Depending upon the value if CS’, A1 and A0 we can select different ports in different modes as input-output function or BSR. This is done by writing a suitable word in control register (control word D0-D7).</h4>
<h4>:heavy_check_mark:the control word we use is 10000010</h4>
<img src="https://user-images.githubusercontent.com/42392736/103838495-dfcc7600-5095-11eb-9521-2b9796aadb39.PNG" width="350" height="350">
<img src="https://user-images.githubusercontent.com/42392736/103839133-603fa680-5097-11eb-848d-01f3b30570c4.jpeg" width="370" height="370">

<h1>:point_right: Seven Segment Display (only used in first idea) </h1>
<h4>We use seven-segments as an indicator for the mode of speed of the motor. if we press the stop button the seven-segments will display "S", if we press the half-speed button the seven-segments will display "H", and if we press the full-speed button it will display "F".</h4>
<h4>We use common cathode seven-segments and the figures below illustrate how to turn on the wanted leds of seven-segments display.</h4>
<img src="https://user-images.githubusercontent.com/42392736/103959138-862c8000-5157-11eb-8cb9-e51969026dd3.jpeg" width="350" height="300">
<img src="https://user-images.githubusercontent.com/42392736/103959143-8a589d80-5157-11eb-8677-5f6a2e74f945.jpeg" width="600" height="125">

<h1>:point_right:Used software</h1>
<h4>1- Protues </h4>
<h4>2- 8086 emulator with MASM </h4>

<h1>:point_right:Final output of the first idea</h1>
<img src="https://user-images.githubusercontent.com/42392736/103961141-8713e080-515c-11eb-9ff0-15708af2aea9.jpeg" width="900" height="500">

<h1>:point_right:Final output of the second idea</h1>
<img src="https://user-images.githubusercontent.com/42392736/104081018-b8f87600-5234-11eb-9e10-e30cf76a30b7.jpeg" width="900" height="500">

<h1>:point_right: Collabrators</h1>
<ul>
  <li><h3>Mostafa mokhtar</h3></li>
  mostafa160875@feng.bu.edu.eg
  <li><h3>Hader Ashraf</h3></li>
  hadeer160958@feng.bu.edu.eg
  <li><h3>Mohamed Mahmoud</h3></li>
  mohamed160733@feng.bu.edu.eg
  <li><h3>Salah Rasmy</h3></li>
  salah160393@feng.bu.edu.eg
  <li><h3>Michael Magdy</h3></li>
  Mikael160570@feng.bu.edu.eg
</ul>

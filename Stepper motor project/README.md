<h1>:point_right:Project idea </h1>
<h4>The main idea of this project is that we control the stepper motor speed through three switches. First one to stop the stepper motor, Second one to activate the half-speed mode, and the third one to activate the full-speed mode. Also, the current mode of stepper motor will be displayed on the seven-segment.</h4>

<h1>:point_right:Components Used </h1>
<ul><h4>
  <li> 8086 MicroProcessor </li>
  <li> 82551 PPI </li>
  <li> 74HC373 Latch </li>
  <li> ULN2003A Motor Driver </li>
  <li> UniPolar Stepper Motor </li>
  <li> (3) Switches </li>
  <li> 7-Segment Comman Cathode Display </li>
  </h4>
</ul>

<h1>:point_right:8086 Microprocessor </h1>
<h4>Intel 8086 is a 16-bit processor designed by Intel. It is a processor that handles a 16-bit word at a time. The data is stored inside the processor in the registers and the different addresses are stored in it. We use it to control the speed of stepper motor</h4>
<img src="https://user-images.githubusercontent.com/42392736/103960593-2cc65000-515b-11eb-9f09-f7ef19612bad.jpeg" width="450" height="450">


<h1>:point_right:Stepper motor </h1>
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

<h3>we choose the unipolar stepper motor:</h3>
<h4>Unipolar stepping motors have a center tap wired to the positive supply on each of two windings. The two ends of each winding are alternately grounded to reverse the direction of the magnetic field. The rotor would require proportionally more poles for higher angular resolutions. 30 degree per step mot4or is a common permanent magnet motor design. Control sequences in the windings spin the motor. The magnet is rotated one step at a time and the two halves of each winding are never energized at the same time.</h4>


<h1>:point_right:Programmable peripheral interface 8255A</h1>
<h4>PPI 8255 is a general purpose programmable I/O device designed to interface the CPU with its outside world. It consists of three 8-bit bidirectional I/O ports i.e. PORT A, PORT B and PORT C. We can assign different ports as input or output functions. It consists of 40 pins each port has 8 pins and operates in +5V regulated power supply.</h4>
<img src="https://user-images.githubusercontent.com/42392736/103838041-b95a0b00-5094-11eb-9662-3358d5a6b94b.png" width="250" height="400">
<h4>Depending upon the value if CS’, A1 and A0 we can select different ports in different modes as input-output function or BSR. This is done by writing a suitable word in control register (control word D0-D7).</h4>
<h4>:heavy_check_mark:the control word we use is 10000010</h4>
<img src="https://user-images.githubusercontent.com/42392736/103838495-dfcc7600-5095-11eb-9521-2b9796aadb39.PNG" width="350" height="350">
<img src="https://user-images.githubusercontent.com/42392736/103839133-603fa680-5097-11eb-848d-01f3b30570c4.jpeg" width="370" height="370">

This project demonstrates a "walking circle" animation across the six 7-segment display modules on the Terasic DE10-Lite FPGA board. The project cycles a circular pattern through the displays, creating a smooth movement effect.

![Screenshot 2025-03-30 235328](https://github.com/user-attachments/assets/5deea9b3-ef2e-44c5-b32c-569a4c33cb42)

# How it works
The clock divider generates a slower signal named overflow than the board's clock. The walking circle module shifts curr_display at each over overflow. The display module ensures the correct pattern is shown at each display.

# Prerequisites

1. Terasic DE10-Lite FPGA board
2. Intel® Quartus® Prime Lite Edition Design Software Version 20.1.1
3. ModelSim-Intel® FPGAs Starter Edition Software (optional) (for simulation)

# Usage

1. Clone the project ```git clone https://github.com/eduskm/circle7segFPGA.git```
2. Have the DE10-Lite FPGA board plugged in and set up
3. Open the project file ```walking_circle.qpf``` in Quartus
4. Compile Design
5. Program the device

# Simulation

![Screenshot 2025-03-30 231724](https://github.com/user-attachments/assets/8b512ca4-7d29-49e8-a817-a2e4348e91b5)  | 
|:--:| 
| *behavior of seg7 (displays 1-5) (sadly couldn't capture on screen all displays)* |

# License

This project is licensed under the MIT License
Copyright (c) 2025 Eduard Mihaiu

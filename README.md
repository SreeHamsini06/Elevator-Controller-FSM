Four-Floor Elevator Controller Using Verilog HDL

Project Overview

This project implements a four-floor elevator controller using a Finite State Machine (FSM) in Verilog HDL. The controller processes floor requests and manages elevator movement and door operation.

The design is implemented and simulated using Xilinx Vivado 2022.2.

Objectives

- Design a four-floor elevator controller using Verilog HDL.
- Implement an FSM for elevator movement.
- Process floor requests and identify the destination floor.
- Control upward and downward movement.
- Implement door-opening functionality.
- Verify the controller using behavioral simulation.

Tools and Technologies

- Hardware Description Language: Verilog HDL
- Software: Xilinx Vivado 2022.2
- Design Methodology: Finite State Machine (FSM)
- Verification: Verilog Testbench and Behavioral Simulation

FSM States

State| Description
IDLE| Elevator waits for a floor request.
UP| Elevator moves toward a higher floor.
DOWN| Elevator moves toward a lower floor.
DOOR_OPEN| Door opens when the required floor is reached.

Working Principle

1. The controller receives a floor request.
2. The requested floor is compared with the current floor.
3. The FSM determines the required movement direction.
4. The motor control signals manage upward or downward movement.
5. When the destination floor is reached, the controller activates the door-opening signal.
6. The elevator returns to the idle state to process subsequent requests.

Project Structure

- "rtl/" — Elevator controller Verilog design
- "testbench/" — Simulation testbench
- "simulation_results/" — Behavioral simulation waveform

Simulation Results

The following waveform illustrates floor requests, floor transitions, motor control signals, and door-control behavior during simulation.

"Elevator Controller Simulation" (simulation_results/elevator_simulation.png)

How to Run

1. Open Xilinx Vivado.
2. Create an RTL project.
3. Add "rtl/elevator.v" as a design source.
4. Add the Verilog testbench from the "testbench" folder as a simulation source.
5. Select the testbench as the simulation top module.
6. Run Behavioral Simulation to observe the waveforms.

Future Scope

- FPGA-based hardware implementation
- Emergency stop and overload detection
- Improved floor-request scheduling
- Additional safety and monitoring features

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2026 11:03:04
// Design Name: 
// Module Name: elevator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module elevator(
     input clk,
     input rst,
     input [3:0] request,
     output reg [1:0] current_floor,
     output reg motor_up,
     output reg motor_down,
     output reg door_open
);
parameter IDLE=2'b00;
parameter MOVE_UP=2'b01;
parameter MOVE_DOWN=2'b10;
parameter DOOR_OPEN=2'b11;
reg [1:0] state;
reg [1:0] next_state;
reg [1:0] target_floor;
reg [1:0] timer_running;

always @(posedge clk or posedge rst)
begin
   if(rst)
     target_floor <= 2'b00;
   else if(state==IDLE)
   begin
     if(request[0])
        target_floor <=2'b00;
     else if(request[1])
        target_floor <=2'b01;
     else if(request[2])
        target_floor <=2'b10;
     else if(request[3])
        target_floor <=2'b11;
     end
end
always @(posedge clk or posedge rst)
begin
   if(rst)
        state <= IDLE;
   else
        state <= next_state;
end
always @(*)
begin 
      next_state = state;
      case(state)
      IDLE:
      begin
         if(target_floor > current_floor)
            next_state = MOVE_UP;
         else if(target_floor < current_floor)
            next_state = MOVE_DOWN;
         else
            next_state = IDLE;
      end
      MOVE_UP:
      begin
         if(target_floor == current_floor)
              next_state = DOOR_OPEN;
         else
              next_state = MOVE_UP;
      end
      MOVE_DOWN:
      begin
         if(target_floor == current_floor)
              next_state = DOOR_OPEN;
         else
              next_state = MOVE_DOWN;
      end
      DOOR_OPEN:
      begin
          if(timer_running)
            next_state = DOOR_OPEN;
          else
             next_state = IDLE;
      end
      default:
          next_state = IDLE;
      endcase
end
always @(*)
begin
     case(state)
     IDLE:
     begin
         motor_up = 0;
         motor_down = 0;
         door_open = 0;
     end
     MOVE_UP:
     begin
         motor_up = 1;
         motor_down = 0;
         door_open = 0;
     end
     MOVE_DOWN:
     begin
         motor_up = 0;
         motor_down = 1;
         door_open = 0;
     end
     DOOR_OPEN:
     begin
        motor_up = 0;
         motor_down = 0;
         door_open = 1;
     end
     default:
     begin
         motor_up = 0;
         motor_down = 0;
         door_open = 1;
     end
     endcase
end
always @(posedge clk or posedge rst)
begin
    if(rst)
      current_floor<=0;
    else if(state==MOVE_UP && current_floor <target_floor)
        current_floor <= current_floor +1;
    else if(state==MOVE_DOWN && current_floor>target_floor)
        current_floor <= current_floor-1;
   end
         
            
   
      

   
    
endmodule

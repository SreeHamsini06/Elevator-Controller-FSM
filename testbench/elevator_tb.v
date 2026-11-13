`timescale 1ns/1ps
 module elevator_tb;
 reg clk;
 reg rst;
 reg [3:0] request;
 wire [1:0] current_floor;
 wire motor_up;
 wire motor_down;
 wire door_open;
 elevator uut(
        .clk(clk),
        .rst(rst),
        .request(request),
        .current_floor(current_floor),
        
        .motor_up(motor_up),
        .motor_down(motor_down),
        .door_open(door_open)
 );
 always #5 clk=~clk;
 initial begin
         clk=0;
         rst=1;
         request = 4'b0000;
         #10
         rst=0;
         #10;
         request = 4'b1000;
         #10;
         request = 4'b0000;
         #100;
         request = 4'b0010;
         #10
         request=4'b0000;
         #100
         $stop;
  end
  endmodule
    
        
 
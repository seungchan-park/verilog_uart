`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/20 14:11:19
// Design Name: 
// Module Name: tb_uart
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


module tb_uart();

    reg clk;
    reg reset;
    reg start;
    reg [7:0] tx_data;
    wire tx;
    wire tx_done;
    reg rx;
    wire [7:0] rx_data;
    wire rx_done;
  
    wire w_tx_rx;

    uart DUT(
        .clk(clk),
        .reset(reset),
        // Transmitter
        .start(start),
        .tx_data(tx_data),
        .tx(w_tx_rx),
        .tx_done(tx_done),
        // Receiver
        .rx(w_tx_rx),
        .rx_data(rx_data),
        .rx_done(rx_done)
    );

    always #5 clk = ~clk;
    
    initial begin
        clk = 1'b0;
        reset = 1'b1;
        start = 1'b0;
        rx = 1'b1;
        
    end

    initial begin
        #20 reset = 1'b0;
        #100 tx_data = 8'b11000101; start = 1'b1;
        #10 start = 1'b0;
    end

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/20 15:07:38
// Design Name: 
// Module Name: top_txrx_loop
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


module top_txrx_loop (
    input  clk,
    input  reset,
    // Transmitter
    output tx,
    // Receiver
    input  rx
);

    wire [7:0] w_rx_data;
    wire w_rx_done;

    uart U_UART (
        .clk(clk),
        .reset(reset),
        // Transmitter
        .start(w_rx_done),
        .tx_data(w_rx_data),
        .tx(tx),
        .tx_done(),
        // Receiver
        .rx(rx),
        .rx_data(w_rx_data),
        .rx_done(w_rx_done)
    );

endmodule

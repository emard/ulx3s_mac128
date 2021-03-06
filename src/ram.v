module ram (
  input             clk,
  input             we,
  input [10:1]      addr,
  input [15:0]      din,
  input             ub,
  input             lb,
  output reg [15:0] dout,
);

  reg [7:0] ram_ub [0:1023];
  reg [7:0] ram_lb [0:1023];

  always @(posedge clk) begin
    if (we) begin
      if (ub) ram_ub[addr] <= din[15:8];
      if (lb) ram_lb[addr] <= din[7:0];
    end
    dout <= {ram_ub[addr], ram_lb[addr]};
  end

endmodule

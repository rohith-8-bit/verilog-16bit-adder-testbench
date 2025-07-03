module adder16(X, Y, Z, sign, zero, carry, parity, overflow);
  input [15:0] X, Y;
  output [15:0] Z;
  output sign, carry, zero, parity, overflow;
  wire c[3:1];

  assign sign = Z[15];
  assign zero = ~|Z;
  assign parity = ~^Z;
  assign overflow = (X[15] & Y[15] & ~Z[15]) | (~X[15] & ~Y[15] & Z[15]);

  adder4 A0 (Z[3:0], c[1], X[3:0], Y[3:0], 1'b0);
  adder4 A1 (Z[7:4], c[2], X[7:4], Y[7:4], c[1]);
  adder4 A2 (Z[11:8], c[3], X[11:8], Y[11:8], c[2]);
  adder4 A3 (Z[15:12], carry, X[15:12], Y[15:12], c[3]);
endmodule

module adder4(S, Cout, A, B, Cin);
  input [3:0] A, B;
  input Cin;
  output [3:0] S;
  output Cout;
  wire c1, c2, c3;

  adder2 FA0 (S[0], c1, A[0], B[0], Cin);
  adder2 FA1 (S[1], c2, A[1], B[1], c1);
  adder2 FA2 (S[2], c3, A[2], B[2], c2);
  adder2 FA3 (S[3], Cout, A[3], B[3], c3);
endmodule

module adder2(S, Cout, A, B, C);
  input A, B, C;
  output S, Cout;
  wire w1, w2, w3;

  xor(w1, A, B);
  xor(S, w1, C);

  and(w2, A, B);
  and(w3, w1, C);

  xor(Cout, w2, w3);
endmodule

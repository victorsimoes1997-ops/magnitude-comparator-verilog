module comparador_fundamental
(
    output I,
    output Ma,
    output Me,
    input A,
    input B
);

assign I = ~(A ^ B);
assign Ma = A & ~B;
assign Me = ~A & B;

endmodule

module comparador_4bits
(
    output A_maior,
    output A_igual,
    output A_menor,
    input [3:0] a,
    input [3:0] b
);

assign A_maior = (a > b);
assign A_igual = (a == b);
assign A_menor = (a < b);

endmodule

module comparador_4bits_cascata
(
    output A_maior,
    output A_igual,
    output A_menor,
    input [3:0] a,
    input [3:0] b
);

wire [3:0] I, Ma, Me;

comparador_fundamental comp0 (.I(I[0]), .Ma(Ma[0]), .Me(Me[0]), .A(a[0]), .B(b[0]));
comparador_fundamental comp1 (.I(I[1]), .Ma(Ma[1]), .Me(Me[1]), .A(a[1]), .B(b[1]));
comparador_fundamental comp2 (.I(I[2]), .Ma(Ma[2]), .Me(Me[2]), .A(a[2]), .B(b[2]));
comparador_fundamental comp3 (.I(I[3]), .Ma(Ma[3]), .Me(Me[3]), .A(a[3]), .B(b[3]));

assign A_maior = Ma[3] | I[3] & Ma[2] | I[2] & Ma[1] | I[1] & Ma[0];
assign A_menor = Me[3] | I[3] & Me[2] | I[2] & Me[1] | I[1] & Me[0];
assign A_igual = I[3] & I[2] & I[1] & I[0];

endmodule
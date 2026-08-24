`timescale 1ns/1ps

module tb_comparadores_duplos;

    reg  [3:0] a;
    reg  [3:0] b;

    // Fios para as saídas da versão Dataflow
    wire df_maior, df_igual, df_menor;
    
    // Fios para as saídas da versão Cascata
    wire cas_maior, cas_igual, cas_menor;

    // 1. Instancia o modelo Dataflow (nosso "gabarito")
    comparador_4bits dut_dataflow (
        .A_maior(df_maior),
        .A_igual(df_igual),
        .A_menor(df_menor),
        .a(a),
        .b(b)
    );

    // 2. Instancia o modelo em Cascata (nosso circuito estrutural)
    comparador_4bits_cascata dut_cascata (
        .A_maior(cas_maior),
        .A_igual(cas_igual),
        .A_menor(cas_menor),
        .a(a),
        .b(b)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_comparadores_duplos);

        $display("Tempo |  a   |  b   || Dataflow (Maior/Igual/Menor) | Cascata (Maior/Igual/Menor)");
        $monitor("%0t   | %b | %b ||        %b    %b    %b         |     %b    %b    %b", 
                 $time, a, b, 
                 df_maior, df_igual, df_menor, 
                 cas_maior, cas_igual, cas_menor);

        // --- BATERIA DE TESTES ---
        a = 4'd5;  b = 4'd5;  #10; // Iguais
        a = 4'd9;  b = 4'd4;  #10; // A > B
        a = 4'd2;  b = 4'd7;  #10; // A < B
        a = 4'd15; b = 4'd12; #10; // A > B
        a = 4'd0;  b = 4'd1;  #10; // A < B
        a = 4'd10; b = 4'd10; #10; // Iguais

        $finish;
    end

endmodule
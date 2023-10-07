//bitwise operations λ����
//tedious �߳���

/**
"Reduction operators"
������unary operatorsһԪ�������������one bit of output
& a[3:0]     
// AND: a[3]&a[2]&a[1]&a[0]. Equivalent to (a[3:0] == 4'hf)
| b[3:0]     
// OR:  b[3]|b[2]|b[1]|b[0]. Equivalent to (b[3:0] != 4'h0)
^ c[2:0]     
// XOR: c[2]^c[1]^c[0]
**/

//Parity checking��ż����
//imperfect �����Ƶģ���������

//��żУ��ʹ��XOR
//We will use "even" parity, where the parity bit is just the XOR of all 8 data bits. 

//even parity żУ��
//odd parity ��У��

module top_module(
    input [7:0] in,
    output parity
);
    assign parity = ^in[7:0];

endmodule
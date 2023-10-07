//ringer ÏìÁå
//vibration Õð¶¯

module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);
/**
    TruthTable
    n  r  v | rr m
    0  0  0   0  0
    1  0  1   0  0
    2  1  0   1  0
    3  1  1   0  1

**/

    assign ringer = ring && ~(vibrate_mode);
    assign motor = ring && vibrate_mode;



endmodule
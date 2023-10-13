module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); 

    reg y, Y;
    parameter left=0, right=1;

    always@(y, bump_left, bump_right)begin
        case(y)
            left: if(bump_left) Y <= right;
                  else Y <= left;   //要有赋原值的过程，状态改变！
            right: if(bump_right) Y = left;
                  else Y <= right;
        endcase
    end

    always@(posedge clk, posedge areset)begin
        if(areset)
            y <= left;
        else
            y <= Y;
    end

    assign walk_left = (y == left);
    assign walk_right = (y == right);


endmodule


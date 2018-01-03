`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// VLSI Group Poject By Himanshu Thakkar & Nimish Joshi
// 
//////////////////////////////////////////////////////////////////////////////////


module Des_Top(CLK, RST, CHIP_SELECT_BAR, ADDRESS, PLAIN_TEXT, CIPHER_TEXT);
 
input   CLK;
 
input   RST;
 
input   CHIP_SELECT_BAR;
 
input   ADDRESS;
 
input   [64 : 1]PLAIN_TEXT;
 
output  [64 : 1]CIPHER_TEXT;
 
wire    CLK;
 
wire    RST;
 
wire    CHIP_SELECT_BAR;
 
wire    ADDRESS;
 
wire    [64 : 1] PLAIN_TEXT;
 
wire    [64 : 1] CIPHER_TEXT;
 
wire    [48 : 1] KEY1,KEY2,KEY3,KEY4,KEY5,KEY6,KEY7,KEY8,KEY9,KEY10,KEY11,KEY12,KEY13,KEY14,KEY15,
                 KEY16;
   
wire    [32 : 1] LEFT1,LEFT2,LEFT3,LEFT4,LEFT5,LEFT6,LEFT7,LEFT8,LEFT9,LEFT10,LEFT11,LEFT12,LEFT13,
                 LEFT14,LEFT15,LEFT16;
 
wire    [32 : 1] RIGHT1,RIGHT2,RIGHT3,RIGHT4,RIGHT5,RIGHT6,RIGHT7,RIGHT8,RIGHT9,RIGHT10,RIGHT11,
                 RIGHT12,RIGHT13,RIGHT14,RIGHT15,RIGHT16; 
 
wire    [32 : 1] LEFT,RIGHT;
 
wire    [32 : 1] LEFT_SWAP,RIGHT_SWAP;
 
 Initial_Permutation ip (
                         .CHIP_SELECT_BAR(CHIP_SELECT_BAR),
 .PLAIN_TEXT(PLAIN_TEXT),
 .LEFT(LEFT),
 .RIGHT(RIGHT)
);
 
 Key_Top key            (
                         .CHIP_SELECT_BAR(CHIP_SELECT_BAR),
 .ADDRESS(ADDRESS),
 .KEY1(KEY1),
 .KEY2(KEY2),
 .KEY3(KEY3),
 .KEY4(KEY4),
 .KEY5(KEY5),
 .KEY6(KEY6),
 .KEY7(KEY7),
 .KEY8(KEY8),
 .KEY9(KEY9),
 .KEY10(KEY10),
 .KEY11(KEY11),
 .KEY12(KEY12),
 .KEY13(KEY13),
 .KEY14(KEY14),
 .KEY15(KEY15),
 .KEY16(KEY16)
                        );
 
 Round1 round1          (
                        .CLK(CLK),
.RST(RST),
.LEFT(LEFT),
.RIGHT(RIGHT),
.KEY(KEY1),
.LEFT1(LEFT1),
.RIGHT1(RIGHT1)
);
 
 Round1 round2          (
                        .CLK(CLK),
.RST(RST),
.LEFT(LEFT1),
.RIGHT(RIGHT1),
.KEY(KEY2),
.LEFT1(LEFT2),
.RIGHT1(RIGHT2)
);
 
 Round1 round3          (
                        .CLK(CLK),
.RST(RST),
.LEFT(LEFT2),
.RIGHT(RIGHT2),
.KEY(KEY3),
.LEFT1(LEFT3),
.RIGHT1(RIGHT3)
);
 
 Round1 round4          (
                        .CLK(CLK),
.RST(RST),
.LEFT(LEFT3),
.RIGHT(RIGHT3),
.KEY(KEY4),
.LEFT1(LEFT4),
.RIGHT1(RIGHT4)
);
 
 Round1 round5          (
                        .CLK(CLK),
.RST(RST),
.LEFT(LEFT4),
.RIGHT(RIGHT4),
.KEY(KEY5),
.LEFT1(LEFT5),
.RIGHT1(RIGHT5)
);
 
 Round1 round6          (
                        .CLK(CLK),
.RST(RST),
.LEFT(LEFT5),
.RIGHT(RIGHT5),
.KEY(KEY6),
.LEFT1(LEFT6),
.RIGHT1(RIGHT6)
);
 
 Round1 round7          (
                        .CLK(CLK),
.RST(RST),
.LEFT(LEFT6),
.RIGHT(RIGHT6),
.KEY(KEY7),
.LEFT1(LEFT7),
.RIGHT1(RIGHT7)
);
 
 Round1 round8          (
                        .CLK(CLK),
.RST(RST),
.LEFT(LEFT7),
.RIGHT(RIGHT7),
.KEY(KEY8),
.LEFT1(LEFT8),
.RIGHT1(RIGHT8)
);
 
 Round1 round9          (
                        .CLK(CLK),
.RST(RST),
.LEFT(LEFT8),
.RIGHT(RIGHT8),
.KEY(KEY9),
.LEFT1(LEFT9),
.RIGHT1(RIGHT9)
);
 
 Round1 round10         (
                        .CLK(CLK),
.RST(RST),
.LEFT(LEFT9),
.RIGHT(RIGHT9),
.KEY(KEY10),
.LEFT1(LEFT10),
.RIGHT1(RIGHT10)
);
 
 Round1 round11         (
                        .CLK(CLK),
.RST(RST),
.LEFT(LEFT10),
.RIGHT(RIGHT10),
.KEY(KEY11),
.LEFT1(LEFT11),
.RIGHT1(RIGHT11)
);
 
 Round1 round12         (
                        .CLK(CLK),
.RST(RST),
.LEFT(LEFT11),
.RIGHT(RIGHT11),
.KEY(KEY12),
.LEFT1(LEFT12),
.RIGHT1(RIGHT12)
);
 
 Round1 round13         (
                        .CLK(CLK),
.RST(RST),
.LEFT(LEFT12),
.RIGHT(RIGHT12),
.KEY(KEY13),
.LEFT1(LEFT13),
.RIGHT1(RIGHT13)
);
 
 Round1 round14         (
                        .CLK(CLK),
.RST(RST),
.LEFT(LEFT13),
.RIGHT(RIGHT13),
.KEY(KEY14),
.LEFT1(LEFT14),
.RIGHT1(RIGHT14)
);
 
 Round1 round15          (
                        .CLK(CLK),
.RST(RST),
.LEFT(LEFT14),
.RIGHT(RIGHT14),
.KEY(KEY15),
.LEFT1(LEFT15),
.RIGHT1(RIGHT15)
);
 
 Round1 round16         (
                        .CLK(CLK),
.RST(RST),
.LEFT(LEFT15),
.RIGHT(RIGHT15),
.KEY(KEY16),
.LEFT1(LEFT16),
.RIGHT1(RIGHT16)
);
 
 Swap   swap            (
                         .LEFT16(LEFT16),
 .RIGHT16(RIGHT16),
 .LEFT_SWAP(LEFT_SWAP),
 .RIGHT_SWAP(RIGHT_SWAP)
                         );
 
 Inverse_Initial_Permutation iip (
                                  .LEFT_SWAP(LEFT_SWAP),
 .RIGHT_SWAP(RIGHT_SWAP),
 .CIPHER_TEXT(CIPHER_TEXT)
 );
 
 endmodule
 
 module Initial_Permutation(PLAIN_TEXT, CHIP_SELECT_BAR, LEFT, RIGHT);
      
  input    CHIP_SELECT_BAR;                      //It is input which works as a chip
                                                 //select
   
  input    [64 : 1] PLAIN_TEXT ;                 //64-bit message input
   
  output   [32 : 1] LEFT;
   
  output   [32 : 1] RIGHT;
      
  wire     CHIP_SELECT_BAR;
      
  wire     [64 : 1] PLAIN_TEXT;
   
  wire     [32 : 1] LEFT;
   
  wire     [32 : 1] RIGHT;
   
  reg      [64 : 1] INITIAL_PERMUTATION_OUTPUT;
   
  assign   LEFT   = INITIAL_PERMUTATION_OUTPUT[64 : 33];
   
  assign   RIGHT  = INITIAL_PERMUTATION_OUTPUT[32 : 1];
   
  always @ (CHIP_SELECT_BAR)                    //Chip select signal.If it is low then and
                                                //then this block works otherwise output
   //remains in high impedence state(Z-state).
   
        begin
   
            if(CHIP_SELECT_BAR == 0)
   
          begin
   
           INITIAL_PERMUTATION_OUTPUT [1]  <= PLAIN_TEXT [58];
  INITIAL_PERMUTATION_OUTPUT [2]  <= PLAIN_TEXT [50];
  INITIAL_PERMUTATION_OUTPUT [3]  <= PLAIN_TEXT [42];
  INITIAL_PERMUTATION_OUTPUT [4]  <= PLAIN_TEXT [34];
  INITIAL_PERMUTATION_OUTPUT [5]  <= PLAIN_TEXT [26];
  INITIAL_PERMUTATION_OUTPUT [6]  <= PLAIN_TEXT [18];
  INITIAL_PERMUTATION_OUTPUT [7]  <= PLAIN_TEXT [10];
  INITIAL_PERMUTATION_OUTPUT [8]  <= PLAIN_TEXT [2];
  INITIAL_PERMUTATION_OUTPUT [9]  <= PLAIN_TEXT [60];
  INITIAL_PERMUTATION_OUTPUT [10] <= PLAIN_TEXT [52];
  INITIAL_PERMUTATION_OUTPUT [11] <= PLAIN_TEXT [44];
  INITIAL_PERMUTATION_OUTPUT [12] <= PLAIN_TEXT [36];
  INITIAL_PERMUTATION_OUTPUT [13] <= PLAIN_TEXT [28];
  INITIAL_PERMUTATION_OUTPUT [14] <= PLAIN_TEXT [20];
  INITIAL_PERMUTATION_OUTPUT [15] <= PLAIN_TEXT [12];
  INITIAL_PERMUTATION_OUTPUT [16] <= PLAIN_TEXT [4];
  INITIAL_PERMUTATION_OUTPUT [17] <= PLAIN_TEXT [62];
  INITIAL_PERMUTATION_OUTPUT [18] <= PLAIN_TEXT [54];
  INITIAL_PERMUTATION_OUTPUT [19] <= PLAIN_TEXT [46];
  INITIAL_PERMUTATION_OUTPUT [20] <= PLAIN_TEXT [38];
  INITIAL_PERMUTATION_OUTPUT [21] <= PLAIN_TEXT [30];
  INITIAL_PERMUTATION_OUTPUT [22] <= PLAIN_TEXT [22];
  INITIAL_PERMUTATION_OUTPUT [23] <= PLAIN_TEXT [14];
  INITIAL_PERMUTATION_OUTPUT [24] <= PLAIN_TEXT [6];
  INITIAL_PERMUTATION_OUTPUT [25] <= PLAIN_TEXT [64];
  INITIAL_PERMUTATION_OUTPUT [26] <= PLAIN_TEXT [56];
  INITIAL_PERMUTATION_OUTPUT [27] <= PLAIN_TEXT [48];
  INITIAL_PERMUTATION_OUTPUT [28] <= PLAIN_TEXT [40];
  INITIAL_PERMUTATION_OUTPUT [29] <= PLAIN_TEXT [32];
  INITIAL_PERMUTATION_OUTPUT [30] <= PLAIN_TEXT [24];
  INITIAL_PERMUTATION_OUTPUT [31] <= PLAIN_TEXT [16];
  INITIAL_PERMUTATION_OUTPUT [32] <= PLAIN_TEXT [8];
  INITIAL_PERMUTATION_OUTPUT [33] <= PLAIN_TEXT [57];
  INITIAL_PERMUTATION_OUTPUT [34] <= PLAIN_TEXT [49];
  INITIAL_PERMUTATION_OUTPUT [35] <= PLAIN_TEXT [41];
  INITIAL_PERMUTATION_OUTPUT [36] <= PLAIN_TEXT [33];
  INITIAL_PERMUTATION_OUTPUT [37] <= PLAIN_TEXT [25];
  INITIAL_PERMUTATION_OUTPUT [38] <= PLAIN_TEXT [17];
  INITIAL_PERMUTATION_OUTPUT [39] <= PLAIN_TEXT [9];
  INITIAL_PERMUTATION_OUTPUT [40] <= PLAIN_TEXT [1];
  INITIAL_PERMUTATION_OUTPUT [41] <= PLAIN_TEXT [59];
  INITIAL_PERMUTATION_OUTPUT [42] <= PLAIN_TEXT [51];
  INITIAL_PERMUTATION_OUTPUT [43] <= PLAIN_TEXT [43];
  INITIAL_PERMUTATION_OUTPUT [44] <= PLAIN_TEXT [35];
  INITIAL_PERMUTATION_OUTPUT [45] <= PLAIN_TEXT [27];
  INITIAL_PERMUTATION_OUTPUT [46] <= PLAIN_TEXT [19];
  INITIAL_PERMUTATION_OUTPUT [47] <= PLAIN_TEXT [11];
  INITIAL_PERMUTATION_OUTPUT [48] <= PLAIN_TEXT [3];
  INITIAL_PERMUTATION_OUTPUT [49] <= PLAIN_TEXT [61];
  INITIAL_PERMUTATION_OUTPUT [50] <= PLAIN_TEXT [53];
  INITIAL_PERMUTATION_OUTPUT [51] <= PLAIN_TEXT [45];
  INITIAL_PERMUTATION_OUTPUT [52] <= PLAIN_TEXT [37];
  INITIAL_PERMUTATION_OUTPUT [53] <= PLAIN_TEXT [29];
  INITIAL_PERMUTATION_OUTPUT [54] <= PLAIN_TEXT [21];
  INITIAL_PERMUTATION_OUTPUT [55] <= PLAIN_TEXT [13];
  INITIAL_PERMUTATION_OUTPUT [56] <= PLAIN_TEXT [5];
  INITIAL_PERMUTATION_OUTPUT [57] <= PLAIN_TEXT [63];
  INITIAL_PERMUTATION_OUTPUT [58] <= PLAIN_TEXT [55];
  INITIAL_PERMUTATION_OUTPUT [59] <= PLAIN_TEXT [47];
  INITIAL_PERMUTATION_OUTPUT [60] <= PLAIN_TEXT [39];
  INITIAL_PERMUTATION_OUTPUT [61] <= PLAIN_TEXT [31];
  INITIAL_PERMUTATION_OUTPUT [62] <= PLAIN_TEXT [23];
  INITIAL_PERMUTATION_OUTPUT [63] <= PLAIN_TEXT [15];
  INITIAL_PERMUTATION_OUTPUT [64] <= PLAIN_TEXT [7];
   
 end
   
 else
  
    begin
  
     INITIAL_PERMUTATION_OUTPUT [64 : 1] <= 64'bZ;
   
 end
   
   end
   
  endmodule
  
  
  module Key_Top(CHIP_SELECT_BAR, ADDRESS, KEY1, KEY2, KEY3, KEY4, KEY5, KEY6, KEY7, KEY8, KEY9, KEY10, KEY11 ,KEY12,
  KEY13, KEY14, KEY15, KEY16);
   
    input   CHIP_SELECT_BAR;
     
    input   ADDRESS;
   
    output  [48 : 1]  KEY1,KEY2,KEY3,KEY4,KEY5,KEY6,KEY7,KEY8,KEY9,KEY10,KEY11,KEY12,KEY13,KEY14,
                      KEY15, KEY16;
     
   // wire    [28 : 1]  LEFT_CIRCULAR_SHIFT1; 
     
   // wire    [28 : 1]  RIGHT_CIRCULAR_SHIFT1;
     
   // wire    [28 : 1]  LEFTHALF_CIRCULAR_SHIFT1;
    
    
    
    //wire    [28 : 1]  RIGHTHALF_CIRCULAR_SHIFT1; 
     
    wire    [48 : 1]  KEY1,KEY2,KEY3,KEY4,KEY5,KEY6,KEY7,KEY8,KEY9,KEY10,KEY11,KEY12,KEY13,KEY14,
                      KEY15,KEY16;
     
    wire    [28 : 1]  LEFT_HALF0,LEFT_HALF1,LEFT_HALF2,LEFT_HALF3,LEFT_HALF4,LEFT_HALF5,LEFT_HALF6,LEFT_HALF7,
                      LEFT_HALF8,LEFT_HALF9,LEFT_HALF10,LEFT_HALF11,LEFT_HALF12,LEFT_HALF13,LEFT_HALF14,
    LEFT_HALF15,LEFT_HALF16;
     
    wire    [28 : 1]  RIGHT_HALF0,RIGHT_HALF1,RIGHT_HALF2,RIGHT_HALF3,RIGHT_HALF4,RIGHT_HALF5,RIGHT_HALF6,RIGHT_HALF7,
                      RIGHT_HALF8,RIGHT_HALF9,RIGHT_HALF10,RIGHT_HALF11,RIGHT_HALF12,RIGHT_HALF13,RIGHT_HALF14,
    RIGHT_HALF15,RIGHT_HALF16;
     
   // wire    [48 : 1]  SUBKEY; 
     
     Key_Generation key_gen (
                          .CHIP_SELECT_BAR(CHIP_SELECT_BAR),
                             .ADDRESS(ADDRESS),
                             .LEFT_CIRCULAR_SHIFT1(LEFT_HALF0),
     .RIGHT_CIRCULAR_SHIFT1(RIGHT_HALF0)
  ); 
     
      assign LEFT_HALF1  = {
  LEFT_HALF0[27 : 1],LEFT_HALF0[28]
  };
      assign LEFT_HALF2  = {
  LEFT_HALF1[27 : 1],LEFT_HALF1[28]
  };
      assign LEFT_HALF3  = {
  LEFT_HALF2[26 : 1],LEFT_HALF2[28],LEFT_HALF2[27]
  };
      assign LEFT_HALF4  = {
  LEFT_HALF3[26 : 1],LEFT_HALF3[28],LEFT_HALF3[27]
  };
   assign LEFT_HALF5  = {
  LEFT_HALF4[26 : 1],LEFT_HALF4[28],LEFT_HALF4[27]
  };
      assign LEFT_HALF6  = {
  LEFT_HALF5[26 : 1],LEFT_HALF5[28],LEFT_HALF5[27]
  };
   assign LEFT_HALF7  = {
  LEFT_HALF6[26 : 1],LEFT_HALF6[28],LEFT_HALF6[27]
  };
   assign LEFT_HALF8  = {
  LEFT_HALF7[26 : 1],LEFT_HALF7[28],LEFT_HALF7[27]
  };
   assign LEFT_HALF9  = {
  LEFT_HALF8[27 : 1],LEFT_HALF8[28]
  };
   assign LEFT_HALF10 = {
  LEFT_HALF9[26 : 1],LEFT_HALF9[28],LEFT_HALF9[27]
  }; 
   assign LEFT_HALF11 = {
  LEFT_HALF10[26 : 1],LEFT_HALF10[28],LEFT_HALF10[27]
  };
   assign LEFT_HALF12 = {
  LEFT_HALF11[26 : 1],LEFT_HALF11[28],LEFT_HALF11[27]
  };
   assign LEFT_HALF13 = {
  LEFT_HALF12[26 : 1],LEFT_HALF12[28],LEFT_HALF12[27]
  };
   assign LEFT_HALF14 = {
  LEFT_HALF13[26 : 1],LEFT_HALF13[28],LEFT_HALF13[27]
  };
   assign LEFT_HALF15 = {
  LEFT_HALF14[26 : 1],LEFT_HALF14[28],LEFT_HALF14[27]
  };
   assign LEFT_HALF16 = {
  LEFT_HALF15[27 : 1],LEFT_HALF15[28]
  };
    
   assign RIGHT_HALF1  = {
  RIGHT_HALF0[27 : 1],RIGHT_HALF0[28]
  };
   assign RIGHT_HALF2  = {
  RIGHT_HALF1[27 : 1],RIGHT_HALF1[28]
  };
   assign RIGHT_HALF3  = {
  RIGHT_HALF2[26 : 1],RIGHT_HALF2[28],RIGHT_HALF2[27]
  };
   assign RIGHT_HALF4  = {
  RIGHT_HALF3[26 : 1],RIGHT_HALF3[28],RIGHT_HALF3[27]
  };
   assign RIGHT_HALF5  = {
  RIGHT_HALF4[26 : 1],RIGHT_HALF4[28],RIGHT_HALF4[27]
  };
   assign RIGHT_HALF6  = {
  RIGHT_HALF5[26 : 1],RIGHT_HALF5[28],RIGHT_HALF5[27]
  };
   assign RIGHT_HALF7  = {
  RIGHT_HALF6[26 : 1],RIGHT_HALF6[28],RIGHT_HALF6[27]
  };
   assign RIGHT_HALF8  = {
  RIGHT_HALF7[26 : 1],RIGHT_HALF7[28],RIGHT_HALF7[27]
  };
   assign RIGHT_HALF9  = {
  RIGHT_HALF8[27 : 1],RIGHT_HALF8[28]
  };
   assign RIGHT_HALF10 = {
  RIGHT_HALF9[26 : 1],RIGHT_HALF9[28],RIGHT_HALF9[27]
  };
   assign RIGHT_HALF11 = {
  RIGHT_HALF10[26 : 1],RIGHT_HALF10[28],RIGHT_HALF10[27]
  };
   assign RIGHT_HALF12 = {
  RIGHT_HALF11[26 : 1],RIGHT_HALF11[28],RIGHT_HALF11[27]
  };
   assign RIGHT_HALF13 = {
  RIGHT_HALF12[26 : 1],RIGHT_HALF12[28],RIGHT_HALF12[27]
  };
   assign RIGHT_HALF14 = {
  RIGHT_HALF13[26 : 1],RIGHT_HALF13[28],RIGHT_HALF13[27]
  };
   assign RIGHT_HALF15 = {
  RIGHT_HALF14[26 : 1],RIGHT_HALF14[28],RIGHT_HALF14[27]
  };
   assign RIGHT_HALF16 = {
  RIGHT_HALF15[27 : 1],RIGHT_HALF15[28]
  };
    
    
   Permuted_Choice2 u1 (
                         .LEFT_CIRCULAR_SHIFT1(LEFT_HALF1),
    .RIGHT_CIRCULAR_SHIFT1(RIGHT_HALF1),
    .SUBKEY(KEY1)
     
  );
    
    
   Permuted_Choice2 u2 (
                         .LEFT_CIRCULAR_SHIFT1(LEFT_HALF2),
    .RIGHT_CIRCULAR_SHIFT1(RIGHT_HALF2),
    .SUBKEY(KEY2)
     
  );
    
   Permuted_Choice2 u3 (
                         .LEFT_CIRCULAR_SHIFT1(LEFT_HALF3),
    .RIGHT_CIRCULAR_SHIFT1(RIGHT_HALF3),
    .SUBKEY(KEY3)
     
  );
    
    
   Permuted_Choice2 u4 (
                         .LEFT_CIRCULAR_SHIFT1(LEFT_HALF4),
    .RIGHT_CIRCULAR_SHIFT1(RIGHT_HALF4),
    .SUBKEY(KEY4)
     
  );
   
      Permuted_Choice2 u5 (
                         .LEFT_CIRCULAR_SHIFT1(LEFT_HALF5),
    .RIGHT_CIRCULAR_SHIFT1(RIGHT_HALF5),
    .SUBKEY(KEY5)
     
  );
    
      Permuted_Choice2 u6 (
                         .LEFT_CIRCULAR_SHIFT1(LEFT_HALF6),
    .RIGHT_CIRCULAR_SHIFT1(RIGHT_HALF6),
    .SUBKEY(KEY6)
     
  );
    
      Permuted_Choice2 u7 (
                         .LEFT_CIRCULAR_SHIFT1(LEFT_HALF7),
    .RIGHT_CIRCULAR_SHIFT1(RIGHT_HALF7),
    .SUBKEY(KEY7)
     
  );
    
      Permuted_Choice2 u8 (
                         .LEFT_CIRCULAR_SHIFT1(LEFT_HALF8),
    .RIGHT_CIRCULAR_SHIFT1(RIGHT_HALF8),
    .SUBKEY(KEY8)
     
  );
    
      Permuted_Choice2 u9 (
                         .LEFT_CIRCULAR_SHIFT1(LEFT_HALF9),
    .RIGHT_CIRCULAR_SHIFT1(RIGHT_HALF9),
    .SUBKEY(KEY9)
     
  );
    
      Permuted_Choice2 u10 (
                         .LEFT_CIRCULAR_SHIFT1(LEFT_HALF10),
    .RIGHT_CIRCULAR_SHIFT1(RIGHT_HALF10),
    .SUBKEY(KEY10)
     
   );
    
      Permuted_Choice2 u11 (
                         .LEFT_CIRCULAR_SHIFT1(LEFT_HALF11),
    .RIGHT_CIRCULAR_SHIFT1(RIGHT_HALF11),
    .SUBKEY(KEY11)
     
   );
    
      Permuted_Choice2 u12 (
                         .LEFT_CIRCULAR_SHIFT1(LEFT_HALF12),
    .RIGHT_CIRCULAR_SHIFT1(RIGHT_HALF12),
    .SUBKEY(KEY12)
     
   );
    
      Permuted_Choice2 u13 (
                         .LEFT_CIRCULAR_SHIFT1(LEFT_HALF13),
    .RIGHT_CIRCULAR_SHIFT1(RIGHT_HALF13),
    .SUBKEY(KEY13)
     
   );
    
      Permuted_Choice2 u14 (
                         .LEFT_CIRCULAR_SHIFT1(LEFT_HALF14),
    .RIGHT_CIRCULAR_SHIFT1(RIGHT_HALF14),
    .SUBKEY(KEY14)
     
    );
    
      Permuted_Choice2 u15 (
                         .LEFT_CIRCULAR_SHIFT1(LEFT_HALF15),
    .RIGHT_CIRCULAR_SHIFT1(RIGHT_HALF15),
    .SUBKEY(KEY15)
     
    );
    
      Permuted_Choice2 u16 (
                         .LEFT_CIRCULAR_SHIFT1(LEFT_HALF16),
    .RIGHT_CIRCULAR_SHIFT1(RIGHT_HALF16),
    .SUBKEY(KEY16)
     
   );
      
  endmodule
  
  
  module Key_Generation(CHIP_SELECT_BAR, ADDRESS, LEFT_CIRCULAR_SHIFT1, RIGHT_CIRCULAR_SHIFT1);
   
      input  CHIP_SELECT_BAR;
    
   input  ADDRESS;
      
   output [28 : 1] LEFT_CIRCULAR_SHIFT1;
    
   output [28 : 1] RIGHT_CIRCULAR_SHIFT1;
    
   wire   CHIP_SELECT_BAR;
    
   wire   ADDRESS;
    
   wire   [28 : 1] LEFT_CIRCULAR_SHIFT1;
    
   wire   [28 : 1] RIGHT_CIRCULAR_SHIFT1;
         
   reg    [56 : 1] OUTPUT_PERMUTATION_CHOICE1;
    
   reg    [64 : 1] KEY;
    
   assign RIGHT_CIRCULAR_SHIFT1 = OUTPUT_PERMUTATION_CHOICE1[28 : 1];
    
   assign LEFT_CIRCULAR_SHIFT1  = OUTPUT_PERMUTATION_CHOICE1[56 : 29];
   
      always @(ADDRESS)
    
   begin
   
           case (ADDRESS)
     
        1'b0    : KEY = 64'h 0000000000000000;
     
           default : KEY = 64'h 1111001010110001;
    
     endcase
      
    end
    
       always @(CHIP_SELECT_BAR or KEY)
    
              begin
   
       if(CHIP_SELECT_BAR == 0)
     
     begin
   
   OUTPUT_PERMUTATION_CHOICE1[1] <= KEY[57];
   OUTPUT_PERMUTATION_CHOICE1[2] <= KEY[49];
   OUTPUT_PERMUTATION_CHOICE1[3] <= KEY[41];
   OUTPUT_PERMUTATION_CHOICE1[4] <= KEY[33];
   OUTPUT_PERMUTATION_CHOICE1[5] <= KEY[25];
   OUTPUT_PERMUTATION_CHOICE1[6] <= KEY[17];
   OUTPUT_PERMUTATION_CHOICE1[7] <= KEY[9];
   OUTPUT_PERMUTATION_CHOICE1[8] <= KEY[1];
   OUTPUT_PERMUTATION_CHOICE1[9] <= KEY[58];
   OUTPUT_PERMUTATION_CHOICE1[10] <= KEY[50];
   OUTPUT_PERMUTATION_CHOICE1[11] <= KEY[42];
   OUTPUT_PERMUTATION_CHOICE1[12] <= KEY[34];
   OUTPUT_PERMUTATION_CHOICE1[13] <= KEY[26];
   OUTPUT_PERMUTATION_CHOICE1[14] <= KEY[18];
   OUTPUT_PERMUTATION_CHOICE1[15] <= KEY[10];
   OUTPUT_PERMUTATION_CHOICE1[16] <= KEY[2];
   OUTPUT_PERMUTATION_CHOICE1[17] <= KEY[59];
   OUTPUT_PERMUTATION_CHOICE1[18] <= KEY[51];
   OUTPUT_PERMUTATION_CHOICE1[19] <= KEY[43];
   OUTPUT_PERMUTATION_CHOICE1[20] <= KEY[35];
   OUTPUT_PERMUTATION_CHOICE1[21] <= KEY[27];
   OUTPUT_PERMUTATION_CHOICE1[22] <= KEY[19];
   OUTPUT_PERMUTATION_CHOICE1[23] <= KEY[11];
   OUTPUT_PERMUTATION_CHOICE1[24] <= KEY[3];
   OUTPUT_PERMUTATION_CHOICE1[25] <= KEY[60];
   OUTPUT_PERMUTATION_CHOICE1[26] <= KEY[52];
   OUTPUT_PERMUTATION_CHOICE1[27] <= KEY[44];
   OUTPUT_PERMUTATION_CHOICE1[28] <= KEY[36];
   OUTPUT_PERMUTATION_CHOICE1[29] <= KEY[63];
   OUTPUT_PERMUTATION_CHOICE1[30] <= KEY[55];
   OUTPUT_PERMUTATION_CHOICE1[31] <= KEY[47];
   OUTPUT_PERMUTATION_CHOICE1[32] <= KEY[39];
   OUTPUT_PERMUTATION_CHOICE1[33] <= KEY[31];
   OUTPUT_PERMUTATION_CHOICE1[34] <= KEY[23];
   OUTPUT_PERMUTATION_CHOICE1[35] <= KEY[15];
   OUTPUT_PERMUTATION_CHOICE1[36] <= KEY[7];
   OUTPUT_PERMUTATION_CHOICE1[37] <= KEY[62];
   OUTPUT_PERMUTATION_CHOICE1[38] <= KEY[54];
   OUTPUT_PERMUTATION_CHOICE1[39] <= KEY[46];
   OUTPUT_PERMUTATION_CHOICE1[40] <= KEY[38];
   OUTPUT_PERMUTATION_CHOICE1[41] <= KEY[30];
   OUTPUT_PERMUTATION_CHOICE1[42] <= KEY[22];
   OUTPUT_PERMUTATION_CHOICE1[43] <= KEY[14];
   OUTPUT_PERMUTATION_CHOICE1[44] <= KEY[6];
   OUTPUT_PERMUTATION_CHOICE1[45] <= KEY[61];
   OUTPUT_PERMUTATION_CHOICE1[46] <= KEY[53];
   OUTPUT_PERMUTATION_CHOICE1[47] <= KEY[45];
   OUTPUT_PERMUTATION_CHOICE1[48] <= KEY[37];
   OUTPUT_PERMUTATION_CHOICE1[49] <= KEY[29];
   OUTPUT_PERMUTATION_CHOICE1[50] <= KEY[21];
   OUTPUT_PERMUTATION_CHOICE1[51] <= KEY[13];
   OUTPUT_PERMUTATION_CHOICE1[52] <= KEY[5];
   OUTPUT_PERMUTATION_CHOICE1[53] <= KEY[28];
   OUTPUT_PERMUTATION_CHOICE1[54] <= KEY[20];
   OUTPUT_PERMUTATION_CHOICE1[55] <= KEY[12];
   OUTPUT_PERMUTATION_CHOICE1[56] <= KEY[4];
    
  end
   
   else
    
        begin
   
                              OUTPUT_PERMUTATION_CHOICE1 <= 64'bZ;
    
     end
   
  end
   
        endmodule
        
        
        module Permuted_Choice2(LEFT_CIRCULAR_SHIFT1, RIGHT_CIRCULAR_SHIFT1, SUBKEY);
             
         //input   [28 : 1] LEFTHALF_CIRCULAR_SHIFT1;
          
         input   [28 : 1] LEFT_CIRCULAR_SHIFT1;
          
         //input   [28 : 1] RIGHTHALF_CIRCULAR_SHIFT1;
          
         input   [28 : 1] RIGHT_CIRCULAR_SHIFT1;
             
         output  [48 : 1] SUBKEY;
          
         //wire    [28 : 1] LEFTHALF_CIRCULAR_SHIFT1;
         wire    [28 : 1] LEFT_CIRCULAR_SHIFT1;
          
         //wire    [28 : 1] RIGHTHALF_CIRCULAR_SHIFT1;
         wire    [28 : 1] RIGHT_CIRCULAR_SHIFT1;
          
         reg     [48 : 1] SUBKEY;
          
         //wire    [56 : 1] LEFT_CIRCULAR_SHIFT1;
          
         //wire    [56 : 1] LEFT_CIRCULAR_SHIFT2;
          
         wire      [56 : 1] PERMUTATION2_INPUT;
          
         assign
          
          PERMUTATION2_INPUT = {
        LEFT_CIRCULAR_SHIFT1 , RIGHT_CIRCULAR_SHIFT1
        };
           
         always @ (PERMUTATION2_INPUT)
          
          begin
          
          SUBKEY[1]  <= PERMUTATION2_INPUT[14];
          SUBKEY[2]  <= PERMUTATION2_INPUT[17];
          SUBKEY[3]  <= PERMUTATION2_INPUT[11];
          SUBKEY[4]  <= PERMUTATION2_INPUT[24];
          SUBKEY[5]  <= PERMUTATION2_INPUT[1];
          SUBKEY[6]  <= PERMUTATION2_INPUT[5];
          SUBKEY[7]  <= PERMUTATION2_INPUT[3];
          SUBKEY[8]  <= PERMUTATION2_INPUT[28];
          SUBKEY[9]  <= PERMUTATION2_INPUT[15];
          SUBKEY[10] <= PERMUTATION2_INPUT[6];
          SUBKEY[11] <= PERMUTATION2_INPUT[21];
          SUBKEY[12] <= PERMUTATION2_INPUT[10];
          SUBKEY[13] <= PERMUTATION2_INPUT[23];
          SUBKEY[14] <= PERMUTATION2_INPUT[19];
          SUBKEY[15] <= PERMUTATION2_INPUT[12];
          SUBKEY[16] <= PERMUTATION2_INPUT[4];
          SUBKEY[17] <= PERMUTATION2_INPUT[26];
          SUBKEY[18] <= PERMUTATION2_INPUT[8];
          SUBKEY[19] <= PERMUTATION2_INPUT[16];
          SUBKEY[20] <= PERMUTATION2_INPUT[7];
          SUBKEY[21] <= PERMUTATION2_INPUT[27];
          SUBKEY[22] <= PERMUTATION2_INPUT[20];
          SUBKEY[23] <= PERMUTATION2_INPUT[13];
          SUBKEY[24] <= PERMUTATION2_INPUT[2];
          SUBKEY[25] <= PERMUTATION2_INPUT[41];
          SUBKEY[26] <= PERMUTATION2_INPUT[52];
          SUBKEY[27] <= PERMUTATION2_INPUT[31];
          SUBKEY[28] <= PERMUTATION2_INPUT[37];
          SUBKEY[29] <= PERMUTATION2_INPUT[47];
          SUBKEY[30] <= PERMUTATION2_INPUT[55];
          SUBKEY[31] <= PERMUTATION2_INPUT[30];
          SUBKEY[32] <= PERMUTATION2_INPUT[40];
          SUBKEY[33] <= PERMUTATION2_INPUT[51];
          SUBKEY[34] <= PERMUTATION2_INPUT[45];
          SUBKEY[35] <= PERMUTATION2_INPUT[33];
          SUBKEY[36] <= PERMUTATION2_INPUT[48];
          SUBKEY[37] <= PERMUTATION2_INPUT[44];
          SUBKEY[38] <= PERMUTATION2_INPUT[49];
          SUBKEY[39] <= PERMUTATION2_INPUT[39];
          SUBKEY[40] <= PERMUTATION2_INPUT[56];
          SUBKEY[41] <= PERMUTATION2_INPUT[34];
          SUBKEY[42] <= PERMUTATION2_INPUT[53];
          SUBKEY[43] <= PERMUTATION2_INPUT[46];
          SUBKEY[44] <= PERMUTATION2_INPUT[42];
          SUBKEY[45] <= PERMUTATION2_INPUT[50];
          SUBKEY[46] <= PERMUTATION2_INPUT[36];
          SUBKEY[47] <= PERMUTATION2_INPUT[29];
          SUBKEY[48] <= PERMUTATION2_INPUT[32];
         
            end
         
        endmodule
        
        
        
        module Round1(CLK, RST, LEFT, RIGHT, KEY, LEFT1, RIGHT1);
         
        input  CLK;
         
        input  RST;
         
        input  [32 : 1] LEFT;
         
        input  [32 : 1] RIGHT;
         
        input  [48 : 1] KEY;
         
        output [32 : 1] LEFT1;
         
        output [32 : 1] RIGHT1;
         
        wire   [32 : 1] LEFT1;
         
        wire   [32 : 1] RIGHT1;
         
        wire   CLK;
         
        wire   RST;
         
        wire   [32 : 1] LEFT;
         
        wire   [32 : 1] RIGHT;
         
        wire   [48 : 1] KEY;
         
        wire   [48 : 1] EXPANSION_PERMUTATION;
         
        wire   [6 : 1]  S1_INPUT;
         
        wire   [6 : 1]  S2_INPUT;
         
        wire   [6 : 1]  S3_INPUT;
         
        wire   [6 : 1]  S4_INPUT;
         
        wire   [6 : 1]  S5_INPUT;
         
        wire   [6 : 1]  S6_INPUT;
         
        wire   [6 : 1]  S7_INPUT;
         
        wire   [6 : 1]  S8_INPUT;
         
        //wire   [48 : 1] SBOX_INPUT;
         
        wire   [3 : 0]  S1_OUTPUT;
         
        wire   [3 : 0]  S2_OUTPUT;
         
        wire   [3 : 0]  S3_OUTPUT;
         
        wire   [3 : 0]  S4_OUTPUT;
         
        wire   [3 : 0]  S5_OUTPUT;
         
        wire   [3 : 0]  S6_OUTPUT;
         
        wire   [3 : 0]  S7_OUTPUT;
         
        wire   [3 : 0]  S8_OUTPUT;
         
        wire   [32 : 1] S_OUTPUT;
         
        wire   [32 : 1] PERMUTATION_OUTPUT;
         
        wire   [32 : 1] RIGHT_REG;
         
        //wire   [6 : 1]  SBOX1_INPUT;
         
        //wire   [6 : 1]  SBOX2_INPUT;
         
        //wire   [6 : 1]  SBOX3_INPUT;
         
        //wire   [6 : 1]  SBOX4_INPUT;
         
        //wire   [6 : 1]  SBOX5_INPUT;
         
        //wire   [6 : 1]  SBOX6_INPUT;
         
        //wire   [6 : 1]  SBOX7_INPUT;
         
        //wire   [6 : 1]  SBOX8_INPUT;
         
          Expansion_Permutation expansion (
                                           .RIGHT(RIGHT),
          .EXPANSION_PERMUTATION(EXPANSION_PERMUTATION)
               );
          
          Xor_Operation expansion_to_xor1  (
                                           .EXPANSION_PERMUTATION(EXPANSION_PERMUTATION),
          .SUBKEY(KEY),
          .SBOX1_INPUT(S1_INPUT), 
          .SBOX2_INPUT(S2_INPUT),
          .SBOX3_INPUT(S3_INPUT),
          .SBOX4_INPUT(S4_INPUT),
          .SBOX5_INPUT(S5_INPUT),
                                           .SBOX6_INPUT(S6_INPUT),
                                           .SBOX7_INPUT(S7_INPUT),
                                           .SBOX8_INPUT(S8_INPUT) 
                                          );
            
          Sbox_Rom1 s1                    (
                                           .S1_INPUT(S1_INPUT),
          .S1_OUTPUT(S1_OUTPUT)
         );
         
          Sbox_Rom2 s2                    (
                                           .S2_INPUT(S2_INPUT),
          .S2_OUTPUT (S2_OUTPUT)
         );
          Sbox_Rom3 s3                    (
                                           .S3_INPUT(S3_INPUT),
          .S3_OUTPUT (S3_OUTPUT)
         );
          Sbox_Rom4 s4(
                                           .S4_INPUT(S4_INPUT),
          .S4_OUTPUT (S4_OUTPUT)
        );
          Sbox_Rom5 s5                   (
                                           .S5_INPUT(S5_INPUT),
          .S5_OUTPUT (S5_OUTPUT)
                                         );
          Sbox_Rom6 s6                   (
                                           .S6_INPUT(S6_INPUT),
          .S6_OUTPUT (S6_OUTPUT)
        );
          Sbox_Rom7 s7                   (
                                           .S7_INPUT(S7_INPUT),
          .S7_OUTPUT (S7_OUTPUT)
        );
          Sbox_Rom8 s8                   (
                                           .S8_INPUT(S8_INPUT),
          .S8_OUTPUT (S8_OUTPUT)
        );
          Sbox_Output sout               (
                                           .S1_OUTPUT(S1_OUTPUT),
          .S2_OUTPUT(S2_OUTPUT),
          .S3_OUTPUT(S3_OUTPUT),
          .S4_OUTPUT(S4_OUTPUT),
          .S5_OUTPUT(S5_OUTPUT),
          .S6_OUTPUT(S6_OUTPUT),
          .S7_OUTPUT(S7_OUTPUT),
          .S8_OUTPUT(S8_OUTPUT),
          .S_OUTPUT (S_OUTPUT)
        );
          Permutation s_to_permutation   (
                                           .S_OUTPUT(S_OUTPUT),
           .PERMUTATION_OUTPUT(PERMUTATION_OUTPUT)
          
        );
          
          Xor_Permutation permut_xor     (
                                           .PERMUTATION_OUTPUT(PERMUTATION_OUTPUT),
          .LEFT(LEFT),
          .RIGHT_REG(RIGHT_REG)
        );
           
         
          Reg32 input_to_round2          (
                                           .CLK(CLK),
          .RST(RST),
          .RIGHT(RIGHT),
          .RIGHT_REG(RIGHT_REG),
          .LEFT_REG1(LEFT1),
          .RIGHT_REG1(RIGHT1)
        );
         
         
        endmodule
        
        
        
        module Expansion_Permutation(RIGHT, EXPANSION_PERMUTATION);
            
            input  [32 : 1] RIGHT;
         
         output [48 : 1] EXPANSION_PERMUTATION;
          
         wire   [32 : 1] RIGHT;
          
         reg    [48 : 1] EXPANSION_PERMUTATION;
          
         
            always @(RIGHT)
         
                begin
         
                   EXPANSION_PERMUTATION[1]   <= RIGHT[32];
                   EXPANSION_PERMUTATION[2]   <= RIGHT[1]; 
                   EXPANSION_PERMUTATION[3]   <= RIGHT[2];   
                EXPANSION_PERMUTATION[4]   <= RIGHT[3]; 
                   EXPANSION_PERMUTATION[5]   <= RIGHT[4];
                   EXPANSION_PERMUTATION[6]   <= RIGHT[5]; 
                   EXPANSION_PERMUTATION[7]   <= RIGHT[4];
                   EXPANSION_PERMUTATION[8]   <= RIGHT[5]; 
                   EXPANSION_PERMUTATION[9]   <= RIGHT[6];
                   EXPANSION_PERMUTATION[10]  <= RIGHT[7]; 
          EXPANSION_PERMUTATION[11]  <= RIGHT[8]; 
          EXPANSION_PERMUTATION[12]  <= RIGHT[9]; 
          EXPANSION_PERMUTATION[13]  <= RIGHT[8]; 
          EXPANSION_PERMUTATION[14]  <= RIGHT[9]; 
          EXPANSION_PERMUTATION[15]  <= RIGHT[10]; 
          EXPANSION_PERMUTATION[16]  <= RIGHT[11]; 
          EXPANSION_PERMUTATION[17]  <= RIGHT[12]; 
          EXPANSION_PERMUTATION[18]  <= RIGHT[13]; 
          EXPANSION_PERMUTATION[19]  <= RIGHT[12]; 
          EXPANSION_PERMUTATION[20]  <= RIGHT[13]; 
          EXPANSION_PERMUTATION[21]  <= RIGHT[14]; 
          EXPANSION_PERMUTATION[22]  <= RIGHT[15]; 
          EXPANSION_PERMUTATION[23]  <= RIGHT[16]; 
          EXPANSION_PERMUTATION[24]  <= RIGHT[17]; 
          EXPANSION_PERMUTATION[25]  <= RIGHT[16]; 
          EXPANSION_PERMUTATION[26]  <= RIGHT[17]; 
          EXPANSION_PERMUTATION[27]  <= RIGHT[18]; 
          EXPANSION_PERMUTATION[28]  <= RIGHT[19]; 
          EXPANSION_PERMUTATION[29]  <= RIGHT[20]; 
          EXPANSION_PERMUTATION[30]  <= RIGHT[21]; 
          EXPANSION_PERMUTATION[31]  <= RIGHT[20]; 
          EXPANSION_PERMUTATION[32]  <= RIGHT[21];
          EXPANSION_PERMUTATION[33]  <= RIGHT[22];
                   EXPANSION_PERMUTATION[34]  <= RIGHT[23]; 
                   EXPANSION_PERMUTATION[35]  <= RIGHT[24];
                   EXPANSION_PERMUTATION[36]  <= RIGHT[25]; 
                   EXPANSION_PERMUTATION[37]  <= RIGHT[24];   
          EXPANSION_PERMUTATION[38]  <= RIGHT[25]; 
          EXPANSION_PERMUTATION[39]  <= RIGHT[26]; 
          EXPANSION_PERMUTATION[40]  <= RIGHT[27]; 
          EXPANSION_PERMUTATION[41]  <= RIGHT[28]; 
          EXPANSION_PERMUTATION[42]  <= RIGHT[29]; 
          EXPANSION_PERMUTATION[43]  <= RIGHT[28]; 
          EXPANSION_PERMUTATION[44]  <= RIGHT[29]; 
          EXPANSION_PERMUTATION[45]  <= RIGHT[30]; 
          EXPANSION_PERMUTATION[46]  <= RIGHT[31]; 
          EXPANSION_PERMUTATION[47]  <= RIGHT[32]; 
          EXPANSION_PERMUTATION[48]  <= RIGHT[1];
         
               end
          
        endmodule
        
        module Xor_Operation(EXPANSION_PERMUTATION, SUBKEY, SBOX1_INPUT, SBOX2_INPUT, SBOX3_INPUT,
                             SBOX4_INPUT, SBOX5_INPUT, SBOX6_INPUT, SBOX7_INPUT, SBOX8_INPUT);
             
         input    [48 : 1] EXPANSION_PERMUTATION;
             
         input    [48 : 1] SUBKEY;
             
         output   [6 : 1]  SBOX1_INPUT;
          
         output   [6 : 1]  SBOX2_INPUT;
          
         output   [6 : 1]  SBOX3_INPUT;
          
         output   [6 : 1]  SBOX4_INPUT;
          
         output   [6 : 1]  SBOX5_INPUT;
          
         output   [6 : 1]  SBOX6_INPUT;
          
         output   [6 : 1]  SBOX7_INPUT;
          
         output   [6 : 1]  SBOX8_INPUT;
          
         wire     [48 : 1] EXPANSION_PERMUTATION;
          
         wire     [48 : 1] SUBKEY;
          
         wire     [48 : 1] SBOX_INPUT;
          
         assign   SBOX_INPUT    =  EXPANSION_PERMUTATION ^ SUBKEY;
          
         assign   SBOX1_INPUT   =  SBOX_INPUT[48 : 43];
          
         assign   SBOX2_INPUT   =  SBOX_INPUT[42 : 37];
          
         assign   SBOX3_INPUT   =  SBOX_INPUT[36 : 31];
          
         assign   SBOX4_INPUT   =  SBOX_INPUT[30 : 25];
          
         assign   SBOX5_INPUT   =  SBOX_INPUT[24 : 19];
           
         assign   SBOX6_INPUT   =  SBOX_INPUT[18 : 13];
         
         assign   SBOX7_INPUT   =  SBOX_INPUT[12 : 7];
          
         assign   SBOX8_INPUT   =  SBOX_INPUT[6 : 1];
           
           
        endmodule
        
        
        module Xor_Permutation(PERMUTATION_OUTPUT, LEFT, RIGHT_REG);
         
          input  [32 : 1]PERMUTATION_OUTPUT;
           
          input  [32 : 1]LEFT;
           
         // input  [32 : 1]RIGHT_REG1;
           
         // output [32 : 1]LEFT_REG2;
           
          output [32 : 1]RIGHT_REG;
           
          wire   [32 : 1]PERMUTATION_OUTPUT;
           
          wire   [32 : 1]LEFT;
           
         // wire   [32 : 1]RIGHT_REG1;
           
         // reg    [32 : 1]LEFT_REG2;
           
          reg    [32 : 1]RIGHT_REG;
           
          always @(PERMUTATION_OUTPUT or LEFT or RIGHT_REG)
           
             begin
           
        //     LEFT_REG2  <= RIGHT_REG1;
           
             RIGHT_REG <= PERMUTATION_OUTPUT ^ LEFT;
           
             end
         
        endmodule
        
        
        module Sbox_Rom1(S1_INPUT, S1_OUTPUT);
             
            input  [6 : 1] S1_INPUT;
          
            output [3 : 0] S1_OUTPUT;
          
         wire   [6 : 1] S1_INPUT;
          
         reg    [3 : 0] S1_OUTPUT;
          
         wire   [6 : 1] S1_SELECT;
          
         assign S1_SELECT = {
        S1_INPUT[6], S1_INPUT[1], S1_INPUT[5 : 2]
        };
          
         always @(S1_SELECT)
          
          begin
           
            case (S1_SELECT)
                    6'b000000: S1_OUTPUT <= 4'hE;
                    6'b000001: S1_OUTPUT <= 4'h4;
                    6'b000010: S1_OUTPUT <= 4'hD;
                    6'b000011: S1_OUTPUT <= 4'h1;
                    6'b000100: S1_OUTPUT <= 4'h2;
                    6'b000101: S1_OUTPUT <= 4'hF;
                    6'b000110: S1_OUTPUT <= 4'hB;
                    6'b000111: S1_OUTPUT <= 4'h8;
                    6'b001000: S1_OUTPUT <= 4'h3;
                    6'b001001: S1_OUTPUT <= 4'hA;
                    6'b001010: S1_OUTPUT <= 4'h6;
                    6'b001011: S1_OUTPUT <= 4'hC;
                    6'b001100: S1_OUTPUT <= 4'h5;
                    6'b001101: S1_OUTPUT <= 4'h9;
                    6'b001110: S1_OUTPUT <= 4'h0;
                    6'b001111: S1_OUTPUT <= 4'h7;
                    6'b010000: S1_OUTPUT <= 4'h0;
                    6'b010001: S1_OUTPUT <= 4'hF;
                    6'b010010: S1_OUTPUT <= 4'h7;
                    6'b010011: S1_OUTPUT <= 4'h4;
                    6'b010100: S1_OUTPUT <= 4'hE;
                    6'b010101: S1_OUTPUT <= 4'h2;
                    6'b010110: S1_OUTPUT <= 4'hD;
                    6'b010111: S1_OUTPUT <= 4'h1;
                    6'b011000: S1_OUTPUT <= 4'hA;
                    6'b011001: S1_OUTPUT <= 4'h6;
                    6'b011010: S1_OUTPUT <= 4'hC;
                    6'b011011: S1_OUTPUT <= 4'hB;
                    6'b011100: S1_OUTPUT <= 4'h9;
                    6'b011101: S1_OUTPUT <= 4'h5;
                    6'b011110: S1_OUTPUT <= 4'h3;
                    6'b011111: S1_OUTPUT <= 4'h8;
                    6'b100000: S1_OUTPUT <= 4'h4;
                    6'b100001: S1_OUTPUT <= 4'h1;
                    6'b100010: S1_OUTPUT <= 4'hE;
                    6'b100011: S1_OUTPUT <= 4'h8;
                    6'b100100: S1_OUTPUT <= 4'hD;
                    6'b100101: S1_OUTPUT <= 4'h6;
                    6'b100110: S1_OUTPUT <= 4'h2;
                    6'b100111: S1_OUTPUT <= 4'hB;
                    6'b101000: S1_OUTPUT <= 4'hF;
                    6'b101001: S1_OUTPUT <= 4'hC;
                    6'b101010: S1_OUTPUT <= 4'h9;
                    6'b101011: S1_OUTPUT <= 4'h7;
                    6'b101100: S1_OUTPUT <= 4'h3;
                    6'b101101: S1_OUTPUT <= 4'hA;
                    6'b101110: S1_OUTPUT <= 4'h5;
                    6'b101111: S1_OUTPUT <= 4'h0;
                    6'b110000: S1_OUTPUT <= 4'hF;
                    6'b110001: S1_OUTPUT <= 4'hC;
                    6'b110010: S1_OUTPUT <= 4'h8;
                    6'b110011: S1_OUTPUT <= 4'h2;
                    6'b110100: S1_OUTPUT <= 4'h4;
                    6'b110101: S1_OUTPUT <= 4'h9;
                    6'b110110: S1_OUTPUT <= 4'h1;
                    6'b110111: S1_OUTPUT <= 4'h7;
                    6'b111000: S1_OUTPUT <= 4'h5;
                    6'b111001: S1_OUTPUT <= 4'hB;
                    6'b111010: S1_OUTPUT <= 4'h3;
                    6'b111011: S1_OUTPUT <= 4'hE;
                    6'b111100: S1_OUTPUT <= 4'hA;
                    6'b111101: S1_OUTPUT <= 4'h0;
                    6'b111110: S1_OUTPUT <= 4'h6;
                    6'b111111: S1_OUTPUT <= 4'hD;
                    default:   S1_OUTPUT <= 4'h0;
         
                 endcase
         
        end
         
        endmodule
        
        
        module Sbox_Rom2(S2_INPUT, S2_OUTPUT);
             
         input  [6 : 1] S2_INPUT;
             
         output [3 : 0] S2_OUTPUT;
          
            wire   [6 : 1] S2_INPUT;
          
         reg    [3 : 0] S2_OUTPUT;
          
         wire   [6 : 1] S2_SELECT;
          
         assign S2_SELECT = {
        S2_INPUT[6],S2_INPUT[1],S2_INPUT[5 : 2]
        };
          
         always @(S2_SELECT)
          
          begin
           
            case(S2_SELECT)
           
                    6'b000000: S2_OUTPUT <= 4'hF;
                    6'b000001: S2_OUTPUT <= 4'h1;
                    6'b000010: S2_OUTPUT <= 4'h8;
                    6'b000011: S2_OUTPUT <= 4'hE;
                    6'b000100: S2_OUTPUT <= 4'h6;
                    6'b000101: S2_OUTPUT <= 4'hB;
                    6'b000110: S2_OUTPUT <= 4'h3;
                    6'b000111: S2_OUTPUT <= 4'h4;
                    6'b001000: S2_OUTPUT <= 4'h9;
                    6'b001001: S2_OUTPUT <= 4'h7;
                    6'b001010: S2_OUTPUT <= 4'h2;
                    6'b001011: S2_OUTPUT <= 4'hD;
                    6'b001100: S2_OUTPUT <= 4'hC;
                    6'b001101: S2_OUTPUT <= 4'h0;
                    6'b001110: S2_OUTPUT <= 4'h5;
                    6'b001111: S2_OUTPUT <= 4'hA;
                    6'b010000: S2_OUTPUT <= 4'h3;
                    6'b010001: S2_OUTPUT <= 4'hD;
                    6'b010010: S2_OUTPUT <= 4'h4;
                    6'b010011: S2_OUTPUT <= 4'h7;
                    6'b010100: S2_OUTPUT <= 4'hF;
                    6'b010101: S2_OUTPUT <= 4'h2;
                    6'b010110: S2_OUTPUT <= 4'h8;
                    6'b010111: S2_OUTPUT <= 4'hE;
                    6'b011000: S2_OUTPUT <= 4'hC;
                    6'b011001: S2_OUTPUT <= 4'h0;
                    6'b011010: S2_OUTPUT <= 4'h1;
                    6'b011011: S2_OUTPUT <= 4'hA;
                    6'b011100: S2_OUTPUT <= 4'h6;
                    6'b011101: S2_OUTPUT <= 4'h9;
                    6'b011110: S2_OUTPUT <= 4'hB;
                    6'b011111: S2_OUTPUT <= 4'h5;
                    6'b100000: S2_OUTPUT <= 4'h0;
                    6'b100001: S2_OUTPUT <= 4'hE;
                    6'b100010: S2_OUTPUT <= 4'h7;
                    6'b100011: S2_OUTPUT <= 4'hB;
                    6'b100100: S2_OUTPUT <= 4'hA;
                    6'b100101: S2_OUTPUT <= 4'h4;
                    6'b100110: S2_OUTPUT <= 4'hD;
                    6'b100111: S2_OUTPUT <= 4'h1;
                    6'b101000: S2_OUTPUT <= 4'h5;
                    6'b101001: S2_OUTPUT <= 4'h8;
                    6'b101010: S2_OUTPUT <= 4'hC;
                    6'b101011: S2_OUTPUT <= 4'h6;
                    6'b101100: S2_OUTPUT <= 4'h9;
                    6'b101101: S2_OUTPUT <= 4'h3;
                    6'b101110: S2_OUTPUT <= 4'h2;
                    6'b101111: S2_OUTPUT <= 4'hF;
                    6'b110000: S2_OUTPUT <= 4'hD;
                    6'b110001: S2_OUTPUT <= 4'h8;
                    6'b110010: S2_OUTPUT <= 4'hA;
                    6'b110011: S2_OUTPUT <= 4'h1;
                    6'b110100: S2_OUTPUT <= 4'h3;
                    6'b110101: S2_OUTPUT <= 4'hF;
                    6'b110110: S2_OUTPUT <= 4'h4;
                    6'b110111: S2_OUTPUT <= 4'h2;
                    6'b111000: S2_OUTPUT <= 4'hB;
                    6'b111001: S2_OUTPUT <= 4'h6;
                    6'b111010: S2_OUTPUT <= 4'h7;
                    6'b111011: S2_OUTPUT <= 4'hC;
                    6'b111100: S2_OUTPUT <= 4'h0;
                    6'b111101: S2_OUTPUT <= 4'h5;
                    6'b111110: S2_OUTPUT <= 4'hE;
                    6'b111111: S2_OUTPUT <= 4'h9;
                    default:   S2_OUTPUT <= 4'h0;
         
                 endcase
         
        end
         
        endmodule   
        
        
        
        module Sbox_Rom3(S3_INPUT , S3_OUTPUT);
             
         input  [6 : 1] S3_INPUT ;
             
         output [3 : 0] S3_OUTPUT;
          
         wire   [6 : 1] S3_INPUT;
          
         reg    [3 : 0] S3_OUTPUT;
          
         wire   [6 : 1] S3_SELECT;
          
         assign S3_SELECT = {
        S3_INPUT[6],S3_INPUT[1],S3_INPUT[5 : 2]
        };
          
         always @(S3_SELECT)
          
          begin
           
            case(S3_SELECT)
           
                    6'b000000: S3_OUTPUT <= 4'hA;
                    6'b000001: S3_OUTPUT <= 4'h0;
                    6'b000010: S3_OUTPUT <= 4'h9;
                    6'b000011: S3_OUTPUT <= 4'hE;
                    6'b000100: S3_OUTPUT <= 4'h6;
                    6'b000101: S3_OUTPUT <= 4'h3;
                    6'b000110: S3_OUTPUT <= 4'hF;
                    6'b000111: S3_OUTPUT <= 4'h5;
                    6'b001000: S3_OUTPUT <= 4'h1;
                    6'b001001: S3_OUTPUT <= 4'hD;
                    6'b001010: S3_OUTPUT <= 4'hC;
                    6'b001011: S3_OUTPUT <= 4'h7;
                    6'b001100: S3_OUTPUT <= 4'hB;
                    6'b001101: S3_OUTPUT <= 4'h4;
                    6'b001110: S3_OUTPUT <= 4'h2;
                    6'b001111: S3_OUTPUT <= 4'h8;
                    6'b010000: S3_OUTPUT <= 4'hD;
                    6'b010001: S3_OUTPUT <= 4'h7;
                    6'b010010: S3_OUTPUT <= 4'h0;
                    6'b010011: S3_OUTPUT <= 4'h9;
                    6'b010100: S3_OUTPUT <= 4'h3;
                    6'b010101: S3_OUTPUT <= 4'h4;
                    6'b010110: S3_OUTPUT <= 4'h6;
                    6'b010111: S3_OUTPUT <= 4'hA;
                    6'b011000: S3_OUTPUT <= 4'h2;
                    6'b011001: S3_OUTPUT <= 4'h8;
                    6'b011010: S3_OUTPUT <= 4'h5;
                    6'b011011: S3_OUTPUT <= 4'hE;
                    6'b011100: S3_OUTPUT <= 4'hC;
                    6'b011101: S3_OUTPUT <= 4'hB;
                    6'b011110: S3_OUTPUT <= 4'hF;
                    6'b011111: S3_OUTPUT <= 4'h1;
                    6'b100000: S3_OUTPUT <= 4'hD;
                    6'b100001: S3_OUTPUT <= 4'h6;
                    6'b100010: S3_OUTPUT <= 4'h4;
                    6'b100011: S3_OUTPUT <= 4'h9;
                    6'b100100: S3_OUTPUT <= 4'h8;
                    6'b100101: S3_OUTPUT <= 4'hF;
                    6'b100110: S3_OUTPUT <= 4'h3;
                    6'b100111: S3_OUTPUT <= 4'h0;
                    6'b101000: S3_OUTPUT <= 4'hB;
                    6'b101001: S3_OUTPUT <= 4'h1;
                    6'b101010: S3_OUTPUT <= 4'h2;
                    6'b101011: S3_OUTPUT <= 4'hC;
                    6'b101100: S3_OUTPUT <= 4'h5;
                    6'b101101: S3_OUTPUT <= 4'hA;
                    6'b101110: S3_OUTPUT <= 4'hE;
                    6'b101111: S3_OUTPUT <= 4'h7;
                    6'b110000: S3_OUTPUT <= 4'h1;
                    6'b110001: S3_OUTPUT <= 4'hA;
                    6'b110010: S3_OUTPUT <= 4'hD;
                    6'b110011: S3_OUTPUT <= 4'h0;
                    6'b110100: S3_OUTPUT <= 4'h6;
                    6'b110101: S3_OUTPUT <= 4'h9;
                    6'b110110: S3_OUTPUT <= 4'h8;
                    6'b110111: S3_OUTPUT <= 4'h7;
                    6'b111000: S3_OUTPUT <= 4'h4;
                    6'b111001: S3_OUTPUT <= 4'hF;
                    6'b111010: S3_OUTPUT <= 4'hE;
                    6'b111011: S3_OUTPUT <= 4'h3;
                    6'b111100: S3_OUTPUT <= 4'hB;
                    6'b111101: S3_OUTPUT <= 4'h5;
                    6'b111110: S3_OUTPUT <= 4'h2;
                    6'b111111: S3_OUTPUT <= 4'hC;
                    default:   S3_OUTPUT <= 4'h0;
         
                 endcase
         
        end
         
        endmodule   
        
        module Sbox_Rom4(S4_INPUT, S4_OUTPUT);
             
         input   [6 : 1]S4_INPUT;
             
         output  [3  : 0 ]S4_OUTPUT;
         
            wire    [6 : 1] S4_INPUT;
          
         reg     [3 : 0] S4_OUTPUT;
          
         wire    [6 : 1] S4_SELECT;
          
         assign S4_SELECT = {
        S4_INPUT[6],S4_INPUT[1],S4_INPUT[5 : 2]
        };
          
         always @(S4_SELECT)
          
          begin
           
            case(S4_SELECT)
           
                    6'b000000: S4_OUTPUT <= 4'h7;
                    6'b000001: S4_OUTPUT <= 4'hD;
                    6'b000010: S4_OUTPUT <= 4'hE;
                    6'b000011: S4_OUTPUT <= 4'h3;
                    6'b000100: S4_OUTPUT <= 4'h0;
                    6'b000101: S4_OUTPUT <= 4'h6;
                    6'b000110: S4_OUTPUT <= 4'h9;
                    6'b000111: S4_OUTPUT <= 4'hA;
                    6'b001000: S4_OUTPUT <= 4'h1;
                    6'b001001: S4_OUTPUT <= 4'h2;
                    6'b001010: S4_OUTPUT <= 4'h8;
                    6'b001011: S4_OUTPUT <= 4'h5;
                    6'b001100: S4_OUTPUT <= 4'hB;
                    6'b001101: S4_OUTPUT <= 4'hC;
                    6'b001110: S4_OUTPUT <= 4'h4;
                    6'b001111: S4_OUTPUT <= 4'hF;
                    6'b010000: S4_OUTPUT <= 4'hD;
                    6'b010001: S4_OUTPUT <= 4'h8;
                    6'b010010: S4_OUTPUT <= 4'hB;
                    6'b010011: S4_OUTPUT <= 4'h5;
                    6'b010100: S4_OUTPUT <= 4'h6;
                    6'b010101: S4_OUTPUT <= 4'hF;
                    6'b010110: S4_OUTPUT <= 4'h0;
                    6'b010111: S4_OUTPUT <= 4'h3;
                    6'b011000: S4_OUTPUT <= 4'h4;
                    6'b011001: S4_OUTPUT <= 4'h7;
                    6'b011010: S4_OUTPUT <= 4'h2;
                    6'b011011: S4_OUTPUT <= 4'hC;
                    6'b011100: S4_OUTPUT <= 4'h1;
                    6'b011101: S4_OUTPUT <= 4'hA;
                    6'b011110: S4_OUTPUT <= 4'hE;
                    6'b011111: S4_OUTPUT <= 4'h9;
                    6'b100000: S4_OUTPUT <= 4'hA;
                    6'b100001: S4_OUTPUT <= 4'h6;
                    6'b100010: S4_OUTPUT <= 4'h9;
                    6'b100011: S4_OUTPUT <= 4'h0;
                    6'b100100: S4_OUTPUT <= 4'hC;
                    6'b100101: S4_OUTPUT <= 4'hB;
                    6'b100110: S4_OUTPUT <= 4'h7;
                    6'b100111: S4_OUTPUT <= 4'hD;
                    6'b101000: S4_OUTPUT <= 4'hF;
                    6'b101001: S4_OUTPUT <= 4'h1;
                    6'b101010: S4_OUTPUT <= 4'h3;
                    6'b101011: S4_OUTPUT <= 4'hE;
                    6'b101100: S4_OUTPUT <= 4'h5;
                    6'b101101: S4_OUTPUT <= 4'h2;
                    6'b101110: S4_OUTPUT <= 4'h8;
                    6'b101111: S4_OUTPUT <= 4'h4;
                    6'b110000: S4_OUTPUT <= 4'h3;
                    6'b110001: S4_OUTPUT <= 4'hF;
                    6'b110010: S4_OUTPUT <= 4'h0;
                    6'b110011: S4_OUTPUT <= 4'h6;
                    6'b110100: S4_OUTPUT <= 4'hA;
                    6'b110101: S4_OUTPUT <= 4'h1;
                    6'b110110: S4_OUTPUT <= 4'hD;
                    6'b110111: S4_OUTPUT <= 4'h8;
                    6'b111000: S4_OUTPUT <= 4'h9;
                    6'b111001: S4_OUTPUT <= 4'h4;
                    6'b111010: S4_OUTPUT <= 4'h5;
                    6'b111011: S4_OUTPUT <= 4'hB;
                    6'b111100: S4_OUTPUT <= 4'hC;
                    6'b111101: S4_OUTPUT <= 4'h7;
                    6'b111110: S4_OUTPUT <= 4'h2;
                    6'b111111: S4_OUTPUT <= 4'hE;
                    default:   S4_OUTPUT <= 4'h0;
         
                 endcase
         
        end
         
        endmodule   
        
        module Sbox_Rom5(S5_INPUT, S5_OUTPUT);
             
         input  [6 : 1] S5_INPUT;
             
         output [3  : 0 ] S5_OUTPUT;
          
         wire   [6 : 1] S5_INPUT;
          
         reg    [3 : 0] S5_OUTPUT;
          
         wire   [6 : 1] S5_SELECT;
          
         assign S5_SELECT = {
        S5_INPUT[6],S5_INPUT[1],S5_INPUT[5 : 2]
        };
          
         always @(S5_SELECT)
          
          begin
           
            case(S5_SELECT)
           
                    6'b000000: S5_OUTPUT <= 4'h2;
                    6'b000001: S5_OUTPUT <= 4'hC;
                    6'b000010: S5_OUTPUT <= 4'h4;
                    6'b000011: S5_OUTPUT <= 4'h1;
                    6'b000100: S5_OUTPUT <= 4'h7;
                    6'b000101: S5_OUTPUT <= 4'hA;
                    6'b000110: S5_OUTPUT <= 4'hB;
                    6'b000111: S5_OUTPUT <= 4'h6;
                    6'b001000: S5_OUTPUT <= 4'h8;
                    6'b001001: S5_OUTPUT <= 4'h5;
                    6'b001010: S5_OUTPUT <= 4'h3;
                    6'b001011: S5_OUTPUT <= 4'hF;
                    6'b001100: S5_OUTPUT <= 4'hD;
                    6'b001101: S5_OUTPUT <= 4'h0;
                    6'b001110: S5_OUTPUT <= 4'hE;
                    6'b001111: S5_OUTPUT <= 4'h9;
                    6'b010000: S5_OUTPUT <= 4'hE;
                    6'b010001: S5_OUTPUT <= 4'hB;
                    6'b010010: S5_OUTPUT <= 4'h2;
                    6'b010011: S5_OUTPUT <= 4'hC;
                    6'b010100: S5_OUTPUT <= 4'h4;
                    6'b010101: S5_OUTPUT <= 4'h7;
                    6'b010110: S5_OUTPUT <= 4'hD;
                    6'b010111: S5_OUTPUT <= 4'h1;
                    6'b011000: S5_OUTPUT <= 4'h5;
                    6'b011001: S5_OUTPUT <= 4'h0;
                    6'b011010: S5_OUTPUT <= 4'hF;
                    6'b011011: S5_OUTPUT <= 4'hA;
                    6'b011100: S5_OUTPUT <= 4'h3;
                    6'b011101: S5_OUTPUT <= 4'h9;
                    6'b011110: S5_OUTPUT <= 4'h8;
                    6'b011111: S5_OUTPUT <= 4'h6;
                    6'b100000: S5_OUTPUT <= 4'h4;
                    6'b100001: S5_OUTPUT <= 4'h2;
                    6'b100010: S5_OUTPUT <= 4'h1;
                    6'b100011: S5_OUTPUT <= 4'hB;
                    6'b100100: S5_OUTPUT <= 4'hA;
                    6'b100101: S5_OUTPUT <= 4'hD;
                    6'b100110: S5_OUTPUT <= 4'h7;
                    6'b100111: S5_OUTPUT <= 4'h8;
                    6'b101000: S5_OUTPUT <= 4'hF;
                    6'b101001: S5_OUTPUT <= 4'h9;
                    6'b101010: S5_OUTPUT <= 4'hC;
                    6'b101011: S5_OUTPUT <= 4'h5;
                    6'b101100: S5_OUTPUT <= 4'h6;
                    6'b101101: S5_OUTPUT <= 4'h3;
                    6'b101110: S5_OUTPUT <= 4'h0;
                    6'b101111: S5_OUTPUT <= 4'hE;
                    6'b110000: S5_OUTPUT <= 4'hB;
                    6'b110001: S5_OUTPUT <= 4'h8;
                    6'b110010: S5_OUTPUT <= 4'hC;
                    6'b110011: S5_OUTPUT <= 4'h7;
                    6'b110100: S5_OUTPUT <= 4'h1;
                    6'b110101: S5_OUTPUT <= 4'hE;
                    6'b110110: S5_OUTPUT <= 4'h2;
                    6'b110111: S5_OUTPUT <= 4'hD;
                    6'b111000: S5_OUTPUT <= 4'h6;
                    6'b111001: S5_OUTPUT <= 4'hF;
                    6'b111010: S5_OUTPUT <= 4'h0;
                    6'b111011: S5_OUTPUT <= 4'h9;
                    6'b111100: S5_OUTPUT <= 4'hA;
                    6'b111101: S5_OUTPUT <= 4'h4;
                    6'b111110: S5_OUTPUT <= 4'h5;
                    6'b111111: S5_OUTPUT <= 4'h3;
                    default:   S5_OUTPUT <= 4'h0;
         
                 endcase
         
        end
         
        endmodule   
        
        module Sbox_Rom6(S6_INPUT, S6_OUTPUT);
             
         input  [6 : 1] S6_INPUT;
             
         output [3  : 0 ] S6_OUTPUT;
            
            wire   [6 : 1] S6_INPUT;
          
         reg    [3 : 0] S6_OUTPUT;
          
         wire   [6 : 1] S6_SELECT;
          
         assign S6_SELECT = {
        S6_INPUT[6],S6_INPUT[1],S6_INPUT[5 : 2]
        };
          
         always @(S6_SELECT)
          
          begin
           
            case(S6_SELECT)
           
                    6'b000000: S6_OUTPUT <= 4'hC;
                    6'b000001: S6_OUTPUT <= 4'h1;
                    6'b000010: S6_OUTPUT <= 4'hA;
                    6'b000011: S6_OUTPUT <= 4'hF;
                    6'b000100: S6_OUTPUT <= 4'h9;
                    6'b000101: S6_OUTPUT <= 4'h2;
                    6'b000110: S6_OUTPUT <= 4'h6;
                    6'b000111: S6_OUTPUT <= 4'h8;
                    6'b001000: S6_OUTPUT <= 4'h0;
                    6'b001001: S6_OUTPUT <= 4'hD;
                    6'b001010: S6_OUTPUT <= 4'h3;
                    6'b001011: S6_OUTPUT <= 4'h4;
                    6'b001100: S6_OUTPUT <= 4'hE;
                    6'b001101: S6_OUTPUT <= 4'h7;
                    6'b001110: S6_OUTPUT <= 4'h5;
                    6'b001111: S6_OUTPUT <= 4'hB;
                    6'b010000: S6_OUTPUT <= 4'hA;
                    6'b010001: S6_OUTPUT <= 4'hF;
                    6'b010010: S6_OUTPUT <= 4'h4;
                    6'b010011: S6_OUTPUT <= 4'h2;
                    6'b010100: S6_OUTPUT <= 4'h7;
                    6'b010101: S6_OUTPUT <= 4'hC;
                    6'b010110: S6_OUTPUT <= 4'h9;
                    6'b010111: S6_OUTPUT <= 4'h5;
                    6'b011000: S6_OUTPUT <= 4'h6;
                    6'b011001: S6_OUTPUT <= 4'h1;
                    6'b011010: S6_OUTPUT <= 4'hD;
                    6'b011011: S6_OUTPUT <= 4'hE;
                    6'b011100: S6_OUTPUT <= 4'h0;
                    6'b011101: S6_OUTPUT <= 4'hB;
                    6'b011110: S6_OUTPUT <= 4'h3;
                    6'b011111: S6_OUTPUT <= 4'h8;
                    6'b100000: S6_OUTPUT <= 4'h9;
                    6'b100001: S6_OUTPUT <= 4'hE;
                    6'b100010: S6_OUTPUT <= 4'hF;
                    6'b100011: S6_OUTPUT <= 4'h5;
                    6'b100100: S6_OUTPUT <= 4'h2;
                    6'b100101: S6_OUTPUT <= 4'h8;
                    6'b100110: S6_OUTPUT <= 4'hC;
                    6'b100111: S6_OUTPUT <= 4'h3;
                    6'b101000: S6_OUTPUT <= 4'h7;
                    6'b101001: S6_OUTPUT <= 4'h0;
                    6'b101010: S6_OUTPUT <= 4'h4;
                    6'b101011: S6_OUTPUT <= 4'hA;
                    6'b101100: S6_OUTPUT <= 4'h1;
                    6'b101101: S6_OUTPUT <= 4'hD;
                    6'b101110: S6_OUTPUT <= 4'hB;
                    6'b101111: S6_OUTPUT <= 4'h6;
                    6'b110000: S6_OUTPUT <= 4'h4;
                    6'b110001: S6_OUTPUT <= 4'h3;
                    6'b110010: S6_OUTPUT <= 4'h2;
                    6'b110011: S6_OUTPUT <= 4'hC;
                    6'b110100: S6_OUTPUT <= 4'h9;
                    6'b110101: S6_OUTPUT <= 4'h5;
                    6'b110110: S6_OUTPUT <= 4'hF;
                    6'b110111: S6_OUTPUT <= 4'hA;
                    6'b111000: S6_OUTPUT <= 4'hB;
                    6'b111001: S6_OUTPUT <= 4'hE;
                    6'b111010: S6_OUTPUT <= 4'h1;
                    6'b111011: S6_OUTPUT <= 4'h7;
                    6'b111100: S6_OUTPUT <= 4'h6;
                    6'b111101: S6_OUTPUT <= 4'h0;
                    6'b111110: S6_OUTPUT <= 4'h8;
                    6'b111111: S6_OUTPUT <= 4'hD;
                    default:   S6_OUTPUT <= 4'h0;
         
                 endcase
         
        end
         
        endmodule   
        
        
        module Sbox_Rom7(S7_INPUT, S7_OUTPUT);
         
          
         input  [6 : 1] S7_INPUT;
             
         output [3  : 0 ] S7_OUTPUT;
            
            wire   [6 : 1] S7_INPUT;
          
         reg    [3 : 0] S7_OUTPUT;
          
         wire   [6 : 1] S7_SELECT;
          
         assign S7_SELECT = {
        S7_INPUT[6],S7_INPUT[1],S7_INPUT[5 : 2]
        };
          
         always @(S7_SELECT)
          
          begin
           
            case(S7_SELECT)
           
                    6'b000000: S7_OUTPUT <= 4'h4;
                    6'b000001: S7_OUTPUT <= 4'hB;
                    6'b000010: S7_OUTPUT <= 4'h2;
                    6'b000011: S7_OUTPUT <= 4'hE;
                    6'b000100: S7_OUTPUT <= 4'hF;
                    6'b000101: S7_OUTPUT <= 4'h0;
                    6'b000110: S7_OUTPUT <= 4'h8;
                    6'b000111: S7_OUTPUT <= 4'hD;
                    6'b001000: S7_OUTPUT <= 4'h3;
                    6'b001001: S7_OUTPUT <= 4'hC;
                    6'b001010: S7_OUTPUT <= 4'h9;
                    6'b001011: S7_OUTPUT <= 4'h7;
                    6'b001100: S7_OUTPUT <= 4'h5;
                    6'b001101: S7_OUTPUT <= 4'hA;
                    6'b001110: S7_OUTPUT <= 4'h6;
                    6'b001111: S7_OUTPUT <= 4'h1;
                    6'b010000: S7_OUTPUT <= 4'hD;
                    6'b010001: S7_OUTPUT <= 4'h0;
                    6'b010010: S7_OUTPUT <= 4'hB;
                    6'b010011: S7_OUTPUT <= 4'h7;
                    6'b010100: S7_OUTPUT <= 4'h4;
                    6'b010101: S7_OUTPUT <= 4'h9;
                    6'b010110: S7_OUTPUT <= 4'h1;
                    6'b010111: S7_OUTPUT <= 4'hA;
                    6'b011000: S7_OUTPUT <= 4'hE;
                    6'b011001: S7_OUTPUT <= 4'h3;
                    6'b011010: S7_OUTPUT <= 4'h5;
                    6'b011011: S7_OUTPUT <= 4'hC;
                    6'b011100: S7_OUTPUT <= 4'h2;
                    6'b011101: S7_OUTPUT <= 4'hF;
                    6'b011110: S7_OUTPUT <= 4'h8;
                    6'b011111: S7_OUTPUT <= 4'h6;
                    6'b100000: S7_OUTPUT <= 4'h1;
                    6'b100001: S7_OUTPUT <= 4'h4;
                    6'b100010: S7_OUTPUT <= 4'hB;
                    6'b100011: S7_OUTPUT <= 4'hD;
                    6'b100100: S7_OUTPUT <= 4'hC;
                    6'b100101: S7_OUTPUT <= 4'h3;
                    6'b100110: S7_OUTPUT <= 4'h7;
                    6'b100111: S7_OUTPUT <= 4'hE;
                    6'b101000: S7_OUTPUT <= 4'hA;
                    6'b101001: S7_OUTPUT <= 4'hF;
                    6'b101010: S7_OUTPUT <= 4'h6;
                    6'b101011: S7_OUTPUT <= 4'h8;
                    6'b101100: S7_OUTPUT <= 4'h0;
                    6'b101101: S7_OUTPUT <= 4'h5;
                    6'b101110: S7_OUTPUT <= 4'h9;
                    6'b101111: S7_OUTPUT <= 4'h2;
                    6'b110000: S7_OUTPUT <= 4'h6;
                    6'b110001: S7_OUTPUT <= 4'hB;
                    6'b110010: S7_OUTPUT <= 4'hD;
                    6'b110011: S7_OUTPUT <= 4'h8;
                    6'b110100: S7_OUTPUT <= 4'h1;
                    6'b110101: S7_OUTPUT <= 4'h4;
                    6'b110110: S7_OUTPUT <= 4'hA;
                    6'b110111: S7_OUTPUT <= 4'h7;
                    6'b111000: S7_OUTPUT <= 4'h9;
                    6'b111001: S7_OUTPUT <= 4'h5;
                    6'b111010: S7_OUTPUT <= 4'h0;
                    6'b111011: S7_OUTPUT <= 4'hF;
                    6'b111100: S7_OUTPUT <= 4'hE;
                    6'b111101: S7_OUTPUT <= 4'h2;
                    6'b111110: S7_OUTPUT <= 4'h3;
                    6'b111111: S7_OUTPUT <= 4'hC;
                    default:   S7_OUTPUT <= 4'h0;
         
                 endcase
         
        end
         
        endmodule   
        
        module Sbox_Rom8(S8_INPUT, S8_OUTPUT);
         
            input  [6 : 1] S8_INPUT;
             
         output [3  : 0 ] S8_OUTPUT;
            
            wire   [6 : 1] S8_INPUT;
          
         reg    [3 : 0] S8_OUTPUT;
          
         wire   [6 : 1] S8_SELECT;
          
         assign S8_SELECT = {
        S8_INPUT[6],S8_INPUT[1],S8_INPUT[5 : 2]
        };
          
         always @(S8_SELECT)
          
          begin
           
            case(S8_SELECT)
           
                    6'b000000: S8_OUTPUT <= 4'hD;
                    6'b000001: S8_OUTPUT <= 4'h2;
                    6'b000010: S8_OUTPUT <= 4'h8;
                    6'b000011: S8_OUTPUT <= 4'h4;
                    6'b000100: S8_OUTPUT <= 4'h6;
                    6'b000101: S8_OUTPUT <= 4'hF;
                    6'b000110: S8_OUTPUT <= 4'hB;
                    6'b000111: S8_OUTPUT <= 4'h1;
                    6'b001000: S8_OUTPUT <= 4'hA;
                    6'b001001: S8_OUTPUT <= 4'h9;
                    6'b001010: S8_OUTPUT <= 4'h3;
                    6'b001011: S8_OUTPUT <= 4'hE;
                    6'b001100: S8_OUTPUT <= 4'h5;
                    6'b001101: S8_OUTPUT <= 4'h0;
                    6'b001110: S8_OUTPUT <= 4'hC;
                    6'b001111: S8_OUTPUT <= 4'h7;
                    6'b010000: S8_OUTPUT <= 4'h1;
                    6'b010001: S8_OUTPUT <= 4'hF;
                    6'b010010: S8_OUTPUT <= 4'hD;
                    6'b010011: S8_OUTPUT <= 4'h8;
                    6'b010100: S8_OUTPUT <= 4'hA;
                    6'b010101: S8_OUTPUT <= 4'h3;
                    6'b010110: S8_OUTPUT <= 4'h7;
                    6'b010111: S8_OUTPUT <= 4'h4;
                    6'b011000: S8_OUTPUT <= 4'hC;
                    6'b011001: S8_OUTPUT <= 4'h5;
                    6'b011010: S8_OUTPUT <= 4'h6;
                    6'b011011: S8_OUTPUT <= 4'hB;
                    6'b011100: S8_OUTPUT <= 4'h0;
                    6'b011101: S8_OUTPUT <= 4'hE;
                    6'b011110: S8_OUTPUT <= 4'h9;
                    6'b011111: S8_OUTPUT <= 4'h2;
                    6'b100000: S8_OUTPUT <= 4'h7;
                    6'b100001: S8_OUTPUT <= 4'hB;
                    6'b100010: S8_OUTPUT <= 4'h4;
                    6'b100011: S8_OUTPUT <= 4'h1;
                    6'b100100: S8_OUTPUT <= 4'h9;
                    6'b100101: S8_OUTPUT <= 4'hC;
                    6'b100110: S8_OUTPUT <= 4'hE;
                    6'b100111: S8_OUTPUT <= 4'h2;
                    6'b101000: S8_OUTPUT <= 4'h0;
                    6'b101001: S8_OUTPUT <= 4'h6;
                    6'b101010: S8_OUTPUT <= 4'hA;
                    6'b101011: S8_OUTPUT <= 4'hD;
                    6'b101100: S8_OUTPUT <= 4'hF;
                    6'b101101: S8_OUTPUT <= 4'h3;
                    6'b101110: S8_OUTPUT <= 4'h5;
                    6'b101111: S8_OUTPUT <= 4'h8;
                    6'b110000: S8_OUTPUT <= 4'h2;
                    6'b110001: S8_OUTPUT <= 4'h1;
                    6'b110010: S8_OUTPUT <= 4'hE;
                    6'b110011: S8_OUTPUT <= 4'h7;
                    6'b110100: S8_OUTPUT <= 4'h4;
                    6'b110101: S8_OUTPUT <= 4'hA;
                    6'b110110: S8_OUTPUT <= 4'h8;
                    6'b110111: S8_OUTPUT <= 4'hD;
                    6'b111000: S8_OUTPUT <= 4'hF;
                    6'b111001: S8_OUTPUT <= 4'hC;
                    6'b111010: S8_OUTPUT <= 4'h9;
                    6'b111011: S8_OUTPUT <= 4'h0;
                    6'b111100: S8_OUTPUT <= 4'h3;
                    6'b111101: S8_OUTPUT <= 4'h5;
                    6'b111110: S8_OUTPUT <= 4'h6;
                    6'b111111: S8_OUTPUT <= 4'hB;
                    default:   S8_OUTPUT <= 4'h0;
         
                 endcase
         
        end
         
        endmodule   
        
        module Swap(LEFT16, RIGHT16, LEFT_SWAP, RIGHT_SWAP);
         
        input  [32 : 1]LEFT16;
         
        input  [32 : 1]RIGHT16;
         
        output [32 : 1]LEFT_SWAP;
         
        output [32 : 1]RIGHT_SWAP;
         
        wire   [32 : 1]LEFT16;
         
        wire   [32 : 1]RIGHT16;
         
        wire   [32 : 1]LEFT_SWAP;
         
        wire   [32 : 1]RIGHT_SWAP;
         
        assign LEFT_SWAP  = RIGHT16;
         
        assign RIGHT_SWAP = LEFT16;
         
        endmodule
        
        
        module Sbox_Output(S1_OUTPUT, S2_OUTPUT, S3_OUTPUT, S4_OUTPUT, S5_OUTPUT, S6_OUTPUT,
                           S7_OUTPUT, S8_OUTPUT, S_OUTPUT);
          
          input   [3 : 0] S1_OUTPUT;
          input   [3 : 0] S2_OUTPUT;
          input   [3 : 0] S3_OUTPUT;
          input   [3 : 0] S4_OUTPUT;
          input   [3 : 0] S5_OUTPUT;
          input   [3 : 0] S6_OUTPUT;
          input   [3 : 0] S7_OUTPUT;
          input   [3 : 0] S8_OUTPUT;
          output  [32 : 1]S_OUTPUT;
           
          wire [3 : 0] S1_OUTPUT;
          wire [3 : 0] S2_OUTPUT;
          wire [3 : 0] S3_OUTPUT;
          wire [3 : 0] S4_OUTPUT;
          wire [3 : 0] S5_OUTPUT;
          wire [3 : 0] S6_OUTPUT;
          wire [3 : 0] S7_OUTPUT;
          wire [3 : 0] S8_OUTPUT;
           
          wire [32 : 1]S_OUTPUT;
           
          assign S_OUTPUT = {
        S1_OUTPUT,S2_OUTPUT,S3_OUTPUT,S4_OUTPUT,S5_OUTPUT,S6_OUTPUT,
                             S7_OUTPUT,S8_OUTPUT
        };
         
         
        endmodule
        
        
        module Permutation(S_OUTPUT, PERMUTATION_OUTPUT);
         
         input   [32 : 1] S_OUTPUT;
          
         output  [32 : 1] PERMUTATION_OUTPUT;
          
         wire    [32 : 1] S_OUTPUT;
          
         reg     [32 : 1] PERMUTATION_OUTPUT;
          
         always @ (S_OUTPUT)
          
           begin
         
          PERMUTATION_OUTPUT[1]  <= S_OUTPUT[16];
          PERMUTATION_OUTPUT[2]  <= S_OUTPUT[7];
          PERMUTATION_OUTPUT[3]  <= S_OUTPUT[20];
          PERMUTATION_OUTPUT[4]  <= S_OUTPUT[21];
          PERMUTATION_OUTPUT[5]  <= S_OUTPUT[29];
          PERMUTATION_OUTPUT[6]  <= S_OUTPUT[12];
          PERMUTATION_OUTPUT[7]  <= S_OUTPUT[28];
          PERMUTATION_OUTPUT[8]  <= S_OUTPUT[17];
          PERMUTATION_OUTPUT[9]  <= S_OUTPUT[1];
          PERMUTATION_OUTPUT[10] <= S_OUTPUT[15];
          PERMUTATION_OUTPUT[11] <= S_OUTPUT[23];
          PERMUTATION_OUTPUT[12] <= S_OUTPUT[26];
          PERMUTATION_OUTPUT[13] <= S_OUTPUT[5];
          PERMUTATION_OUTPUT[14] <= S_OUTPUT[18];
          PERMUTATION_OUTPUT[15] <= S_OUTPUT[31];
          PERMUTATION_OUTPUT[16] <= S_OUTPUT[10];
          PERMUTATION_OUTPUT[17] <= S_OUTPUT[2];
          PERMUTATION_OUTPUT[18] <= S_OUTPUT[8];
          PERMUTATION_OUTPUT[19] <= S_OUTPUT[24];
          PERMUTATION_OUTPUT[20] <= S_OUTPUT[14];
          PERMUTATION_OUTPUT[21] <= S_OUTPUT[32];
          PERMUTATION_OUTPUT[22] <= S_OUTPUT[27];
          PERMUTATION_OUTPUT[23] <= S_OUTPUT[3];
          PERMUTATION_OUTPUT[24] <= S_OUTPUT[9];
          PERMUTATION_OUTPUT[25] <= S_OUTPUT[19];
          PERMUTATION_OUTPUT[26] <= S_OUTPUT[13];
          PERMUTATION_OUTPUT[27] <= S_OUTPUT[30];
          PERMUTATION_OUTPUT[28] <= S_OUTPUT[6];
          PERMUTATION_OUTPUT[29] <= S_OUTPUT[22];
          PERMUTATION_OUTPUT[30] <= S_OUTPUT[11];
          PERMUTATION_OUTPUT[31] <= S_OUTPUT[4];
          PERMUTATION_OUTPUT[32] <= S_OUTPUT[25];
           
           end
         
        endmodule
        
        
        module Reg32(CLK, RST, RIGHT, RIGHT_REG, LEFT_REG1, RIGHT_REG1);
         
         input   CLK;
          
         input   RST;
          
         input   [32 : 1]RIGHT;
          
         input   [32 : 1]RIGHT_REG;
          
         output  [32 : 1] LEFT_REG1;
          
         output  [32 : 1] RIGHT_REG1;
         
         wire    CLK;
          
         wire    RST;
            
         reg     [32 : 1] LEFT_REG1;
          
         reg     [32 : 1] RIGHT_REG1;
          
         always @ (posedge CLK or posedge RST)
          
           begin
         
          if(RST)
           
            begin
          
           LEFT_REG1  <= 32'h00000000;
         
        RIGHT_REG1 <= 32'h00000000;
         
         end
         
          else
            
         begin
          
           LEFT_REG1  <=  RIGHT;
         
        RIGHT_REG1 <=  RIGHT_REG;
         
         end
          
          end
          
        endmodule
        
        
        
        module Inverse_Initial_Permutation(RIGHT_SWAP, LEFT_SWAP, CIPHER_TEXT);
         
        input   [32 : 1]RIGHT_SWAP;
         
        input   [32 : 1]LEFT_SWAP;
         
        output  [64 : 1]CIPHER_TEXT;
         
        wire    [32 : 1]RIGHT_SWAP;
         
        wire    [32 : 1]LEFT_SWAP;
           
        reg     [64 : 1]CIPHER_TEXT;
         
        wire    [64 : 1]TEMP;
         
        assign  TEMP  = {
        LEFT_SWAP,RIGHT_SWAP
        };
         
        always @(TEMP)
         
          begin
            
        CIPHER_TEXT[1]  <= TEMP[40];
        CIPHER_TEXT[2]  <= TEMP[8];
        CIPHER_TEXT[3]  <= TEMP[48];
        CIPHER_TEXT[4]  <= TEMP[16];
        CIPHER_TEXT[5]  <= TEMP[56];
        CIPHER_TEXT[6]  <= TEMP[24];
        CIPHER_TEXT[7]  <= TEMP[64];
        CIPHER_TEXT[8]  <= TEMP[32];
        CIPHER_TEXT[9]  <= TEMP[39];
        CIPHER_TEXT[10] <= TEMP[7];
        CIPHER_TEXT[11] <= TEMP[47];
        CIPHER_TEXT[12] <= TEMP[15];
        CIPHER_TEXT[13] <= TEMP[55];
        CIPHER_TEXT[14] <= TEMP[23];
        CIPHER_TEXT[15] <= TEMP[63];
        CIPHER_TEXT[16] <= TEMP[31];
        CIPHER_TEXT[17] <= TEMP[38];
        CIPHER_TEXT[18] <= TEMP[6];
        CIPHER_TEXT[19] <= TEMP[46];
        CIPHER_TEXT[20] <= TEMP[14];
        CIPHER_TEXT[21] <= TEMP[54];
        CIPHER_TEXT[22] <= TEMP[22];
        CIPHER_TEXT[23] <= TEMP[62];
        CIPHER_TEXT[24] <= TEMP[30];
        CIPHER_TEXT[25] <= TEMP[37];
        CIPHER_TEXT[26] <= TEMP[5];
        CIPHER_TEXT[27] <= TEMP[45];
        CIPHER_TEXT[28] <= TEMP[13];
        CIPHER_TEXT[29] <= TEMP[53];
        CIPHER_TEXT[30] <= TEMP[21];
        CIPHER_TEXT[31] <= TEMP[61];
        CIPHER_TEXT[32] <= TEMP[29];
        CIPHER_TEXT[33] <= TEMP[36];
        CIPHER_TEXT[34] <= TEMP[4];
        CIPHER_TEXT[35] <= TEMP[44];
        CIPHER_TEXT[36] <= TEMP[12];
        CIPHER_TEXT[37] <= TEMP[52];
        CIPHER_TEXT[38] <= TEMP[20];
        CIPHER_TEXT[39] <= TEMP[60];
        CIPHER_TEXT[40] <= TEMP[28];
        CIPHER_TEXT[41] <= TEMP[35];
        CIPHER_TEXT[42] <= TEMP[3];
        CIPHER_TEXT[43] <= TEMP[43];
        CIPHER_TEXT[44] <= TEMP[11];
        CIPHER_TEXT[45] <= TEMP[51];
        CIPHER_TEXT[46] <= TEMP[19];
        CIPHER_TEXT[47] <= TEMP[59];
        CIPHER_TEXT[48] <= TEMP[27];
        CIPHER_TEXT[49] <= TEMP[34];
        CIPHER_TEXT[50] <= TEMP[2];
        CIPHER_TEXT[51] <= TEMP[42];
        CIPHER_TEXT[52] <= TEMP[10];
        CIPHER_TEXT[53] <= TEMP[50];
        CIPHER_TEXT[54] <= TEMP[18];
        CIPHER_TEXT[55] <= TEMP[58];
        CIPHER_TEXT[56] <= TEMP[26];
        CIPHER_TEXT[57] <= TEMP[33];
        CIPHER_TEXT[58] <= TEMP[1];
        CIPHER_TEXT[59] <= TEMP[41];
        CIPHER_TEXT[60] <= TEMP[9];
        CIPHER_TEXT[61] <= TEMP[49];
        CIPHER_TEXT[62] <= TEMP[17];
        CIPHER_TEXT[63] <= TEMP[57];
        CIPHER_TEXT[64] <= TEMP[25];
         
         end
        endmodule
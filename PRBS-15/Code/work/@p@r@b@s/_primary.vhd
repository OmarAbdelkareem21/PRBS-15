library verilog;
use verilog.vl_types.all;
entity PRBS is
    generic(
        \Type\          : integer := 15;
        BusWidth        : integer := 8;
        NumWidth        : integer := 4
    );
    port(
        InData          : in     vl_logic_vector;
        n               : in     vl_logic_vector;
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        OutData         : out    vl_logic_vector;
        PRBSEq          : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of \Type\ : constant is 1;
    attribute mti_svvh_generic_type of BusWidth : constant is 1;
    attribute mti_svvh_generic_type of NumWidth : constant is 1;
end PRBS;

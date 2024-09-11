library verilog;
use verilog.vl_types.all;
entity PRBS_tb is
    generic(
        \Type\          : integer := 15;
        BusWidth        : integer := 8;
        NumWidth        : integer := 4
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of \Type\ : constant is 1;
    attribute mti_svvh_generic_type of BusWidth : constant is 1;
    attribute mti_svvh_generic_type of NumWidth : constant is 1;
end PRBS_tb;

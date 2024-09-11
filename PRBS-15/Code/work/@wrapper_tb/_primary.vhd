library verilog;
use verilog.vl_types.all;
entity Wrapper_tb is
    generic(
        \Type\          : integer := 15;
        BusWidth        : integer := 8;
        NumWidth        : integer := 4;
        InPatternDetector: vl_logic_vector(31 downto 0) := (Hi1, Hi0, Hi1, Hi0, Hi1, Hi0, Hi1, Hi0, Hi1, Hi0, Hi1, Hi1, Hi1, Hi0, Hi1, Hi1, Hi1, Hi1, Hi0, Hi0, Hi1, Hi1, Hi0, Hi0, Hi1, Hi1, Hi0, Hi1, Hi1, Hi1, Hi0, Hi1);
        nPatternDetector: vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of \Type\ : constant is 1;
    attribute mti_svvh_generic_type of BusWidth : constant is 1;
    attribute mti_svvh_generic_type of NumWidth : constant is 1;
    attribute mti_svvh_generic_type of InPatternDetector : constant is 1;
    attribute mti_svvh_generic_type of nPatternDetector : constant is 1;
end Wrapper_tb;

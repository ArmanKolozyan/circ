#!/usr/bin/env zsh

set -ex

disable -r time

cargo build --release --example circ_c

BIN=./target/release/examples/circ_c

case "$OSTYPE" in 
    darwin*)
        alias measure_time="gtime --format='%e seconds %M kB'"
    ;;
    linux*)
        alias measure_time="time --format='%e seconds %M kB'"
    ;;
esac

function mpc_test {
    parties=$1
    zpath=$2
    RUST_BACKTRACE=1 measure_time $BIN -p $parties $zpath
}

# # build mpc arithmetic tests
# mpc_test 2 ./examples/C/mpc/unit_tests/arithmetic_tests/2pc_add.c
# # mpc_test 2 ./examples/C/mpc/unit_tests/arithmetic_tests/2pc_add_unsigned.c
# mpc_test 2 ./examples/C/mpc/unit_tests/arithmetic_tests/2pc_sub.c
# mpc_test 2 ./examples/C/mpc/unit_tests/arithmetic_tests/2pc_mult.c
# mpc_test 2 ./examples/C/mpc/unit_tests/arithmetic_tests/2pc_mult_add_pub.c
# mpc_test 2 ./examples/C/mpc/unit_tests/arithmetic_tests/2pc_mod.c

# mpc_test 2 ./examples/C/mpc/unit_tests/arithmetic_tests/2pc_int_equals.c
# mpc_test 2 ./examples/C/mpc/unit_tests/arithmetic_tests/2pc_int_greater_than.c
# mpc_test 2 ./examples/C/mpc/unit_tests/arithmetic_tests/2pc_int_greater_equals.c
# mpc_test 2 ./examples/C/mpc/unit_tests/arithmetic_tests/2pc_int_less_than.c
# mpc_test 2 ./examples/C/mpc/unit_tests/arithmetic_tests/2pc_int_less_equals.c

# # build mpc nary arithmetic tests
# mpc_test 2 ./examples/C/mpc/unit_tests/nary_arithmetic_tests/2pc_nary_arithmetic_add.c

# # build mpc bitwise tests
# mpc_test 2 ./examples/C/mpc/unit_tests/bitwise_tests/2pc_bitwise_and.c
# mpc_test 2 ./examples/C/mpc/unit_tests/bitwise_tests/2pc_bitwise_or.c
# mpc_test 2 ./examples/C/mpc/unit_tests/bitwise_tests/2pc_bitwise_xor.c

# # build mpc boolean tests
# mpc_test 2 ./examples/C/mpc/unit_tests/boolean_tests/2pc_boolean_and.c
# mpc_test 2 ./examples/C/mpc/unit_tests/boolean_tests/2pc_boolean_or.c
# mpc_test 2 ./examples/C/mpc/unit_tests/boolean_tests/2pc_boolean_equals.c

# # build mpc nary boolean tests
# mpc_test 2 ./examples/C/mpc/unit_tests/nary_boolean_tests/2pc_nary_boolean_and.c

# # build mpc const tests
# mpc_test 2 ./examples/C/mpc/unit_tests/const_tests/2pc_const_arith.c
# mpc_test 2 ./examples/C/mpc/unit_tests/const_tests/2pc_const_bool.c

# # build if statement tests
# mpc_test 2 ./examples/C/mpc/unit_tests/ite_tests/2pc_ite_ret_bool.c
# mpc_test 2 ./examples/C/mpc/unit_tests/ite_tests/2pc_ite_ret_int.c

# # build array tests
# mpc_test 2 ./examples/C/mpc/unit_tests/array_tests/2pc_array_sum.c
# mpc_test 2 ./examples/C/mpc/unit_tests/array_tests/2pc_array_sum_2.c
# mpc_test 2 ./examples/C/mpc/unit_tests/array_tests/2pc_array_index.c
# mpc_test 2 ./examples/C/mpc/unit_tests/array_tests/2pc_array_index_2.c
# # mpc_test 2 ./examples/C/mpc/unit_tests/array_tests/2pc_array_ret.c



# # build circ/compiler array tests
# mpc_test 2 ./examples/C/mpc/unit_tests/c_array_tests/2pc_array.c
# mpc_test 2 ./examples/C/mpc/unit_tests/c_array_tests/2pc_array_1.c
# mpc_test 2 ./examples/C/mpc/unit_tests/c_array_tests/2pc_array_2.c
# mpc_test 2 ./examples/C/mpc/unit_tests/c_array_tests/2pc_array_3.c

# mpc_test 2 ./examples/C/mpc/unit_tests/c_array_tests/2pc_array_sum_c.c

# benchmarks
mpc_test 2 ./examples/C/mpc/benchmarks/kmeans.c

# mpc_test 2 ./examples/C/mpc/unit_tests/arithmetic_tests/2pc_loop_add.c

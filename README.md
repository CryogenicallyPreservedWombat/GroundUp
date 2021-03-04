# GroundUp

## Redefining Common Operators in Swift

The goal here is to redefine common operators and functions entirely from the bitwise operators: `~ & | ^ <<` and `>>` as well as the associated syntactic sugar `&= |= ^= <<=` and `>>=`.

Unfortunately (in this context) 0 does not evaluate as false, so I will be permitting myself `!= 0` and `== 0` as valid operations. 

## Why?

Not entirely sure, to be honest, but it sounded fun.

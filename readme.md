# bit32 Module for Lua

This is a Lua implementation of the `bit32` library, providing bitwise operations for 32-bit integers. The `bit32` library is useful for manipulating individual bits within integers, and this implementation includes all standard functions of the `bit32` library.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Functions](#functions)
- [License](#license)

## Features

- Bitwise NOT
- Bitwise AND
- Bitwise OR
- Bitwise XOR
- Left Shift
- Logical Right Shift
- Arithmetic Right Shift
- Extract bits
- Replace bits
- Test bits

## Installation

To use this module, simply copy the code from the `source.lua` file and add it to your Lua script.

## Usage
Here's a quick example of how to use the bit32 library in your Lua scripts:

```lua
local result_not = bit32.bnot(5)
local result_and = bit32.band(5, 3)
local result_or = bit32.bor(5, 3)
local result_xor = bit32.bxor(5, 3)
local result_lshift = bit32.lshift(5, 1)
local result_rshift = bit32.rshift(5, 1)
local result_arshift = bit32.arshift(5, 1)
local result_extract = bit32.extract(255, 4, 4)
local result_replace = bit32.replace(255, 3, 4, 4)
local result_btest = bit32.btest(5, 1)
```

## Functions

`bit32.bnot(x)`
<br>
Returns the bitwise NOT of x.

`bit32.band(x, y)`
<br>
Returns the bitwise AND of x and y.

`bit32.bor(x, y)`
<br>
Returns the bitwise OR of x and y.

`bit32.bxor(x, y)`
<br>
Returns the bitwise XOR of x and y.

`bit32.lshift(x, s_amount)`
<br>
Returns the value of x shifted left by s_amount bits.

`bit32.rshift(x, s_amount)`
<br>
Returns the value of x shifted right by s_amount bits (logical shift).

`bit32.arshift(x, s_amount)`
<br>
Returns the value of x shifted right by s_amount bits (arithmetic shift).

`bit32.extract(n, field, width)`
<br>
Extracts width bits from n starting at bit field.

`bit32.replace(n, v, field, width)`
<br>
Replaces width bits in n starting at bit field with v.

`bit32.btest(...)`
<br>
Tests if all specified bits are 1.


## License
This code is licensed under the MIT License. See the LICENSE file for more information.

This `README.md` includes a module overview, installation instructions, usage examples, a description of available functions, and license information.
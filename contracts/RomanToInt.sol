// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RomanToInt {

    mapping(bytes1 => uint) private  mappings;

    constructor() {
        mappings["I"] = 1;
        mappings["V"] = 5;
        mappings["X"] = 10;
        mappings["L"] = 50;
        mappings["C"] = 100;
        mappings["D"] = 500;
        mappings["M"] = 1000;
    }

    function romanToInt (string calldata s) public view returns (uint) {
        bytes memory strBytes = bytes(s);
        uint len = strBytes.length;

        uint result = 0;
        uint prev = 0;

        for (uint i = len; i > 0; i--) {
            uint cur = mappings[strBytes[i - 1]];

            if (cur < prev) {
                result -= cur;
            } else {
                result += cur;
                prev = cur;
            }
        }

        return result;
    }
}
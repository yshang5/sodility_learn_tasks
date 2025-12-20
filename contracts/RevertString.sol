// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RevertString {

    function revertString (string calldata str) external pure returns (string memory) {
        bytes memory strBytes = bytes(str);
        bytes memory r = new bytes(strBytes.length);

        for (uint i = 0; i < strBytes.length; i++) {
            r[strBytes.length - 1 - i] = strBytes[i];
        }
        return string(r);
    }
}
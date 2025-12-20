// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IntToRoma {

    bytes1[4] ones;
    bytes1[4] fives;

    constructor() {
        ones  = [bytes1("I"), "X", "C", "M"];
        fives = [bytes1("V"), "L", "D", bytes1(0)];
    }

    function intToRoma (uint num)  public view returns (string memory){
        bytes memory buf;
        uint i = 0;
        while (num > 0) {
            uint val = num % 10;
            bytes1 one = ones[i];
            bytes1 five = fives[i];
            if (val % 5 != 4) {
                //处理0123 5678
                for (uint count = 0; count < val % 5; count++) {
                    buf = abi.encodePacked(one, buf);
                }
                if (val >= 5) {
                    buf = abi.encodePacked(five, buf);
                }
            } 
            //处理4
            else if (val == 4) {
                buf = abi.encodePacked(one, five, buf);
            } 
            //处理9
            else  {
                buf = abi.encodePacked(one, ones[i+1], buf);
            }
            num /= 10;
            i++;
        }
        return string(buf);
    }
}
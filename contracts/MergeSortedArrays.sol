// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MergeSortedArray {
    function mergeSortedArray (uint[] calldata nums1, uint m, uint[] calldata nums2, uint n) public pure returns (uint[] memory){
        uint[] memory res = new uint[](m + n);

        uint i = 0; // nums1 指针
        uint j = 0; // nums2 指针
        uint k = 0; // res 指针

        while (i < m && j < n) {
            if (nums1[i] <= nums2[j]) {
                res[k++] = nums1[i++];
            } else {
                res[k++] = nums2[j++];
            }
        }

        // 收尾
        while (i < m) {
            res[k++] = nums1[i++];
        }

        while (j < n) {
            res[k++] = nums2[j++];
        }

        return res;

    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract Voting {

    mapping(string => uint256) private votes;

    string[] private candidates;
    mapping(string => bool) private seen;

    function vote(string calldata name) external {
        if (!seen[name]) {
            seen[name] = true;
            candidates.push(name);
        }
        votes[name] += 1;
    }

    function getVotes(string calldata name)
        external
        view
        returns (uint256)
    {
        return votes[name];
    }

    // 4️⃣ 重置所有候选人的得票数
    function resetVotes() external {
        for (uint256 i = 0; i < candidates.length; i++) {
            delete votes[candidates[i]];
        }
    }
}

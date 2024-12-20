// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import {Ownable} from "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";

contract IPCM is Ownable {
    constructor(address owner) Ownable(owner) {}

    string private cidMapping;

    event MappingUpdated(string value);

    function setValue(string memory value) public onlyOwner {
        cidMapping = value;
        emit MappingUpdated(value);
    }

    function getValue() public view returns (string memory) {
        return cidMapping;
    }
}

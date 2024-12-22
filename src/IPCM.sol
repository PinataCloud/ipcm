// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.23;

import {Ownable} from "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";

contract IPCM is Ownable {
    string private cidMapping;

    constructor(address owner) Ownable(owner) {}

    event MappingUpdated(string value);

    function updateMapping(string memory value) public onlyOwner {
        cidMapping = value;
        emit MappingUpdated(value);
    }

    function getMapping() public view returns (string memory) {
        return cidMapping;
    }
}

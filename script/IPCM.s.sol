// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {Script, console} from "forge-std/Script.sol";
import {IPCM} from "../src/IPCM.sol";

contract IPCMScript is Script {
    IPCM public ipcm;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        ipcm = new IPCM(msg.sender, "ipfs://");

        vm.stopBroadcast();
    }
}

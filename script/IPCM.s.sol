// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {IPCM} from "../src/IPCM.sol";

contract IPCMScript is Script {
    IPCM public ipcm;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        ipcm = new IPCM();

        vm.stopBroadcast();
    }
}

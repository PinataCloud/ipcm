// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {IPCM} from "../src/IPCM.sol";

contract IPCMTest is Test {
    IPCM public ipcm;

    function setUp() public {
        ipcm = new IPCM();
    }
}

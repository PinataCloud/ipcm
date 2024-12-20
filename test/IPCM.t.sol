// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {Test, console} from "forge-std/Test.sol";
import {IPCM} from "../src/IPCM.sol";

contract IPCMTest is Test {
    IPCM public ipcm;
    address owner = address(1);
    string testCid = "QmTest123";

    function setUp() public {
        ipcm = new IPCM(owner);
        vm.startPrank(owner);
    }

    function testSetValue() public {
        ipcm.setValue(testCid);
        assertEq(ipcm.getValue(), testCid);
    }

    function testOnlyOwnerCanSetValue() public {
        vm.stopPrank();
        vm.startPrank(address(2));
        vm.expectRevert();
        ipcm.setValue(testCid);
    }

    function testEmitsEvent() public {
        emit IPCM.MappingUpdated(testCid);
        ipcm.setValue(testCid);
    }

    function testGetValue() public {
        string memory emptyValue = ipcm.getValue();
        assertEq(emptyValue, "");

        ipcm.setValue(testCid);
        string memory newValue = ipcm.getValue();
        assertEq(newValue, testCid);
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {Test, console} from "forge-std/Test.sol";
import {IPCM} from "../src/IPCM.sol";

contract IPCMTest is Test {
    IPCM public ipcm;
    address owner = address(1);
    string testCid = "QmTest123";

    function setUp() public {
        ipcm = new IPCM(owner, testCid);
        vm.startPrank(owner);
    }

    function testSetValue() public {
        ipcm.updateMapping(testCid);
        assertEq(ipcm.getMapping(), testCid);
    }

    function testOnlyOwnerCanSetValue() public {
        vm.stopPrank();
        vm.startPrank(address(2));
        vm.expectRevert();
        ipcm.updateMapping(testCid);
    }

    function testEmitsEvent() public {
        emit IPCM.MappingUpdated(testCid);
        ipcm.updateMapping(testCid);
    }

    function testGetValue() public {
        string memory initialValue = ipcm.getMapping();
        assertEq(initialValue, testCid);

        string memory newTestCid = "QmTest456";
        ipcm.updateMapping(newTestCid);
        string memory newValue = ipcm.getMapping();
        assertEq(newValue, newTestCid);
    }
}

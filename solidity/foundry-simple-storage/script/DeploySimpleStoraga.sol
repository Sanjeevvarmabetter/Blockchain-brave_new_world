// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;


import {Script} from  "forge-std/Script.sol";
import {SimpleStorage}  from "../src/SimpleStorage.sol";
contract DeploySimpleStorage {
    function run() external returns (SimpleStorage) {
        
        
        vm.startBroadcast();

        SimpleStorage simplestorage = new SimpleStorage();
        
        vm.stopBroadcast();
    
        return simplestorage;
    }


} 
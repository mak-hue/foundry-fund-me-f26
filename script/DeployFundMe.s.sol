//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HeleperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        // note any keyword before startBroadcast will not sent a real tx to the blockchain but will be executed locally and any keyword after startBroadcast will send a real tx to the blockchain
        HeleperConfig helperConfig = new HeleperConfig();
        address ethUsdPriceFeed = helperConfig.activeNetworkConfig();
        // note the address supposed to be rapped like this (address ethUsdPriceFeed,,,)but since we only have one variable in the struct in HelperConfig.s.sol contract we can just write like this address ethUsdPriceFeed = helperConfig.activeNetworkConfig();

        vm.startBroadcast();
        FundMe fundMe = new FundMe(ethUsdPriceFeed);
        vm.stopBroadcast();
        return fundMe;
    }
}

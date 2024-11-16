// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18;

import {Script, console} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";

contract FundFundMe is Script {
    uint256 SEND_VALUE = 0.1 ether;

    function fundFundMe(address mostRecentlyDeployed) public {
        vm.startBroadcast();
        FundMe(payable(mostRecentlyDeployed)).fund{value: SEND_VALUE}();
        vm.stopBroadcast();
        console.log("Funded FundMe with %s", SEND_VALUE);
    }

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "FundMe",
            block.chainid
        );
        fundFundMe(mostRecentlyDeployed);
    }
}

contract WithdrawFundMe is Script {
    function withdrawFundMe(address mostRecentlyDeployed) public {
        vm.startBroadcast();
        FundMe(payable(mostRecentlyDeployed)).withdrow();
        vm.stopBroadcast();
        console.log("Withdraw FundMe balance!");
    }

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "FundMe",
            block.chainid
        );
        withdrawFundMe(mostRecentlyDeployed);
    }
}

// import {Script, console} from "forge-std/Script.sol";
// import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";
// import {FundMe} from "../src/FundMe.sol";

// contract FundFundMe is Script {
//     uint256 constant SEND_VALUE = 0.01 ether;

//     function fundFundMe(address mostRecentlyDeployed) public {
//         FundMe(payable(mostRecentlyDeployed)).fund{value: SEND_VALUE}();
//         console.log("Funded dundMe with %s", SEND_VALUE);
//     }

//     function run() external {
//         address mostRecntlyDeployed = DevOpsTools.get_most_recent_deployment(
//             "FundMe",
//             block.chainid
//         );
//         vm.startBroadcast();
//         fundFundMe(mostRecntlyDeployed);
//         vm.stopBroadcast();
//     }
// }

// contract WithdrawFundMe is Script {
//     uint256 constant SEND_VALUE = 0.01 ether;

//     function withdrowFundMe(address mostRecentlyDeployed) public {
//         address account = vm.addr(0); // The default account used for running the script
//         vm.deal(account, 1 ether);
//         vm.startBroadcast();
//         FundMe(payable(mostRecentlyDeployed)).withdrow();
//         vm.stopBroadcast();
//     }

//     function run() external {
//         address mostRecntlyDeployed = DevOpsTools.get_most_recent_deployment(
//             "FundMe",
//             block.chainid
//         );
//         vm.startBroadcast();
//         withdrowFundMe(mostRecntlyDeployed);
//         vm.stopBroadcast();
//     }
// }

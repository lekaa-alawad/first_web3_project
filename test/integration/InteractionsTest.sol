// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../../src/FundMe.sol";
import {DeployFundMe} from "../../script/DeployFundMe.s.sol";

import {FundFundMe, WithdrawFundMe} from "../../script/Interaction.s.sol";

contract InteractionsTest is Test {
    FundMe fundMe;

    address USER = makeAddr("Lekaa");
    uint256 constant SEND_VALU = 0.1 ether;
    uint256 constant STARING_BALANCE = 10 ether;
    uint256 constant GAS_PRICE = 1;

    function setUp() external {
        DeployFundMe deploy = new DeployFundMe();
        fundMe = deploy.run();
        vm.deal(USER, STARING_BALANCE);
    }

    function testUserCanFundInteractions() public {
        FundFundMe fundFundMe = new FundFundMe();
        // vm.prannk(USER);
        // vm.deal(USER, 1e18);
        fundFundMe.fundFundMe(address(fundMe));
        // address funder = fundMe.getFunder(0);
        // assertEq(funder,USER);

        WithdrawFundMe withdrowFundMe = new WithdrawFundMe();
        withdrowFundMe.withdrawFundMe(address(fundMe));

        assert(address(fundMe).balance == 0);
    }
}

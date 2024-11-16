// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    function getPrice( AggregatorV3Interface priceFeed) internal view returns (uint256) {
        //  EthtoUSD = 0x9326BFA02ADD2366b30bacB125260Af641031331;
        (, int price, , , ) = priceFeed.latestRoundData();
        return uint256(price * 1e10);
    }

    function getExchangeRate(
        uint256 ethAmount, AggregatorV3Interface priceFeed
    ) internal view returns (uint256) {
        uint256 ethPrice = getPrice(priceFeed);
        uint256 ethAmountInUSD = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUSD;
    }

    function getVersion() internal view returns (uint256) {
        return
            AggregatorV3Interface(0x9326BFA02ADD2366b30bacB125260Af641031331)
                .version();
    }
}
// SPDX-License-Identifier: MIT

/*

    Kube, the leisure and travel multi-brand utility system.

    The digital currency that aims to revolutionize the leisure and travel industries, universally adoptable
    through multi-brand platforms.

    The following contract implements the ERC-20 standard from Open Zeppelin
    (https://github.com/OpenZeppelin/openzeppelin-contracts). We just overwrite the token number of decimals
    in order to reduce it from 18 to 6 decimals.

    To adapt the contract to the Binance Smart Chain BEP-20 specification
    (https://github.com/binance-chain/BEPs/blob/master/BEP20.md), we implement the only function out of the
    ERC-20 standard: getOwner ().

    The distribution of the tokens will be carried out as following:
        - 60% Liquidity
        - 12% Liquidity lock (burn)
        - 10% Seed holders
        - 10% Board
        - 8% Marketing, Technology and Operations

    100% of the supply will reside in the address used to create the contract, and the distribution of the
    percentages for the Board (10%) and Marketing, Technology and Operations (8%) will be moved immediately
    after deployment.

*/

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/presets/ERC20PresetFixedSupply.sol";

contract Kube is ERC20PresetFixedSupply {

    uint8 private _decimals = 6;
    address _owner;

    constructor() ERC20PresetFixedSupply("Kube", "KUBE", 480 * 10**6 * 10**uint(_decimals), msg.sender) {
        _owner = msg.sender;
    }

    // BEP20 mandatory method.
    function getOwner() external view returns (address) {
        return _owner;
    }

    // We override default 18 decimals from openzeppelin
    function decimals() public view virtual override returns (uint8) {
        return _decimals;
    }
}

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/presets/ERC20PresetFixedSupply.sol";

contract NewAgeToken is ERC20PresetFixedSupply {

    uint8 private _decimals;

    constructor() ERC20PresetFixedSupply("NewAgeToken", "NEWAGE", 360 * 10**6 * 10**uint(_decimals), msg.sender) {
        _decimals = 2;
    }

    // BEP20 mandatory method.
    function getOwner() external view returns (address) {
        return owner();
    }

    // We override default 18 decimals from openzeppelin
    function decimals() external view override returns (uint8) {
        return _decimals;
    }
}

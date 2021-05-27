// SPDX-License-Identifier: MIT

/*

    Kube, the leisure and travel multi-brand utility system.

    The digital currency that aims to revolutionize the leisure and travel industries, universally adoptable
    through multi-brand platforms.

    El siguiente contrato hace uso de la implementación del estándar ERC-20 de Open Zeppelin
    (https://github.com/OpenZeppelin/openzeppelin-contracts). Tan sólo sobreescribimos la cantidad de decimales
    de la moneda para reducirlo de 18 a 6 decimales.

    Para adaptar el contrato a las necesidades de la especificación de la Binance Smart Chain BEP-20
    (https://github.com/binance-chain/BEPs/blob/master/BEP20.md), implementamos la única función que dista del
    estándar ERC-20: getOwner().

    La distribución de los tokens se realizará de la siguiente manera:
    - 60%  Liquidity
    - 12%  Liquidity lock (burn)
    - 10%  Seed holders
    - 10%  Board
    - 8%   Marketing, Technology and Operations

    El 100% de la supply residirá en la dirección que despliega el contrato, y la distribución de los porcentajes
    para Board (10%) y Marketing, Technology and Operations (8%) se realizará inmediatamente después del despliegue.

*/

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/presets/ERC20PresetFixedSupply.sol";

contract NewAgeToken is ERC20PresetFixedSupply {

    uint8 private _decimals = 6;
    address _owner;

    constructor() ERC20PresetFixedSupply("NewAgeToken", "NEWAGE", 480 * 10**6 * 10**uint(_decimals), msg.sender) {
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

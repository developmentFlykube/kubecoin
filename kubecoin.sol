pragma solidity ^0.8.4;

import './libraries/IBEP20.sol';
import './libraries/Context.sol';
import './libraries/Ownable.sol';

contract KubeCoin is Context, IBEP20, Ownable {

    string private _name = "KubeCoin";
    string private _symbol = "KUBE";
    uint256 private _totalSupply = 360 * 10**6 * 10**2;
    uint8 private _decimals = 2;
    mapping (address => uint256) private _balances;
    mapping (address => mapping (address => uint256)) private _allowances;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor() {
        _balances[owner()] = _totalSupply;
        emit Transfer(address(0), msg.sender, _totalSupply);
    }

    function totalSupply() external view returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) external view returns (uint256) {
        return _balances[account];
    }

    function getOwner() external view returns (address) {
        return owner();
    }

    function _transfer(address from, address to, uint256 amount) private {
        require(from != address(0), "Cannot transfer from the zero address");
        require(to != address(0), "Cannot transfer to the zero address");
        require(amount > 0, "Transfer amount must be greater than zero");
        _balances[_msgSender()] = _balances[_msgSender()].sub(amount);
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(_msgSender(), recipient, amount);
    }

    function transfer(address recipient, uint256 amount) external returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    function allowance(address owner, address spender) external view returns (uint256) {
        return _allowances[owner][spender];
    }

    function _approve(address owner, address spender, uint256 value) private {
        require(owner != address(0), "Cannot approve from the zero address");
        require(spender != address(0), "Cannot approve to the zero address");
        _allowances[owner][spender] = value;

    }

    function approve(address spender, uint256 amount) external returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool) {
        _transfer(sender, recipient, amount);
        return true;
    }
}

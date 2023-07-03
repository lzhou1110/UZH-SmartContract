// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.0.0/contracts/token/ERC20/IERC20.sol
interface IERC20 {
    function totalSupply() external view returns (uint);

    function balanceOf(address account) external view returns (uint);

    function transfer(address recipient, uint amount) external returns (bool);

    function allowance(address owner, address spender) external view returns (uint);

    function approve(address spender, uint amount) external returns (bool);

    function transferFrom(
        address sender,
        address recipient,
        uint amount
    ) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
}


contract SimpleSwap {
    IERC20 public token1;
    IERC20 public token2;

    constructor(address _token1, address _token2) {
        token1 = IERC20(_token1);
        token2 = IERC20(_token2);
    }

    function swapToken1ForToken2(uint amount) external {
        require(token1.balanceOf(msg.sender) >= amount, "Insufficient token1 balance");
        
        // Transfer token1 from sender to this contract
        token1.transferFrom(msg.sender, address(this), amount);
        
        // Transfer equivalent amount of token2 from this contract to the sender
        token2.transfer(msg.sender, amount);
    }
    
    function swapToken2ForToken1(uint amount) external {
        require(token2.balanceOf(msg.sender) >= amount, "Insufficient token2 balance");
        
        // Transfer token2 from sender to this contract
        token2.transferFrom(msg.sender, address(this), amount);
        
        // Transfer equivalent amount of token1 from this contract to the sender
        token1.transfer(msg.sender, amount);
    }
}
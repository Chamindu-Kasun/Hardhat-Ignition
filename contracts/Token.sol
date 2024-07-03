pragma solidity ^0.8.0;

contract Token {
    string public name = "Example Token";
    string public symbol = "ET";
    uint256 public totalSupply = 10000000;
    address public owner;

    mapping(address => uint256) balances;

    constructor() {
        owner = msg.sender;
        balances[msg.sender] = totalSupply;
    }

    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    function transfer(address to, uint256 amount) external {
        require(balances[msg.sender] >= amount, "Not enough tokens");

        balances[msg.sender] -= amount;
        balances[to] += amount;

        emit Transfer(msg.sender, to, amount);
    }

    function balanceOf(address account) external view returns(uint256){
        return balances[account];
    }
}

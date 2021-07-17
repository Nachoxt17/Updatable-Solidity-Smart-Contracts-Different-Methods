pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

//+-This is an ERC-20 Token that you want to buy in the Exchange where you have the best price, either ExchangeA or ExchangeB.
contract Token is ERC20 {
    constructor() public ERC20("My Token", "TKN") {}
}

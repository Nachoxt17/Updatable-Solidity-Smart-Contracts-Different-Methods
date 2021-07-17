pragma solidity ^0.6.0;

import './Adapter.sol';
import './Token.sol';

/**+-In this Contract you actually perform the action of buying the ERC-20 Token in the Exchange where you have the best price,
either ExchangeA or ExchangeB. You could put all your Business Logic in the Function "invest(***)" but the problem is that maybe
in the Future new Exchanges will appear and you would want to include them in your Business Logic, but once you deploy your
Smart Contract this is too late. For that reason, is Important to use the Adaptern Pattern to be able to Update our Smart Contracts.
(Go to see the "Adapter.sol" File).*/
contract MyContract {
    Adapter adapter;
    Token token;
    
    constructor(address tokenAddress) public {
        token = Token(tokenAddress);
    }
    
    function updateAdapter(address adapterAddress) external {
        adapter = Adapter(adapterAddress);
    }
    
    function invest(uint amount) external {
        token.approve(address(adapter), amount);
        address bestExchange = adapter.getBestExchangeFor(address(token));
        adapter.invest(amount, address(token), bestExchange);
    }
}

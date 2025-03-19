// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
import "hardhat/console.sol";

contract conditional{
    uint x=0;

    function incre() public{
        x++;
    }

    function test() public view{
        if(x==2){
            console.log(x);

        }
    }
}
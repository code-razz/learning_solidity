// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
import "hardhat/console.sol";

contract conditional{
    // event LogInput(string message, uint number); // Event for logging
    uint x=0;

    function incre() public{
        x++;
    }

    function test() public view{
        if(x==2){
            console.log(x);

        }
    }

    function Natural() public {
        while(x<5){
            console.log(x);
            x++;
        }
        x=0;
    }

    //Lab works
    // Task 1: Implement the isPositive function
    // function isPositive(int256 num) public pure{
    //     if(num < 0){
    //         console.log(num , " is negative");
    //     }else{
    //         console.log(num , " is positive");
    //     }
    // }

        // // Task 1: Implement the isPositive function
        // function isPositive(int256 num) public pure returns(bool){
        //     if(num < 0){
        //         return (num<0);
        //     }else{
        //         return (num>0);
        //     }
        // }

    // Task 2: Implement the recursiveSum function using a while loop
    function recSum(uint num) public pure returns(uint){
        uint sum;
        while(num>0){
            sum =sum + num;
            num--;
        }
        console.log(sum);
        return sum;
        // emit LogInput("hello",sum);
    }

    //Task 4: Implement the factorialFuntion using a for loop
    function fact(uint num) public pure returns(uint){
        uint ans=1;
        for(uint i=1;i<=num;i++){
            ans=ans*i;
        }
        console.log("Factorial of ", num ," is ", ans);
        return ans;

    }



}
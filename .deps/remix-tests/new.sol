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
    function isPositive(int256 num) public pure{
        if(num < 0){
            console.log(" is negative");
        }else{
            console.log(" is positive");
        }
    }

    // Task 2: Implement the recursiveSum function using a while loop
    function recSum(uint num) public pure returns(uint){
        uint sum;
        uint i=0;
        while(i<=num){
            sum =sum + i;
            i++;
        }
        console.log(sum);
        return sum;
        // emit LogInput("hello",sum);
    }

    //Task 3: Implement the sumBackwards function using a do-while loop
    function sumBackwards(uint num) public pure returns(uint){
        uint sum;
        do{
            sum =sum + num;
            num--;
        }while(num>0);
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

    //Task 5: Implement the stopCountAtFive function using the break statement
    function stopAt5(uint num) public pure returns(uint){
        while(true){
            if(num<= 5){
                break;
            }else{
                console.log(num);
            }
            num--;
        }
        return num;
    }

    // Task 6: Implement the skipSumAtThree function using the continue statement
    function sumExcept3(uint num) public pure returns(uint){
        uint sum=0;
        for(uint i=0;i<=num;i++){
            if(i==3){
                continue;
            }
            sum = sum + i;
        }
        console.log(sum);
        return sum;
    }

}
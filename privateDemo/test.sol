pragma solidity ^0.4.4;
/*
pragma：版本声明
solidity： 开发语言
0.4.4: 当前合约版本
^: 向上兼容 0.4.4~0.4.9 可以对我们当前的代码进行编译
*/

contract test {
    function multiply(uint a) pure public returns (uint d) {
        return a * 7;
    }
}

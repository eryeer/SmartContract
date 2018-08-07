pragma solidity ^0.4.4;
contract HelloWorld {
  function test() pure public returns (string) {
    return "HelloWorld";
  }

  function test1() pure public returns (string) {
    return "World Hello";
  }

  function echo(string s) pure public returns (string){
    return s;
  }
}

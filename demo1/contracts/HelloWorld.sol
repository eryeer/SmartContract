pragma solidity ^0.4.4;
contract HelloWorld {
  function test() pure public returns (string) {
    return "HelloWorld";
  }

  function test1() public returns (string) {
    return "World Hello";
  }

  function echo(string s) public returns (string){
    return s;
  }
}

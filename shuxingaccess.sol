pragma solidity ^0.4.4;

contract ShuxingAccess {
  uint internal _age;
  uint public _money = 250;
  uint private _height =1000;

  //自定义的get函数比public变量自己生成的get函数优先级高
  function _money() constant public returns(uint) {
      return 120;
  }
}

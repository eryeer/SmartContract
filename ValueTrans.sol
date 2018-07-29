pragma solidity ^0.4.4;

contract ValueTrans {

  uint _age;

  /* 方法名和合约名相同时就属于构造函数， */
  /* 在创建对象时，构造函数会最先被调用 */
  function ValueTrans(uint age) {
    _age = age;
  }

  function f(){
      modify(_age);
  }

  function modify(uint age){
    age = 100;
  }

  function age() constant returns(uint){
      return _age;
  }
}

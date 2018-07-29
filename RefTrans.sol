pragma solidity ^0.4.4;

contract RefTrans {

  string _name;

  /* 方法名和合约名相同时就属于构造函数， */
  /* 在创建对象时，构造函数会最先被调用 */
  constructor(string name) public {
    _name = name;
  }

  function f() public{
      modify(_name);
  }

  function modify(string storage name) internal{
    bytes(name)[0] = "L";
  }

  function name() constant public returns(string){
      return _name;
  }
}

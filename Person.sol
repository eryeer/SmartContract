pragma solidity ^0.4.4;

contract Person {
  uint _height;
  uint _age;
  address _owner; // 代表合约的拥有者
  /* 方法名和合约名相同时就属于构造函数， */
  /* 在创建对象时，构造函数会最先被调用 */
  function Person() {
    _height = 180;
    _age = 29;
    _owner = msg.sender;
  }

  function owner() constant returns (address) {
    return _owner;
  }
/* set方法 可以修改height属性 */
  function setHeight(uint height) {
    _height = height;
  }
/* 读取_height属性 ,constant 代表方法只读,returns 返回值类型*/
  function height() constant returns (uint) {
    return _height;
  }

  function setAge(uint age) {
    _age = age;
  }

  function age() constant returns (uint){
    return _age;
  }

  function kill() {
    if(_owner == msg.sender){
      /* 析构函数 */
      selfdestruct(_owner);
    }
  }
}

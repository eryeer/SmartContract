pragma solidity ^0.4.4;

contract Boolean {
  uint _a;
  uint _b;
  bool _c;
  function Boolean(){
      _a = 100;
      _b = 200;
      _c = true;
  }
  //！逻辑非
  function fei() constant returns (bool){
    return (!_c);
  }
  //&& 逻辑与
  function luojiyu() constant returns (bool){
    return _a == _b && _c;
  }

  // ||逻辑或
  // !=不等于
  function luojihuo() constant returns (bool){
    return _a != _b || _c;
  }
}

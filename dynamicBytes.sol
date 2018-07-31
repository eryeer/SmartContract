pragma solidity ^0.4.4;

contract dynamicBytes {
  bytes public name = new bytes(2);//0x00，括号中为长度

  function nameLength() constant public returns (uint) {
    return name.length;
  }

  function setNameLength(uint len) public {
    name.length = len;
  }
  //往字节数组尾部追加字节，字节数组长度加1
  function pushAByte(byte b) public {
    name.push(b);
  }

}

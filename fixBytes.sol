pragma solidity ^0.4.4;

contract FixBytes {
 bytes9 b9 = 0x6c693c3d2f11934411; //0x6c 69 3c 3d 2f 11 93 44 11
 function readIndex5Byte() constant returns (byte) {
   return b9[5]; //0x11
 }
}

<h1>ETH以太坊学习文档</h1>
<!-- TOC -->

- [1. Tool](#1-tool)
- [2. Demo](#2-demo)
- [3. IDE](#3-ide)
- [4. solidity编程基础](#4-solidity编程基础)
    - [4.1. 入门DEMO](#41-入门demo)
    - [4.2. 值类型](#42-值类型)
    - [4.3. 引用类型](#43-引用类型)
    - [4.4. 变量传递的关键字](#44-变量传递的关键字)
        - [4.4.1. memory 值传递 形参传递默认为此类型，相当于值传递](#441-memory-值传递-形参传递默认为此类型相当于值传递)
        - [4.4.2. storage 引用传递，修改的话要先用byte获取到字节数组，然后更改字节数组的值。](#442-storage-引用传递修改的话要先用byte获取到字节数组然后更改字节数组的值)
    - [4.5. 属性和行为的访问权限](#45-属性和行为的访问权限)
        - [4.5.1. 属性的访问权限](#451-属性的访问权限)
        - [4.5.2. 方法的访问权限](#452-方法的访问权限)
    - [4.6. 合约的继承](#46-合约的继承)
    - [4.7. 合约的重写](#47-合约的重写)
- [5. 数据类型详述](#5-数据类型详述)
    - [5.1. 布尔类型](#51-布尔类型)
    - [5.2. 整型](#52-整型)
    - [5.3. 地址](#53-地址)
        - [5.3.1. this的含义](#531-this的含义)
        - [5.3.2. 地址之间支持的运算符](#532-地址之间支持的运算符)
        - [5.3.3. 成员变量和函数](#533-成员变量和函数)
        - [5.3.4. transfer转账](#534-transfer转账)
        - [5.3.5. send转账](#535-send转账)
    - [5.4. string字符串](#54-string字符串)
    - [5.5. 固定大小字节数组](#55-固定大小字节数组)
        - [5.5.1. 操作运算符](#551-操作运算符)
            - [5.5.1.1. 比较运算符](#5511-比较运算符)
            - [5.5.1.2. 位运算符](#5512-位运算符)
        - [5.5.2. 地址访问](#552-地址访问)
        - [5.5.3. 长度不可变解析](#553-长度不可变解析)
    - [5.6. 动态大小字节数组](#56-动态大小字节数组)
        - [5.6.1. 常规字符串string转换bytes](#561-常规字符串string转换bytes)
        - [5.6.2. 汉字字符串或特殊字符的字符串转换为bytes](#562-汉字字符串或特殊字符的字符串转换为bytes)
            - [5.6.2.1. 特殊字符对应一个字节](#5621-特殊字符对应一个字节)
            - [5.6.2.2. 中文字符串对应3个字节](#5622-中文字符串对应3个字节)
        - [5.6.3. 创建字节数组](#563-创建字节数组)
        - [5.6.4. 改变字节数组长度](#564-改变字节数组长度)
        - [5.6.5. push方法的使用](#565-push方法的使用)
        - [5.6.6. 总结](#566-总结)
    - [5.7. 动态大小字节数组、固定大小字节数组、string之间的转换关系](#57-动态大小字节数组固定大小字节数组string之间的转换关系)
        - [5.7.1. 固定大小字节数组之间的转换](#571-固定大小字节数组之间的转换)
        - [5.7.2. 固定大小字节数组转动态大小字节数组](#572-固定大小字节数组转动态大小字节数组)
        - [5.7.3. 固定大小字节数组不能直接转换为string](#573-固定大小字节数组不能直接转换为string)
        - [5.7.4. 动态大小字节数组转string](#574-动态大小字节数组转string)
        - [5.7.5. 标准固定大小字节数组转string代码](#575-标准固定大小字节数组转string代码)
    - [5.8. 数组Arrays](#58-数组arrays)
        - [5.8.1. 创建固定大小字节数组、可变大小字节数组](#581-创建固定大小字节数组可变大小字节数组)

<!-- /TOC -->

# 1. Tool
- Parity Ethereum
https://www.parity.io
- Ethereum Wallet
Ethereum offical website
- MetaMask Chrome
https://chrome.google.com/webstore/search/MetaMask?hl=zh-CN
- MyEtherWallet
https://www.myeherwallet.com

# 2. Demo 
https://blockchaindemo.io/

- Local demo
npm install blockchain-cli -g
- Hash 的计算
CryptoJS.sha256(index+previousHash+timestamp+data+nonce)
# 3. IDE
- Atom 
https://atom.io/
- Atom 插件
autocomplete-solidity 代码自动补齐
linter-solium linter-solidity 代码错误检查
language-ethereum 支持solidity代码高亮

- Remix网络IDE
https://remix.ethereum.org/ 

# 4. solidity编程基础
## 4.1. 入门DEMO
```
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
```

## 4.2. 值类型
- 布尔类型 Booleans
- 整型 Integer
- 地址 Address
- 定长字节数组 fixed byte arrays
- 有理数和整型 Rational and Integer Literals, String literals
- 枚举类型 Enums
- 函数 Function Types
## 4.3. 引用类型
- 不定长字节数组 bytes
- 字符串 string
- 数组 Array
- 结构体 Struts

## 4.4. 变量传递的关键字 
### 4.4.1. memory 值传递 形参传递默认为此类型，相当于值传递
```
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

```
### 4.4.2. storage 引用传递，修改的话要先用byte获取到字节数组，然后更改字节数组的值。
```
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
```
## 4.5. 属性和行为的访问权限

public 可以对外开放
internal 只能内部和子合约调用 
private 只能内部调用

**备注：** 不管是属性还是方法，只有是public类型时，才可以通过合约地址进行访问，合约内部的this就是当前合约地址，在合约内部如果要访问internal和private类型的属性或是函数，直接访问即可，不要试图用this进行访问。

### 4.5.1. 属性的访问权限
internal 是合约属性默认的访问权限
public 类型的字段会默认生成一个和属性名相同并且返回值就是当前属性的get方法，以便于被外部访问；但是自定义的同名get函数会覆盖掉public变量自己生成的get函数
```solidity
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
```
### 4.5.2. 方法的访问权限

方法默认权限为public类型
internal和private 类型的方法不能够通过指针进行访问，哪怕是在内部通过this访问都会报错，直接访问方法即可。
```
pragma solidity ^0.4.4;

contract MethodAndShuxing {

  uint _weight;
  uint private _height;
  uint internal _age;
  uint public _money;
  
   function test() constant returns(uint){
      return _weight;
  }
  
  function test1() constant public returns(uint){
      return _height;
  }

  function test2() constant internal returns(uint){
      return _age;
  }
  function test3() constant private returns(uint){
      return _money;
  }
  
  //用指针this访问方法只能访问public方法
  function testInternal1() constant returns(uint){
      return this.test1();
  }
  //访问internal方法不能用this
  function testInternal() constant returns(uint){
      return test2();
  }
 
}

```

## 4.6. 合约的继承
is 关键字为继承
合约中支持多继承，父合约用逗号分隔
private的属性和方法不可被继承
internal和public的属性和方法可以被继承
```
pragma solidity ^0.4.4;

contract Animal {

  uint _weight;
  uint private _height;
  uint internal _age = 50;
  uint public _money;
  
   function test() constant returns(uint){
      return _weight;
  }
  
  function test1() constant public returns(uint){
      return _height;
  }

  function test2() constant internal returns(uint){
      return 50;
  }
  function test3() constant private returns(uint){
      return _money;
  }
 
}

contract Animal1 {
    uint _sex = 1;
    
    function sex() constant returns(uint){
        return _sex;
    }
}

contract Dog is Animal, Animal1{
    function testMethod() constant returns (uint){
        return test2();
    }
    
    function testAttr() constant returns(uint){
        return _age;
    }
}
```

## 4.7. 合约的重写
若子合约与父合约中有相同函数或属性，则子合约函数或属性覆盖父合约。

# 5. 数据类型详述
## 5.1. 布尔类型
bool : true/false
支持运算符
! / && / || / == /!=
```
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
```
## 5.2. 整型
uint无符号（全正数）:uint8,uint16,uint24,...uint256,例如3,8,10
int有符号(分正负):int8,int16,int24,...int256，例如-1,+3

int === int256
uint === uint256

//int8 -> 8位
// 11111111 ~ 01111111
// -127 ~ 127

//uint8 -> 8位
// 00000000 ~ 11111111
// 0 ~ 255

- var 变量的使用
```
pragma solidity ^0.4.4;

contract TestVar {

  function test() constant returns (uint8){
      uint8 a = 100;
      var b = a;
      return b;
  }
  
    function test1() constant returns (uint){
        
      uint a;  
      //此处的var会默认赋予uint8，所以循环不能超出255
      for(var i = 0;i<255;i++){
          a = i;
      }
      return a;
  }
}

```
- 运算符
<= == >= > < !=
- 位运算符
与& 或| 亦或^ 非~
- 运算符
 +加 -减 *乘 /除 %求余 **次方 >> 左移 <<右移 

## 5.3. 地址
 
 地址长度20字节，一字节8位，一共160位。 可以用uint160声明地址。

 - 转换uint160 和 address
 ```
 pragma solidity ^0.4.4;

contract Test {

  address _owner;
  uint160 _ownerUint;
  
  function Test(){
      _owner = 0x5e72914535f202659083db3a02c984188fa26e9f;
      _ownerUint = 539200072242722497324523172593427911613710757535;
  }
  
  function owner() constant returns(address){
      return _owner;
  }

  function ownerUint160() constant returns(uint160){
      return uint160(_owner);//返回十进制

  }
  
    function ownerUintToAddress() constant returns(address){
      return address(_ownerUint);//返回address

  }
}
 ```
**Block and Transaction Properties**
```
block.blockhash(uint blockNumber) returns (bytes32): hash of the given block - only works for 256 most recent, excluding current, blocks - deprecated in version 0.4.22 and replaced by blockhash(uint blockNumber).
block.coinbase (address): current block miner’s address
block.difficulty (uint): current block difficulty
block.gaslimit (uint): current block gaslimit
block.number (uint): current block number
block.timestamp (uint): current block timestamp as seconds since unix epoch
gasleft() returns (uint256): remaining gas
msg.data (bytes): complete calldata
msg.gas (uint): remaining gas - deprecated in version 0.4.21 and to be replaced by gasleft()
msg.sender (address): sender of the message (current call) //当前调用消息的钱包地址
msg.sig (bytes4): first four bytes of the calldata (i.e. function identifier)
msg.value (uint): number of wei sent with the message
now (uint): current block timestamp (alias for block.timestamp)
tx.gasprice (uint): gas price of the transaction
tx.origin (address): sender of the transaction (full call chain)
```

### 5.3.1. this的含义
this 指的是什么？当前合约的地址值
```
pragma solidity ^0.4.4;

contract Test {

  address public _owner; // wallet address, this is contract owner
  
  uint public _number;
  
  function Test(){
      _owner = msg.sender;
      _number = 100;
  }  
  
  function msgSenderAddress() constant returns (address){
      return msg.sender;
  }
  
  function returnContractAddress() constant returns (address){
      return this;
  }
  
  function setNumber1(){
      _number = _number + 5;
  }
  
  function setNumber2(){
        if(_owner == msg.sender){
             _number = _number + 10;
        }
  }
}
```
### 5.3.2. 地址之间支持的运算符
<=、  <、 ==、 >、 >=

### 5.3.3. 成员变量和函数
addr.balance 通过钱包地址查询钱包地址的余额，合约地址也是合法的钱包地址，可以通过this.balance查询。
```
pragma solidity ^0.4.4;

contract addressBalance {
    
  function getBalance(address addr) constant returns(uint){
      return addr.balance;
  }

  function getCurrentAddressBalance() constant returns(uint){
      return this.balance;
  }
}
```
### 5.3.4. transfer转账
从合约发起方向某个地址转入以太币，地址无效或者合约发起方的余额不足时，代码将抛出异常并停止转账。
方法中涉及转账 要在方法声明中添加payable关键字。
```
pragma solidity ^0.4.4;

contract addressBalance {
    
    function depoist() payable{
        address Account3 = 0x16d916692cE71dFc60B41Ab463F648698E82D8e4;
        Account3.transfer(msg.value);//msg.value is global variable, input in the browser directly
    }
    function getAccount3Balance() constant returns(uint){
        address Account3 = 0x16d916692cE71dFc60B41Ab463F648698E82D8e4;
        return Account3.balance;
    }
    
    function getOwnerBalance() constant returns(uint){
        address Owner = msg.sender;
        return Owner.balance;
    }
}
```
### 5.3.5. send转账
从合约发起方向某个地址转入以太币，地址无效或者合约发起方的余额不足时，代码将返回false。
```
pragma solidity ^0.4.4;

contract addressBalance {
    
    function depoist() payable returns(bool){
        address Account3 = 0x16d916692cE71dFc60B41Ab463F648698E82D8e4;
        return Account3.send(msg.value);//msg.value is global variable, input in the browser directly
    }
    function getAccount3Balance() constant returns(uint){
        address Account3 = 0x16d916692cE71dFc60B41Ab463F648698E82D8e4;
        return Account3.balance;
    }
    
    function getOwnerBalance() constant returns(uint){
        address Owner = msg.sender;
        return Owner.balance;
    }
}
```

- 调用递归深度不能超过1024
- 如果gas不够，执行会失败
- 所以使用这个方法要检查成功与否
- transfer相对send较安全。

## 5.4. string字符串
字符串可以通过""或''表示，英文字母对应1个字节，汉字对应3个字节，并且不会像C一样以\0结束。
string为特殊可变大小的字节数组。
不能通过length方法获取长度，需要转换为bytes后才能获取。
```
pragma solidity ^0.4.4;

contract StringLiterals {
    
    string _name;
    function StringLiterals() {
        _name = "eryeer";
    }
    
    function setString(string name){
        _name = name;
    }
    
    function name() constant returns(string){
        return _name;
    }
}
```
## 5.5. 固定大小字节数组
bytes1 只能存储一个字节，即一个字母或数字
bytes2 只能存储两个字节
......
bytes32只能存储三十二个字节
```
pragma solidity ^0.4.4;

contract FixBytes {
  bytes1 b1 = 0x6c; //0110 1100
  bytes2 b2 = 0x6c69;// 0110 1100 0110 1001
  bytes9 b9 = 0x6c693c3d2f11934411;

  function getByteLength() constant returns (uint) {
    return b9.length;
  }
}

```
### 5.5.1. 操作运算符
#### 5.5.1.1. 比较运算符
<=, <, ==, !=, >=, >
#### 5.5.1.2. 位运算符
&, |, ^, ~, >>, << 
### 5.5.2. 地址访问
```
pragma solidity ^0.4.4;

contract FixBytes {
 bytes9 b9 = 0x6c693c3d2f11934411; //0x6c 69 3c 3d 2f 11 93 44 11
 function readIndex5Byte() constant returns (byte) {
   return b9[5]; //0x11
 }
}
```
### 5.5.3. 长度不可变解析
1. 长度不可变
2. 内容不可修改
```
pragma solidity ^0.4.4;

contract FixBytes {
 bytes9 b9 = 0x6c693c3d2f11934411;
 function setNameLength(uint length) {
   //报错 长度不可修改
   b9.length = length;
 }
 function setNameFirstByte(byte b) {
   //报错 存储内容不可修改
   b9[0] = b;
 }
}
```
## 5.6. 动态大小字节数组
- string 是一个动态尺寸的UTF-8编码字符串，他是一个特殊的可变字节数组，string是引用类型，而非值类型
- bytes 动态字节数组，引用类型。
### 5.6.1. 常规字符串string转换bytes
```
pragma solidity ^0.4.4;

contract dynamicBytes {
  bytes9 public g = 0x6c693c3d2f11934411;
  string public name = "liyuechun";
  function gByteLength() constant returns (uint){
    return g.length;
  }

  function nameBytes() constant returns (bytes){
    return bytes(name);
  }

  function nameLength() constant returns (uint){
    return bytes(name).length;
  }
  //通过索引去修改内容
  function setNameFirstByteForL(bytes1 z){
    bytes(name)[0] = z;
  }
}
```
### 5.6.2. 汉字字符串或特殊字符的字符串转换为bytes
#### 5.6.2.1. 特殊字符对应一个字节
```
pragma solidity ^0.4.4;

contract dynamicBytes {

  string public name = "a!+&520";

  function nameBytes() constant returns (bytes){
    return bytes(name); //0x61212b26353230
  }
  function nameLength() constant returns (unit){
    return bytes(name).length; //7
  }
}
```
#### 5.6.2.2. 中文字符串对应3个字节
```
pragma solidity ^0.4.4;

contract dynamicBytes {

  string public name = "黎越春";

  function nameBytes() constant returns (bytes){
    return bytes(name); 
  }
  function nameLength() constant returns (uint){
    return bytes(name).length; //9
  }
}
```
### 5.6.3. 创建字节数组
内容可变
```
contract dynamicBytes {
  bytes public b = new bytes(5);

  function bLength() constant returns (uint) {
    return b.length;//5
  }
// input 3,0x6c 内容可变
  function setIndexByByte(uint index,byte data){
    b[index] = data;
  }
}
```
### 5.6.4. 改变字节数组长度
长度可变,通过改变length值来设置
```
pragma solidity ^0.4.4;

contract dynamicBytes {
  bytes public b = new bytes(1);//0x00，括号中为长度

  function bLength() constant returns (uint) {
    return b.length;//1
  }

  //input 3
  function setBLength(uint len) {
    b.length = len; //b.length = 3
  }
  // input 0 即为清空
  function clearBBytes(uint len){
    b.length = len;
  }

  // 第二种清空方法
  function clearBBytes2(){
    delete b;
  }
}}
```
### 5.6.5. push方法的使用
```
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
```
### 5.6.6. 总结
- 不可变字节数组
如果清楚存储字节的大小，可以通过bytes1,bytes2,bytes3,...,bytes32来声明字节数组变量，不过不可变字节数组的字节数不可修改，字节数组长度不可修改。
- 可变字节数组
可以通过bytes name = new bytes(length) - length 为字节数组长度，来声明可变大小和可修改字节内容的可变字节数组。
## 5.7. 动态大小字节数组、固定大小字节数组、string之间的转换关系
### 5.7.1. 固定大小字节数组之间的转换
- bytesi的变量长度由i来决定
- 向下转换会将末位砍掉
- 向上转换会在末位补齐
```
pragma solidity ^0.4.4;
contract fixBytes {
  // 0x6c6979656368756e

  bytes9 public b = 0x6c697975656368756e;
  
  function b1_length() constant returns (uint){
      return b.length; 
  }
  
  function bToBytes2() constant returns(bytes2){
      return bytes2(b);//0x6c69
  }
  function bToBytes32() constant returns(bytes32){
      return bytes32(b);//0x6c697975656368756e0000000000000000000000000000000000000000000000
  }
   function bToByte() constant returns(byte){
      return byte(b);//0x6c
  }
}
```

### 5.7.2. 固定大小字节数组转动态大小字节数组
两者之间不能直接强转,可以创建可变字节数组，拷贝固定字节数组到动态数组中。
```
pragma solidity ^0.4.4;
contract fixBytes {
  // 0x6c6979656368756e

  bytes9 public b = 0x6c697975656368756e;
  
  function zhuanhuan() constant returns (bytes memory b1){
      b1 = new bytes(b.length);
      for(uint i = 0;i<b.length;i++){
          b1[i] = b[i];
      }
  }
  
}
```
### 5.7.3. 固定大小字节数组不能直接转换为string
固定大小字节数组转string，需先转动态字节数组，再转string

### 5.7.4. 动态大小字节数组转string
string()直接强转
```
pragma solidity ^0.4.4;
contract fixBytes {
  // 0x6c6979656368756e
  bytes9 names9 = 0x6c6979656368756e;
  bytes name = new bytes(2);
  bytes names = new bytes(9);
  function fixBytes(){
      name[0] = 0x6c;
      name[0] = 0x69;
      for(uint i = 0 ; i< names9.length;i++){
          names[i] = names9[i];
      }
  }
  
  function nameToString() constant returns(string){
      return string(names);
  }
  
}
```
### 5.7.5. 标准固定大小字节数组转string代码
```
pragma solidity ^0.4.4;
contract fixBytes {
  // 0x6c6979656368756e
  function bytes32ToString(bytes32 x) constant returns(string){
      bytes memory bytesString = new bytes(32);
      uint charCount = 0;
      for(uint j=0;j<32;j++){
          byte char = byte(bytes32(uint(x) <<  (8 * j)));
          if(char != 0 ){
              bytesString[charCount] = char;
              charCount++;
          }
      }
      bytes memory bytesStringTrimmed = new bytes(charCount);
      for(j = 0;j<charCount;j++){
          bytesStringTrimmed[j] = bytesString[j];
      }
      return string(bytesStringTrimmed);
  }
}
```
## 5.8. 数组Arrays
### 5.8.1. 创建固定大小字节数组、可变大小字节数组
创建可变字节数组除了通过```bytes b = new bytes(len)```来创建外，也可以通过```byte[] b```来进行声明。

创建固定大小字节数组可以通过```byte[len] b```来创建，不过这种创建方式生成的字节数组，<font color=red><b>长度不可变，但是内容可以修改</b></font>。

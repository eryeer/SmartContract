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
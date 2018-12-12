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
        - [5.8.1. 固定长度的数组](#581-固定长度的数组)
            - [5.8.1.1. 声明和求数组长度](#5811-声明和求数组长度)
            - [5.8.1.2. 固定长度数组的长度不可变，但是内容可变](#5812-固定长度数组的长度不可变但是内容可变)
        - [5.8.2. 可变长度的数组](#582-可变长度的数组)
        - [5.8.3. 创建固定大小字节数组、可变大小字节数组](#583-创建固定大小字节数组可变大小字节数组)
        - [5.8.4. 二维数组](#584-二维数组)
        - [5.8.5. 创建Memory Arrays](#585-创建memory-arrays)
        - [5.8.6. 数组的字面量和内连数组inline](#586-数组的字面量和内连数组inline)
    - [5.9. 枚举](#59-枚举)
    - [5.10. 结构体](#510-结构体)
    - [5.11. 字典映射](#511-字典映射)
    - [5.12. 综合案例1：运动员投资合约](#512-综合案例1运动员投资合约)
    - [5.13. 单位和全局变量的使用](#513-单位和全局变量的使用)
    - [5.14. 元组(Tuples)](#514-元组tuples)
- [6. 使用truffle编写智能合约](#6-使用truffle编写智能合约)
    - [6.1. 入门](#61-入门)
    - [6.2. 书写简易代币合约](#62-书写简易代币合约)
    - [6.3. 建立标准代币部落币"BLC"](#63-建立标准代币部落币blc)
- [7. 部署私链](#7-部署私链)
    - [7.1. 软件安装](#71-软件安装)
    - [7.2. 部署私链单节点](#72-部署私链单节点)
    - [7.3. 部署合约](#73-部署合约)
    - [7.4. 多节点部署](#74-多节点部署)
- [8. 基于Parity搭建联盟链](#8-基于parity搭建联盟链)
    - [8.1. Parity钱包下载安装](#81-parity钱包下载安装)
    - [8.2. 设置chain spec](#82-设置chain-spec)
    - [8.3. 设置两个节点](#83-设置两个节点)
- [9. 玩转truffle、web3js](#9-玩转truffleweb3js)
    - [9.1. web3.js api的使用](#91-web3js-api的使用)
    - [9.2. 编写truffle测试代码](#92-编写truffle测试代码)
    - [9.3. truffle unbox 项目介绍](#93-truffle-unbox-项目介绍)

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
http://remix.ethereum.org/ 

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
 
 - 地址长度20字节，一字节8位，一共160位。 可以用uint160声明地址。
 - 输入地址值作为参数时要加""。

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

### 5.8.1. 固定长度的数组
#### 5.8.1.1. 声明和求数组长度
```
pragma solidity ^0.4.4;
contract arrays {
  uint[5] public T = [1,2,3,4,5]; 
  
  function numbers() constant public returns (uint){
      uint num = 0;
      for (uint i = 0; i< T.length;i++){
          num = num + T[i];
      }
      return num;
  }
}
```
#### 5.8.1.2. 固定长度数组的长度不可变，但是内容可变
```
pragma solidity ^0.4.4;
contract arrays {
  uint[5] public T = [1,2,3,4,5]; 
  function setTIndex0Value()public {
      T[0] =10;
  }
}
```
### 5.8.2. 可变长度的数组
这类数组长度和内容均可修改
- 第一种声明
```
pragma solidity ^0.4.4;
contract arrays {
   uint[] T = [1,2,3,4,5];
   function T_length() constant returns (uint){
       return T.length;
       
   }
   
   function setTlen(uint len) {
       T.length = len;
   }
}
```
- 第二种声明
```
pragma solidity ^0.4.4;
contract arrays {
   uint[] public T = new uint[](5);
   function arrays(){
       for(uint i = 0;i<T.length;i++){
           T[i] = i+1;
       }
   }
}
```

### 5.8.3. 创建固定大小字节数组、可变大小字节数组
创建可变字节数组除了通过```bytes b = new bytes(len)```来创建外，也可以通过```byte[] b```来进行声明。

创建固定大小字节数组可以通过```byte[len] b```来创建，不过这种创建方式生成的字节数组，<b>长度不可变，但是内容可以修改</b>。
```
pragma solidity ^0.4.4;
contract fixBytes {
  // 0x6c6979656368756e
  bytes9 a = 0x6c6979656368756e;
  byte[9] public aa = [byte(0x6c),0x69,0x79,0x65,0x63,0x68,0x75,0x6e];
  byte[] public cc = new byte[](10);
  bytes ccc = new bytes(10);
  function setAAIndex0Byte()public {
      aa[0] = 0x89;
  }
  function setCC() public returns (byte[]){
      for(uint i = 0 ; i< a.length; i++){
          cc.push(a[i]);
      }
      return cc;
  }
}

```

### 5.8.4. 二维数组
```
pragma solidity ^0.4.4;
contract arrays {
  uint [2][3] T = [[1,2],[3,4],[5,6]];
  uint [2][] T1 = new uint[2][](5);//可变数组

  function T_len() constant public returns(uint){
      return T.length; //3
  }
  
  function pushArrToT1(uint[2] _t){
      T1.push(_t);
  }
}
```
### 5.8.5. 创建Memory Arrays
函数体内创建的数组只能是memory类型,长度不可改变
```
pragma solidity ^0.4.4;
contract arrays {
  function f(uint len){
      uint[] memory a = new uint[](7);
      a[6] = 9;
  }
}
```
### 5.8.6. 数组的字面量和内连数组inline
memory类型数组要进行强转类型才能作为参数调用
```solidity
pragma solidity ^0.4.4;
contract arrays {
  function f() public {
      g([uint(1),2,3]);
  }
  // uint256
  function g(uint[3] _data) public{
      
  }
}
```
函数内固定长度的memory类型数组不可以赋值给可变memeory类型数组；全局的则可以

**错误写法**
```solidity
pragma solidity ^0.4.4;
contract arrays {
  
  //错误写法
  function g() public{
      uint[] memory x = [uint(1),3,4];
  }

}
```
## 5.9. 枚举
实际上是有范围的自定义整型，超出范围会报错
默认范围为uint8，超出会变成uint16，以此向上类推
```solidity
pragma solidity ^0.4.4;
contract testEnum {
  enum ActionChoices{GoLeft,GoRight,GoStraight,SitStill} //default ActionChoices as uint8, value as 0,1,2,3
  ActionChoices _choice;
  ActionChoices constant defaultChoice = ActionChoices.GoStraight;
  
  function setGoStraight(ActionChoices choice) public {
      _choice = choice;
  }
  function getChoice() constant public returns(ActionChoices){
      return _choice;
  }
  function getDefaultChoiceUint() pure public returns(uint){
      return uint(defaultChoice); // uint256 2
  }
    function getDefaultChoice() pure public returns(ActionChoices){
      return defaultChoice; //uint8 2
  }
}
```
## 5.10. 结构体
```
pragma solidity ^0.4.4;
contract Students {
    
  struct Person{
      uint age;
      uint stuId;
      string name;
  }

  Person [] persons = new Person[](5);
}
```
- 初始化方法
```
pragma solidity ^0.4.4;
contract Students {
    
  struct Person{
      uint age;
      uint stuId;
      string name;
  }
  Person public _person1 = Person(15,101,"eryeer");//初始化方法1
  Person public _person2 = Person({age:38,stuId:102,name:"zhaochen"});//初始化方法2
}
```

## 5.11. 字典映射
+ 找不到的key返回0
+ 字典无法作为返回值
- 格式
```
mapping(_keyType => _valueType)
```
- 用法
```
pragma solidity ^0.4.4;
contract MappingExample {
    // 0xf8414e1c36D921E35298450FD9B94e682b4451BA
    //0x8c9A06C8440048d001C978c8190748A6D73D0522
    mapping(address => uint) balances;
    function update(address a, uint newBalance) public {
        balances[a] = newBalance;
    }
    //{0xf8414e1c36D921E35298450FD9B94e682b4451BA:100,0x8c9A06C8440048d001C978c8190748A6D73D0522:200}
    function searchBalance(address a )constant public returns(uint){
        return balances[a];
    }
}
```
## 5.12. 综合案例1：运动员投资合约
```solidity
pragma solidity ^0.4.4;
contract CrowdFunding {
    //0x14723a09acff6d2a60dcdf7aa4aff308fddc160c liuxiang
    //0x4b0897b0513fdc7c541b6d9d7e929c4e5364d2db yaoming
    //投资人
    struct Funder {
        address addr; //投资人地址
        uint amount;  //投资额
    }
    //运动员
    struct Campaign {
        address beneficiary; //运动员地址
        uint fundingGoal; //目标融资总额
        uint numFunders; //投资人个数
        uint amount;  //目前被投资金额
        mapping(uint => Funder) funders;
    }
    //运动员数量
    uint public numCampaigns;
    mapping(uint=>Campaign) campaigns; 
    
    function newCampaign(address beneficiary, uint goal) public returns (uint campaignID){
        campaignID = numCampaigns++;
        campaigns[campaignID] = Campaign(beneficiary,goal,0,0);
    }
    function contribute(uint campaignID) public payable {
        Campaign storage c = campaigns[campaignID];
        c.funders[c.numFunders++] =Funder({addr:msg.sender,amount:msg.value});
        c.amount += msg.value;
        c.beneficiary.transfer(msg.value);
    }
    function checkGoalReached(uint campaignID) view public returns(bool reached){
        Campaign storage c = campaigns[campaignID];
        if(c.amount < c.fundingGoal){
            return false;
        }else {
            return true;
        }
    }
}
```
## 5.13. 单位和全局变量的使用
- token单位
一个证书后面可以跟一个单位，ether，finney，szabo，wei。
    + 1 ether = 1000 finney
    + 1 ether = 1000,000 szabo
    + 1 ether = 10 ** 18 wei
```solidity
pragma solidity ^0.4.4;
contract C {
  uint a = 1 ether;
  uint b = 10 ** 18 wei;
  uint c = 1000 finney;
  uint d = 1000000 szabo;
  function isTrueAEqualToB() view public returns(bool){
      return a == b; //true
  }
    function isTrueAEqualToC() view public returns(bool){
      return a == c; //true
  }
    function isTrueAEqualToD() view public returns(bool){
      return a == d; //true
  }
}
```

- 时间单位
默认单位 seconds；总共有seconds minutes hours days weeks years
```
pragma solidity ^0.4.4;
contract C {
  function test1() constant public returns(bool){
      return 1 == 1 seconds;
  }
  
    function test2() constant public returns(bool){
      return 60 seconds == 1 minutes;
  }
}
```

- 区块和交易属性
```
block.blockhash(uint blockNumber) returns (bytes32): hash of the givenblock - only works for 256 most recent, excluding current, blocks - deprecated in version 0.4.22 and replaced by blockhash(uint blockNumber). 某个区块链的hash
block.coinbase (address): current block miner’s address 当前区块的挖矿地址
block.difficulty (uint): current block difficulty 当前区块难度
block.gaslimit (uint): current block gaslimit
block.number (uint): current block number
block.timestamp (uint): current block timestamp as seconds since unix epoch
gasleft() returns (uint256): remaining gas
msg.data (bytes): complete calldata
msg.gas (uint): remaining gas - deprecated in version 0.4.21 and to be replaced by gasleft()剩余gas
msg.sender (address): sender of the message (current call) //当前调用消息的钱包地址
msg.sig (bytes4): first four bytes of the calldata (i.e. function identifier)方法ID
msg.value (uint): number of wei sent with the message
now (uint): current block timestamp (alias for block.timestamp)
tx.gasprice (uint): gas price of the transaction交易的Gas单价
tx.origin (address): sender of the transaction (full call chain)
```
- 错误处理
    + assert(bool condition) : 不满足条件，将抛出异常
    + require(bool condition) : 不满足条件，将抛出异常
    + revert() 抛出异常
```
    if(msg.sender != owner) {revert();}
    assert(msg.sender == owner);
    require(msg.sender == owner);
```

## 5.14. 元组(Tuples)
元组中可以保存不同数据类型，同时返回多个值。
```
pragma solidity ^0.4.4;
contract C {
  mapping(uint => string) students;
  function C(){
      students[0] = "eryeer";
      students[1] = "zhaochen";
  }
  
  function studentsNames() constant returns (string name0, string name1, uint i) {
      name0 = students[0];
      name1 = students[1];
      i = 3;
  }
  
  //等价于
  function studentsNames2() constant returns (string name0, string name1, uint i) {
      name0 = students[0];
      name1 = students[1];
      return (name0,name1,3);
  }
}
```
- 元组的使用
```
pragma solidity ^0.4.4;
contract C {
    
  uint[] data = new uint[](5);    
  function f() constant returns (uint, bool, uint) {
      return (7,true,2);
  }
  
  function g1() constant returns(uint,bool,uint){
      var (x,b,y) = f();
      return (x,b,y);
  }
  
  function g2() constant returns(uint,uint){
      var (x,b,y) =f();
      return (x,y);  
  }
  
  function g3() constant returns(uint,uint){
      var (x,b,y) =f();
      (x,y) =(2,7);
      (x,y) = (y,x);
      return (x,y);
  }
  
  function g4() constant returns(uint[]){
      (data.length,) = f();
      return data;
  }

  function g5() constant  returns(uint[]){
      (,data[3]) =f();
      return data;
  }

  function g6() constant returns(uint){
      var(x,) =(1,);
      return x;
  }
}
```
# 6. 使用truffle编写智能合约
## 6.1. 入门
- 完整视频
https://v.qq.com/x/page/h0552ba9k8h.html
- 安装truffle
```
npm install -g truffle
```
- 创建
```
truffle init
```
- 打开编译器
```
truffle develop
```
- demo代码
```
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
```

- 在编译器中输入```compile```开始编译
- 在编译器中输入```migrate```开始部署（重新部署需要输入```migrate --reset```）
```
let contract = HelloWorld.deployed().then(instance => contract = instance); //获取合约实例
contract.test() //调用合约test方法(有pure关键字的function)
contract.test1.call() // 调用test1方法(没有pure关键字的function)
contract.echo.call("eryeer")
```
## 6.2. 书写简易代币合约
- 合约
```
pragma solidity ^0.4.4;
contract EncryptedToken {
   uint256 INITIAL_SUPPLY = 666666;
   mapping (address => uint256) balances;

   constructor() public {
     balances[msg.sender] = INITIAL_SUPPLY;
   }

   function transfer(address _to, uint256 _amount) public {
     assert(balances[msg.sender] >= _amount);
     balances[msg.sender] -= _amount;
     balances[_to] += _amount;
   }

   function balanceOf(address _owner) constant public returns (uint256){
     return balances[_owner];
   }
}

```
- truffle develop 指令
```
truffle(develop)> contract.balanceOf("0x627306090abab3a6e1400e9345bc60c78a8bef57");
BigNumber { s: 1, e: 5, c: [ 666666 ] }
truffle(develop)> contract.transfer("0xf17f52151ebef6c7334fad080c5704d77216b732",6000);
{ tx:
   '0xd8acfb7b462c2d916864329cb30e9f78588a50d144c740babd1f4069436e8b08',
  receipt:
   { transactionHash:
      '0xd8acfb7b462c2d916864329cb30e9f78588a50d144c740babd1f4069436e8b08',
     transactionIndex: 0,
     blockHash:
      '0x4b71a954be7373d86081b9fd8008c27f21228644b8d39ba13164aba19204d94b',
     blockNumber: 5,
     gasUsed: 49150,
     cumulativeGasUsed: 49150,
     contractAddress: null,
     logs: [],
     status: '0x01',
     logsBloom:
      '0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000' },
  logs: [] }
truffle(develop)> contract.balanceOf("0x627306090abab3a6e1400e9345bc60c78a8bef57");
BigNumber { s: 1, e: 5, c: [ 660666 ] }
truffle(develop)> contract.balanceOf.call("0xf17f52151ebef6c7334fad080c5704d77216b732");
BigNumber { s: 1, e: 3, c: [ 6000 ] }
```

## 6.3. 建立标准代币部落币"BLC"
建立文件夹
```
mkdir BLC
npm install #生成package.json
truffle install #可能会报错，需要将package.json移出文件夹
```
安装OpenZeppelin简化加密钱包开发过程。OpenZeppelin是一套能够给我们方便提供编写加密合约的函数库，同时里面也提供了兼容ERC20的智能合约。
- 安装
```
cd BLC
npm install zeppelin-solidity
```

- 代码
```
pragma solidity ^0.4.4;
import "../node_modules/zeppelin-solidity/contracts/token/ERC20/StandardToken.sol";

contract BloggerCoin is StandardToken {
  string public name = "BloggerCoin";
  string public symbol = "BLC";
  uint8 public decimals = 4; //决定小数点后多少位
  uint256 public INITIAL_SUPPLY = 666666;
  constructor() public {
    totalSupply_ = INITIAL_SUPPLY;
    balances[msg.sender] = INITIAL_SUPPLY;
  }
}
```
- truffle develop 指令
```
truffle(develop)> contract.name.call()
'BloggerCoin'
truffle(develop)> contract.symbol.call()
'BLC'
truffle(develop)> contract.decimals.call()
BigNumber { s: 1, e: 0, c: [ 4 ] }
truffle(develop)> contract.balanceOf("0x627306090abab3a6e1400e9345bc60c78a8bef57")
BigNumber { s: 1, e: 5, c: [ 666666 ] }
truffle(develop)> contract.balanceOf("0xf17f52151ebef6c7334fad080c5704d77216b732")
BigNumber { s: 1, e: 0, c: [ 0 ] }
truffle(develop)> contract.transfer("0xf17f52151ebef6c7334fad080c5704d77216b732",6666)
{ tx:
   '0x729aec4414f4f90e021b967d30e76d55496c5f9a851f10772296ac472c90e462',
  receipt:
   { transactionHash:
      '0x729aec4414f4f90e021b967d30e76d55496c5f9a851f10772296ac472c90e462',
     transactionIndex: 0,
     blockHash:
      '0x92540886de725b9af13a3dab534cb7e0e6bb406d8ef1af0aa0bd810941f3c7db',
     blockNumber: 5,
     gasUsed: 51633,
     cumulativeGasUsed: 51633,
     contractAddress: null,
     logs: [ [Object] ],
     status: '0x01',
     logsBloom:
      '0x00000000000000000000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000010000008000000000000000000010000000080000000000000000000000000000000000000000000000000000000000000000010000000000000000000010000000000000000000000000000000000000000010000000002000000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000000010000000000000' },
  logs:
   [ { logIndex: 0,
       transactionIndex: 0,
       transactionHash:
        '0x729aec4414f4f90e021b967d30e76d55496c5f9a851f10772296ac472c90e462',
       blockHash:
        '0x92540886de725b9af13a3dab534cb7e0e6bb406d8ef1af0aa0bd810941f3c7db',
       blockNumber: 5,
       address: '0x345ca3e014aaf5dca488057592ee47305d9b3e10',
       type: 'mined',
       event: 'Transfer',
       args: [Object] } ] }
truffle(develop)> contract.balanceOf("0xf17f52151ebef6c7334fad080c5704d77216b732")
BigNumber { s: 1, e: 3, c: [ 6666 ] }
truffle(develop)> contract.balanceOf("0x627306090abab3a6e1400e9345bc60c78a8bef57")
BigNumber { s: 1, e: 5, c: [ 660000 ] }
```
# 7. 部署私链
## 7.1. 软件安装
- 官方指导
https://github.com/ethereum/go-ethereum/wiki
安装brew（MACOS）
安装golang编译器
```
brew install go
```
安装geth
下载source code（tar.gz）
```
cd go-ehtereum-1.5.9
make geth
```
安装solidity
```
brew install solidity
```
## 7.2. 部署私链单节点
- 新建文件夹privateDemo并进入
- 编辑文件genesis.json
```
{
   "config": {
        "chainId": 15,
        "homesteadBlock": 0,
        "eip155Block": 0,
        "eip158Block": 0
    },
    "coinbase" : "0x0000000000000000000000000000000000000000",
    "difficulty" : "0x40000",
    "extraData" : "",
    "gasLimit" : "0xffffffff",
    "nonce" : "0x0000000000000042",
    "mixhash" : "0x0000000000000000000000000000000000000000000000000000000000000000",
    "parentHash" : "0x0000000000000000000000000000000000000000000000000000000000000000",
    "timestamp" : "0x00",
    "alloc": { }

}
```
<b>chainID(私链id主链为1),config,difficulty,gasLimit,alloc都是必须的</b>
- 注：如果设置了初始账号如下
```
"alloc": {
              "dbdbdb2cbd23b783741e8d7fcf51e459b497e4a6":
              {
                  "balance":"300000"
              },
              "d7cc42b9880030e3c143a86593d536f50ef7c929":
              {
                  "balance":"400000"
              }
            
       }
```
需要设置etherbase,之后挖矿的gas就会进入这个账号
```
miner.setEtherbase("d7cc42b9880030e3c143a86593d536f50ef7c929");
```
- 初始化genesis.json
```
geth --datadir data1 init genesis.json
```
- 启动私链
```
geth --datadir data1 --networkid 314590 --ipcdisable --port 61910  --rpcport 8200 console
```
- 查看首个节点信息
```
> admin.nodeInfo.enode
"enode://2efbb4aac545b0c79dc486bc2af9cb19d3e0b4a6a0df9d72abdb1b95fd792d74e98acc3181cf7b92bde7571fd98e011844805c9d3503faa15ea720d4d6771b94@10.72.6.145:61910"
```
- 查看账户
```
personal.listAccounts
```
- 创建新账户
```
personal.newAccount("密码") //如personal.newAccount("eryeer")
```
- 查看账户余额
```
 eth.getBalance("0xf1d126385c8eb3f74249c22fbfe2c9302ebd7982")
```
- 解锁账户
```
personal.unlockAccount(peronsal.listAccounts[0])// 或者里面直接填写地址值
```
- 开始挖矿
```
miner.start()
```
- 结束挖矿
```
miner.stop()
```
- 转账
```
amount = web3.toWei(5,'ether')
eth.sendTransaction({from:personal.listAccounts[0],to:personal.listAccounts[1],value:amount})
```
- 查看交易池
```
> txpool.status
{
  pending: 0,
  queued: 0
}
```
- 查看pending数据
```
> eth.getBlock("pending",true)
{
  difficulty: 2,
  extraData: "0xda8301080d846765746888676f312e31302e338777696e646f777300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
  gasLimit: 6270953,
  gasUsed: 21000,
  hash: null,
  logsBloom: "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
  miner: null,
  mixHash: "0x0000000000000000000000000000000000000000000000000000000000000000",
  nonce: null,
  number: 2,
  parentHash: "0x01240347fbcacb8943ed7fce6af94613fbd6d1d8c7226c6fa832e901d1c46c1a",
  receiptsRoot: "0x056b23fbba480696b65fe5a59b8f2148a1299103c4f57df839233af2cf4ca2d2",
  sha3Uncles: "0x1dcc4de8dec75d7aab85b567b6ccd41ad312451b948a7413f0a142fd40d49347",
  size: 717,
  stateRoot: "0xc4b0a4d8b6d6a8519cdaeb1a4cdd60849899bb3a912145faa6072cf8e008ef3a",
  timestamp: 1533472711,
  totalDifficulty: 0,
  transactions: [{
      blockHash: "0x7fbf6244b996ac1b16daf6c1a10b1201f9cd164a9809f0907b79c6252ef47cd3",
      blockNumber: 2,
      from: "0xf1d126385c8eb3f74249c22fbfe2c9302ebd7982",
      gas: 90000,
      gasPrice: 1,
      hash: "0x48ade838f40e959c5e67d41d625aa281ec50dcfa8ceeeb90daabef99608fdba5",
      input: "0x",
      nonce: 1,
      r: "0x699060d5c68aa8fdcbf0d1450cade00d40e007778150dd147b92a4490e0e611d",
      s: "0x2d7e27329b0469cce872f3f5c06c6288bdd158ca264c776d86789b9ca74013e9",
      to: "0x9c9ab08b08713bf1402689de7a053a5204a5d174",
      transactionIndex: 0,
      v: "0xa96",
      value: 5000000000000000000
  }],
  transactionsRoot: "0xb90fff27c4bea583ee104656d60189f15cdb5d199ea6b81e2f19af1901a784bc",
  uncles: []
}
```
- 通过区块号查看区块
```
> eth.getBlock(2) //通过区块号查看区块
{
  difficulty: 2,
  extraData: "0xda8301080d846765746888676f312e31302e338777696e646f77730000000000b0acd15f6fb6bc2523cfb4a68ed56d972b868a339bcb8a153b4b3c3e8f2c6d537246d3b39eda03817efa8138b53a915575c90fd964e467d9352484905722a95001",
  gasLimit: 6270953,
  gasUsed: 21000,
  hash: "0x6090421d57c4bb92209efda0e05a823c67aa40c75ab406cfaf9521cb950667c6",
  logsBloom: "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
  miner: "0x0000000000000000000000000000000000000000",
  mixHash: "0x0000000000000000000000000000000000000000000000000000000000000000",
  nonce: "0x0000000000000000",
  number: 2,
  parentHash: "0x01240347fbcacb8943ed7fce6af94613fbd6d1d8c7226c6fa832e901d1c46c1a",
  receiptsRoot: "0x056b23fbba480696b65fe5a59b8f2148a1299103c4f57df839233af2cf4ca2d2",
  sha3Uncles: "0x1dcc4de8dec75d7aab85b567b6ccd41ad312451b948a7413f0a142fd40d49347",
  size: 717,
  stateRoot: "0x296802efd72aafc5cd03acdf47b09553707c7246ee0cf51a7fa1f065cfbdfba8",
  timestamp: 1533473791,
  totalDifficulty: 5,
  transactions: ["0x48ade838f40e959c5e67d41d625aa281ec50dcfa8ceeeb90daabef99608fdba5"],
  transactionsRoot: "0xb90fff27c4bea583ee104656d60189f15cdb5d199ea6b81e2f19af1901a784bc",
  uncles: []
}
```
- 查看区块高度
```
> eth.blockNumber
2
```
- 查看交易
```
> eth.getTransaction("0x48ade838f40e959c5e67d41d625aa281ec50dcfa8ceeeb90daabef99608fdba5")
{
  blockHash: "0x6090421d57c4bb92209efda0e05a823c67aa40c75ab406cfaf9521cb950667c6",
  blockNumber: 2,
  from: "0xf1d126385c8eb3f74249c22fbfe2c9302ebd7982",
  gas: 90000,
  gasPrice: 1,
  hash: "0x48ade838f40e959c5e67d41d625aa281ec50dcfa8ceeeb90daabef99608fdba5",
  input: "0x",
  nonce: 1,
  r: "0x699060d5c68aa8fdcbf0d1450cade00d40e007778150dd147b92a4490e0e611d",
  s: "0x2d7e27329b0469cce872f3f5c06c6288bdd158ca264c776d86789b9ca74013e9",
  to: "0x9c9ab08b08713bf1402689de7a053a5204a5d174",
  transactionIndex: 0,
  v: "0xa96",
  value: 5000000000000000000
}
```

## 7.3. 部署合约
- 准备test.sol放于privateDemo文件夹下

合约内容
```solidity
pragma solidity ^0.4.4;
contract test {
    function multiply(uint a) pure public returns (uint d) {
        return a * 7;
    }
}
```

在目录privateDemo下执行
```
npm install -g solc
```
- 查看版本
```
> solcjs --version
0.4.24+commit.e67f0147.Emscripten.clang
```
- 编译获取字节码
```
solcjs --bin test.sol
```
同级目录生成
test_sol_test.bin
- 获取abi json
```
solcjs --abi test.sol
```
同级目录生成
test_sol_test.abi
- 在geth console中操作
```
# 拷贝test_sol_test.bin中的字节码，开头添加0x
> var bin = "0x608060405234801561001057600080fd5b5060bb8061001f6000396000f300608060405260043610603f576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063c6888fa1146044575b600080fd5b348015604f57600080fd5b50606c600480360381019080803590602001909291905050506082565b6040518082815260200191505060405180910390f35b60006007820290509190505600a165627a7a7230582009dd925b52db2f972b61d39f9347a16c962b4b42896f44a51a82e640e49211bc0029"
undefined
# 拷贝test_sol_test.abi中的json
> var abi = [{"constant":true,"inputs":[{"name":"a","type":"uint256"}],"name":"multiply","outputs":[{"name":"d","type":"uint256"}],"payable":false,"stateMutability":"pure","type":"function"}]
undefined
#解锁账户1
> eth.getBalance(personal.listAccounts[1])
10000000000000000000
> personal.unlockAccount(personal.listAccounts[1])

Unlock account 0x9c9ab08b08713bf1402689de7a053a5204a5d174
Passphrase:
true
#预估gas消费量
> web3.eth.estimateGas({data:bin})
102751
#新建合约对象
> var myContract = eth.contract(abi);
undefined
#部署合约，gas值不要低于评估值
> var contract = myContract.new({from:personal.listAccounts[1],data:bin,gas:150000})
INFO [08-05|21:34:59.328] Submitted contract creation              fullhash=0x4244b17199b588c717c5847a9299f024e65a61ac60cdc33d94f910d0494cb19c contract=0x939eC7D882d3174A6590599804206eB684D36705
undefined

> contract
{
  abi: [{
      constant: true,
      inputs: [{...}],
      name: "multiply",
      outputs: [{...}],
      payable: false,
      stateMutability: "pure",
      type: "function"
  }],
  address: undefined,
  transactionHash: "0x4244b17199b588c717c5847a9299f024e65a61ac60cdc33d94f910d0494cb19c"
}
> txpool.status
{
  pending: 1,
  queued: 0
}
# 开始挖矿
> miner.start()
INFO [08-05|21:35:44.827] Transaction pool price threshold updated price=1
nuIlNlF
O>  [08-05|21:35:44.838] Starting mining operation
INFO [08-05|21:35:44.843] Commit new mining work                   number=3 txs=1 uncles=0 elapsed=0s
INFO [08-05|21:35:44.847] Successfully sealed new block            number=3 hash=5b46bb…f1197d
INFO [08-05|21:35:44.854] 🔨 mined potential block                  number=3 hash=5b46bb…f1197d
INFO [08-05|21:35:44.854] Commit new mining work                   number=4 txs=0 uncles=0 elapsed=0s
WARN [08-05|21:35:44.865] Block sealing failed                     err="waiting for transactions"
> miner.stop()
true
> txpool.status
{
  pending: 0,
  queued: 0
}
> contract
{
  abi: [{
      constant: true,
      inputs: [{...}],
      name: "multiply",
      outputs: [{...}],
      payable: false,
      stateMutability: "pure",
      type: "function"
  }],
  address: "0x939ec7d882d3174a6590599804206eb684d36705",
  transactionHash: "0x4244b17199b588c717c5847a9299f024e65a61ac60cdc33d94f910d0494cb19c",
  allEvents: function(),
  multiply: function()
}
> eth.getCode(contract.address)
"0x608060405260043610603f576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063c6888fa1146044575b600080fd5b348015604f57600080fd5b50606c600480360381019080803590602001909291905050506082565b6040518082815260200191505060405180910390f35b60006007820290509190505600a165627a7a7230582009dd925b52db2f972b61d39f9347a16c962b4b42896f44a51a82e640e49211bc0029"
# 测试合约方法
> contract.multiply(6)
42
>
```
## 7.4. 多节点部署
部署第二个节点
- 初始化genesis.json
```
geth --datadir data2 init genesis.json
```
- 启动节点
```
geth --datadir data2 --networkid 314590 --ipcdisable --port 61911 --rpcport 8101 --bootnodes "enode://2efbb4aac545b0c79dc486bc2af9cb19
d3e0b4a6a0df9d72abdb1b95fd792d74e98acc3181cf7b92bde7571fd98e011844805c9d3503faa15ea720d4d6771b94@10.72.6.145:61910" console
```
--bootndoes 是设置当前节点启动后,直接通过设置--bootndoes 的值来链接第一个节点, --bootnoedes 的值可以通过在第一个节点的命令行中,输入:admin.nodeInfo.enode命令打印出来.
也可以不设置 --bootnodes, 直接启动,启动后进入命令行, 通过命令admin.addPeer(enodeUrlOfFirst Instance)把它作为一个peer添加进来.
```
admin.addPeer("enode://a1e18dd40fbce856d84b8c6872d4158ab152812a081d1608643fd8a9c7d650ad161b5ef0b0a2a94357d2d6f3a044b380445f9033550233f8ded232eabd24e29a@ip_address:30303")
```
查看信息
```
> net.peerCount
1
> admin.peers
[{
    caps: ["eth/63"],
    id: "07fa266c6c5c22a878630faf5e036c791d4875ac5246e20585834073c28830622802fcb2bdf4c03515035a57b88a71dbe7c441563ae5aebc504468a0f2bd7f5d",
    name: "Geth/v1.8.13-stable-225171a4/windows-amd64/go1.10.3",
    network: {
      inbound: true,
      localAddress: "192.168.1.105:61910",
      remoteAddress: "10.72.6.145:63554",
      static: false,
      trusted: false
    },
    protocols: {
      eth: {
        difficulty: 9573858,
        head: "0x295b7421534163cbe7ba94c05b5aa3a4ac59747555f41ff59b73657ac8f9402e",
        version: 63
      }
    }
}]
```

# 8. 基于Parity搭建联盟链
+ 什么情况可以建立自己测试用的PoA chain？
  - 公司内网或无对外网络，无法同步区块
  - 降低测试是等待区块时间
  - 不想碰到testrpc各种雷
+ PoA chain特点有
  - 依靠预设好的Authority nodes，负责产生block。
  - 可依照需求设定Authority node数量
  - 可指定产生block时间，例如收到交易的5秒产生block。
  - 一般的以太坊节点亦可以连接到poa chain，正常发起transactions，contracts等。
## 8.1. Parity钱包下载安装
https://www.parity.io/ 下载安装地址
- 安装ubuntu的parity
下载parity_1.11.8_ubuntu_amd64.deb
```
dpkg -i parity_1.11.8_ubuntu_amd64.deb
```
## 8.2. 设置chain spec
PoA chain 需要设置一个创世区块
```
{
  "name": "DemoPoA",
  "engine": {
    "authorityRound": {
      "params": {
        "stepDuration": "5",
        "validators": {
          "list": [

          ]
        }
      }
    }
  },
  "params": {
    "gasLimitBoundDivisor": "0x0400",
    "maximumExtraDataSize": "0x20",
    "minGasLimit": "0x1388",
    "networkID": "0x2323"
  },
  "genesis": {
    "seal": {
      "authorityRound": {
        "step": "0x0",
        "signature": "0x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
      }
    },
    "difficulty": "0x20000",
    "gasLimit": "0x5B8D80"
  },
  "accounts": {
    "0x0000000000000000000000000000000000000001": {
      "balance": "1",
      "builtin": {
        "name": "ecrecover",
        "pricing": {
          "linear": {
            "base": 3000,
            "word": 0
          }
        }
      }
    },
    "0x0000000000000000000000000000000000000002": {
      "balance": "1",
      "builtin": {
        "name": "sha256",
        "pricing": {
          "linear": {
            "base": 60,
            "word": 12
          }
        }
      }
    },
    "0x0000000000000000000000000000000000000003": {
      "balance": "1",
      "builtin": {
        "name": "ripemd160",
        "pricing": {
          "linear": {
            "base": 600,
            "word": 120
          }
        }
      }
    },
    "0x0000000000000000000000000000000000000004": {
      "balance": "1",
      "builtin": {
        "name": "identity",
        "pricing": {
          "linear": {
            "base": 15,
            "word": 3
          }
        }
      }
    }
  }
}
```
stepDuration 设定成5秒产生一个区块。
validators 设定Authority的地方，目前先空著，后面创建account之后再回来填入。
将上面的文件保存到桌面的一个文件中，保存为demo-spec.json。

## 8.3. 设置两个节点

在我们这篇文章中，我们在同一台电脑设置两个节点，跟我们讲解以太坊私网建立 (2) – 同一台电脑／不同电脑运行多个节点时，如果在同一台电脑设置两个节点，需要将rpcport和port设置为不同的值，否则就会发生冲突，POA chain中也是一样，需要将一些参数设置为不同的值。

-d：指定存储资料与账号的目录
--port：指定Parity的network port，可用来让其他node连接
--jsonrpc-port：这是JSON RPC port，使用web3.js时会需要
ui-port：Parity提供的Web-based UI port
启动节点
```
parity --chain demo-spec.json -d parity0 --port 30300  --ui-port 8180  --jsonrpc-port 8540 --jsonrpc-apis web3,eth,net,personal,parity,parity_set,traces,rpc,parity_accounts
```
除了打一长串的指令外，Parity也提供更为简洁的config档案设定方式，使用 --config 即可引用配置文件。
```
node0 使用如下配置文件 node0.toml：
[parity]
chain = "demo-spec.json"
base_path = "parity0"
[network]
port = 30300
[rpc]
port = 8540
apis = ["web3", "eth", "net", "personal", "parity", "parity_set", "traces", "rpc", "parity_accounts"]
[ui]
port = 8180
[websockets]
port = 8456
```

node1 使用如下配置文件 node1.toml：

```conf
[parity]
chain = "demo-spec.json"
base_path = "parity1"
[network]
port = 30301
[rpc]
port = 8541
apis = ["web3", "eth", "net", "personal", "parity", "parity_set", "traces", "rpc", "parity_accounts"]
[ui]
port = 8181
[websockets]
port = 8457
```

后因parity浏览器已经从节点中剥离，无法进行用户生成，所以不再继续，详情参考见http://www.8btc.com/ethereum-parity 。

# 9. 玩转truffle、web3js

**truffle的安装详见第6章**

## 9.1. web3.js api的使用

- API 文档

http://web3js.readthedocs.io/en/1.0/index.html
https://ethereumbuilders.gitbooks.io

## 9.2. 编写truffle测试代码

在test目录下建立TestMath.sol

```solidity
pragma solidity ^0.4.4;
import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Math.sol";

contract TestMath {
  function testAMulBisRight() {
    Math meta = Math(DeployedAddresses.Math());
    Assert.equal(meta.mulAtoB(3,4),12, "3*4 should be 12");
  }
}
```

在写好之后在truffle开发工具中输入test

```
truffle(develop)> test
Using network 'develop'.

Compiling .\contracts\Math.sol...
Compiling .\test\TestMath.sol...
Compiling truffle/Assert.sol...
Compiling truffle/DeployedAddresses.sol...

/C/Users/ERYEER/Desktop/SmartContract/demo1/test/TestMath.sol:10:40: DeclarationError: Undeclared identifier.
    Assert.equal(meta.mulAtoB(3,4),12, expected, "3*4 should be 12");
                                       ^------^
Compilation failed. See above.
truffle(develop)> test
Using network 'develop'.

Compiling .\contracts\Math.sol...
Compiling .\test\TestMath.sol...
Compiling truffle/Assert.sol...
Compiling truffle/DeployedAddresses.sol...

Compilation warnings encountered:

/C/Users/ERYEER/Desktop/SmartContract/demo1/test/TestMath.sol:7:3: Warning: No visibility specified. Defaulting to "public".
  function testAMulBisRight() {
  ^ (Relevant source part starts here and spans across multiple lines).

  TestMath
    √ testAMulBisRight (77ms)

  1 passing (667ms)
```

## 9.3. truffle unbox 项目介绍

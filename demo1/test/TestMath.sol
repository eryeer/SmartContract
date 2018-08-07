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

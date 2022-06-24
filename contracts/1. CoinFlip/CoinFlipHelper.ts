import { expect } from "chai";
import { ethers } from "hardhat";

const helper = async (victim: any, attacker: any) => {
  // lets call it 10 times
  for(var i=0; i<10;i++) {
    await attacker.hackContract();
  }
};

export default helper;

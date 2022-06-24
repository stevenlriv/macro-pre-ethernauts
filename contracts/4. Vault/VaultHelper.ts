
import { ethers, waffle } from "hardhat";

const helper = async (victim: any) => {
  /* 
    Add code here that will help you pass the test
    Note: Unlock without using the string "A very strong password"
    Unlock the vault by somehow reading the private password from 
    Vault directly
  */
  const addr = victim.address;
  const provider = new ethers.providers.JsonRpcProvider("http://127.0.0.1:8545/");
  let Password = provider.getStorageAt(addr, 1);
  //let Password = ethers.utils.formatBytes32String("A very strong password");
  await victim.unlock(Password);
};

export default helper;

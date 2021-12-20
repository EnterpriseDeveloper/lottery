const HDWalletProvider = require('truffle-hdwallet-provider');
const Web3 = require('web3');
const { interface, bytecode } = require('./compile');

const provider = new HDWalletProvider(
    "claw shadow swallow rent filter develop charge local theory record friend code",
    "https://rinkeby.infura.io/v3/4ee0a30d186a46d398caebd668b0cd95"
);
const web3 = new Web3(provider);

const deploy = async () =>{
  const accounts = await web3.eth.getAccounts();

  console.log("Attempting to deploy from account", accounts[0]);

  const result = await new web3.eth.Contract(JSON.parse(interface))
  .deploy({ data: bytecode })
  .send({ from: accounts[0], gas: '1000000'});

  console.log(interface)
  console.log("Contract deploy to", result.options.address)
};

deploy();
pragma solidity 0.5.1;

int "can be minus"
uiny "can be only plus"

contract sendEther{
    mapping(address => uint256) public balances
    address payable wallet;

    event Purchase(
        address indexed _buyer,
        uint256 _amount
    );

    constructor(address payable _wallet) public {
        wallet = _wallet;
    }

    function() external payable {
        buyToken();
    }

    function buyToken() public payable {
        // buy token
        balances[msg.sender] += 1;
    
        // send ether to wallet
          wallet.transfer(msg.value);

        emit Purchase(msg.sender, 1)
    }
}

contract Timer{
   mapping(uint => Person) public people;

   uint256 public peopleCount = 0;

   uint256 openingTime = 1565794058;


   modifier onlyWhileOpen() {
        require(block.timestamp >= openingTime);
        _;

   }

   struct Person{
       uint _id
       string _firstName;
       string _lastName;
   }


   function addPerson(
       string memory _firstName, 
       string memory _lastName
    ) 
       public 
       onlyWhileOpen 
    {
       incrementCoint()
       people[peopleCount] = Person(peopleCount, _firstName, _lastName)
   } 

   function incrementCoint() internal {
        peopleCount += 1;
   }

}

contract DataStructure{

   mapping(uint => Person) public people;
   uint256 public peopleCount = 0;


   address owner;

   modifier onlyOwner() {
        require(msg.sender == owner);
        _;

   }

   struct Person{
       uint _id
       string _firstName;
       string _lastName;
   }
   
   constructor() public{
       owner = msg.sender;
   }

   function addPerson(
       string memory _firstName, 
       string memory _lastName
    ) 
       public 
       onlyOwner 
    {
       incrementCoint()
       people[peopleCount] = Person(peopleCount, _firstName, _lastName)
   } 

   function incrementCoint() internal {
        peopleCount += 1;
   }

}

contract DataStructure{

   Person[] public people;

   uint256 public peopleCount;

   struct Person{
       string _firstName;
       string _lastName;
   }
   function addPerson(string memory _firstName, string memory _lastName) public {
       peopleCount += 1;
       people.push(Person(_firstName, _lastName));
   } 

}


contract EnumExample{
// enum it's for get or set some state
// it's return always some number of position, from 0 to ...
// Waiting will return "1"

enum State {Active, Waiting, Ready}
State public state;

constructor() public{
    state = State.Waiting
}

function active() public{
    state = State.Active
}

function isActive() public view returns(bool){
      return state == State.Active
}
}

pragma solidity ^0.4.17;


contract Lottery{
    address public manager;
    address[] public players;
    
    function Lottery() public{
        manager = msg.sender;
    }
    
    function enter() public payable {
       require(msg.value > .01 ether);
      
       players.push(msg.sender);
    }
    
    function random() private view returns (uint) {
        return uint(keccak256(block.difficulty, now, players));
    }
    
    function pickWinner() public restricted {

        uint index = random() % players.length;
        players[index].transfer(this.balance);
        // transfer incide cane be value of 
        // transaction or this.balance it's 
        // mean all balance in smart comtract
        players = new address[](0);
        // new address[](0) incide [] 
        // you can paste how deep will
        // have array, () if 0 it's mean 
        // fully empty
    }
    
    //
   modifier restricted() {
        require(msg.sender == manager);
        _;
   }
   
   function getPlayers() public view returns (address[]){
       return players;
   }
}
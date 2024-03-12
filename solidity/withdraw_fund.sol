pragma solidity ^0.8.0;

contract windraw_fund {
    mapping(address => uint256) public balance;

    //fun to deposite  funds into contect
                        //payable is a modifier that is used to receve ether 
    function deposit() public payable {
        balance[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount)  public {
        //first we need to check whether the account have enough ether or not
        require(balance[msg.sender] >= amount,"Insufficient balance");
        require(address(this).balance >= amount, "Contract balance is insufficient");
    
        balance[msg.sender] = balance[msg.sender] - amount;
        payable(msg.sender).transfer(amount);
    }
}

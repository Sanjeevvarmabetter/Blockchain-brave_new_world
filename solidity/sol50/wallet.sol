//generally contracts store ether
// so we need a conytratc that can reciebe and store the ether


contract EtherWaller {
	
	address payable public  owner;
	
	constructor() {
		owner = payable(msg.sender);
	}
	
	
	receive() external payable {}

	function withdraw(uint256 _amount) external {
		require(msg.sender == owner,"caller is not owner");
		payable(msg.sender).trasfer(_amount);

}

	function getBalance() external view returns (uint256) {
		return address(this).balance;

}


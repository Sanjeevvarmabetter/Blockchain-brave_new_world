/* in the english auction the price of the item starts at low and increases as buyes bid for tit */


// the logic is min_price will change every time a msg.value gets updated


// we need to hold the new price for some time and then execute it


// the seller can only deloply this contra t


interface IERC721 {
	function safeTransferFrom(address from,address to,uint256 token_id) external;
	function transferFrom(address,address,uint256) external;

}

contract EnglishAuction {
	event start();
	event Bid(address indexed sender,uint256 amount);
	event withdraw(address indexed bidder,uint256 amount);
	event End(address winner,uint256 amount);

	IERC721 nft;
	uint256 public nftId;

	address payable public seller;
	uint256 endAt;
	bool started;
	bool ended;

	address public highestBidder;
	uint256 public highestBid;
	//we need to know who is bidding how much
	mapping(address => uint256) bids;

	constructor(address _nft,uint256 _nftId,uint256 _startingBid) {
		nft = IERC721(_nft);
		nftId = _nftId;

		seller = payable(msg.sender);
		highestBid = _startingBid;
	}


	function start() external {
	require(!started,"started");
	require(msg.sender == seller,"not seller");

	nft.transferFrom(msg.sender,address(this),nftId);
	started = true;
	endAt = block.timestamp  + 7 days;

	emit start();

	
	}

	function bid() external payable {
		require(started,"not startted");
		require(block.timestamp < endAt," auction completed");
		require(msg.value > highestBid ," not enough bid");
	

	// now add the bidders to the bidders mapping

	if(highestBidder != address(0)) {
	bids[highestBidder] += highestBid;
	}

	// now update the higherstbidder address and highestbid

	highestBidder = msg.sender;
	highestbid = msg.value;

	emit Bid(msg.sender,msg.value);
	}

	function withdraw() external {
		uint256 bal = bids[msg.sender];
		bids[msg.sender] = 0;
		payable(msg.sender).transfer(bal);

		emit withdraw(msg.sender,bal);
	}

	function end() external {
		require(started,"not started");
		require(block.timestamp >= endAt,"not ended");
		require(!ended,"ended");

		ended = true;
		
		if (highestBidder != address(0)) {
			nft.safeTransferFrom(address(this),highestBidder,nftId);
			seller.transfer(highestbid);
		}
		else {
			nft.safeTransferFrom(address(this),seller,nftId);
		}

		emit End(highestBidder, highestBid);
	}

}

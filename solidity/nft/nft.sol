// SPDX-License_Identifier: MIT

pragma solidity ^0.8.19;



contract nft is ERC721 {
	uint256 public tokencounter;


	event minted(address minter,uint256 price,uint256 nftid,string uri);


// minting

	function mint(string tokenURI,address minterAddress,uint256 price) {
		require(price>0,"the price has to be greater than 0");

		tokencounter++;

		uint256 tokenid = tokencounter;


		_safeMint(minterAddress,tokenid);
		_setTokenURI(tokenid,tokenURI);

		emit minted(minterAddress,price,tokenid,tokenURI);


		return tokenid;


	}
}

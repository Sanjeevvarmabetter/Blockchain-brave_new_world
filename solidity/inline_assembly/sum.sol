// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract sumofarray {
    function sumSolidity(uint[] memory  data)  public pure returns (uint sum) {
	for(uint i=0;i<data.length;i++) {
		sum = sum + data[i];
	}	
	
   }


   //now we will rewrite this in asm

   function asmsum(uint[] memory  data) public pure returns (uint sum) {
	
	for(uint i=0;i<data.length;i++) {

	  assembly {
		// sum = sum + data[i]

		sum := add(sum, mload(add(add(data,0x20), mul(i,0x20))))


	  }
   
   }

   }


   function pureasm(uint[] memory  data) public pure returns (uint sum) {
	   assembly {
	  	
		   // we need to find the length of data

		   let len:= mload(data)
			
		   let dataelementlocation := add(data,0x20)

		   for 
			   { let end := add(dataelementlocation,mul(len,0x20)) }
		   	lt(dataelementlocation,end)
			{ dataelementlocation := add(dataelementlocation,0x20) }
			
			{
			
				sum := add(sum,mload(dataelementlocation))
				
			}


		   	
	   }


}
}


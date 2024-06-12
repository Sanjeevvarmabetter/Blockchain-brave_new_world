// Registration: Users can register their identity by submitting their 
// address and a hash of their identity information.

// Proof of Identity: Users can prove their identity by submitting a 
// message signed with their private key.



// user need to submit their address and hash
// a digital sig(with private key)



contract decentralizedIdentity {
    struct Identity {
    address userAddress;
    bytes32 identityhash;
    bool isRegistered;
}


    mapping(address => Identity) private identities;

    event identityRegistered(address user,bytes32 identityHash);
    event identityVerified(address  user);


    modifier  onlyRegistered(address user) {
        require(identities[user].isRegistered,"User not registerd");
        _;
    }   


    function registerIdentities(bytes32 identityHash) external {
        
        // the user should not be registerd

        require(!identities[msg.sender].isRegistered,"User is alredy registerd");

        identities[msg.sender] = Identity({
            userAddress: msg.sender,
            identityhash:identityHash,
            isRegistered: true
        });

        emit identityRegistered(msg.sender,identityHash);

    }


    function verifyIdentity(string memory message, uint8 v,bytes32 r,bytes32 s) external  onlyRegistered(msg.sender) returns (bool) {
        // we will generate the hash
        //then we will compare the hashs
        // signers


        // ecrecover : inbuit cryptograpic meethod that enables the retrival of signers addreess using thier private key
// https://ethereum.stackexchange.com/questions/49261/how-to-use-ecrecover-and-what-it-is
         
   
    
    bytes32 hash = keccak256(abi.encodePacked(message));
    address signer = ecrecover(hash,v,r,s);
    require(signer == msg.sender,"invalid signature");

    emit identityVerified(msg.sender);
    return true;

 } 





    // for external verification
    function getIdentity(address user) external view returns (address,bytes32,bool) {
        Identity memory identity = identities[user];

        return (identity.userAddress,identity.identityhash,identity.isRegistered);
    }
    


}
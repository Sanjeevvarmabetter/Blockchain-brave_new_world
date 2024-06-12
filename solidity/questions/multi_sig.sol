// Write a Solidity function to implement a multi-signature wallet, where funds can be released only with the approval of multiple addresses.


// my logic

//  if count < numberofsig - conform is false;
//  if count > numberofsig - conform is true

contract multisignature {
    address public owner;
    uint256 private transactionId;

    uint256[] public pendingTransactions;

    mapping(address => bool) owners;
    mapping(address => uint256) funds;

    struct transaction {
        address from;
        address to;
        uint256 amount;
        bool isConform;
        uint256 sigcount;
        uint256 reqSignatures;

    }

    mapping(uint256 => mapping(address => bool)) signature;
    mapping(uint256 => transaction) public transactions;

    // events

    event DepositFunds(address from,uint256 amount);
    event withdrawFunds(address from ,uint256 amount);
    event transactionCreated(address from, address to, uint256 amount);
    event transactionSigned(address by,uint256 transactionId);
    event transactionCompleted(address from,address to,uint256 amount,uint256 transactionId);
    

    constructor() {
        owner = msg.sender;
    }

    modifier isOwner() {
        require(msg.sender == owner,"bro you cant access");
        _;
    }

    modifier validOwner() {
        require(msg.sender == owner || owners[msg.sender] == true,"You are not owner");
        _;
    }

    // addonwer
    // remove owner
    //deposirte
    // create transaction
    // pending transactions

    //sign the transactions
    // release payment
    // delete transaction
    

    function addOwner(address _owner) public isOwner {
        owners[_owner] = true;
    }

    function removeOwner(address _owner) public isOwner {
        owners[_owner] = false;
    }

    recieve() external payable {
        funds[msg.sender] = funds[msg.sender] + msg.value;

    emit DepositFunds(msg.sender,msg.value);
        
    }

    function TransferTo(address _to,uint256 _amount,uint256 _signatureRequired) public validOwner {
        require(funds[msg.sender] >= _amount, "Not enough balance");

        transactions[transactionId] = transaction(
            {
                from:msg.sender,
                to: _to,
                amount: _amount,
                isConform:false,
                sigcount:0,
                reqSignatures: _signatureRequired
            }
        );
    
    pendingTransactions.push(transactionId);

    emit transactionCreated(msg.sender,_to,_amount);

    
    }

    
    function getPendingtransations() public view validOwner returns (uint256[] memory) {
        return pendingTransactions;
    }


    function signTransaction(uint256 _tranactionId) public validOwner {

    
        transaction storage transac = transactions[_tranactionId];
        
         

    if(transaction.sigcount >= transaction.reqSignatures) {
        //transfer
        payable(transaction.to).transfer(transaction.amount);

        transactions[_tranactionId].isConform = true;

        funds[transaction.form] = 0;

        emit transactionCompleted(
            transaction.from,
            transaction.to,
            transaction.amount,
            _tranactionId
        );

        deleteTransaction(_transactionid);

    }

    }
    
    function deleteTransaction(uint256 _tranactionId) private validOwner {
        require(transactions[_tranactionId].isConform,"Transaction must exist");
    };


    delete pendingTransactions[_tranactionId];

    delete transactions[_tranactionId]


}



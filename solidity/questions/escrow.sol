// simply escrow (an arbiter ) will hold the asset until b recieves the (car)


// this solved the trust and prevents discrepancy



// in this we will be using enums

contract escrow {
    
    address public seller;
    address public buyer;
    address public arbiter;
    


    enum State {
    
     await_payment,await_delivery,complete
    }

    State public state;

    modifier instate(State expected_state) {
        require(state == expected_state);
        _;
    }

    modifier onlyBuyer() {
        require(msg.sender == buyer || msg.sender == arbiter);
        _;
    }

    modifier onlySeller() { 
        require(msg.sender == seller);
        _;
    }


    constructor(address payable _buyer,address payable _seller) {
        // now arbiter will consume the payment

        arbiter = payable(msg.sender);
        buyer = _buyer;
        seller = _seller;
        state = State.await_payment;
    
    }



    // conform payment

    function confirm_payment() onlyBuyer instate(State.await_payment) public payable {
        state = State.await_delivery;
    }


    // conform delivery

    function confirm_delivery() onlyBuyer instate(State.await_delivery) public {
        seller.transfer(address(this).balance);
        state = State.complete;
    }

    function ReturnPayment() onlySeller instate(State.await_delivery) public {
        buyer.transfer(address(this).balance);
    }



}
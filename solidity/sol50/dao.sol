//DAO membership refers to the process and criteria by which individuals participate in a Decentralized Autonomous Organization (DAO), 
//enabling them to contribute to governance, decision-making, and operations


/// membership token
// so i am deploying an erc-20 token as a membership token

// now members can crearte proporsals  and voting will begin

// voting period ends after specific time

// constrains : only token holders can vote


//SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DAOMembership is ERC20 {
    struct Proposal {
        uint256 id;
        address proporser;
        string description;
        uint256 voteEnd;
        uint256 yesVotes;
        uint256 NoVotes;
        bool executed;
    }
    
    uint256 public proposalCount;
    uint256 public constant VOTING_PERIOD = 3 days;
    
    // quorum percentage => the amount of percentage votes required to pass a proposal

    uint256 public constant QUORUM_PERCENTAGE = 50; // 50% of total supply

    mapping(uint256 => Proposal) public proposals;
    // useraddress -> proposalId -> has voted or not
    mapping(address => mapping(uint256 => bool)) public hasVoted;

    // now we  need to have event to emit when a proposal is created
    event ProposalCreated(uint256 id, address proposer, string description);

    event Voted(uint256 proposalId, address voter, bool support);
    event ProposalExecuted(uint256 proposalId);


    constructor() ERC20("DAOMembership", "DAO") {
        // mint some tokens to the deployer
        _mint(msg.sender, 1000 * 10 ** decimals()); // no of tokens = 1000  
    }

    modifier onlyMember() {
        require(balanceOf(msg.sender) > 0, "Only members can call this function");
        _;
    }
    
    function createProposal(string memory _description) external onlyMember {
        proposalCount++;
        proposals[proposalCount] = Proposal({
            id: proposalCount,
            proporser:msg.sender,
            description: _description,
            voteEnd: block.timestamp + VOTING_PERIOD,
            yesVotes: 0,
            noVotes: 0,
            executed: false
        });

        emit ProposalCreated(proposalCount, msg.sender, _description);

    }

    function vote(uint256 _proposalId,bool _support) external onlyMember   {
        Proposal storage proposal = proposals[_proposalId];
        reqire(block.timestamp < proposal.voteEnd, "Voting period has ended");
require(!hasVoted[msg.sender][_proposalId], "You have already voted on this proposal");
        // hasVoted[msg.sender][_proposalId] = true;
    hasVoted[msg.sender][proposalId] = true;

    emit Voted(_proposalId, msg.sender, _support);



    }

    function executeProposal(uint256 _proposalId) external {
        Proposal storage proposal = proposals[_proposalId];
        require(block.timestamp > proposal.voteEnd, "Voting period has not ended");
        require(!proposal.executed, "Proposal has already");
        uint256 totalVotes = proposal.yesVotes + proposal.noVotes;
        uint256 quorum = (totalSupply() * QUORUM_PERCENTAGE) / 100; 

        require(totalVotes >= quorum, "Quorum not reached");        
        if(proposal.yesVotes > proposal.noVotes) {
            // execute the proposal
            // add your logic here
            proposal.executed = true;
            emit ProposalExecuted(_proposalId);
        }
    }   




}
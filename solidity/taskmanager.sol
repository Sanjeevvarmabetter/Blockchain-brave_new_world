// we are going to build a task manager contract


// id 

// descriptiion ->> limited to few char

// bool  ->> completed/not completed

pragma solidity ^0.8.20;


contract Todo {
    uint public tsk_count = 0;


    struct task {
        uint id;
        string des;
        bool status;
    }
    

    //mapping of tasks

    mapping(uint => task) public t;

    event taskcreated(uint id,string des,bool status);

    event taskcompleted(uint id,bool status);


    constructor() {

    }


    function createTask(string memory _description) public {
        tsk_count++;
        //create an array
        
        t[tsk_count] = task(tsk_count,_description,false);
        emit taskcreated(tsk_count,_description,false);

    }

    function marktaskcompleted(uint _id) public {
        task memory _task = t[_id];
        _task.status = !_task.status;
        t[_id] = _task;
    
        emit taskcompleted(_id,_task.status);
    }



}
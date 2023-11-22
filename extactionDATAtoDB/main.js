const MongoClient = require('mongodb');
const Web3 = require('web3');

//this is all mongodb connection setup
const mongoClient = new MongoClient('mongodb://localhost:27017', { useNewUrlParser: true, useUnifiedTopology: true})

const db = mongoClient.db('blockchain_data');
const blocksCollection = db.collection('blocks');

//now we need to initialize connection to the eth blockchain


const web3 = new Web3('http://localhost:8545');

async function extractBlockData(blocknumber) {
	const block = await web3.eth.getBlock(blocknumber);

	//we need block height timestamp and hash

	const blockheight = block.number;
	const blockTimestamp = block.timestamp;
	const blockHash = block.hash;

	//now we need to insert the data into mongodb
	

	const blockdata = {
		blockheight = blockheight,
		blockTimestamp = blockTimestamp;
		blockHash = blockHash;
	};

	//now insert the data in to mongodb
	
	await blocksCollection.insertOne(blockData);

	console.log(`Data for block ${blockHeight} inserted into mongodb`);

}

//extraction and storing
//
(async () => {
	try {
		await mongoClient.connect();

		for (let blockNumber = 0;blockNumber < 10; blockNumber++) {
			await extractBlockData(blockNumber);
		} catch (error)  {
			console.log('Error extracting or storing blockchain data: ', error);
		} finally {
			await mongoClient.close();
})();

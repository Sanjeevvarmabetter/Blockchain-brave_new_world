/*a merkle tree consists of a top hash(node) 
and the child hashes start from 0 1
*/


    //         tophash
    //         |           |
    //     hash 0          hash 1
    // |          |           
    // hash 0-0    hash 0-1

/*
this consists of leaves,branch nodes, root node, hashing algorithm
*/

//                    Root Hash
//                    /       \
//           Branch Hash1    Branch Hash2
//           /      \          /      \
//    Leaf1 Hash  Leaf2 Hash  Leaf3 Hash  Leaf4 Hash

#include<iostream>
#include<vector>
#include<string>
#include<algorithm>
#include<functionl>
#include<openssl/sh.h>

using namespace std;
//function to build sha256 algorithm

string sha256(const string &input) {
    unsigned char hash[SHA256_DIGEST_LENGTH];
    SHA256_CTX sha256;
    SHA256_Init(&sha256);
    SHA256_Update(&sha256, input.c_str(),input.size());
    SHA256_Final(hash, &sha256);

    char hash_hex[2 * SHA256_DIGEST_LENGTH + 1];
    for(int i=0;i<SHA256_DIGEST_LENGTH;i++) {
        sprintf(hash_hex + 2 * i, "%02x", hash[i]);
    }
    return hash_hex;

}

vector<string> buildmerkletree(vector<string> &transactions) {
    vector<string> tree = transaction;

    while (tree.size() > 1) {
        if (tree.size() % 2 != 0) {
            tree.push_back(tree.back());
        }

        for(size_t i = 0;i< tree.size(); i+=2) {
            string combined = tree[i] + tree[i+1];
            intermediate_tree.push_back(sha256(combined));
        }
        tree = intermediate_tree;
    }
    return tree;
}

int main() {
    vector<string> transaction = {
        "Txn1",
        "Txn2",
        "Txn3",
        "Txn4"
    };

    vector<string> merkleRoot = buildMerkleTree(transaction);
    string transactionToValidate = "Txn3";

    if(merkleRoot[0] == sha256(transactionToValidate)) {
        cout << "transaction " << transactionToValidate << " is valid" << endl;
    }
    else {
        cout << "Transaction " << transactionToValidate << " is not valid " << endl;
    }
    return 0;
}

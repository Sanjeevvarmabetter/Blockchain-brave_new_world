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


#include <iostream>
#include <vector>
#include <iomanip>
#include <sstream>
#include <openssl/sha.h>

using namespace std;

// Function to compute SHA-256 hash
string sha256(const string &input) {
    unsigned char hash[SHA256_DIGEST_LENGTH];
    SHA256_CTX sha256;
    SHA256_Init(&sha256);
    SHA256_Update(&sha256, input.c_str(), input.size());
    SHA256_Final(hash, &sha256);

    stringstream ss;
    for (int i = 0; i < SHA256_DIGEST_LENGTH; i++) {
        ss << hex << setw(2) << setfill('0') << (int)hash[i];
    }
    return ss.str();
}

// Function to build the Merkle Tree
string buildMerkleTree(vector<string> &transactions) {
    vector<string> tree = transactions;
    vector<string> intermediate_tree;
    
    // Build the tree
    while (tree.size() > 1) {
        intermediate_tree.clear();
        for (size_t i = 0; i < tree.size(); i += 2) {
            string left = tree[i];
            string right = (i + 1 < tree.size()) ? tree[i + 1] : tree[i];
            string combined = left + right;
            intermediate_tree.push_back(sha256(combined));
        }
        tree = intermediate_tree;
    }
    
    // The last remaining element in 'tree' is the Merkle Root
    return tree.empty() ? "" : tree[0];
}

int main() {
    vector<string> transactions = {
        "Txn1",
        "Txn2",
        "Txn3",
        "Txn4"
    };

    // Compute the Merkle Root
    string merkleRoot = buildMerkleTree(transactions);

    cout << "Merkle Root: " << merkleRoot << endl;

    return 0;
}

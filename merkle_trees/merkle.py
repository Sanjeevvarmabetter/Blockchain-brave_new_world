import hashlib

def sha256(data):
    """Compute SHA-256 hash of the input data."""
    return hashlib.sha256(data.encode()).hexdigest()

def build_merkle_tree(transactions):
    """Build Merkle Tree and return the Merkle Root."""
    tree = transactions
    while len(tree) > 1:
        intermediate_tree = []
        for i in range(0, len(tree), 2):
            left = tree[i]
            right = tree[i + 1] if i + 1 < len(tree) else left
            combined = left + right
            intermediate_tree.append(sha256(combined))
        tree = intermediate_tree
    
    return tree[0] if tree else ""

def main():
    transactions = [
        "Txn1",
        "Txn2",
        "Txn3",
        "Txn4"
    ]

    merkle_root = build_merkle_tree(transactions)
    print("Merkle Root:", merkle_root)

if __name__ == "__main__":
    main()

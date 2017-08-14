pragma solidity ^0.4.4;


// Proof Of Existence contract, version 2
contract ProofOfExistence2 {
    bytes32[] private proofs;

    /**
     * Store a POE in the contract state.
     */
    function storeProof(bytes32 proof) {
        proofs.push(proof);
    }

    /**
     * Calculate and store the POE for a document.
     */
    function notarize(string document) {
        storeProof(calculateProof(document));
    }

    /**
     * Get document's SHA256.
     */
    function calculateProof(string document) constant returns (bytes32) {
        return sha256(document);
    }

    /**
     * Check if a document has been notarized.
     */
    function checkDocument(string document) constant returns (bool) {
        return hasProof(calculateProof(document));
    }

    /**
     * Returns `true` if proof is stored.
     */
    function hasProof(bytes32 proof) constant returns (bool) {
        for (uint256 i = 0; i < proofs.length; i++) {
            if (proofs[i] == proof) {
                return true;
            }
        }
        return false;
    }
}
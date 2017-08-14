pragma solidity ^0.4.4;


// Proof Of Existence contract, version 4
contract ProofOfExistence3 {
    mapping (bytes32 => bool) private proofs;

    /**
     * Store a POE in contract state.
     */
    function storeProof(bytes32 proof) {
        proofs[proof] = true;
    }

    /**
     * Calculate and store proof for a document.
     */
    function notarize(string document) {
        storeProof(calculateProof(document));
    }

    /**
     * Get a document's SHA256.
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
     * Return `true` if proof is stored.
     */
    function hasProof(bytes32 proof) constant returns (bool) {
        return proofs[proof];
    }
}
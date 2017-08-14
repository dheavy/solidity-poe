pragma solidity ^0.4.4;


/**
 * Proof Of Existence contract, version 1
 */
contract ProofOfExistence1 {
    // State.
    bytes32 public proof;

    /**
     * Calculate and store the proof for a document.
     * Transactional function (consumes gas).
     */
    function notarize(string document) {
        proof = calculateProof(document);
    }

    /**
     * Helper function to get a document's SHA256.
     * Read-only function (does NOT consume gas).
     */
    function calculateProof(string document) constant returns (bytes32) {
        return sha256(document);
    }
}

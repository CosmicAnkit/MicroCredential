// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


contract MicroCredential {
    struct Credential {
        string name;
        string description;
        address issuer;
        address owner;
    }

    mapping(uint256 => Credential) public credentials;
    uint256 public credentialCount;

    function issueCredential(string memory _name, string memory _description) public {
        credentialCount++;
        credentials[credentialCount] = Credential(_name, _description, msg.sender, msg.sender);
    }

    function transferCredential(uint256 _id, address _to) public {
        require(credentials[_id].owner == msg.sender, "You do not own this credential");
        credentials[_id].owner = _to;
    }

    function verifyCredential(uint256 _id) public view returns (bool) {
        return credentials[_id].owner != address(0);
    }
}
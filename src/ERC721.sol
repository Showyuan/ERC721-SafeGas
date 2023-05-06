// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC721} from "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {ERC721A} from "ERC721A/ERC721A.sol";
import {ERC721Enumerable} from "openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract ERC721Mock is ERC721Enumerable {
    constructor(string memory name, string memory symbol) ERC721(name, symbol) {}

    function totalMinted() public view returns (uint256) {
        return totalSupply();
    }

    function safeMint(address to, uint256 tokenId) public {
        _safeMint(to, tokenId, "");
    }

    function transfer(address to, uint256 tokenId) public {
        _safeTransfer(msg.sender, to, tokenId, '');
    }

    function approveTo(address to, uint256 tokenId) public {
        _approve(to, tokenId);
    }
}

contract ERC721AMock is ERC721A {
    constructor(string memory name_, string memory symbol_) ERC721A(name_, symbol_) {}

    function totalMinted() public view returns (uint256) {
        return _totalMinted();
    }

    function safeMint(address to, uint256 quantity) public {
        _safeMint(to, quantity);
    }

    function transfer(address to, uint256 tokenId) public {
        safeTransferFrom(msg.sender, to, tokenId, '');
    }

    function approveTo(address to, uint256 tokenId) public{
        approve(to, tokenId);
    }
}

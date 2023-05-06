// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "../src/ERC721.sol";
import "forge-std/Test.sol";

contract ERC721Test is Test {
    ERC721Mock public erc721;
    ERC721AMock public erc721a;

    address user1 = makeAddr('user1');
    address user2 = makeAddr('user2');


    function setUp() public {
        erc721 = new ERC721Mock("ERC721T","ERC721T");
        erc721a = new ERC721AMock("ERC721AT","ERC721AT");
    }

    function test_mint_gas_ERC721() public {
        vm.startPrank(user1);
        for(uint i = 0; i < 10; i++){
            erc721.safeMint(address(user1), i);
        }
        vm.stopPrank();
    }

    function test_mint_gas_ERC721A() public {
        vm.startPrank(user1);
        erc721a.safeMint(address(user1), 10);
        vm.stopPrank();
    }

    function test_transfer_gas_ERC721() public {
        vm.startPrank(user1);
        for(uint i = 0; i < 5; i++){
            erc721.safeMint(address(user1), i);
        }
        erc721.transfer(address(user2), 4);
        vm.stopPrank();
    }

    function test_transfer_gas_ERC721A() public {
        vm.startPrank(user1);
        erc721a.safeMint(address(user1), 5);
        erc721a.transfer(address(user2), 4);
        vm.stopPrank();
    }

    function test_approve_ERC721() public {
        vm.startPrank(user1);
        for(uint i = 0; i < 5; i++){
            erc721.safeMint(address(user1), i);
        }
        erc721.approveTo(address(user2), 4);
        vm.stopPrank();
    }

    function test_approve_ERC721A() public {
        vm.startPrank(user1);
        erc721a.safeMint(address(user1), 5);
        erc721a.approveTo(address(user2), 4);
        vm.stopPrank();
    }

    function test_totalMinted_ERC721() public {
        vm.startPrank(user1);
        for(uint i = 0; i < 5; i++){
            erc721.safeMint(address(user1), i);
        }
        erc721.totalMinted();
        vm.stopPrank();
    }

    function test_totalMinted_ERC721A() public {
        vm.startPrank(user1);
        erc721a.safeMint(address(user1), 5);
        erc721a.totalMinted();
        vm.stopPrank();
    }

}
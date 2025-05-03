pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/Base64.sol";

contract PoetryNFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _ids;

    constructor() ERC721("PoetryNFT", "POEM") {}

    function publish(string memory poem) external returns (uint256) {
        _ids.increment();
        uint256 id = _ids.current();
        _mint(msg.sender, id);

        string memory json = string(
            abi.encodePacked(
                '{"name":"On-chain Poem #',
                Strings.toString(id),
                '","description":"A poem stored fully on Ethereum",',
                '"poem":"', poem, '"}'
            )
        );
        string memory uri = string(
            abi.encodePacked("data:application/json;base64,", Base64.encode(bytes(json)))
        );
        _setTokenURI(id, uri);
        return id;
    }
}

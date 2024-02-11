//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StorePeople {
    uint256 public favoriteNum;

    struct People{
        uint256 favoriteNum;
        string name;
    }

    People[] public people;

    mapping(string => uint256) public nameToFavoriteNum;

    function store(uint256 _favoriteNum) public {
        favoriteNum = _favoriteNum;
    }

    function retrieve() public view returns(uint256){
        return favoriteNum;
    }

    function addPerson(string memory _name, uint256 _favoriteNum) public {
        // People memory newPerson = People({favoriteNum: _favoriteNum, name:_name}); // We can do this way as well
        People memory newPerson = People(_favoriteNum, _name); // this also we can do
        people.push(newPerson);
        // people.push(People(_favoriteNum, _name));
        nameToFavoriteNum[_name] = _favoriteNum;
    }
}
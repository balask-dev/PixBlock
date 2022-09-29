// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

      
  uint256 constant TOTAL_IMAGES = 50;
 contract Images{
    
    address public owner = msg.sender;

  struct Image{
    address owner;
    uint256 cost;
 }  

 Image[TOTAL_IMAGES] public images;

  constructor(){
    for(uint256 i=0; i < TOTAL_IMAGES;i++){
       images[i].cost = 1e17;
       images[i].owner = address(0x0);
    }
}
   function buyer(uint256 _index) external payable{
        require(_index < TOTAL_IMAGES && _index>=0);
        require(images[_index].owner == address(0x0));
        require(msg.value >= images[_index].cost);
        images[_index].owner = msg.sender;
     }
}
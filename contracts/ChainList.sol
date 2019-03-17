pragma solidity >=0.4.21 <0.6.0;

contract ChainList{
  address seller;
  address buyer;
  string name;
  string description;
  uint256 price;

// events
event LogSellArticle(
  address indexed _seller,
  string _name,
  uint256 _price
  );

event LogBuyArticle(
 address indexed _seller,
 address indexed _buyer,
 string _name,
 uint256 _price

  );


  function sellArticle(string _name,string _description,uint256 _price) public {
    seller = msg.sender;
    name = _name;
    description = _description;
    price = _price;
    emit LogSellArticle(seller, name, price);
  }
function getArticle() public view returns (address _seller , address _buyer,string  _name, string _description,uint256 _price)
{
  return(seller,buyer,name,description,price);
}
function buyArticle() payable public{
  //article is on sell or not
 require(seller != 0X0);

  //article is not been sold yet
 require(buyer == 0X0);

    //we don't allow seller to buy own buyArticle
 require(msg.sender != seller);
 //we check value to the price of an article
 require(msg.value == price);
 //keep the buyer information
 buyer = msg.sender;
 //the buyer can pay the _seller
 seller.transfer(msg.value);
 //trigger the events
emit LogBuyArticle(seller,buyer,name,price);


}
}

//load contract
var ChainList = artifacts.require("./ChainList.sol");

contract("ChainList",function(accounts){
  var chainListInstance;
  var seller = accounts[1];
  var buyer = accounts[2];
  var articleName ="article 1";
  var articleDescripion = "description of the article";
  var articlePrice = 10;
  // no articale for sale buyerBalanceAfterBuy

  it("should throw an exeption if you buy an article  when there is no article for sale",function() {
    return ChainList.deployed().then(function(instance){
      chaiListInstance = instance;
      return chainListInstance.buyArticle({
        from: buyer,
        value: web3.toWei(articlePrice,"ether")
      });

    }).then(assert.fail)
    .catch(function(error){
      assert(true);
    }).then(function(){
      return chaiListInstance.getArticle();
    }).then(function(data){
      console.log("data[3]=",data[3]);
      assert.equal(data[0],0x0,"seller must be empty");
      assert.equal(data[1],0x0,"buyer must be empty");
      assert.equal(data[2],"","article name should be empty");
      assert.equal(data[3],"","article description should be empty");
      assert.equal(data[4].toNumber(),0,"article price should be zero");
    });

  })


});

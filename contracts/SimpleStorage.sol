pragma solidity ^0.4.18;

contract SimpleStorage {
  
  struct Player
  {
    uint[] cards;
    uint cardsValue;
    bool Busted;
    bool BlackJack;
    bool InGame;
    bool Stand;
  }
  struct GameEntity
  {
    uint[] dealercards;
    uint dealercardsValue;
    mapping (uint => bool) usedCards;
    bool dealerBusted;
    bool dealerBlackJack;
    bool Inprocess;
      
  }
  
  mapping(address => Player) public players;
  mapping(address => GameEntity) public games;
  mapping(address => address[]) public addrPlayers;
  address public Dealer;
  
  uint numberOfplayers;
  uint numberOfstands;
  uint nonce;
  
  constructor() public
  {
    Dealer = msg.sender;
    address[] storage addrList = addrPlayers[Dealer];
    GameEntity storage gameInstance = games[Dealer];
    games[Dealer].Inprocess = false;
    games[Dealer].dealerBusted = false;
    games[Dealer].dealerBlackJack = false;
    
  }


  function placeBets() payable public returns(uint)
  {
      GameEntity storage gameInstance = games[Dealer];
       //requre(Dealer != msg.sender)
      require(!gameInstance.Inprocess);
      //add player to the playerList
     
      address[] storage addrList = addrPlayers[Dealer];
      addrList.push(msg.sender);

      Player storage currentPlayer = players[msg.sender];
      require(!currentPlayer.InGame);

      currentPlayer.InGame = true;
      currentPlayer.Stand = false;
      currentPlayer.Busted = false;
      currentPlayer.BlackJack = false;
      
      numberOfplayers++;
      return numberOfplayers;
  }
  
  function startGame() payable public returns(uint, uint)
  {
    //require( msg.sender == Dealer, "Only Dlear start Game.");
    GameEntity storage gameInstance = games[Dealer];
    
    require(!gameInstance.Inprocess);
    require(addrPlayers[Dealer].length > 0);
    gameInstance.Inprocess = true;

    address[] storage addrList = addrPlayers[Dealer];

    for (uint i = 1; i < 53; i++)//Shuffling
    {
        gameInstance.usedCards[i] = false;
    }
    //deal card to player
    for(uint j = 0; j < addrPlayers[Dealer].length; j++)
    {
        players[addrList[j]].cards.push(dealCard(randomNumber(52)));
        players[addrList[j]].cards.push(dealCard(randomNumber(52)));
        players[addrList[j]].cardsValue = sumScore(players[addrList[j]].cards, 21);
        if(players[addrList[j]].cardsValue == 21)
        {
             players[addrList[j]].BlackJack = true;
        }
    }
    
    //deal card to dealer
    gameInstance.dealercards.push(dealCard(randomNumber(52)));
    gameInstance.dealercards.push(dealCard(randomNumber(52)));
    gameInstance.dealercardsValue = sumScore(gameInstance.dealercards, 21);
    if(gameInstance.dealercardsValue == 21)
    {
        gameInstance.dealerBlackJack = true;
    }
    
    return (players[addrList[0]].cardsValue, gameInstance.dealercardsValue);
    
  }

  function reset() payable public returns(bool
  )
  {
    //require( msg.sender == Dealer, "Only Dlear start Game.");
    GameEntity storage gameInstance = games[Dealer];
    
    gameInstance.Inprocess = false;

    address[] storage addrList = addrPlayers[Dealer];

    for (uint i = 1; i < 53; i++)//Shuffling
    {
        gameInstance.usedCards[i] = false;
    }
    //deal card to player
    for(uint j = 0; j < numberOfplayers; j++)
    {
        if(players[addrList[j]].cardsValue == 21)
        {
             players[addrList[j]].BlackJack = false;
        }
        delete players[addrList[j]];
        numberOfplayers--;

    }
    
    //deal card to dealer
    if(gameInstance.dealercardsValue == 21)
    {
        gameInstance.dealerBlackJack = false;
    }
    delete gameInstance.dealercards;
    delete gameInstance.dealercardsValue;
    delete gameInstance.dealerBusted;
    delete addrPlayers[Dealer];
    

    gameInstance.dealercardsValue = 0;

    
    return gameInstance.Inprocess;
    
  }
  
  function dealCard(uint IndexCard) internal returns (uint)
  {
    GameEntity storage gameInstance = games[Dealer];
        // indexcard : [1-52] the index of the deck
        if(gameInstance.usedCards[IndexCard])
        {
            if(IndexCard >= 52)
            {
                IndexCard = 0;
            }
            
            IndexCard = IndexCard + 1;

            return dealCard(IndexCard);
        }
        gameInstance.usedCards[IndexCard] = true;
        return uint(IndexCard);
  }

  function hit() public returns(uint, uint[])
  {
      //GameEntity storage gameInstance = games[Dealer];
      require(!players[msg.sender].Stand && !players[msg.sender].Busted && !players[msg.sender].BlackJack);
      players[msg.sender].cards.push(dealCard(randomNumber(52)));//deal a card and store in sender's hands
      players[msg.sender].cardsValue = sumScore(players[msg.sender].cards, 21);// recored the totalScore of player

      address[] storage addrList = addrPlayers[Dealer];

      if(players[msg.sender].cardsValue >= 21)
      {
          if(players[msg.sender].cardsValue == 21)
          {
            players[msg.sender].BlackJack = true;
          }
          else
          {
            players[msg.sender].Busted = true;
          }
          
      }

      for(uint i = 0; i < addrList.length; i++)
      {
          if(!(players[addrList[i]].Stand || players[addrList[i]].Busted))
          {
            return;
          }
      }
      {
          DealerPlay();
      }
      
      return (players[msg.sender].cardsValue, players[msg.sender].cards);
      
  }

  function stand() public 
  {
      players[msg.sender].Stand = true;
      numberOfstands++;
      
      address[] storage addrList = addrPlayers[Dealer];

      for(uint i = 0; i < addrList.length; i++)
      {
          if(!(players[addrList[i]].Stand || players[addrList[i]].Busted))
          {
            return;
          }
      }
      {
          DealerPlay();
      }
  }

  function getCardofPlayerHands(address addrPlayer) public view returns(uint[] )
  {
      return (players[addrPlayer].cards);
  }
    function getCardofDealerHands() public view returns(uint[])
  {
      return (games[Dealer].dealercards);
  }
    function getValueofPlayerHands(address addrPlayer) public view returns(uint)
  {
      return (players[addrPlayer].cardsValue);
  }
      function getValueofDealerHands() public view returns(uint)
  {
      return (games[Dealer].dealercardsValue);
  }
  function getGameInfo(address addrPlayer) public view returns(uint[], uint[], uint, uint, bool)
  {
      return (players[addrPlayer].cards, games[Dealer].dealercards, players[addrPlayer].cardsValue, games[Dealer].dealercardsValue, games[Dealer].Inprocess);
  }


  function randomNumber(uint8 max) internal returns (uint8 result) 
  {
        nonce++;
        uint256 value = uint256(keccak256(abi.encodePacked(now, blockhash(block.number - 1), nonce)));
        return uint8(value % max + 1); // [1, max]
  }
  function DealerPlay() internal returns(uint[] )
  {
      GameEntity storage gameInstance = games[Dealer];

      uint newCard = 0;
      while(gameInstance.dealercardsValue < 17)
      {
        newCard = dealCard(randomNumber(52));
        gameInstance.dealercards.push(newCard);
        gameInstance.dealercardsValue = sumScore(gameInstance.dealercards, 21);
      }
     games[Dealer].Inprocess = false;

      return gameInstance.dealercards;
  }
  function sumScore(uint[] cards , uint maxScore) internal pure returns(uint)
  {
      uint totalScore = 0;
      uint numberOfAce = 0;
        for (uint i = 0; i < cards.length; i++) 
        {
            uint cardValue = cards[i] % 13;
            if (cardValue == 1)// Ace
            {
                numberOfAce++;
                totalScore = totalScore + 11;
            }
            else if (cardValue > 10 || cardValue == 0) // J Q K
            {
                totalScore = totalScore + 10;
            }
            else 
            {
                totalScore = totalScore + cardValue;
            }
        }
        for(uint j = 0; j < numberOfAce; j++)
        {
            if (totalScore > maxScore)
            {
                totalScore = totalScore - 10;
            }
        }
        return totalScore;
  }

}


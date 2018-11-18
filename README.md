# BlackJack
1    Introduction
Global consumers spend about $10 billion a year on online gambling, and that number continues to keep a trend of rising[3]. As one of the most revenue entertainment business, gambling application take huge profits[1]. Blackjack as one of online gambling game has been developed in many different forms and different strategies of design. Not surprisingly, most of the previous work has developed it as a client-server program. in this architecture, the application will be run in a centralized system, and the application in this architecture called centralized application. Instead of being a centralized application, In this work, the Blackjack application is developed in a decentralized application system. specific, it developed on blockchain which operates on a pear-to-pear network.
1.1    Aim and Objectives
The aim of the project is to develop a blackjack decentralized web application on Ethereum.
The objectives of my project are:
1.    Setting up the development environment for decentralized application and installing some dependencies are includes:
─    Truffle: a development environment and testing framework[6], enabling developers using Ethereum Virtual Machine to undertake developing of decentralized application. It supports the compiling, placing, testing for the smart contract.
─    Ganache: a personal blockchain for Ethereum development, it represents the Ethereum client on the developers computer. Using Ganache the develops can simply migrate, and test the smart contract on the personal blockchain.
─    Metamask: a bridge that connected Ethereum blockchain and local web browser. It enable users accessing the blockchain with a browser extension. It allows users sending transaction, reject transaction and some other functions of the general Ethereum wallet.
─    private chain: a personal blockchain for developing and testing the application. it can reduce the unnecessary cost during the developing.
2.    Designing the architecture of the application, distributing the work of the application to smart contract and front-end client.
3.    Implementing the smart contract of the decentralized application, using the solidity programing language. The smart contract takes responsibility to implement the logic and operation of the game.
4.    Implementing the front-end client of the decentralized application, using the CSS, HTML, JavaScript programing language. Front-end takes responsibility to interact with the blockchain and provides a friendly interface for users.
5.    Testing and Evaluating the decentralized application.
1.2    Requirements 
The blackjack decentralized application should satisfy the following requirements:
1.    The decentralized application developed in this project should support single- and multi-player modes. 
2.    The decentralized application should correctly implement the chosen set of rules of the Blackjack. 
3.    The decentralized application design should not contain oblivious vulnerabilities that can be exploited for cheating 
4.    The frontend decentralized application should contain a friendly user interface. 
1.3    Motivation
Most of the previous blackjack games were built on the centralized network, which is facing several attacks by malicious programs. The typical approach to attack the application is obtaining the accession of the central database to modify the data of the game. In centralized network, all the client participating in the network are controlled by the control database. Once the database was controlled by the attacker, all data of the client are exposed to the attacker. That means an attacker can deal any cards he wished or modify the rules of the game easily. Otherwise, blackjack developed on blockchain can prevent this attack in most extend. Blockchain broadcast all the transaction across the decentralized network, which ensure all the nodes participating in the network have the copies of the data. And all the data is secured by cryptographic hashing, and validated by a consensus algorithm. Even if attack modifies the data one of blocks successfully, the other nodes still keep original. Blackjack decentralized application provides players with a trust-free and tamper-proof gaming environment.
1.4    Structure of Dissertation
This dissertation contains 10 major sections. Section 1. aims to introduce the project and describe the aim of the project and present the motivation and requirements. Section 2. presents background which explains the idea of decentralization and blockchain. Section 3. Introduces the related work which can accelerate the developing of decentralized application. section 4. describes the design of the blackjack decentralized application. Section 5. introduces the specific technologies that used in the project. Section 6. Explains the specific detail about blackjack decentralized application implementation. Section 7. presents the testing strategy and the test result of the application. Section 8. evaluates the project and analyzes the limitation of the project. Section 9. Summarizes the work has done and presents the conclusion and section 10 describe the further work of this project.
2    Background
This section conations the ideal of centralized and decentralized, the basic strategy of the blockchain, some features of a specifically programmable blockchain named Ethereum and the rules of the blackjack game. Furthermore, it also discusses the differences between the centralized and decentralized, which can enforce the motivation of this project.
2.1    Centralized and Decentralized
Centralized
Currently, centralized systems are a most preferred model for the web application[2], as it provides the highest authority and control for the center. Specifically, in the centralized network, all the resource, computing power, storage are allocated on only one single center, this center controls the others individual of the network. All the information, data are routed through this center. For instance, the Client-Server model is the typical implementation of the centralized system. all the thin clients are connected to the central server, and act followed the command from the central server, all the data sent from the client are passed through the central server. An application in centralized architecture is easier to be controlled and being more efficient, but once the central point of the network false, the entire network is affected. There has more likely to be a single point of failure in the centralized system.

Figure 1. centralized network

Decentralized
The idea of decentralization can be dated back to the era of human communication, the basic concept of it is sharing the information with each individual among the group to prevent the extinction of this information in the group[2]. Specifically, It can prevent failure caused by single individual loss. Basically, decentralization is a processes of taking and distribute information. More importantly, the information distributed as copies from across the network. Scilicet, each node of the decentralized system network has the copy of the information. In conclusion, the security and redundancy have been promoted in the decentralized system.

Figure 2. decentralized network
In the decentralized system, there is no single central point control the others individuals, each peer or nodes are equal in this system, all these nodes across the peer-to-peer network are run with trustless protocols, in hence, there is no central point of failure.
2.2    Blockchain
Blockchain technology is a decentralized data storage technology proposed by a mysterious creator Satoshi Nakamoto [9]. It implemented in Bitcoin and provides the technological basis for the crypto-currency Bitcoin. In 2008, a paper named “Bitcoin: A Peer-to-Peer Electronic Cash System” was published, followed by blockchain technology. With the developing of blockchain technology, this decentralized data storage feature and distributed computing architecture become the potential solution for business problems[10].
In terms of the structure of the Blockchain, it is essentially a chain of blocks. The data are ordered in a chronological sequence and each one of them points to an individual storage which called block, and all these blocks chained together by the timestamps. In addition, all these blocks are shared across the all the nodes participating from the network in a broadcast approach. This decentralized approaching ensures that the blocks cannot be changed without consensus of the all the nodes. In terms of the adding data to the blockchain, each time the new block added to the chain, indicating that the previous block was completed. There is only one block can be added to this chain at a time. This feature is attributed to the timestamps of the blocks. According to the hash of the block, timestamp server timestamps each block and publishing the result, which ensures the blocks are orders in chronological sequence. Furthermore, each time stamp contains the timestamp of the previous block, which ensure that the adding new block must after the previous blocks completed.

Figure 3. structure of blockchain
Instead of having a central authority to make decision, blockchain run in a majority decision-making approach. To making the decision followed by the consensus of the nodes, the proof-of-work system was applied in the blockchain. Basically, when building a new block, every node of the network should collect broadcasting transactions into the block, and to finding the proof-of-work for this new block. proof-of-work require nodes to find the exponential in number of zero bits of a hash[9,10]. That means proof-of-work is difficult to produce but easier to check and verify. Once the efforts of nodes satisfy the requirement, the new block will be broadcast to all nodes, and all the nodes will accept it if all the transactions of this block are valid. This strategy ensures the chain of the block cannot be added new block without redoing the proof-of-work, and also prevent the tampering occurred in isolation.
As regards the role of the node in the blockchain, every single individual of the blockchain network can be regarded as a node. In this distribute and decentralized network, each node holds a copy of the public ledger. This Public ledger created by blockchain with the transactions take the responsibility of the database of the servers of the centralized network. Each node associate with others nodes to maintain the consistency of the public ledger (data), these copies of the data distrusted across the network make the hacking and attacking extremely difficult [2].
As regards the attacking and tampering, the architecture of the blockchain requires the attacker providing extreme computing capability. Suppose there is an attacker who tried to modify the data of the block, his malicious transactions need to obtain the validation from all the other nodes. The only approach to make it possible is to provide the extreme computing power more than other nodes combine. Simply, blockchain can be viewed as a trust-free, tamper-proof, immutable technology [2].
2.3    Ethereum
Ethereum is a blockchain that allows the user to develop and build the decentralized application. More importantly, unlike the blockchain which pre-defined the operation for users, Ethereum is a programmable blockchain[12]. that means Ethereum allow users creating any possible operation for their own decentralized application on the blockchain. Ethereum essentially can be regarded as Ethereum Virtual Machine, which can execute a program written in some friendly programming languages like Solidity, Javascript.
Ethereum consolidates many technologies which were applied in Bitcoin, while also proposing some modification. Rather than concentrate on the transaction in Bitcoin blockchain, Ethereum introduces the account as the basic unit of it. All the accounts can be divided into two types: Externally Owned Accounts (EOAs) and Contract Accounts. Externally Owned Accounts basically is the user's account, it controlled by the private keys which identify the user or address. And Contract Accounts are controlled by the code of contract, can only be ‘active’ by the EOAs, which is the users [11]. In addition, the code of smart contract can be programmed that smart contract can be controlled by certain address. That means users controlled certain Externally Owned Account can control the specific contract accounts by programming the code of this smart contract. All the transaction between the accounts eventually forms the state transaction of the Ethereum blockchain. to prevent malicious transaction and the attack, the Ethereum also require a transaction fee for each transaction. The sender of the transaction must pay for the state change of the blockchain, and this consumption charged in an Ethereum token, named Ether, and this transaction consumption is called gas. Ether can be rewarded to the users or who solve the proof-of-work on Ethereum blockchain and this action which obtaining rewarded also called mining.
2.4    BlackJack
The gambling industry is flourishing in recent decades. Blackjack as one of the card game of gambling also developed in popularity. This section will introduce this card game and focus on explaining the basic rules of this card game.
In the casino, the cards are dealt from the deck by the casino employee, which called Dealer. each the players who participate in the game plays individually against the Dealer. That means, there is no conflict or competition between the player and the players. As regards cards, each table uses one or more 52-card deck, which will be shuffled well before the game starts. Each card has a corresponding value. Specifically, For the spot cards(except Ace cards), the number of the card represents the corresponding value. For instance, the two-spot card’s value is two. For the face cards(e.g. jack, queen, king), it’s value all equal to ten. Especially, the value of the Ace card can be one or eleven either, which depends on the player’s option. And, if the hand(all the cards of one player) contains Ace and the Ace valued 11, this hand is called “soft” hand. Otherwise, if the Ace represents 1 point, it is a “hard ” hand.
When the game starts, the Dealer will deal one card to each player followed one to himself. after that, redoing this action to deal the seconded card to everyone. When each player (includes the dealer)obtained 2 cards, the player’s turn starts. Basically, the player has an option to receive one additional card at a time, called hit. Otherwise, if the player is satisfied with his hands, he can give up the right to for additional cards in this game, called stand. Naturally, To win this game, the player would try to make his cards’ total value as big as possible by the hit. Meanwhile, the player has to avoid the bust, which means the total value of the cards is greater than 21. All the operations of the player’s turn depend on the player himself. when each player completes their turns, the dealer is required to deal cards to himself. unlike the option provided to the player, the dealer must deal cards until his hand's value is equal to or more than 17. In addition, the dealer is required to hit a soft 17. When Dealer’s turn completed, the game is over and show the results of this game. the player win by not busting(total value of hands cards more than 21 called bust) and value are higher than the dealer, or not busting and having dealer bust[18].

3    Related Work
This section will introduce strategies and framework that can be applied in client and programmable blockchain respectively. these previously related works enable and accelerate the developing decentralized application on blockchain.
3.1    Truffle React Box
Truffle is a development environment and testing framework, enabling developers using Ethereum Virtual Machine to undertake to develop of decentralized application. It also provides some boilerplates that help the developer build decentralized application with different front-end client frameworks. In this project, truffle react-box boilerplates was applied. Truffle can be used to compile, link, develop smart contract. With react-box, developers can build a react framework interacting with the smart contract. It also provide an easier solution for the testing of the smart contract.
3.2    Smart contract and Solidity
The key concept of Ethereum is programmable, and the smart contract is the exact section of Ethereum to allow developers to create their own operation for their decentralized application. the smart contract actually is a piece of code run on the blockchain. it imposes rules, consequences, and computation over every transaction of the Ethereum blockchain[11]. for instance, a user of certain decentralized application send a transaction to the blockchain and require a piece of data. The smart contract will response this request according to the certain rules. In addition, the smart contract is open and immutable. Once it developed on the blockchain, it cannot be changed, and everyone can view the content of the contract. These features make the decentralized application secure and fairness [6,10,14]. In this project, to develop the smart contract, solidity language was introduced. Solidity is one of the most widely used high-level programming languages for implementing the smart contract. It provides statically typed, supports inheritance, libraries and complex user-defined types and other useful approaches for programming. Solidity was designed to target Ethereum Virtual Machine, and the code of solidity contract is compiled to bytecode and eventually run on the Ethereum Virtual Machine.
4    Design
In this section, it will describe the overall architecture of the Blackjack decentralized application and introduce the components of the entire decentralized application as two parts, which are the smart contract and front-end client.
4.1    Architecture of Blackjack decentralized application
The entire application can be divided into three parts: smart contract, front-end client and the interaction between the smart contract and front-end client. The smart contract is the program run on the blockchain. it contains the game rules and game operation of blackjack. In addition, the data of the game(for example, the dealer’s cards, player’s cards, the status of the game) are stored on the blockchain. basically, clients send a transaction to the blockchain, and smart contract enforces the corresponding operation, rules, and consequence over the transaction. After that, the data for executing the transaction is stored on the blockchain. front-end client takes responsibility to request the data from the blockchain and represent it on the user interface. It defines the layout the application and wait for the response from the blockchain. interaction is the communication between the blockchain and client. It simply is sending transaction form the client to blockchain and retrieves the return value of the transaction form the blockchain to the client. The specific blackjack application architecture can be seen below

Figure 4. architecture of blackjack centralized application
At the first stage, the client sends transition to blockchain to participate the game and obtain the dealer address of this game. At the second stage, when the game starts, a transaction will be sent to the blockchain at specified intervals. This transaction sends the request for the game information of this game and waits for the return value of this transaction. This transaction will keep sending until game over.

Figure 5. structure of game information
the GameInfo data contain the current information on this game, including the Dealer’s cards data, Player’s cards data and the Game status. 
In addition, the game status indicates the status of the current game, for instance, the game in progress or game over. The client will split GameInfo into the corresponding part. And exhibit it on the user interface. Finally, when the game is over, the client will receive t the GameStatus which includes a signal indicating that the game is over. And the client will stop sending transaction, the entire program ends.
4.2    Smart contract design
Overview of the blackjack smart contract

Figure 6. process of smart contract program
This flow chart indicates the process how smart contract works. Initially, when the game starts, smarts contract deal tow cards to the dealer and players respectively and record the cards. Secondly, in the player’s, the smart contract will deal one additional card to the player who sends the hit transaction. meanwhile, smart contract store the cards of this player to a certain player structure. According to the total value of the player’s hands, If the player hand is bust, the smart contract will mark this player to reject all the subsequent hit or stand operation of this player. otherwise, the smart contract will wait for the next transaction of this player, that means, The process returns to the beginning of the player's turn. Player oblation another chance to hit or stand. In terms of stand option, once the player is satisfied with his hands, he should send stand transaction to smart contract. As the response, the smart contract will mark this player and there is no more hit or stand operation he can execute. So far, player’s turn ends. Dealer ‘s turn will execute automatically after all the players stand or bust. Smart contract deals the cards to the dealer until Dealer hit a ‘soft’ 17 point. Finally, this game ends and wait for the reset transaction to reactive this game.
Data Structure
─    Player: includes the cards player has, the total value of all the cards in player’s hand, some markers to indicate the current player status.
─    Player List: includes the address of the all the players who participate in the current game.
─    Game Entity: includes the cards dealer has, the total value of all the cards in dealer’s hand, some markers to indicate the current game status. In addition, it contains a deck which used in this game.
Operations and Functions
To implement the rules and logic of the Blackjack game, some operations and functions should be defined on smart contact. 
External functions
The external function defined on smart contract, allowing users to alter the state of the smart contract by sending the transaction to directly call the function. It also can be regarded as the interface provided by smart contract.
─    Participate Game: this function initialize a player for the game. Specifically, smart contract recorded the address of the sender of this transaction, and append it into a list. This address list contains all the players who participate in the game, and the value of this list can be easily obtained by the dealer. In addition, it also set some flag for this player, which help to indicate the status of the game.
─    Start Game: this function initializes a game entity for the current game, which includes shuffling the deck, dealing cards to the dealer and player respectively. In terms of dealing cards, this operation needs to call a certain function to ensure the card dealt randomly. This function will be This function will be introduced separately in the next section.
─    Reset Game: it removes the all the data recorded in the previous game an reset the statues for preparing the next game.
─    Hit: smart contract dealer one additional card to the player who sends this transaction, and adds this new card to the player’s hand which stored the cards he obtained. Meanwhile, this function executes a conditional statement to determine if the cards bust. If bust, a subsequent conditional statement that determines if all players bust or stand will be executed. And smart contract calls a certain function to process dealer’s turn.
─    Stand: Smart contract mark the sender of the transaction’s corresponding player data, and update the data on the blockchain. the next processes are similar to the Hit function. The function of the dealer’s turn will be executed after all player stand or busted.
─    Get Game Information: this function retrieves the dealer data, player data and game status from the blockchain and pack it return to the sender of this transaction. unlike the function provided above, it will not change the state of the smart contract..
Internal functions
The iTnternal function is not accessible for the client or the other external accounts. It protects data by only called by smart contact.
─    Random Number: the basic idea of this function is generating a random number for Deal card function. A special mathematical and cryptographic function named keccak256 called inside. Keccak function compute the hash value of the arguments, returning back the hash value in bytes32 form[14]. In this project, the number of blocks and the time were chosen as parameters, ensuring the hash value generated randomly.
─    Deal Card: this function takes the random number generated by Random Number function and returns the index of the card which was dealt. Meanwhile, the dealt card is marked, to ensure the same card would not be dealt twice.
─    Dealer Play: this function represents the action of the dealer on the dealer’s turn. It will be executed after all the player’s turn over. It basically deals additional cards until the dealer hit ‘soft’ 17. To stop acting according to the rules, each time dealing a card to the dealer, the Sum Score function will be called to check if dealer obtains ‘soft ’17 points.
─    Sum Score: this function focus on the computation the sum of the cards of dealer or player hands. Furthermore, this function should deal with the problem of the Ace card. The Ace card can be counted as 1 or 11 depends on the situation. Sum Score function is taking responsibility to handle this option value problem and obtain the appropriate value of Ace card.
4.3    Front-end client design
Overview of front-end client
client take responsibility of pulling information from the blockchain and exhibiting the view that current situation of the game for the users. This section will introduce how blackjack front-end works. Initially, it will represent the basic setting and process of blackjack client, after that some client methods(operations) corresponding to the external functions of the smart contact will be introduced. 
Basic setting and process
─    Connecting to Etherum Blockchain: This stage includes tow operation: Instantiating web3 and Instantiating the contract. Firstly, according to the web3 instance to create a web3 object, which can be used to interact with Ethereum. Secondly, instantiating the smart contract by using the address where smart contract developed. By doing these two operations, the front-end can interact with the Etherum blockchain.
─    Sending the transaction to participate game: Send a transaction to the blockchain to require participating the game, and retrieve the dealer’s address to the client.
─    Retrieving the basic unit data when interaction: once the game starts, the client would start to get game information in at specified intervals. The user interface will be updated according to the new information obtained by this transaction.
─    Displaying the data on the user interface: the client takes responsibility of pulling information from the blockchain and exhibiting the view that indicates the process of the game for the users. It split the Game information which obtained from the smart contact, dividing it into the dealer data, player data, game status and represent it on the screen. This process can be seen in Figure 7.

Figure 7. GameInfo Dataflow
Data Structure
─    Dealer’s cards: it contains the all the cards of dealer obtained.
─    Dealer’s hand: it indicates the value of the cards in dealer’s hand.
─    Player’s cards: it contains the all the cards of player obtained.
─    Player’s hand: it indicates the value of the cards in player’s hand.
─    Game status: it indicates the current state of the game. For example, game in process, game over, game standby.
─    Deck: This represents all the 52 cards that are possible to be used in the client. Specifically, it contains 52 image which represents 52 cards respectively. 
Client Methods (operations)
In this project, the operations of the client can be divided into two types: 
─    Type1: sending the transaction to request smart contract to execute the corresponding function (e.g. participate game, start the game, hit, stand, reset game,). 
─    Type2: sending the transaction to retrieve game information form the smart contract(get game information). 
5    Specific Technologies Used in the Implementation
This section will introduce some Specific technologies and tools will be used in the implementation. Specifically, web3.js provide the interface to react with blockchain. React library will be applied in the truffle react box framework. Ethereum private chain and Ganache will set an environment for the developing and testing of smart contact.
5.1    Web3.js
In order to react with the Ethereum blockchain, one option is to use web3 provided by web3.js library[19]. Web3.js is a library collection of JavaScript API, which enables the interacting with the node of blockchain by using JASON RPC. In this project, web3.js provide the technical support for interaction between the client and blackjack. The specific processes and operation will be introduced in the implementation of client section. 
5.2    React
React is a Javascript library for developing user interface[13]. The basic idea of using react is operating the “components” provided by React. Developers are allowed to compose the complex user interfaces from various components, which simplify the architecture of the application and the function of the application can be implemented separately. 
Each component generally has “props” as the parameters, and return a scene to display on the user interface by render method. Specifically, In this project, props of the application components will control the display of the cards, the value, the entire view of the application, and it will be displayed by using the Render method.
5.3    Ethereum Private Chain and Ganache
Ethereum allows users to create a personal blockchain which maintains all the feature of the main Ethereum blockchain but isolated from the Ethereum. This private chain technology saves developers the problem of synchronizing millions of nodes of the main blockchain. meanwhile, refer to the gas consumption of Ethereum background, instead of spending truly token for the transaction, private blockchain can be paid by test token. It extremely reduces the cost of developing the decentralized application on Ethereum. Furthermore, Ganache provides a set of solutions for users, which eliminate cumbersome steps of creating a private blockchain and developing smart contract on the blockchain[16]. it also provides a friendly user interface to react to the change of blockchain directly and instantly.
6    Implementation
In this section, the implementation detail will be presented. The strategies and algorithms involved will also be shown in this section. Specifically, it will explain the implementation detail of the smart contract first. Secondly, the implementation of the interacting with blockchain will be described. thirdly, the implementation detail of the front-end client will be covered in the third part. Finally, some constraints will be implemented. In addition, some specific knowledge of the used technology will be involved in this section.
6.1    Smart contract implementation
To make the next part easier to understand, a definition and some concepts should be introduced initially.
Address Type: Address is value type provide by Solidity language that is not available in other languages. It actually contains 20 bytes value and a pointer. The value of address indicates an account. That means certain users or smart contract can find out by using this unique bytes value. For instance, according to the address, the client can easily locate the smart contact when the client is trying to connect to the certain smart contract. And when the function of smart contract is called, we can use code “ msg. sender ” to indicate the account who is calling this the function.
Game Data structure

Player 
This data structure represents every single player..
struct Player
{
uint[] cards;
uint cardsValue;
bool Busted;
bool BlackJack;
bool InGame;
bool Stand;
}
This structure stores the cards (variable cards ) and the total of these cards (variable cardsValue) of the player who is pointed by this structure. The rest of this structure is used to store some Boolean variable to indicate the player’s status, the entire variables of this structure are:
─    cards: a list that contains all the cards the player has.
─    cardsValue: a uint variable used to store the total of value of cards the player has.
─    BlackJack: a boolean variable used to indicate if the user obtains 21 points in first dealing turn. In addition, this variable can be used to analyzing the current game status and to obtain the final result of the game.
─    Busted: a boolean variable used to indicate if the user’s total value of cards is bust. It supports for the continuation of the game.
─    InGame: a boolean variable used to indicate if the user participates current game. By using this variable the smart contract can prevent the same player from participating the game multiple times.
─    Stand: a boolean variable used to indicate whether a player is no longer request for more cards in the game. This variable supports for the continuation of the game.

Game Entity
This data structure represents every single game of the smart contact.
struct GameEntity
{
uint[] dealercards;
uint dealercardsValue;
mapping (uint => bool) usedCards;
bool dealerBusted;
bool dealerBlackJack;
bool Inprocess;
}
Similarly, Game Entity stored the data of the dealer. Furthermore, it contains a deck used in this game of the smart contract. According to the rules of blackjack, the deck should contain 52 stander cards and the same card is not allowed to be dealt twice in this game.
─    dearlercards: a list contains all the cards the dealer has.
─    dealercardsValue: a uint variable used to store the total of the value of cards the dealer has.
─    dealerBusted: a boolean variable used to indicate if the dealer bust.
─    dealerBlackJack: a boolean variable used to indicate if the dealer obtains the blackjack.
─    InProcess: a boolean variable used to indicate the status of the game. if this value were true, means the game is running, otherwise, the game is over or standby.
─    usedCards: it is a map variable mapping the uint variable to a boolean variable. It records all the cards have been dealt. 

Player List
mapping(address => address[]) public addrPlayers;
this mapping variable mapping an address to the list of address. Specifically, The key of this mapping is the dealer’s address, the value of the mapping is the player’s address list. This variable can be used to obtain all player participating in this game.
Game operation function
All the functions mentioned below can be accessed by the client. In hence, it was called game operation function in this project. By using this function. Player can push the process of the game followed the rules.

placeBets Function
this function can be used to initialize the Player variable.
address[] storage addrList = addrPlayers[Dealer];
addrList.push(msg.sender);
Dealer is the address of the dealer, by using the address of the dealer and the mapping addrPlayers, the addrList obtain the list which contains the addresses of the players who participate in the game. After that, addrList call the push function to add the address of message sender into the list. So far, the user who calls this function has joined the game.
Player storage currentPlayer = players[msg.sender];
currentPlayer.InGame = true;
currentPlayer.Stand = false;
currentPlayer.Busted = false;
currentPlayer.BlackJack = false;
after that, according to the address of sender, smart contact will allocate an empty player structure data for this address. This unique address can point to this certain player data by using the mapping. And the empty player data will be filled with some pre-setting.

startGame Function.
This function is responsible for starting the entire game, including shuffling, and the first round of dealer.
GameEntity storage gameInstance = games[Dealer];
At first, smart contact gains the gameInstace which represent this game. and this available generate by a mapping with the dealer address of this game. with the gameInstance, smart contact can operate on the game.
for (uint i = 1; i < 53; i++)//Shuffling
{
gameInstance.usedCards[i] = false;
}
This step basically is shuffling. It initializes all the cards of the deck by marking the each boolean value of card to false. That means, this card are available for dealing.
address[] storage addrList = addrPlayers[Dealer];
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
This step is responsible for dealing cards to players. The player list addrList can be obtained by using mapping with the dealer address. After that, smart contract accesses each address stored on this list and obtain the corresponding Player variable. As mentioned in data structure section, the Player contains a list which stores all the cards the player has. To deal with the user, first, generate a card using the randomNumber function and the dealCard function. Then, use the push function to provide the list variable and add the new card to the Player structure. Furthermore, startGame function still needs to set the status of this player. Specifically, if player obtained 21 points during this function, the BlackJack variable should be changed to true, which means that according to the cards this player has, he already win the game, and he doesn’t need any addition operation in this game.
gameInstance.dealercards.push(dealCard(randomNumber(52)));
gameInstance.dealercards.push(dealCard(randomNumber(52)));
gameInstance.dealercardsValue = sumScore(gameInstance.dealercards, 21);
if(gameInstance.dealercardsValue == 21)
{
gameInstance.dealerBlackJack = true;
}
Then the smart contract needs to deal cards to the dealer, and these operations are similar to dealing cards to players. The only difference is smart contract accessing the address of the dealer instead of accessing the address of the player.

resetGame Function
Basically, this function re-doing the shuffling, and deleting the data which relate to the players and dealer who participated in the previous game.
for (uint i = 1; i < 53; i++)//Shuffling
{
gameInstance.usedCards[i] = false;
}
re-doing shuffle by setting the usedCards variable to false.
for(uint j = 0; j < numberOfplayers; j++)
{
if(players[addrList[j]].cardsValue == 21)
{
players[addrList[j]].BlackJack = false;
}
delete players[addrList[j]];
}

accessing each player stored on the list and deleting the related data.
if(gameInstance.dealercardsValue == 21)
{
gameInstance.dealerBlackJack = false;
}
delete gameInstance.dealercards;
delete gameInstance.dealercardsValue;
delete gameInstance.dealerBusted;
delete addrPlayers[Dealer];
accessing the GameEntity variable and deleting the dealer’s data and the other related data.

hit Function
By calling this function, smart contract will deal one additional card to the player who calls it at a time.
players[msg.sender].cards.push(dealCard(randomNumber(52)));
players[msg.sender].cardsValue = sumScore(players[msg.sender].cards, 21);
Firstly, obtain the Player variable using the map and the sender's address. Then access the list of player cards stored, and finally push the new card to the card list. At the same time, update and record the total value of the card and store it in the cardsValue.
After dealing addition cards. Smart contract will execute some conditional statement to check the current status of game.
if(players[msg.sender].cardsValue > 21)
{
players[msg.sender].Busted = true;          
}
If the player obtain more than 21, this player will be marks as busted. And this player cannot require any more additional cards in this game.
for(uint i = 0; i < addrList.length; i++)
{
if(!(players[addrList[i]].Stand || players[addrList[i]].Busted))
{
return;
}
}
DealerPlay();
If the all the player participated in the game are busted or stand, the smart contract will execute DealerPlay function automatically. Specifically, the smart contract will access the Playerlist of the game. and check each the player’s status. If somebody’s Busted value and Stand value both are false, the function ends. Otherwise, smart contract will call the function named DealerPlay.

stand Function
this function will be called when the player is satisfied with his hands. It basically will mark the current player’s status and execute some conditional statement.
players[msg.sender].Stand = true;
address[] storage addrList = addrPlayers[Dealer];
for(uint i = 0; i < addrList.length; i++)
{
if(!(players[addrList[i]].Stand || players[addrList[i]].Busted))
{
return;
}
}
DealerPlay();
The first step is accessing the player’s Stand variable and change the value to true. The rest operation is similar to the hit function. The smart contract will check the each player’s status and execute the DealerPlay function Selectively.
Computing functions
The smart contract will check the each player’s status and execute the DealerPlay function Selectively.
randomNumber Function
In order to ensure the fairness of the game, the program needs a random number to support the operation of dealing card randomly.
nonce++;
uint256 value = uint256(keccak256(abi.encodePacked(now, blockhash(block.number - 1), nonce)));
return uint8(value % max + 1); // [1, max]
as mentioned in the design section, keccak function generates a random number by using the time, block number and nonce. And the result is a uint256 type variable. In order to correspond to 52 cards, this number needs to be further processed. Specifically, it is taking the remainder of the value divided by 52, the plus 1 to the result. By performing the above operation, the function can return a random number between 1 and 52. And this result will be sent to the dealCard function.

dealCard Function
this function generates an index which represents the card’s order of the deck. More importantly, there is a problem cannot be ignored: The given random number has the possibility of repetition. To handle this problem, Recursion Method is used in this function.
GameEntity storage gameInstance = games[Dealer];
// indexcard : [1-52] the index of the deck
if(gameInstance.usedCards[IndexCard])
{
if(IndexCard >= 52)
{
IndexCard = 1;
}

IndexCard = IndexCard + 1;

return dealCard(IndexCard);
}

gameInstance.usedCards[IndexCard] = true;
initially, obtaining the instance of the game. after that, smart contract will check the boolean value of the card which random index point to. If the value is true, which means the card already been used. In this situation, The random index will be incremented by 1, and the function will re-execute the dealCard function internally using the new random index. In some extreme cases, in order to prevent this continuously increasing random index overflow, the function will execute a conditional statement.
if(IndexCard >= 52)
{
IndexCard = 1;
}
When the random number exceeds the limit of 52, the random number will be reset to1 which points to the first card.

sumScore Function
This function will calculate the value represented by the card in the game and store the result in the corresponding data structure(dealer or player). More importantly, this function handles the problem that valuing ace card. Specifically, the value of the Ace card can be 1 or 11 depends on the total value of the cards. According to the rules of blackjack, this function needs to ensure that the total value is the greatest but not more than 21 (bust).


Figure 8. Computing cards
function sumScore(uint[] cards , uint maxScore) internal pure returns(uint)
this function will take two parameters, which are the list containing the card and a maximum value. For this game, this value is 21.
uint totalScore = 0;
uint numberOfAce = 0;
firstly, this function defines tow variable for recoding the total score of all the cards and the number of ace cards of the card list.
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
And then, the function will execute a loop to access each card stored in the card list. It will take the remainder of the card (it actually is the index of the specific cards in the deck) divided by 13(each deck contains 4 colours, each colour contains 13 cards from 1 to 13). The remainder which value is 1 represents Ace card. Each time there is an ace card in the list, the function will increment the numberOfAce variable by 1. Meanwhile, the function will add the 11 which represent Ace card’s value to the totalScore. In particular, when the remainder is greater than or equal to 10(represent J Q K cards), the function will add the 10 to the totalScore. In other cases, the function will add the value of the remainder to the totalScore.
for(uint j = 0; j < numberOfAce; j++)
{
if (totalScore > maxScore)
{
totalScore = totalScore - 10;
}
}
Finally, the function will handle the situation that a hand with ace cards ‘soft’ exceed the maximum number. The function will execute a loop until the executing times is equal to the value of numberOfAce. In this loop, if totalScore is greater than the maximum number, totalScore will be subtracted 10. By this approach, Ace card is counted as 1 value.

DealerPlay Function
This function will executed automatically after all players complete their operations 
GameEntity storage gameInstance = games[Dealer];

uint newCard = 0;
while(gameInstance.dealercardsValue < 17)
{
newCard = dealCard(randomNumber(52));
gameInstance.dealercards.push(newCard);
gameInstance.dealercardsValue = sumScore(gameInstance.dealercards, 21);
}
Function will obtain the Instance firstly. Then will execute a loop. This loop will keep running until the conditional statement find out the value of dealer’s hand is greater than 17. Inside the loop, an additional card will be dealt to dealer, an stored in the card list of dealer.

Interaction functions
Solidity provides a keywords “view”. The function declared with “view” means they promise not to modify the state of smart contract[14]. It can be widely used when the client only requests data from the blockchain. in this project, the basic unit of interaction is GameInfo structure. To retrieve the GameInfo from the blockchain to client, this function should be pre-defined on blockchain with keyword “view”.
function getGameInfo(address addrPlayer) public view returns(uint[], uint[], uint, uint ,bool)
{
return (players[addrPlayer].cards, games[Dealer].dealercards, players[addrPlayer].cardsValue, games[Dealer].dealercardsValue, games[Dealer].Inprocess);
}
This function retrieve the player’s cards, dealer’s cards, total value of player’s cards ,  total value of dealer’s cards and a boolean value which indicate the game status to the sender who call this function.
6.2    Migrating implementation
The migration can be sued to alter application’s smart contract from one state to next state.[17]
var SimpleStorage = artifacts.require("./Blackjack.sol");

module.exports = function(deployer) {
deployer.deploy(Blackjack);
};
Blackjack.sol is the smart contract file will be deployed on blockchain, and deloyer.deploy function can be used to deploy the contract on the blockchain.
6.3    Front-end client implementation
Connecting to blockchain
By using the web3.js library and truffle framework, Developer can easily connect to the blockchain.
getWeb3()
this method is provided by truffle framework. Basically, it will check if Web3 has been injected by browser first, and create a Web3 objective for client selectively. This method returns a web3 objective which can be used to interact with blockchain.
web3.eth.getAccounts()
by using this interface provided by web3.js library, the client can obtain the accounts list which represents the player and dealer in this game.
Blackjack.deployed()
Blackjack is the smart contract that needs to be built in blockchain. by using the deployed method, the client can obtain the instance of the contract from the blockchain.
this.setState({ BlackjackInscatnce : instance })
And the client will store this instance in the state variable of the react framework. So far, the client completes the connecting to the blockchain.
Interaction
Request GameInfo data packet and split it
In this application, client will keep sending transaction to request GameInfo from blockchain until the game over. 
setInterval(this.getGameInfo, 3000)
serInterval is a method can call a method by a specified period (in milliseconds). Specifically, blackjack client will call the method getGameInfo by each 3 second.
getGameInfo(){
return this.state.simpleStorageInstance.getGameInfo(this.state.PlayerAdress)
.then((result) => {
/*result[0] players's cards
result[1] delaer's cards
result[2] player's cardsValue
result[3] dealer's cardsVlaue
result[4] Inprocess
*/ 
var playerCards = result[0];
var dealerCards = result[1];
var playerValue = result[2];
var dealerValue = result[3];

var tempPlayer = [];
for(var i = 0; i < playerCards.length; i++)
{
tempPlayer.push(playerCards[i].c[0]);    
}
this.setState({PlayerHands : tempPlayer})
console.log(this.state.PlayerHands)
var tempDealer = [];
for(var j = 0; j < dealerCards.length; j++)
{
tempDealer.push(dealerCards[j].c[0]);    
}
this.setState({DealerHands : tempDealer})
console.log(this.state.DealerHands)

this.setState({DealerHandsValue : dealerValue.c[0]})
this.setState({PlayerHandsValue : playerValue.c[0]})
this.setState({ InProcess: result[4]})
console.log(this.InProcess);
return;
}
)}
This method will call the getGameInfo function of smart contract, and obtain the result for client. Furthermore, it also will split the GameInfo data packet, store the split part into the state variable. In order to correctly split the GameInfo data packet, we must first know that the internal structure of the result is divided into five parts:
─    Result[0] : a list which contains player’s cards
─    Result[1] : a list which contains dealer’s cards
─    Result[2] : a numerical value which represent the total value of player’s hand
─    Result[3] : a numerical value which represent the total value of dealer’s hand
─    Result[4] : a boolean value which indicate the game status(game in process or game over).
The last three item of the GameInfo (result) data packet can be stored in the client after simple processing, but the list type stored in the first item and the second item needs to be processed in some special operations. We will take the first item(player’s cards) as an example.
var tempPlayer = [];
this.setState({PlayerHands : []})
for(var i = 0; i < playerCards.length; i++)
{
tempPlayer.push(playerCards[i].c[0]);    
}
this.setState({PlayerHands : tempPlayer})
Firstly, the method will define a temporary list for storing the cards. Then the method will access each element in result[0], add its value to the temporary list, and finally store the temporary list in state of client.
So far, the client has completed the acquisition, processing and storage of GameInfo.

bigNumber issues
According to the document of JavaScript, JavaScript provide only one numeric data type in double-precision 64-bit floating point format (IEEE 754), named number[7]. But the uint type used in solidity language can be 256-bit. In this project, the problem is number is too small to store the data retrieve from blockchain. Therefore, the data obtained from the blockchain needs to be converted so that the client can read it correctly. This section will take a line of code which is storing the player’s card to list as an example.
tempPlayer.push(playerCards[i].c[0]); playerCards[i].c[0]
in this line, playerCards[i] is a list. By using the c function, the client can obtain the card data parts of the entire information. In this way, the client can successfully access the data of a single card and filter it to useless data.
Display
This section will focus on the implement of displaying data on the user interface. Basically, It will mainly describe how to display the image corresponding to the card value on the screen.
const pics = [];
for (let i = 1; i <= 52; i++) {
const e = require('../img/'+i+'.png');
pics.push(e);
}
this.setState({picCards : pics});
First define an array called pics to store the images of all the cards, then import all the images from the local file in order. The pics will be store in the state of the client after above operation done.
In display section, map() function was used to take a card of dealer(or player) and display the corresponding images. 
<div>
{ this.state.DealerHands.map((i) => {
return <img src={this.state.picCards[i-1]}  alt='dealerscards'/>
}) 
}
</div>
Specifically, the card stored on dealer’s hand actually is an index number of the card which indicates the card’s order in the deck. And the image is arranged by the same strategy. Therefore, the client can obtain the correct index of the image by subtracting 1 from variable i, and finally display it on the user interface successfully.
6.4    Constraints
In order to prevent errors caused by user abnormal operations, some restrictions should be implemented in the program. This section will list some code of function for preventing potential illegal operation.
In solidity, the function require() can be used to handle error[15]. In this project, this function will be used to prevent the processing of the illegal operations.
Constraints of placeBets Function
require(!gameInstance.Inprocess);
This line of code prevents the same user from participating the same game multiple times.
Constraints of startGame Function.
require(!gameInstance.Inprocess);
require(addrPlayers[Dealer].length > 0);
This line of code prevents the situations that game starts without any players joining and the game starts when the last game is still in progress. 
Constraints of hit Function
require(!players[msg.sender].Stand && !players[msg.sender].Busted && !players[msg.sender].BlackJack);
This line of code prevents the situations that player request additional card with his hands is busted or blackjack or he already chosen stand in this game.

References
1.    Andrle, J.D., 2006. A winning hand: A proposal for an international regulatory schema with respect to the growing online gambling dilemma in the United States. Gaming research & review journal., 10(1), p.7.
2.    Asharaf, S., 2017. Decentralized computing using blockchain technologies and smart contracts : emerging research and opportunities /, Hershey, Pennsylvania (701 E. Chocolate Avenue, Hershey, PA 17033, USA) : IGI Global.
3.    Cotte, J. and Latour, K. (2009). Blackjack in the Kitchen: Understanding Online versus Casino Gambling. Journal of Consumer Research, 35(5), pp.742-758.
4.    David B., Dowsley R., Larangeira M. (2018) 21 - Bringing Down the Complexity: Fast Composable Protocols for Card Games Without Secret State. In: Susilo W., Yang G. (eds) Information Security and Privacy. ACISP 2018. Lecture Notes in Computer Science, vol 10946. Springer, Cham
5.    Dinur, I., Dunkelman, O. & Shamir, A., 2014. Collision attacks on up to 5 rounds of SHA-3 using generalized internal differentials. Lecture Notes in Computer Science (including subseries Lecture Notes in Artificial Intelligence and Lecture Notes in Bioinformatics), 8424, pp.219–240.
6.    Iyer, K., Dannen, C. & SpringerLink, 2018. Building Games with Ethereum Smart Contracts Intermediate Projects for Solidity Developers,
7.    MDN Web Docs. (2018). Number. [online] Available at: https://developer.mozilla.org/en-US/docs/Glossary/Number [Accessed 24 Aug. 2018].
8.    Kim, H., Kim, Dong-Chan & SpringerLink, 2018. Information Security and Cryptology – ICISC 2017 20th International Conference, Seoul, South Korea, November 29 - December 1, 2017, Revised Selected Papers.
9.    Nakamoto, S. (2008). Bitcoin: A peer-to-peer electronic cash system. Academic Press.
10.    Nofer, M. et al., 2017. Blockchain. Business & Information Systems Engineering, 59(3), pp.183–187.
11.    Ethdocs.org. (2018). Contracts — Ethereum Homestead 0.1 documentation. [online] Available at: http://www.ethdocs.org/en/latest/contracts-and-transactions/contracts.html [Accessed 24 Aug. 2018].
12.    Ethdocs.org. (2018). What is Ethereum? — Ethereum Homestead 0.1 documentation. [online] Available at: http://www.ethdocs.org/en/latest/introduction/what-is-ethereum.html
13.    Reactjs.org. (2018). Getting Started – React. [online] Available at: https://reactjs.org/docs/getting-started.html#learn-react [Accessed 24 Aug. 2018].
14.    Solidity.readthedocs.io. (2018). Units and Globally Available Variables — Solidity 0.4.21 documentation. [online] Available at: https://solidity.readthedocs.io/en/v0.4.21/units-and-global-variables.html [Accessed 24 Aug. 2018].
15.    Solidity.readthedocs.io. (2018). Types — Solidity 0.4.24 documentation. [online] Available at: https://solidity.readthedocs.io/en/v0.4.24/types.html [Accessed 24 Aug. 2018].
16.    Truffle Suite. (2018). Truffle Suite | Documentation | Ganache | Ganache Quickstart. [online] Available at: https://truffleframework.com/docs/ganache/quickstart [Accessed 24 Aug. 2018].
17.    Truffle Suite. (2018). Truffle Suite | Tutorials | Ethereum Pet Shop -- Your First Dapp. [online] Available at: https://truffleframework.com/tutorials/pet-shop [Accessed 24 Aug. 2018].
18.    Werthamer, N. R. (2009). Risk and reward: The science of casino blackjack. Springer Science & Business Media.global-variables.html [Accessed 24 Aug. 2018].
19.    Web3js.readthedocs.io. (2018). web3.js - Ethereum JavaScript API — web3.js 1.0.0 documentation. [online] Available at: https://web3js.readthedocs.io/en/1.0/ [Accessed 24 Aug. 2018].
20.    Yi, X., Paulet, R. & Bertino, E., 2014. Homomorphic encryption and applications.
21.    Zyskind, G., Nathan, O. & Pentland, A.'S., 2015. Decentralizing Privacy: Using Blockchain to Protect Personal Data. 2015 IEEE Security and Privacy Workshops, pp.180–184.

import React, { Component } from 'react'
import SimpleStorageContract from '../build/contracts/SimpleStorage.json'
import getWeb3 from './utils/getWeb3'

import './css/oswald.css'
import './css/open-sans.css'
import './css/pure-min.css'
import './App.css'

class App extends Component {
  constructor(props) {
    super(props)

    this.state = {
      currAccount: 0x0,
      acclength: 7,
      web3: null,
      simpleStorageInstance: null,

      DealerAdress: null,
      PlayerAdress: null,
      DealerHands: [],
      DealerHandsValue: 0,
      PlayerHands: [],
      PlayerHandsValue: 0,
      
      InProcess: false,

      //ui
      picCards: [],
      deck: [],
      dealer: null,
      player: null,
      wallet: 0,
      inputValue: '',
      currentBet: null,
      gameOver: false,
      message: null
    }
    this.startGame = this.startGame.bind(this);
    this.hit = this.hit.bind(this);
    this.stand = this.stand.bind(this);
    this.getGameInfo = this.getGameInfo.bind(this);

  }

//UI

  placebets()
  {
    return this.state.simpleStorageInstance.placeBets({gas : 420000, price :500}).then((result) => {
      return this.state.simpleStorageInstance.addrPlayers(this.state.DealerAdress, 0).then((Player) => {
        console.log(Player)
        return this.setState({PlayerAdress : Player})
      })
    })
  }

  reset()
  {
    return this.state.simpleStorageInstance.reset({gas : 420000, price :500}).then(clearInterval(this.getGameInfo))
  }


  startGame() {
    return this.state.simpleStorageInstance.startGame()
    .then( setInterval(this.getGameInfo, 3000))
  }

  hit() {
    return this.state.simpleStorageInstance.hit()
    .then()
  }

  stand() {
    return this.state.simpleStorageInstance.stand()
    .then()
  }


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
        console.log(this.state.InProcess);
        return;
  }
)}


  componentWillMount() {
    // Get network provider and web3 instance.
    // See utils/getWeb3 for more info.

    getWeb3
    .then(results => {
      this.setState({
        web3: results.web3
      })

      // Instantiate contract once web3 provided.
      this.instantiateContract()
      
      
    })
    .catch(() => {
      console.log('Error finding web3.')
    })
  }



  componentDidMount() {
  
    const pics = [];
    for (let i = 1; i <= 52; i++) {
      const e = require('../img/'+i+'.png');
      pics.push(e);
    }
   this.setState({picCards : pics});


  

  }

  instantiateContract() {
    /*
     * SMART CONTRACT EXAMPLE
     *
     * Normally these functions would be called in the context of a
     * state management library, but for convenience I've placed them here.
     */

    const contract = require('truffle-contract')
    const simpleStorage = contract(SimpleStorageContract)
    simpleStorage.setProvider(this.state.web3.currentProvider)


    // Declaring this for later so we can chain functions on SimpleStorage.
    // Get accounts.
    this.state.web3.eth.getAccounts((error, accounts) => {
      
      simpleStorage.deployed().then((instance) => {
        this.setState({ simpleStorageInstance : instance })


        //codeing
        this.setState({acclength : accounts.length})
        this.setState({currAccount: accounts})
        simpleStorage.defaults({from:accounts[0]});
       
        return this.state.simpleStorageInstance.Dealer()
      }).then((result) => {
        return this.setState({DealerAdress : result})
      })
    })
  }

  render() {



    return (
      <div className="App">
        <nav className="navbar pure-menu pure-menu-horizontal">
            <a href="#" className="pure-menu-heading pure-menu-link">Black Jack</a>
        </nav>
        <main className="container">
          <div className="pure-g">
            <div className="pure-u-1-1">

              <p>Dealer: {this.state.DealerAdress}</p>

              <p>Dealer's Hand ({ this.state.DealerHandsValue })</p>
              <div>
                  { this.state.DealerHands.map((i) => {
                    return <img src={this.state.picCards[i-1]}  alt='dealerscards'/>
                  }) }
              </div>


              
                <div style={{
                'display': 'inline-flex',
                'flexFlow': 'column nowrap',
                'color': 'white',
                'position': 'fixed',
                'top': '700',
                'bottom': '0',
                'margin': 'auto',
                'left': '0',
                'right': '0',
                'alignItems': 'center',
                'justifyContent': 'center',}}
                >
                {!this.state.InProcess&&<button className="button bigrounded gray" onClick={() => {this.placebets()}}>PlaceBets</button>}
                <div>
                    {!this.state.InProcess&&<button className="button bigrounded red" onClick={() => {this.startGame()}}>startGame</button>}
                    {true&&<button className="button bigrounded red" onClick={() => {this.reset()}}>resetGame</button>}
                    {this.state.InProcess&&<button className="button bigrounded gray" onClick={() => {this.hit()}}>Hit</button>}
                    {this.state.InProcess&&<button className="button bigrounded gray" onClick={() => {this.stand()}}>Stand</button>}
                    
                  </div>
                </div>

              <p>Player: {this.state.PlayerAdress}</p>
              <p>Your Hand ({ this.state.PlayerHandsValue })</p>

              <div>
                  { this.state.PlayerHands.map((i) => {
                    return <img src={this.state.picCards[i-1]}  alt='playerscard'/>
                  }) }
              </div>
              { (this.state.PlayerHandsValue > this.state.DealerHandsValue )&&!this.state.InProcess&&<p>You WIN</p>}
              { (this.state.PlayerHandsValue < this.state.DealerHandsValue )&&!this.state.InProcess&&<p>You LOSE</p>}              


            </div>
          </div>
          
        </main>
        


        
        
        
        
      </div>
    );
  }
}

export default App

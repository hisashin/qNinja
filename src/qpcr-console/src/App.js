import React, { Component } from 'react';
import './App.css';
import { ServerConnection } from 'rtcmesh-react';
import Header from './components/partials/Header';
import AlertBanner from './components/partials/AlertBanner';
import AppState from './support/AppState';
import Router from './support/Router';

class App extends Component {
  alertCallback = (severity, message) => {
    console.log('alertCallback', severity, message);
    const { showAlertBanner } = AppState;
    showAlertBanner(severity, message, 3000);
  };


  render() {
    return (
      <div className="App">
        <Header />
        <ServerConnection
          REACT_APP_SERVER_URL={process.env.REACT_APP_SERVER_URL}
          alertCallback={this.alertCallback} />
        <AlertBanner />
        <Router />
      </div>
    );
  }
}

export default App;

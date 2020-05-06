import React from 'react';
import { withRouter } from 'react-router-dom';
import { SendRequest, RegisterServiceCallback } from 'rtcmesh-react';
import SiteNav from '../partials/SiteNav';
import Button from 'react-bootstrap/Button';
import AppState from '../../support/AppState';

class Home extends React.Component {
  constructor(props) {
    super(props);
    this.register_msg_handler();
  }
  
  start_experiment = () => {
    console.log('start_experiment')
    SendRequest('crt_updt', null, 'experiment', 'dummy', (response) => {
      console.log('response', response);
      if(response.code === 200){
        const { showAlertBanner } = AppState;
        showAlertBanner('success', response.message, 2000);
      } 
    });
  }
  
  stop_experiment = () => {
    SendRequest('delete', null, 'experiment', 'dummy', (response) => {
      console.log('response', response);
      if(response.code === 200){
        const { showAlertBanner } = AppState;
        showAlertBanner('success', response.message, 2000);
      } 
    });
  }
  
  register_msg_handler = () => {
    console.log('register_msg_handler - RegisterServiceCallback');
    RegisterServiceCallback('experiment', function(msgObj){
      console.log('Home - RegisterServiceCallback', msgObj)
    
    });
  }
  
  
  render() {
    return (
      <div>
        <SiteNav />
        <div className="content">
          <Button variant="primary" onClick = {this.start_experiment} >Start</Button>{' '}
          <Button variant="danger" onClick = {this.stop_experiment} >Stop</Button>{' '}
      
        </div>
      </div>
    );
  }
}

export default withRouter(Home);

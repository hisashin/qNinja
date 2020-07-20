import React from 'react';
import { withRouter } from 'react-router-dom';
import { SendRequest, RegisterServiceCallback } from 'rtcmesh-react';
import SiteNav from '../partials/SiteNav';
import Button from 'react-bootstrap/Button';
import AppState from '../../support/AppState';
import {Line} from 'react-chartjs-2';

class Home extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      chart_data: {
        labels: [],
        datasets: [
          {
            label: 'Cycling',
            fill: false,
            lineTension: 0.1,
            backgroundColor: 'rgba(75,192,192,0.4)',
            borderColor: 'rgba(75,192,192,1)',
            borderCapStyle: 'butt',
            borderDash: [],
            borderDashOffset: 0.0,
            borderJoinStyle: 'miter',
            pointBorderColor: 'rgba(75,192,192,1)',
            pointBackgroundColor: '#fff',
            pointBorderWidth: 1,
            pointHoverRadius: 5,
            pointHoverBackgroundColor: 'rgba(75,192,192,1)',
            pointHoverBorderColor: 'rgba(220,220,220,1)',
            pointHoverBorderWidth: 2,
            pointRadius: 1,
            pointHitRadius: 10,
            data: []
          }
        ]
      }
    };
    this.register_msg_handler();
  }
  
  start_experiment = () => {
    console.log('start_experiment')
    let _this = this;
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
    if( typeof this.register_msg_handler.stopped_experiment == 'undefined' ) {
      this.register_msg_handler.stopped_experiment = false;
    }
    if( typeof this.register_msg_handler.transition_count == 'undefined' ) {
      this.register_msg_handler.transition_count = 0;
    }
    let _this = this;
    RegisterServiceCallback('experiment', function(msgObj){
      // console.log('Home - RegisterServiceCallback', msgObj, 'topic:', msgObj.topic)
      if(_this.register_msg_handler.transition_count >= 3 && !_this.register_msg_handler.stopped_experiment){
        _this.stop_experiment();
        _this.register_msg_handler.stopped_experiment = true;
      } 
      switch(msgObj.topic){
      case 'ThermalTransition':
        _this.register_msg_handler.transition_count++;
        break;
      case 'ThermalDataUpdate':
        _this.process_msgObj(msgObj);
        // console.log('Home - RegisterServiceCallback - ThermalDataUpdate', msgObj)
        break;
      default:
      }
    });
  }
  
  process_msgObj = (msgObj) => {
    if( typeof this.process_msgObj.last_time_sec == 'undefined' ) { this.process_msgObj.last_time_sec = 0 }
    let tstamp = Math.floor(Date.now() / 1000);
    // console.log('tstamp', tstamp, '- last_time_sec', this.process_msgObj.last_time_sec)
    if(tstamp > this.process_msgObj.last_time_sec){
      let chart_data = Object.assign({}, this.state.chart_data);  // creating copy of the object
      chart_data.labels.push('');
      chart_data.datasets[0].data.push(msgObj.well);
      // console.log('chart_data', chart_data)
      // console.log('tstamp', tstamp)
      this.setState({chart_data});
      //
      this.process_msgObj.last_time_sec = tstamp;
    }  
  }
  
  
  render() {
    return (
      <div>
        <SiteNav />
        <div className="content">
          <h2>Cycling</h2>
          <Line data={this.state.chart_data} redraw/>
          <Button variant="primary" onClick = {this.start_experiment} >Start</Button>{' '}
          <Button variant="danger" onClick = {this.stop_experiment} >Stop</Button>{' '}
        </div>
      </div>
    );
  }
}

export default withRouter(Home);

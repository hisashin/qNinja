import React from 'react';
import Alert from 'react-bootstrap/Alert'
import AppState from '../../support/AppState';

class AlertBanner extends React.Component {
  constructor(props) {
    super(props);
    
    this.state = { visible: false, color: 'light', text: '' };
    const { set_prop } = AppState;
    set_prop('showAlertBanner', this.showAlertBanner);
    set_prop('hideAlertBanner', this.hideAlertBanner);
    set_prop('resetAlertBanner', this.resetAlertBanner);
  }

  onDismiss = () => {
    this.hideAlertBanner();
  };

  // color = primary (blue) | secondary (gray) | success (green) | danger (red) |
  //         warning (yellow) | info (cyan) | light (white) | dark (dark gray)
  showAlertBanner = (color, text, hide_timeout) => {
    this.setState({ visible: true, color: color, text: text });

    if (hide_timeout && hide_timeout > 0) {
      setTimeout(
        function(this_) {
          this_.hideAlertBanner();
        },
        hide_timeout,
        this,
      );
    }
  };

  hideAlertBanner = () => {
    this.setState({ visible: false, color: 'light', text: '' });
  };

  resetAlertBanner = () => {
    console.log('resetAlertBanner');
  };

  render() {
    return (
      <Alert
        variant={this.state.color}
        show={this.state.visible}
        onClose={this.onDismiss}
      >
        {this.state.text}
      </Alert>
    );
  }
}

export default AlertBanner;

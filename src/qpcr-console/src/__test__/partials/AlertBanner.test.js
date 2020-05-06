import React from 'react';
import Alert from 'react-bootstrap/Alert'
import { shallow } from 'enzyme';

import AlertBanner from '../../components/partials/AlertBanner';

describe('AlertBanner', () => {
  const render = () => {
    const wrapper = shallow(<AlertBanner />);
    return wrapper;
  };

  it('should render AlertBanner component', () => {
    const alertBanner = render();
    expect(alertBanner).toHaveLength(1);
  });

  it('should have 1 Alert component', () => {
    const alertBanner = render();
    expect(alertBanner.find(Alert)).toHaveLength(1);
  });

  it('should have dismiss when the user clicks the Alert', () => {
    const alertBanner = render();
    alertBanner.setProps({ visible: true });
    alertBanner.find(Alert).simulate('click');
    expect(alertBanner.state('visible')).toEqual(false);
  });

  it('should have dismiss when onDismiss has been called', () => {
    const alertBanner = render();
    const instance = alertBanner.instance();
    alertBanner.setProps({ visible: true });
    instance.onDismiss();
    expect(alertBanner.state('visible')).toEqual(false);
  });

  it('should have dismiss when hideAlertBanner has been called', () => {
    const alertBanner = render();
    const instance = alertBanner.instance();
    alertBanner.setProps({ visible: true });
    instance.hideAlertBanner();
    expect(alertBanner.state('visible')).toEqual(false);
  });

  it('should pop up the alert when showAlertBanner has been called', () => {
    const alertBanner = render();
    const instance = alertBanner.instance();
    alertBanner.setProps({ visible: false });
    instance.showAlertBanner('primary', 'Alert', 1000);
    expect(alertBanner.state('visible')).toEqual(true);
  });
});

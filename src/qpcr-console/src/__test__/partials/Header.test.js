import React from 'react';
import Row from 'react-bootstrap/Row'
import Col from 'react-bootstrap/Col'
import { shallow } from 'enzyme';

import Header from '../../components/partials/Header';
import UserNav from '../../components/partials/UserNav';

describe('Header', () => {
  const render = () => {
    const wrapper = shallow(<Header />);
    return wrapper;
  };

  it('should render Header component', () => {
    const header = render();
    expect(header).toHaveLength(1);
  });

  it('should have header component', () => {
    const header = render();
    expect(header.find('header')).toHaveLength(1);
  });

  it('should have Row component', () => {
    const header = render();
    expect(header.find(Row)).toHaveLength(1);
  });

  it('should have 2 Col component', () => {
    const header = render();
    expect(header.find(Col)).toHaveLength(2);
  });

  it('should have img component', () => {
    const header = render();
    expect(header.find('img')).toHaveLength(1);
  });

  it('should have UserNav component', () => {
    const header = render();
    expect(header.find(UserNav)).toHaveLength(1);
  });
});

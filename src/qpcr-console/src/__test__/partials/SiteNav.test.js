import React from 'react';
import Row from 'react-bootstrap/Row'
import Col from 'react-bootstrap/Col'
import Nav from 'react-bootstrap/Nav'
import { shallow } from 'enzyme';

import SiteNav from '../../components/partials/SiteNav';
import AlertBanner from '../../components/partials/AlertBanner';

describe('SiteNav', () => {
  const render = () => {
    const wrapper = shallow(<SiteNav.WrappedComponent />);
    return wrapper;
  };

  it('should render SiteNav component', () => {
    const siteNav = render();
    expect(siteNav).toHaveLength(1);
  });

  it('should have div component', () => {
    const siteNav = render();
    expect(siteNav.find('div')).toHaveLength(1);
  });

  it('should have Row component', () => {
    const siteNav = render();
    expect(siteNav.find(Row)).toHaveLength(1);
  });

  it('should have Col component', () => {
    const siteNav = render();
    expect(siteNav.find(Col)).toHaveLength(1);
  });

  it('should have Navbar component', () => {
    const siteNav = render();
    expect(siteNav.find(Navbar)).toHaveLength(1);
  });

  it('should have NavbarToggler component', () => {
    const siteNav = render();
    expect(siteNav.find(NavbarToggler)).toHaveLength(1);
  });

  it('should have Collapse component', () => {
    const siteNav = render();
    expect(siteNav.find(Collapse)).toHaveLength(1);
  });

  it('should have Nav component', () => {
    const siteNav = render();
    expect(siteNav.find(Nav)).toHaveLength(1);
  });

  it('should have AlertBanner component', () => {
    const siteNav = render();
    expect(siteNav.find(AlertBanner)).toHaveLength(1);
  });
});

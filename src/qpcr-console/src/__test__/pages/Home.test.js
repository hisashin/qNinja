import React from 'react';
import { shallow } from 'enzyme';

import Home from '../../components/pages/Home';
import SiteNav from '../../components/partials/SiteNav';

describe('Home', () => {
  const render = () => {
    const wrapper = shallow(<Home.WrappedComponent />);
    return wrapper;
  };

  it('should render Home page', () => {
    const homePage = render();
    expect(homePage).toHaveLength(1);
  });

  it('should have SiteNav component', () => {
    const homePage = render();
    expect(homePage.find(SiteNav)).toHaveLength(1);
  });

  it('should have div component with className "content"', () => {
    const homePage = render();
    expect(
      homePage
        .find('div')
        .last()
        .hasClass('content'),
    ).toEqual(true);
  });
});

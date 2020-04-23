import React from 'react';
import { withRouter } from 'react-router-dom';
import SiteNav from '../partials/SiteNav';

class Page1 extends React.Component {
  
  render() {
    return (
      <div>
        <SiteNav />
        <div className="content">
          Page1
        </div>
      </div>
    );
  }
}

export default withRouter(Page1);

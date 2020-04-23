import React from 'react';
import Row from 'react-bootstrap/Row'
import Col from 'react-bootstrap/Col'
import Nav from 'react-bootstrap/Nav'
import Navbar from 'react-bootstrap/Navbar'
import { view } from 'react-easy-state';
// import { NavLink as RRNavLink } from 'react-router-dom';
import { LinkContainer } from 'react-router-bootstrap'
import AppState from '../../support/AppState';
import AlertBanner from './AlertBanner';
import { withRouter } from 'react-router-dom';

class SiteNav extends React.Component {
  constructor(props) {
    super(props);
    this.toggle = this.toggle.bind(this);
    this.state = {
      isOpen: false,
    };
  }

  componentDidMount() {
    console.log('SiteNav componentDidMount');
    const { set_prop } = AppState;
    set_prop('history', this.props.history);
  }

  static getDerivedStateFromProps(props) {
    console.log('SiteNav getDerivedStateFromProps props', props);
    return null;
  }

  toggle() {
    this.setState({
      isOpen: !this.state.isOpen,
    });
  }

  render() {
    return (
      <div>
        <Row className="bottom-border">
          <Col xs={{ size: 12 }} sm={{ size: 12 }} md={{ size: 12 }}>
            <Navbar color="faded" bg='light' expand="sm" id="main-menu">
              <Navbar.Toggle onClick={this.toggle} />
              <Navbar.Collapse>
                <Nav navbar activeKey={window.location.pathname}>
                  <LinkContainer to="/home">
                    <Nav.Link eventKey="home">Home</Nav.Link>
                  </LinkContainer>
                  <LinkContainer to="/page1">
                    <Nav.Link eventKey="page1">Page1</Nav.Link>
                  </LinkContainer>
                </Nav>
              </Navbar.Collapse>
            </Navbar>
          </Col>
        </Row>
        <AlertBanner />
      </div>
    );
  }
}

export default view(withRouter(SiteNav));

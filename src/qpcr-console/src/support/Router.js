import React from 'react'
import { Switch, Route, Redirect, BrowserRouter as Router } from 'react-router-dom'
import Home from "../components/pages/Home";
import Page1 from "../components/pages/Page1";


const Routes = () => (
  <Router basename = {process.env.REACT_APP_BASENAME}>
    <Switch>
      <Route path='/home' component={Home} />
      <Route path='/page1' component={Page1} />
    	<Route exact path="/" render={() => (
    		<Redirect to="/home"/> )
    	}/>
    </Switch>
  </Router>
)

export default Routes

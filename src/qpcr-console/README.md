# Ninja-qPCR Console
A React client to control the Ninja-qPCR

The console tries to connect to the Ninja-qPCR server using the URL specified in the `REACT_APP_SERVER_URL` property in the `.env` file. If the server is not running it will retry using an adaptive algorithm.

**NOTE:** the entry `SKIP_PREFLIGHT_CHECK=true` in the `.env` file is necessary as of 2010-04-22 because of a version mismatch in webpack.  Will remove after it is fixed.

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

## Available Scripts

In the project directory, you can run:

### `yarn start`

Runs the app in the development mode.<br />
Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

The page will reload if you make edits.<br />
You will also see any lint errors in the console.

### `yarn test`

Launches the test runner in the interactive watch mode.<br />
See the section about [running tests](https://facebook.github.io/create-react-app/docs/running-tests) for more information.

### `yarn build`

Builds the app for production to the `build` folder.<br />
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.<br />
Your app is ready to be deployed!

See the section about [deployment](https://facebook.github.io/create-react-app/docs/deployment) for more information.

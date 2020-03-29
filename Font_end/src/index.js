import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import LoginRegister from './LoginRegister';
import * as serviceWorker from './serviceWorker';
import Login from "./pages/Login/Login";
import Layout from "./Layout/index";
ReactDOM.render(<Layout />, document.getElementById('root'));
serviceWorker.unregister();

import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import LoginRegister from './LoginRegister';
import * as serviceWorker from './serviceWorker';
ReactDOM.render(<LoginRegister />, document.getElementById('root'));
serviceWorker.unregister();

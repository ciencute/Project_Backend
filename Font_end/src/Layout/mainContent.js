import React, {Component} from 'react';
import Nav from "./components/nav";
import Footer from "./footer";

class MainContent extends Component {
	render() {
		return (
			<div id="content-wrapper" className="d-flex flex-column">
				<div id="content">
					<Nav/>

				</div>
				<Footer/>
			</div>
		);
	}
}

export default MainContent;
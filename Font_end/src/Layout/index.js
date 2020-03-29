import React, {Component} from 'react';
import SideBar from "./sideBar";
import MainContent from "./mainContent";

class Index extends Component {
	render() {
		return (
			<div id="wrapper">
				<SideBar/>
				<MainContent/>
			</div>
		);
	}
}

export default Index;
import React, {Component} from 'react';
import NavBar from "../../Layout/components/NavBar";
import SideContainer from "../../Layout/components/SideContainer";
import ContentWrapper from "../../Layout/components/ContentWrapper";
import MainFooter from "../../Layout/components/MainFooter";
import ControlSideBar from "../../Layout/components/ControlSideBar";

class App extends Component {
	render() {
		return (
			<div className="wrapper">
				<NavBar/>
				<SideContainer/>
				<ContentWrapper/>
				<MainFooter/>
				<ControlSideBar/>
			</div>
		);
	}
}

export default App;
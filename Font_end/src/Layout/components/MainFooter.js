import React, {Component} from 'react';

class MainFooter extends Component {
	render() {
		return (
			<footer className="main-footer">
				<strong>
					Copyright © 2014-2019{" "}
					<a href="%PUBLIC_URL%/http://adminlte.io">AdminLTE.io</a>.
				</strong>
				All rights reserved.
				<div className="float-right d-none d-sm-inline-block">
					<b>Version</b> 3.0.3-pre
				</div>
			</footer>

		);
	}
}

export default MainFooter;
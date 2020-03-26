import React, {Component} from 'react';
export default class LoginRegister extends Component {
  constructor(props) {
    super(props)
    this.state = {email: '', password: ''}
  }
  _setUsernameAndPassword = event => {
    let target = event.target
    let name = target.name//txtname
    let value = target.value
    this.setState({
      [name] :value
    })

  };
  _onSubmit = (event) => {
   event.preventDefault()
   console.log(this.state)
  }
  render () {
    const {email, password} = this.state
    return (
      <div class="limiter">
        <div class="container-login100">
          <div class="wrap-login100">
            <form class="login100-form validate-form" onSubmit={this._onSubmit}>
              <span class="login100-form-title p-b-43">
                Login to continue
              </span>
              <div
                class="wrap-input100 validate-input"
                data-validate="Valid email is required: ex@abc.xyz"
              >
                <input class="input100" type="text" name="email"  onChange={this._setUsernameAndPassword}/>
                <span class="focus-input100" />
                <span class="label-input100">Email</span>
              </div>
              <div
                class="wrap-input100 validate-input"
                data-validate="Password is required"
              >
                <input class="input100" type="password" name="password" onChange = { this._setUsernameAndPassword}/>
                <span class="focus-input100" />
                <span class="label-input100">Password</span>
              </div>
              <div class="flex-sb-m w-full p-t-3 p-b-32">
                <div class="contact100-form-checkbox">
                  <input
                    class="input-checkbox100"
                    id="ckb1"
                    type="checkbox"
                    name="remember-me"
                  />
                  <label class="label-checkbox100" for="ckb1">
                    Remember me
                  </label>
                </div>
                <div>
                  <a href="#" class="txt1">
                    Forgot Password?
                  </a>
                </div>
              </div>
              <div class="container-login100-form-btn">
                <button class="login100-form-btn" type="submit">
                  Login
                </button>
              </div>
              <div class="text-center p-t-46 p-b-20">
                <span class="txt2">
                  or sign up using
                </span>
              </div>
              <div class="login100-form-social flex-c-m">
                <a
                  href="#"
                  class="login100-form-social-item flex-c-m bg1 m-r-5"
                >
                  <i class="fa fa-facebook-f" aria-hidden="true" />
                </a>
                <a
                  href="#"
                  class="login100-form-social-item flex-c-m bg2 m-r-5"
                >
                  <i class="fa fa-twitter" aria-hidden="true" />
                </a>
              </div>
            </form>
            <div
              class="login100-more"
              style={{backgroundImage: 'url("images/bg-01.jpg")'}}
            />
          </div>
        </div>
      </div>
    );
  }
}

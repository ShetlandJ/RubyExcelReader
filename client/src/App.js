import React, { Component } from 'react';
import FileForm from './containers/FileForm'
import Input from './containers/Input'

class App extends Component {
  constructor(props){
    super(props);
    this.state = {
      guess: "",
      visibility: "hidden"
    }
  }

  render() {
    return (
      <div>
        <FileForm />
        <Input />
      </div>
    );
  }
}

export default App;

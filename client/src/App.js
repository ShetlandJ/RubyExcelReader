import React, { Component } from 'react';
import FileForm from './containers/FileForm'

class App extends Component {
  constructor(props){
    super(props);
    this.state = {
    }
  }

  render() {
    return (
      <div>
        <FileForm />
      </div>
    );
  }
}

export default App;

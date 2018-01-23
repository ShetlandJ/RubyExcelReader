import React from 'react';
import ConstituencySelector from './ConstituencySelector';

class FileForm extends React.Component {

  constructor(props){
    super(props);
    this.state = {
      constituencies:[],
    };
  }

  componentDidMount(){
    const url = 'http://localhost:4567/api';
    const request = new XMLHttpRequest();
    console.log(url);
    console.log(request);
    request.open("GET", url);
    request.addEventListener('load', () => {
      if (request.status === 200) {
        const jsonString = request.responseText;
        const constituency_data = JSON.parse(jsonString);
        this.setState({ constituencies: constituency_data })
      };
    });
    request.send();
  }

  render() {
    return(
      <div><ConstituencySelector constituencies={this.state.constituencies}/></div>
    )
  }
}

export default FileForm;

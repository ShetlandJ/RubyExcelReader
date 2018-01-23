import React from 'react';
import Input from './Input';

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

    const constituencies = this.state.constituencies.map((constituency, index) => {

      const constituency_name = Object.keys(constituency)

      constituency[constituency_name].forEach(function(year_data, index){
        console.log(year_data[index+2012]);
      });

      return <div className="test">
        <Input />
      </div>
    })

    return(
      <div>{constituencies}</div>
    )
  }
}

export default FileForm;

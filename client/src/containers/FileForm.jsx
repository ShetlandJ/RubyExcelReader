import React from 'react';

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
      console.log(constituency["Dundee City"][0]["2012"]);
      console.log("BELOW ME");

      for (var year_data of constituency["Dundee City"]) {
        console.log(year_data);
      }
      return <div className="test">

        <p>{Object.keys(constituency)}</p>
        <p>{Object.keys(constituency["Dundee City"])}</p>
        <p>Average Monthly Income (Net £):</p>
        <p>{constituency["Dundee City"][0]["2012"]["Average Monthly Income (Net £)"]}</p>
        </div>

      });

      return(
        <div>{constituencies}</div>
      )
    }
  }

  export default FileForm;

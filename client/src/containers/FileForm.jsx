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

    // const constituency_data = this.state.constituencies[0].map((constituency, index) => {
    //   return <div className="constituency">
    //     {constituency}
    //   </div>
    // });

    // console.log(constituency_data);
    console.log(this.state.constituencies);

    return(
      <div>hello</div>
    )
  }
}

export default FileForm;

import React from 'react';

class Input extends React.Component {
  render() {
    return (
      <form action="http://localhost:4567/save_file" method="POST" enctype="multipart/form-data">
      <input type="file" name="file"/>
      <input type="submit" value="Submit file"/>
    </form>
    )
  }
}

export default Input;

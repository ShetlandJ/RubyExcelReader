import React from 'react';

class Input extends React.Component {
  render() {
    return (
      <form action="http://localhost:4567/save_file" method="POST" encType="multipart/form-data">
      <input type="file" name="file"/>
      <input type="checkbox" value="3" name="check[]"/>
      <input type="submit" value="Submit file"/>
    </form>
    )
  }
}

export default Input;

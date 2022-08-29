import './App.css';
import React, { useState, useEffect} from 'react';
import Banner from './components/banner';
// import Display from './components/display';

const App = () => {
  const [posts, setPosts] = useState([]);
  useEffect(() => {
  fetch('https://chitter-backend-api-v2.herokuapp.com/peeps')
    .then((response) => response.json())
    .then((data) => {
      console.log(data);
      setPosts(data);
    })
    .catch((err) => {
      console.log(err.message);
    });
  }, []);

  const handleClick = (data) => {
    fetch('https://chitter-backend-api-v2.herokuapp.com/peeps', {
      method: 'POST', // or 'PUT'
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(data.body),
    })
    .then((response) => response.json())
    .then((data) => {
      console.log('Success:', data);
    })
    .catch((error) => {
      console.error('Error:', error);
    });
}

// const createPeep = (data) => {
//   // Simple POST request with a JSON body using fetch
//   const requestOptions = {
//       method: 'POST',
//       headers: { 'Content-Type': 'application/json' },
//       body: JSON.stringify(data)
//   };
//   fetch('https://chitter-backend-api-v2.herokuapp.com/peeps', requestOptions)
//       .then(response => response.json())
//       .then(data => this.setState({ postBody: data.body }));
// }

  return (
    <div className="App">
      <Banner />
      <div className='card'>
        <input type="text" id="add-peep-input" />
        <button onClick={handleClick} id="add-note-btn">New peep!</button>
      </div>
        {posts.map((post) => {
            return (
               <div className ="card">
                  <p className="post-body">{post.body}</p>
                  <p className="post-user">User: {post.user.handle}</p>
                  <p className="post-likes">Likes: {post.likes.length}</p>
                  <p className="post-date-created">Created at: {post.created_at}</p>
               </div>
            );
        })}
   </div>
   );
}


export default App;

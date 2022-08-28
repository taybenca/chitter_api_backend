import './App.css';
import React, { useState, useEffect} from 'react';
import Banner from './components/banner';

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





  return (
    <div className="App">
      <Banner />
      {posts.map((post) => {
         return (
            <div className="post-card" key={post.id}>
               <p className="post-body">{post.body}</p>
               <p className="post-date-created">{post.created_at}</p>
               {/* <p className="post-date-updated">{post.updated_at}</p> */}
               {/* <p className="post-user">{post.user.handle}</p> */}
               {/* <p className="post-likes">{post.likes}</p> */}
            </div>
         );
      })}
   </div>
   );
}


export default App;

import React, { useEffect, useState } from 'react';
import './App.css';

const serverIP = process.env.REACT_APP_SERVER_IP; 

function App() {
  const [message, setMessage] = useState("");

  useEffect(() => {
    fetch(`http://${serverIP}:5000/api/message`)
      .then(response => response.json())
      .then(data => {
        console.log("Received response:", data);
        setMessage(data.message);
      });
  }, []);

  console.log("Client-side app initialized");

  return (
    <div className="App">
      <header className="App-header">
        <p>{message}</p>
      </header>
    </div>
  );
}

export default App;

import React, { useEffect, useState } from 'react';
import './App.css';

function App() {
  const [message, setMessage] = useState("");

  useEffect(() => {
    fetch('http://192.168.1.175:5000/api/message')
      .then(response => response.json())
      .then(data => {
        console.log("Received response:", data); // Log the response
        setMessage(data.message);
      });
  }, []);

  console.log("Client-side app initialized"); // Log the initialization

  return (
    <div className="App">
      <header className="App-header">
        <p>{message}</p>
      </header>
    </div>
  );
}

export default App;
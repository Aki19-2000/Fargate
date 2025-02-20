// Import Express module
const express = require('express');
const app = express();

// Define the port from an environment variable, or default to 3002
const port = process.env.PORT || 3002;

// Serve a simple HTML response
app.get('/', (req, res) => {
  res.send('<html><body><h1>Welcome to the Patient Service</h1></body></html>');
});

// Start the server and listen on the specified port
app.listen(port, () => {
  console.log(`Patient service is running on port ${port}`);
});


const express = require('express');
const app = express();
const port = process.env.PORT || 3001;  // Default to 3001 or port from the environment

app.get('/', (req, res) => {
  res.send('Hello from Appointment Service!');  // For appointment-service
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});


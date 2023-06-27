const express = require("express");
const app = express();

app.get("/api/hello", (req, res) => {
  res.send("Hello World!");
});

app.listen(3000, "0.0.0.0", () => {
  console.log("Server is listening on port 3000");
});

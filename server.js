const express = require("express");
const mongoose = require("mongoose");
require("dotenv").config();


const todoRoutes = require("./routes/todoRoutes");


const app = express();
app.use(express.json());


mongoose.connect(process.env.MONGO_URI)
.then(() => console.log("MongoDB Connected"))
.catch(err => console.error(err));


app.use("/api/todos", todoRoutes);

app.get("/", (req, res) => {
  res.send("Welcome to your Node.js + MongoDB Todo app!");
});


app.listen(3000, () => {
console.log("Server running on port 3000");
});
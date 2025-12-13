const express = require("express");
const mongoose = require("mongoose");
const path = require("path");
require("dotenv").config();


const todoRoutes = require("./routes/todoRoutes");


const app = express();
app.use(express.json());


mongoose.connect(process.env.MONGO_URI)
    .then(() => console.log("MongoDB Connected"))
    .catch(err => console.error(err));


app.use("/api/todos", todoRoutes);

app.get("/", (req, res) => {
    res.sendFile(path.join(__dirname, "public", "index.html"));
});


app.listen(3000, () => {
    console.log("Server running on port 3000");
});
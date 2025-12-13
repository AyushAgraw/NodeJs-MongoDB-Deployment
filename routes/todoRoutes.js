const express = require("express");
const Todo = require("../models/Todo");


const router = express.Router();


// Create Todo
router.post("/", async (req, res) => {
    try {
        const todo = await Todo.create({ title: req.body.title });
        res.status(201).json(todo);
    } catch (err) {
        res.status(400).json({ error: err.message });
    }
});


// Get All Todos
router.get("/", async (req, res) => {
    const todos = await Todo.find();
    res.json(todos);
});


// Update Todo
router.put("/:id", async (req, res) => {
    const todo = await Todo.findByIdAndUpdate(req.params.id, req.body, { new: true });
    res.json(todo);
});


// Delete Todo
router.delete("/:id", async (req, res) => {
    await Todo.findByIdAndDelete(req.params.id);
    res.json({ message: "Todo deleted" });
});


module.exports = router;
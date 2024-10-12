const express = require("express");
const Order = require("../models/Order");
const router = express.Router();

router.post("/", async (req, res) => {
  const { userId, items, total } = req.body;

  if (!userId || !items || items.length === 0 || total <= 0) {
    return res.status(400).json({ message: "Invalid order data" });
  }

  try {
    const newOrder = new Order({
      userId,
      items,
      total,
    });
    await newOrder.save();
    res
      .status(201)
      .json({ message: "Order placed successfully", order: newOrder });
  } catch (error) {
    res.status(500).json({ message: "Failed to place order" });
  }
});

router.get("/:userId", async (req, res) => {
  try {
    const orders = await Order.find({ userId: req.params.userId }).sort({
      date: -1,
    });
    res.json(orders); 
  } catch (error) {
    res.status(500).json({ message: "Failed to fetch orders" });
  }
});

module.exports = router;

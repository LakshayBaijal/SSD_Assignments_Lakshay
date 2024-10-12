const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
const session = require("express-session");
const MongoStore = require("connect-mongo");
const authRoutes = require("./routes/auth");
const productRoutes = require("./routes/products");
const orderRoutes = require("./routes/orders");

const app = express();
app.use(cors());
app.use(express.json());

mongoose.connect("mongodb://localhost:27017/mernshopping", {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

app.use(
  session({
    secret: "your-secret-key", 
    resave: false,
    saveUninitialized: false,
    store: MongoStore.create({
      mongoUrl: "mongodb://localhost:27017/mernshopping", 
    }),
    cookie: {
      maxAge: 1000 * 60 * 60 * 24, 
    },
  })
);

app.use("/api/auth", authRoutes);
app.use("/api/products", productRoutes);
app.use("/api/orders", orderRoutes);

app.listen(5000, () => {
  console.log("Server is running on port 5000");
});

const mongoose = require("mongoose");
const Product = require("./models/Product");

// MongoDB connection
mongoose.connect("mongodb://localhost:27017/mernshopping", {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

const products = [
  {
    name: "Colgate",
    description: "Colgate",
    price: 10,
    image: "https://images.unsplash.com/photo-1519125323398-675f0ddb6308",
  },
  {
    name: "LUX",
    description: "LUX",
    price: 15,
    image:
      "https://www.google.com/url?sa=i&url=https%3A%2F%2Fbharatbasket.com%2Fproduct%2Flux-rose-soap-100-grams%2F&psig=AOvVaw2H9QZvrudKc5loxqX447X1&ust=1728855725056000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLCV0c_niYkDFQAAAAAdAAAAABAE",
  },
  {
    name: "Elvive",
    description: "Elvive",
    price: 20,
    image:
      "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.caretobeauty.com%2Fat%2Fen%2Fl-oreal-paris-elvive-extraordinary-oil-shampoo-400ml%2F&psig=AOvVaw2euKuUmgf7YyBGSPZ06hvZ&ust=1728855633498000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCMiQ4KDniYkDFQAAAAAdAAAAABAb",
  },
];

// Function to seed the database
const seedProducts = async () => {
  try {
    await Product.deleteMany(); // Remove all existing products
    await Product.insertMany(products); // Insert new products
    console.log("Products seeded successfully!");
    mongoose.connection.close(); // Close the connection
  } catch (error) {
    console.error("Error seeding products:", error);
    mongoose.connection.close();
  }
};

// Run the seed function
seedProducts();

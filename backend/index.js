// backend/index.js
import express from 'express';
import cors from 'cors';
// import bodyParser from 'body-parser';
import jwt from 'jsonwebtoken';
import { getCred, createUser, checkCred, checkProducts, sortProducts, createReview, fetchReview } from './database.js';
import path from 'path'
import { fileURLToPath } from 'url';
import cookieParser from 'cookie-parser';


const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();
const port = 8080;


// app.use for middleware
app.use(cookieParser())
app.use(express.static(path.join(__dirname, './Powercoders2024_Frankho')));
app.use(express.json());
app.use(express.urlencoded({ extended: false })); // configuring express.js

const corsOptions = {
  origin: '*',
  credentials: true,
  optionSuccessStatus: 200
};
app.use(cors(corsOptions));

const JWT_SECRET = 'password123' //simple secret key is easy to brute-force;



app.get('/api/v1/products', async (req, res) => {
  let rating = req.query.rating;
  console.log(rating)
  let products;
  rating ?  products = await sortProducts(rating) 
    :  products = await checkProducts();
//  console.log(products);
 try {
  if (products){
    res.json(products);
    // console.log(res)
        } else {
          res.status(404).json({ error: "No products found" });
        }}
 catch (error) {
  console.error('Error:', error);
  res.status(500).json({ error: "Internal server error" });
 }
})

app.post("/api/v1/users/login", async (req, res) => {
  const { username, password } = req.body;

  try {
    const cred = await getCred(username, password);
    if (cred.length === 0) {
      console.log(`User not found or incorrect credentials`);
      res.status(404).json({ error: "User not found or incorrect credentials" });
    } else {
      const token = jwt.sign({ username: cred[0].username }, JWT_SECRET, { expiresIn: '1h' });
      res.cookie('Token',token, {maxAge: 3600000, httpOnly: true});
      res.status(200).json({ message: "Login successful", token, username: cred[0].username });
      // res.redirect('/frontpage');
      console.log(token)
    }
  } catch (error) {
    console.error('Error:', error);
    res.status(500).json({ error: "Internal server error" });
  }
});

app.post("/api/v1/users/register", async (req, res) => {
  const { username, password } = req.body;
  console.log("Recieved POST request from register")
  try {
    // Check if the username already exists
    const existingUser = await checkCred(username);
    console.log(existingUser)
    if (existingUser.length > 0) {
      console.log("Username already exists")
      return res.status(400).json({ error: "Username already exists" });
    }

    // Create the new user
    await createUser(username, password);
    console.log(res)
    res.status(201).json({ message: "User registered successfully" });
  } catch (error) {
    console.error('Error:', error);
    res.status(500).json({ error: "Internal server error" });
  }
});

app.post("/api/v1/reviews", async (req, res) => {
  const {id, username, stars, review} = req.body;
  console.log(req.body)
  try {
    await createReview(id, username, stars, review);
    console.log(res);
    res.status(201).json({ message: "Review insert successfully" });
  } catch (error) {
    console.error('Error:', error);
    res.status(500).json({ error: "Internal server error" });
  }
});

app.get('/api/v1/reviews', async (req, res) => {
  let id = req.query.id;
  console.log(id)
  let review;
  review = await fetchReview(id) 
  console.log(review)
 try {
  if (review){
    res.json(review);
    // console.log(res)
        } else {
          res.status(404).json({ error: "No review found" });
        }}
 catch (error) {
  console.error('Error:', error);
  res.status(500).json({ error: "Internal server error" });
 }
})



app.get('^/$|/index(.html)?', (req, res) => {
  // res.sendFile(path.join(__dirname, './Powercoders2024_Frankho', 'index.html'))
  res.sendFile("./Powercoders2024_Frankho/index.html", { root: __dirname})
})

app.get('/oldpage(.html)?',(req, res) => {
  res.redirect(301, '/backend/Powercoders2024_Frankho/index.html') 
  // 302 by default
})

app.get('/qweqwe', (req, res) => {
  // res.sendFile(path.join(__dirname, './Powercoders2024_Frankho', 'index.html'))
  res.sendFile(path.join(__dirname, '..', 'frontend', 'src', 'Frontpage.js'))
})


app.get("/frontpage", authenticateToken, (req, res) => {
  res.sendFile("./Powercoders2024_Frankho/index.html", { root: __dirname})
});

app.get("/quiz", authenticateToken, (req, res, next) => {
  console.log("sending you to QUIZ GAME");
  // Call next() only if you have additional middleware or route handler
  next();
}, (req, res) => {
  res.redirect('http://localhost:3000/quiz'); // Redirect to the quiz URL
});


function authenticateToken(req, res, next) {
  const token = req.cookies.Token; //  the token is stored in a cookie named "Token"
  if (!token) return res.sendStatus(401);
  console.log(token)
  jwt.verify(token, JWT_SECRET, (err, user) => {
    if (err) return res.sendStatus(403);
    req.user = user;
    next(); // Call next to proceed to the next middleware or endpoint handler
  });
}



app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});

const express = require('express');
const mongoose = require('mongoose');
const cors = require("cors");
const app = express();
const settings = require('./settings');

//On utilise cors pour les éventuelles erreurs cors du navigateur.
app.use(cors());

mongoose.connect(settings.pathBdd,
  { useNewUrlParser: true,
    useUnifiedTopology: true })
  .then(() => console.log('Connexion à MongoDB réussie !'))
  .catch(() => console.log('Connexion à MongoDB échouée !'));


const employeesRoutes = require('./routes/employees');

// Middleware
app.use(express.json()); // Pour extraire le corps JSON des requêtes POST

app.use((req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content, Accept, Content-Type, Authorization');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH, OPTIONS');
  next();
});

// Routes
app.use('/api/employees', employeesRoutes);
app.get('/', (req, res, next) => {
  res.statusCode=200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Hello World');
});


module.exports = app;
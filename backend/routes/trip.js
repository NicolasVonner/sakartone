const express = require('express');

const router = express.Router();
const tripCtrl = require('../controllers/trip');

// Routes
router.get('/', tripCtrl.getAllTrips);
router.post('/', tripCtrl.createTrip);
// router.post('/login', userCtrl.login); 
// router.post('/by', userCtrl.getUsers);


module.exports = router;
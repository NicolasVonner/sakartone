const express = require('express');

const router = express.Router();
const userCtrl = require('../controllers/user');

// Routes
// router.get('/', userCtrl.getAllUsers);
// router.get('/:id', userCtrl.getOneUserById);
// router.post('/', userCtrl.createUser);
// router.post('/login', userCtrl.login);

router.get('/', userCtrl.getAllUsers);
router.post('/', userCtrl.createUser);
router.post('/login', userCtrl.login); 
router.post('/by', userCtrl.getUsers);


module.exports = router;
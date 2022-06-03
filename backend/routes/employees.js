const express = require('express');

const router = express.Router();
const employeesCtrl = require('../controllers/employees');

router.get('/', employeesCtrl.getAllEmployees);
router.get('/getOne/:id', employeesCtrl.getOneEmployees);
router.post('/create', employeesCtrl.createEmployees);
router.post('/delete/:id', employeesCtrl.deleteEmployees);
router.patch('/update/:id', employeesCtrl.updateEmployees);


module.exports = router;
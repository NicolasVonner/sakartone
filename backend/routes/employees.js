const express = require('express');

const router = express.Router();
const employeesCtrl = require('../controllers/employees');

router.get('/', employeesCtrl.getAllEmployees);
router.get('/', employeesCtrl.getOneEmployees);
router.post('/', employeesCtrl.createEmployees);
router.post('/', employeesCtrl.deleteEmployees);
router.patch('/', employeesCtrl.updateEmployees);


module.exports = router;
const Employees = require('../models/employees');
const ObjectId = require('mongodb').ObjectId;

exports.getAllEmployees = (req, res, next) => {
    Employees.find().then(
      (employees) => {
        res.status(200).json(employees);
      }
    ).catch(
      (error) => {
        res.status(400).json({
          error: error
        });
      }
    );
  };

exports.getOneEmployees = (req, res, next) => {
    const id = new ObjectId(req.params.id);
     Employees.findOne({_id: id}).then(
      (employees) => {
        res.status(200).json({employees})}
    ).catch(error => res.status(500).json({error: error}));
  };

exports.updateEmployees =  (req, res, next ) => {
    try {
      const id = new ObjectId(req.params.id);
      const employees = Employees.findOne({ _id: id });

      if (req.body.firstname) {
        employees.firstname = req.body.firstname
      }
      if (req.body.name) {
        employees.name = req.body.name
      }
      if (req.body.hiringDate) {
        employees.hiringDate = req.body.hiringDate
      }
      if (req.body.salary) {
        employees.salary = req.body.salary
      } 
      if (req.body.days) {
        employees.days = req.body.days
      } 
      if (req.body.team) {
        employees.team = req.body.team
      } 
       employees.save();
      res.status(200).json(employees)
    } catch {
      res.status(404)
    }
  };

exports.createEmployees = (req, res, next) => {
    const employees = new Employees({
      firstname: req.body.firstname,
      name: req.body.name,
      hiringDate: req.body.hiringDate,
      salary: req.body.salary,
      days: req.body.days,
      team: req.body.team
    });
    employees.save()
    .then(() => res.status(201).json({message: 'Nouvel employé créé'})).
    catch(error => res.status(400).json({error: error}));
}

exports.deleteEmployees = (req, res, next) => {
    const id = new ObjectId(req.params.id);
    Employees.deleteOne({_id: id})
    .then( () => res.status(201).json({message: 'Employé supprimé'})
    ).catch(error => res.status(400).json({error: error}));
}

exports.getEmployeesByDate = (req, res, next) => {
  var todayDay = new Date();
  weekday = new Array('Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi'),
	dayOfWeek = weekday[todayDay.getDay()],
  console.log(dayOfWeek);
  // Employees.find({days: dayOfWeek}).then(console.log(dayOfWeek));
}


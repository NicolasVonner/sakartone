const mongoose = require('mongoose');
const uniqueValidator = require('mongoose-unique-validator');

const employeesSchema = mongoose.Schema({
  firstname: { type: String, required: false },
  name: { type: String, required: false },
  hiringDate: { type: Date, default: Date.now, required: false}, //Convertir en string pour la base? -> cast sur le front?
  salary: { type: Number, min: 0, max: 70000, required: false }, //Convertir en string pour la base? -> cast sur le front?
  days: {type: Array,required: false },
  team: { type: Number, required: false }, //Id de la team.
});
employeesSchema.plugin(uniqueValidator);

module.exports = mongoose.model('employees', employeesSchema);
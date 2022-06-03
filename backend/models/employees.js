const mongoose = require('mongoose');
const uniqueValidator = require('mongoose-unique-validator');

const employeesSchema = mongoose.Schema({
  id: { type: Number, required: false },
  firstname: { type: String, required: false },
  name: { type: String, required: false },
  hiringDate: { type: Date, default: Date.now, required: false}, //Convertir en string pour la base? -> cast sur le front?
  salary: { type: Number, min: 1000, max: 70000, required: false }, //Convertir en string pour la base? -> cast sur le front?
  days: [{type: String,required: false }],
  team: { type: Number, required: false }, //Id de la team.
});
employeesSchema.plugin(uniqueValidator);

module.exports = mongoose.model('User', employeesSchema);
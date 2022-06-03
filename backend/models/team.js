const mongoose = require('mongoose');
const uniqueValidator = require('mongoose-unique-validator');

const temasSchema = mongoose.Schema({
  id_team: { type: Number, required: true },
  name: {type: String, required: true}
});
employeesSchema.plugin(uniqueValidator);

module.exports = mongoose.model('Teams', teamsSchema);
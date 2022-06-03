const mongoose = require('mongoose');
const uniqueValidator = require('mongoose-unique-validator');

const tripSchema = mongoose.Schema({
  name: { type: String, required: false },
  countrys: { type: Array, required: false },
  description: { type: String, required: false },
  departureDate: { type: String, required: true },
  endDate: { type: String, required: true },
  places: { type: Array, required: true },
});

tripSchema.plugin(uniqueValidator);

module.exports = mongoose.model('Trip', tripSchema);
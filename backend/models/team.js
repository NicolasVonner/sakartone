const teamRole = require('./team'); //Todo enum fonctionne en local mais pas ici.
const mongoose = require('mongoose');
const uniqueValidator = require('mongoose-unique-validator');

const teamSchema = mongoose.Schema({
  id: { type: Number,required: false }, //Convertir en string pour la base? -> cast sur le front?
  name: { type: String, required: true, enum: [ Team.CARTON, Team.SCOTCH, Team.CLIENT ], default: Team.DEFAULT },
});

//Enum des equipes 
const Team = Object.freeze({//TODO importer l'objet depuis aileur.
  CARTON : 'carton',
  SCOTCH :'scotch',
  CLIENT : 'client',
  DEFAULT : 'client'
});
teamSchema.plugin(uniqueValidator);

module.exports = mongoose.model('Team', teamSchema);
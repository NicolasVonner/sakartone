const Trip = require('../models/trip');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const { json } = require('express');
var ObjectId = require('mongodb').ObjectID;

// exports.getOneUser = (req, res, next) => {
//   User.findOne({
//       _id: req.params.id
//   }).then(
//     () => {
//       res.status(200).json(user);
//     }
//   ).catch(
//     (error) => {
//       res.status(400).json({
//         error: error
//       });
//     }
//   );
// };

exports.getTrips = (req, res, next) => {
  //On formate l'objet qui arrive pour enlever les champs vide ou nuls.
  buildUserSchema(req.body);
  Trip.find(req.body).then(
    (trips) => {
      res.status(200).json(trips);
    }
  ).catch(
    (error) => {
      res.status(400).json({
        error: error
      });
    }
  );
};

exports.getAllTrips = (req, res, next) => {
  Trip.find().then(
    (trips) => {
      res.status(200).json(trips);
    }
  ).catch(
    (error) => {
      res.status(400).json({
        error: error
      });
    }
  );
};

exports.createTrip = (req, res, next) => {
const trip = new Trip({
    name: req.body.name,
    countrys: req.body.countrys,
    description: req.body.description,
    departureDate: req.body.departureDate,
    endDate: req.body.endDate,
    places: req.body.places,
  });
  console.log("On est en train de créer un trip qui est =>" +JSON.stringify(req.body));
  // if(req.body._id!= undefined){
  //   trip.update( { _id: req.body._id },trip )
  //   .then(() => res.status(201).json({message: 'Nouveau trip créé'})).
  //   catch(error => res.status(400).json({error: error}));
  // }
//   const filter = { "_id": new ObjectId(req.body._id)};
//   console.log("IDDDDDDDDDDDDDDD=>"+JSON.stringify(filter));
//   const update = { "places": req.body.places,};

// // `doc` is the document _before_ `update` was applied
// trip.updateOne(filter,{$set:trip}, update,(err)=>{
//   if(err) return res.status(200).json({
//       error: true,
//       code: 115,
//       message: "Erro to update user!"
//   })
// });

 //backup
  trip.save()
  .then(() => res.status(201).json({message: 'Nouveau trip créé'})).
  catch(error => res.status(400).json({error: error}));
};
exports.createUser = (req, res, next) => {
  bcrypt.hash(req.body.password, 10)
  .then(hash => {
  const user = new User({
    firstname: req.body.firstname,
    name: req.body.name,
    phonenumber: req.body.phonenumber,
    email: req.body.email,
    password: hash,
  });
  user.save()
  .then(() => res.status(201).json({message: 'Nouvel utilisateur créé'})).
  catch(error => res.status(400).json({error: error}));
})
.catch(error => res.status(500).json({error: error}));
};

//Enlève les champs vides ou nuls.
const buildTripSchema = (objetTrip)=>{
  for (var propName in objetTrip) { 
    if (objetTrip[propName] === null || objetTrip[propName] === undefined || objetTrip[propName] === "") {
      delete objetTrip[propName];
    }
  }
}

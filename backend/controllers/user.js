// const User = require('../models/user');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

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

exports.getUsers = (req, res, next) => {
  //On formate l'objet qui arrive pour enlever les champs vide ou nuls.
  buildUserSchema(req.body);
  User.find(req.body).then(
    (users) => {
      res.status(200).json(users);
    }
  ).catch(
    (error) => {
      res.status(400).json({
        error: error
      });
    }
  );
};

exports.getAllUsers = (req, res, next) => {
  User.find().then(
    (users) => {
      res.status(200).json(users);
    }
  ).catch(
    (error) => {
      res.status(400).json({
        error: error
      });
    }
  );
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

exports.login = (req, res, next) => {
  User.findOne({ email: req.body.email })
    .then(user => {
      if (!user) {
        return res.status(401).json({ error: 'Aucun utilisateur n\'est enregistré avec cet email' });
      }
      bcrypt.compare(req.body.password, user.password)
        .then(valid => {
          if (!valid) {
            return res.status(401).json({ error: 'Le mot de passe saisi est incorrect' });
          }
          res.status(200).json({
            userId: user._id,
            token: jwt.sign(
              { userId: user._id },
              'RANDOM_TOKEN_SECRET',
              { expiresIn: '24h' }
            )
          });
        })
        .catch(error => res.status(500).json({ error }));
    })
    .catch(error => res.status(500).json({ error }));
};

//Enlève les champs vides ou nuls.
const buildUserSchema = (objetUser)=>{
  for (var propName in objetUser) { 
    if (objetUser[propName] === null || objetUser[propName] === undefined || objetUser[propName] === "") {
      delete objetUser[propName];
    }
  }
  //On supprime le password.
  if(objetUser['password'] != undefined)
    delete objetUser['password'];
}

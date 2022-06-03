//Changer les paramètres de configuration principaux deu serveur ici.

//Functions.
const normalizePort = val => {
  const port = parseInt(val, 10);

  if (isNaN(port)) {
    return val;
  }
  if (port >= 0) {
    return port;
  }
  return false;
};

//Variables export.
const port = normalizePort(process.env.PORT || '3000');
const pathBdd = 'mongodb+srv://root:root@clustersakartone.mukm4mx.mongodb.net/?retryWrites=true&w=majority';




module.exports = {
  port: port,
  pathBdd: pathBdd
}
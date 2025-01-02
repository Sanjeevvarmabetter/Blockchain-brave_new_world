const math = require('mathjs');

const a = math.matrix([4,2],[1,3]);

const eig = math.eig(a);

console.log("EigenValues are :", eig.values);
console.log("EigenVectors are :",eig.vector);



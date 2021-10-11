const path = require('path');
const fs = require('fs');

const mainController = {
    index: (req,res) => {
        let products = JSON.parse(fs.readFileSync(path.resolve(__dirname, '../data/products.json')));
        res.render(path.resolve(__dirname,'../views/main/index'), {
            title:"Home",
            products
        });
    },

    contact: (req,res) => {
        res.render(path.resolve(__dirname,'../main/contact'), {
            title:"Contacto",
        });
    },
    
}


module.exports = mainController

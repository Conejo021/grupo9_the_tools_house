const path = require('path');
const fs = require('fs');

const adminController = {
    index: (req,res) => {
        let products = JSON.parse(fs.readFileSync(path.resolve(__dirname, '../data/products.json')));
        res.render(path.resolve(__dirname,'../views/admin/admin'), {title: "Administrar", products});
    },
    create: (req,res) => {
        let products = JSON.parse(fs.readFileSync(path.resolve(__dirname, '../data/products.json')));
        res.render(path.resolve(__dirname, '../views/admin/create'), {title: "Crear"});
    },
    save: (req,res) => {
        let products = JSON.parse(fs.readFileSync(path.resolve(__dirname, '../data/products.json')));
        let lastProduct = products.pop();
        products.push(lastProduct);
        let newProduct = {
            id: lastProduct.id +1,
            nombre: req.body.nombre,
            descripcion: req.body.descripcion,
            origen: req.body.origen,
            precio: req.body.precio,
            descuento: req.body.descuento,
            imagen: req.file.filename
        }

        products.push(newProduct);
        let newProductSave = JSON.stringify(products,null,2);
        fs.writeFileSync(path.resolve(__dirname, '../data/products.json'), newProductSave);
        res.redirect('/admin');
    }, 
    show: (req,res) => {
        let products = JSON.parse(fs.readFileSync(path.resolve(__dirname, '../data/products.json')));
        let myProduct;
        products.forEach(product => {
            if(product.id == req.params.id) {
                myProduct = product;
            }
            
        });

        res.render(path.resolve(__dirname, '../views/admin/detail'), {
            title: "Product", 
            myProduct});
    },

    edit: (req,res) => {
        let products = JSON.parse(fs.readFileSync(path.resolve(__dirname, '../data/products.json')));
        let productEdit = products.find(product=> product.id == req.params.id);


        res.render(path.resolve(__dirname, '../views/admin/edit'), {
            title: "Edit",
            productEdit
        });

    },

    update: (req,res) => {
        let products = JSON.parse(fs.readFileSync(path.resolve(__dirname, '../data/products.json')));
        req.body.id = req.params.id;
        req.body.imagen = req.file ? req.file.filename : req.body.oldImagen;
        let productUpdate = products.map(product => {
            if(product.id == req.body.id) {
                return product = req.body;
            }
            return product;
        })
        let productActualziar = JSON.stringify(productUpdate, null,2);
        fs.writeFileSync(path.resolve(__dirname, '../data/products.json'), productActualziar);
        res.redirect('/admin');
    },

    destroy: (req,res) => {
        let products = JSON.parse(fs.readFileSync(path.resolve(__dirname, '../data/products.json')));
        const productDeleteId = req.params.id;
        const productsFinal = products.filter(product => product.id != productDeleteId);
        let productsSave = JSON.stringify(productsFinal,null,2);
        fs.writeFileSync(path.resolve(__dirname, '../data/products.json'), productsSave);
        res.redirect('/admin');
    }

}

module.exports = adminController;
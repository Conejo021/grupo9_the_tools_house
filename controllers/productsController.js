const productsController = {
    todos: (req,res) => {
        res.render('products/products', {title : 'Todos los productos'
    
    
        })
    },

    detalle: (req,res) => {
        let producto = req.params.id;

        res.render('products/detail', {title : 'Detalle de producto' + ' ' + producto, 
           
        })
    },
    
    nuevo: (req,res) => {
        res.render('products/new', {title : 'Agregar producto'
    
        })
    },

    carrito: (req,res) => {
        res.render('products/productCart', {title : 'Carrito de compras'
    
        })
    },

}

module.exports = productsController


module.exports = (sequelize, dataTypes) => {
    let alias = "Producto";
  
    let cols = {
      id: {
        type: dataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
      },
      nombre: {
        type: dataTypes.STRING,
        allowNull: false,
      },
      descripcion: {
        type: dataTypes.STRING,
        allowNull: false,
      },
      precio: {
        type: dataTypes.DECIMAL(10, 0),
        allowNull: false,
      },
      
      },
    };
  
    let config = {
      tableName: "productos",
      timestamps: true,
    };
  
    const Producto = sequelize.define(alias, cols, config);
  
    Producto.associate = (models) => {
      // Categories
      Producto.belongsTo(models.Marca, {
        as: "marcas",
        foreignKey: "id_marcas",
      });
  
    return Product;
    }
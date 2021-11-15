module.exports = (sequelize, dataTypes) => {
    let alias = "Marca";
  
    let cols = {
      id: {
        type: dataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        allowNull: false,
      },
      nombre: {
        type: dataTypes.STRING,
        unique: true,
        allowNull: false,
      },
      origen: {
        type: dataTypes.STRING,
        allowNull: false,
      },
    };
    let config = {
      tableName: "marcas",
      timestamps: true,
      deletedAt: false,
    };
  
    const Marca = sequelize.define(alias, cols, config);
  
    Marca.associate = (models) => {
      // Productos
      Marca.hasMany(models.Producto, {
        as: "products",
        foreignKey: "brand_id",
      });
    };
  
    return Marca;
  };
  
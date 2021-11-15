module.exports = (sequelize, dataTypes) => {
    let alias = "Admin";
  
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
      apellido: {
        type: dataTypes.STRING,
        allowNull: false,
      },
      legajo: {
        type: dataTypes.INTEGER,
        allowNull: false,
        unique: true,
      },
      
    };
  
    let config = {
      tableName: "admin",
      timestamps: true,
    };
  
    const Admin = sequelize.define(alias, cols, config);
  
    Admin.associate = (models) => {    
      Admin.belongsTo(models.Producto, {
        as: "productos",
        foreignKey: "id_producto",
      });
      Admin.belongsTo(models.Cliente, {
        as: "clientes",
        foreignKey: "id_clientes",
      });
         
    return Admin;

  };
}

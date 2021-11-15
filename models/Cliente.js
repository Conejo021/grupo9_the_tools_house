module.exports = (sequelize, dataTypes) => {
    let alias = "Cliente";
  
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
      DNI: {
        type: dataTypes.INTEGER,
        allowNull: false,
        unique: true,
      },
      telefono: {
        type: dataTypes.INTEGER,
        allowNull: false,
        unique: true,
      },
      direccion: {
        type: dataTypes.STRING,
        allowNull: false,
        unique: false,
      },
      Cantidad: {
        type: dataTypes.INTEGER,
        allowNull: false,
        unique: false,
      },
      Imagen: {
        type: dataTypes.STRING,
        allowNull: true,
        unique: false,
      },
    };
  
    let config = {
      tableName: "clientes",
      timestamps: true,
    };
  
    const Cliente = sequelize.define(alias, cols, config);
  
    Cliente.associate = (models) => {
      // Roles
      Cliente.belongsTo(models.Producto, {
        as: "productos",
        foreignKey: "id_producto",
      });
  
    return User;
  };
}
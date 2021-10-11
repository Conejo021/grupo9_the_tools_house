const bcryptjs = require('bcryptjs');
const { validationResult } = require('express-validator');

const User = require('../models/User');

const usersController = {
    register: (req,res) => {
        res.render('users/register', {title : 'Registro'
    
        })
    },

    processRegister: (req,res) => {
        const resultValidations = validationResult(req);

        if (resultValidations.errors.length > 0) {
            return res.render('users/register', {
                errors: resultValidations.mapped(),
                oldData: req.body
            });
        }
        
        let userInDB = User.findByField('email', req.body.email);
        if (userInDB) {
            return res.render('users/register', {
                errors: {
                    email: {
                        msg: 'Este email ya está registrado'
                    }
                },
                oldData: req.body
            });
        }

        let userToCreate = {
            ...req.body,
            password: bcryptjs.hashSync(req.body.password, 10),
            confirm_password: bcryptjs.hashSync(req.body.confirm_password, 10),
            avatar: req.file.filename
        }

        User.create(userToCreate);
        return res.redirect('../users/profile')
    },

    login: (req,res) => {
        res.render('users/login', {title : 'Iniciar sesión'
    
        })
    },

    loginProcess: (req,res) => {
        let userToLogin = User.findByField('email', req.body.email);
        
        if (userToLogin) {
            let passwordOk = bcryptjs.compareSync(req.body.password, userToLogin.password);
            if (passwordOk) {
                delete userToLogin.password;
                req.session.userLogged = userToLogin;
                    
                if(req.body.remember_user){
                    res.cookie('email',userToLogin.email,{maxAge: 1000 * 60 * 60 * 24})
                }
                                
                return res.redirect('../users/profile')
            }

            return res.render('users/login', {
            errors: {
                password: {
                    msg: 'Las credenciales son inválidas'
                },
                
            }
        }
        )}

        return res.render('users/login', {
            errors: {
                email: {
                    msg: 'No se encuentra este email en nuestra base de datos'
                },
            }
        });
    },

   profile: (req, res) => {
		return res.render('users/profile', {
			userLogged: req.session.userLogged
		});
	},
    
    logout: (req, res) => {
        res.clearCookie('userEmail');
        req.session.destroy();
        return res.redirect('../');
    }
}


module.exports = usersController
import 'package:flutter/services.dart';

import '../models/exception.dart';
import '../providers/authprov.dart';

import 'reinitialisation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum AuthMode { Signup, Login }

class Connect extends StatefulWidget {
  static const routeName = '/Connect';
  @override
  _ConnectState createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
  final _passwordController = TextEditingController();

  final _form = GlobalKey<FormState>();
  AuthMode _authMode = AuthMode.Login;
  var _isLoading = false;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
    'phone': '',
    'fistname': '',
    'lastname': '',
  };
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(
          child: Text(
            'Oups !',
            style: TextStyle(
              color: Colors.teal,
              fontSize: 28,
              fontFamily: 'GloriaHallelujah',
            ),
          ),
        ),
        content: Container(
          height: 164,
          child: Column(
            children: [
              Text(
                message,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'okay',
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 21,
                    fontFamily: 'GloriaHallelujah',
                  ),
                ),
              ),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(350)),
      ),
    );
  }

  Future<void> _saveForm() async {
    if (!_form.currentState.validate()) {
      // Invalid!
      return;
    }
    _form.currentState.save();
    setState(() {
      _isLoading = true;
    });
    if (_authMode == AuthMode.Login) {
      try {
        await Provider.of<Auth>(context, listen: false).logIn(
          _authData['email'],
          _authData['password'],
        );
      } on HttpException catch (error) {
        var errorMessage = 'échec d\'authentification';
        if (error.toString().contains('email/password')) {
          errorMessage = 'Le mot de passe est incorrect !!, Réessayer svp';
        }
        if (error.toString().contains('username/password!')) {
          errorMessage =
              ' Il\'y a Pas encore un compte avec cette adresse E-mail !!, faite le tout d\'abord !';
        }
        _showErrorDialog(errorMessage);
      } catch (error) {
        const errorMessage = 'échec, réessayer plus tard svp';
        _showErrorDialog(errorMessage);
      }
    } else {
      // Sign user up
      try {
        await Provider.of<Auth>(context, listen: false).signUp(
          _authData['email'],
          _authData['password'],
          _authData['phone'],
          _authData['firstname'],
          _authData['lastname'],
        );
      } on HttpException catch (error) {
        var errorMessage = 'échec d\'authentification';
        if (error.toString().contains('duplicate key')) {
          if (error.toString().contains('phone_1 dup key')) {
            errorMessage =
                'Ce numéro est déja utilisé, réessayer avec un autre svp..';
          }
          if (error.toString().contains('email')) {
            errorMessage =
                'Cette adresse E-mail est déja utilisée, réessayer avec une autre svp..';
          }
        }
        _showErrorDialog(errorMessage);
      } catch (error) {
        const errorMessage = 'échec, réessayer plus tard svp';
        _showErrorDialog(errorMessage);
      }
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  final _confpasswordFocusNode = FocusNode();
  final _telephoneFocusNode = FocusNode();
  final _prenomFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _telephoneFocusNode.dispose();
    _prenomFocusNode.dispose();
    _emailFocusNode.dispose();

    super.dispose();
  }

  Color firstColor = Colors.teal;

  Color secondColor = Colors.teal[300];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            ClipPath(
              clipper: CustomShapeClipper(),
              child: Stack(
                children: [
                  Container(
                    color: Colors.teal,
                    height: MediaQuery.of(context).size.height * 0.5,
                  ),
                  Opacity(
                    opacity: 0.3,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://i2.wp.com/happy-yummy.fr/wp-content/uploads/2020/05/person-holding-brown-wooden-chopsticks-with-green-vegetable-3622476.jpg?resize=768%2C1152&ssl=1'),
                            fit: BoxFit.fitWidth),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListView(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Bienvenue chez',
                              style: TextStyle(
                                  fontFamily: 'KiteOne',
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Happy Yummy',
                              style: TextStyle(
                                  fontFamily: 'GloriaHallelujah',
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 310,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://i0.wp.com/happy-yummy.fr/wp-content/uploads/2020/03/LOGO2020_HAPPY_YUMMY_RVB.png?fit=100%2C100&ssl=1'),
                            fit: BoxFit.contain),
                      ),
                    ),
                  ],
                ),
                _authMode == AuthMode.Signup
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height * 0.09,
                      )
                    : SizedBox(
                        height: MediaQuery.of(context).size.height * 0.16,
                      ),
                Container(
                  child: Form(
                    key: _form,
                    child: Column(
                      children: [
                        _authMode == AuthMode.Signup
                            ? Text(
                                'Créer un compte',
                                style: TextStyle(
                                    fontFamily: 'KiteOne',
                                    color: Colors.teal,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                              )
                            : Text(
                                'Se connecter',
                                style: TextStyle(
                                    fontFamily: 'KiteOne',
                                    color: Colors.teal,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                              ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        if (_authMode == AuthMode.Signup)
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [firstColor, secondColor],
                              ),
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            child: TextFormField(
                              onSaved: (value) {
                                _authData['firstname'] = value;
                              },
                              textInputAction: TextInputAction.next,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10),
                                border: InputBorder.none,
                                icon: Icon(Icons.perm_identity),
                                hintText: "Nom",
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'saisir votre nom svp';
                                }

                                return null;
                              },
                              onFieldSubmitted: (_) {
                                FocusScope.of(context)
                                    .requestFocus(_prenomFocusNode);
                              },
                            ),
                          ),
                        if (_authMode == AuthMode.Signup)
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                        if (_authMode == AuthMode.Signup)
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [firstColor, secondColor],
                              ),
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if (value.length < 2) {
                                  return 'vous devez saisir votre prénom';
                                }
                                return null;
                              },
                              focusNode: _prenomFocusNode,
                              onFieldSubmitted: (_) {
                                FocusScope.of(context)
                                    .requestFocus(_telephoneFocusNode);
                              },
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              onSaved: (value) {
                                _authData['lastname'] = value;
                              },
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10),
                                border: InputBorder.none,
                                icon: Icon(Icons.person_pin),
                                hintText: "Prénom",
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'KiteOne',
                                ),
                              ),
                            ),
                          ),
                        if (_authMode == AuthMode.Signup)
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.017,
                          ),
                        if (_authMode == AuthMode.Signup)
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [firstColor, secondColor],
                              ),
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if (value.length < 7 && value.length > 14) {
                                  return 'vous devez saisir au moins 8 entiers';
                                }
                                return null;
                              },
                              focusNode: _telephoneFocusNode,
                              onFieldSubmitted: (_) {
                                FocusScope.of(context)
                                    .requestFocus(_emailFocusNode);
                              },
                              onSaved: (value) {
                                _authData['phone'] = value;
                              },
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.phone,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10),
                                border: InputBorder.none,
                                icon: Icon(Icons.call),
                                hintText: "Télephone",
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'KiteOne',
                                ),
                              ),
                            ),
                          ),
                        if (_authMode == AuthMode.Signup)
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [firstColor, secondColor],
                            ),
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: TextFormField(
                            focusNode: _emailFocusNode,
                            onFieldSubmitted: (_) {
                              FocusScope.of(context)
                                  .requestFocus(_passwordFocusNode);
                            },
                            onSaved: (value) {
                              _authData['email'] = value;
                            },
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value.isEmpty || !value.contains('@')) {
                                return 'Invalid email!';
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.next,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 10),
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.email,
                              ),
                              hintText: "Adresse Email",
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'KiteOne',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.017,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [firstColor, secondColor],
                            ),
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: TextFormField(
                            controller: _passwordController,
                            validator: (value) {
                              if (value.isEmpty || value.length < 5) {
                                return 'vous devez saisir au moins 5 caractéres';
                              }
                              return null;
                            },
                            focusNode: _passwordFocusNode,
                            onSaved: (value) {
                              _authData['password'] = value;
                            },
                            textInputAction: TextInputAction.done,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            obscureText: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 10),
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.lock,
                              ),
                              hintText: "Mot de passe",
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'KiteOne',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (_authMode == AuthMode.Signup)
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.017,
                  ),
                if (_authMode == AuthMode.Signup)
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [firstColor, secondColor],
                      ),
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: TextFormField(
                      enabled: _authMode == AuthMode.Signup,
                      validator: _authMode == AuthMode.Signup
                          ? (value) {
                              if (value != _passwordController.text) {
                                return 'incorrecte, réessayer !';
                              }
                              return null;
                            }
                          : null,
                      focusNode: _confpasswordFocusNode,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.lock,
                        ),
                        hintText: "Confirmer mot de passe",
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'KiteOne',
                        ),
                      ),
                    ),
                  ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.017,
                ),
                Center(
                  child: Column(
                    children: [
                      if (_isLoading)
                        CircularProgressIndicator()
                      else
                        FloatingActionButton(
                          heroTag: '16',
                          child: Icon(
                            Icons.account_circle,
                          ),
                          backgroundColor: Colors.teal,
                          onPressed: _saveForm,
                        ),
                      if (_authMode == AuthMode.Login)
                        FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Reset()));
                            },
                            child: Text(
                              'mot de passe oublié ?',
                              style: TextStyle(
                                fontFamily: 'KiteOne',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                      if (_authMode == AuthMode.Signup)
                        SizedBox(
                          height: 15,
                        ),
                      if (_authMode == AuthMode.Signup)
                        Text('Vous avez déja un compte ?'),
                      FlatButton(
                        onPressed: _switchAuthMode,
                        child: Text(
                          _authMode == AuthMode.Login
                              ? 'créer un compte'
                              : 'Se connecter',
                          style: TextStyle(
                              fontFamily: 'KiteOne',
                              color: Colors.teal,
                              fontSize: 27,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height);

    var firstEndPoint = Offset(size.width * .43, size.height * 0.58);
    var firstControlpoint = Offset(size.width * 0.1, size.height * 0.61);
    path.quadraticBezierTo(firstControlpoint.dx, firstControlpoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width * .8, size.height * -0.15);
    var secondControlPoint = Offset(size.width * .7, size.height * 0.56);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width * .8, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}


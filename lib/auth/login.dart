import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation <double> _animation;
  late TextEditingController _emailController = TextEditingController(text: '');
  late TextEditingController _passwordController = TextEditingController(text: '');
  bool _obsecureText= true;




  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    _animationController= AnimationController(vsync: this, duration: Duration(seconds: 20));
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.linear)..addListener(() {
      setState(() {

      });
    })..addStatusListener((animationStatus) {
      if(animationStatus== AnimationStatus.completed){
        _animationController.reset();
        _animationController.forward();
      }
    });
    _animationController.forward();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
body: Stack(
children: [
  CachedNetworkImage(
    imageUrl: "https://cdn.pixabay.com/photo/2014/12/16/22/25/woman-570883_960_720.jpg",
    placeholder: (context, url) => Image.asset("images/01.jpg"),
    errorWidget: (context, url, error) => Icon(Icons.error),
    height: double.infinity,
    width: double.infinity,
    fit: BoxFit.cover,
    alignment: FractionalOffset(_animation.value,0),
  ),
  Padding(
      padding:EdgeInsets.symmetric(horizontal: 16),
    child: ListView(
      children: [
        SizedBox(height:size.height*0.1 ,),
        Text('login', style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.lightBlue),),
        SizedBox(height: 10,),
        RichText(text: TextSpan(
          text: "Don't have an account", style:TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color:Colors.white ),
        ),
        ),
        SizedBox(height: 40,),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          controller: _emailController,
          style: TextStyle(color: Colors.orangeAccent),
          decoration: InputDecoration(
            hintText: 'Email',
            hintStyle: TextStyle(color: Colors.white),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
        ),
        SizedBox(height: 20,),
        TextFormField(
          obscureText:_obsecureText ,
          validator: (value){
            if(value!.isEmpty || value.length<7){
              return 'please enter valid password';
            }else{
              return null;
            }
          },
          //controller: _passwordController,
          style: TextStyle(color: Colors.orangeAccent),
          decoration: InputDecoration(
            hintText: 'Password',
            hintStyle: TextStyle(color: Colors.white),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
        ),
        FlatButton(
            onPressed: (){},
            child: Text('Submit', style: TextStyle(fontSize: 28, color: Colors.green,),),
        ),

      ],
    ),
  )
],
),
    );
  }
}

import 'package:flutter/material.dart';
import '../util/auth/googleAuth.dart';

class SignInButton extends StatefulWidget{
  const SignInButton({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;
  
  @override
  State<StatefulWidget> createState() {
    return new _SignInButtonState();
  }
}

class _SignInButtonState extends State<SignInButton>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: (){
        signInWithGoogle().whenComplete((){
          print('Sign in successful');
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/icons/google_icon.png', height: 22, width: 22,),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text("Sign in with Google",
              style: TextStyle(
                fontSize: 14.0
              ),),
            )
          ],
        ),
      ),
    );
  }
}
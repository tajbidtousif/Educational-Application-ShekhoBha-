import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'signIn.dart';

class lonIn extends StatefulWidget {
  const lonIn({Key? key}) : super(key: key);

  @override
  State<lonIn> createState() => _lonInState();
}

class _lonInState extends State<lonIn> {

  bool _secureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
            child: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children:
            [
              const SizedBox(height: 50,),

             Text(
                'ShekhoBha!', style:
              GoogleFonts.bebasNeue(
                fontSize: 40,
                color: Colors.deepPurple
              ),
              ),

              const SizedBox(height: 10),

                Text(
                'Know-Ask-Learn-Grow',
                style: GoogleFonts.bebasNeue(
                  fontSize:20,

              ),
              ),


               SizedBox(height: 25),


              //------------------- email text field-------------------


            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),

              child: Container(

              decoration: BoxDecoration(
                color: Colors.grey[200],

              border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(20)
              ),


             child: const Padding(

                 padding:  EdgeInsets.symmetric(horizontal: 22.0),
             child: TextField(
               textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Username or E-mail',
                  icon: Icon(Icons.email),

                ),
              )
             )
            )
            ),

            const SizedBox(height: 10,),

              //--------------- Password Text Field--------------------


              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),

                  child: Container(

                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(20)
                      ),


                      child:  Padding(

                          padding:  EdgeInsets.symmetric(horizontal: 22.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',

                              suffixIcon: IconButton(
                                icon: Icon(_secureText ? Icons.remove_red_eye: Icons.security),
                                onPressed: (){
                                  setState(() {
                                    _secureText =! _secureText;
                                  });
                                },
                              )
                            ),
                            obscureText: _secureText,
                          )
                      )
                  )
              ),

              const SizedBox(height: 20,),

//------------- Sign In Button -------------------

               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 100.0),



                 child: Container(
                   padding: const EdgeInsets.all(10),
                   decoration: BoxDecoration(color: Colors.deepPurple,
                     borderRadius: BorderRadius.circular(12),


                   ),
                   child:  MaterialButton(
                     onPressed: () {  },
                     child: Text('Sign In',
                       style: TextStyle(color: Colors.white,
                         fontWeight: FontWeight.bold,
                         fontSize: 18,
                       ),
                     ),
                   ),
                 ),
               ),


              const SizedBox(height: 20,),



              TextButton(
                onPressed: (){

                },
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ),

              const SizedBox(height: 10,),

              //-------------Don't have an account? ------------------

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const Text('Don\'t have an account?'),
                  const SizedBox(width: 5,),
                  TextButton(
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => signIn()));
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ),

                ],
              )


            ],
          ),
        )

        )
    );
  }
}

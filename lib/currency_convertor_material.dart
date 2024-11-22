import 'package:flutter/material.dart';

/**steps of how we are going to proceed with the app so the steps are following 
 * 1. create the variable that stores the converted currency value
 * 2. create a function that convert the USD
 * 3. store the value of the converted that we have created 
 * 4. display it 
 */
class CurrencyConvertorMaterialpage extends StatefulWidget {
  const CurrencyConvertorMaterialpage({super.key});
  @override
  State<CurrencyConvertorMaterialpage> createState() {
    return _currencyconvertormaterialstate();
  }
}

// ignore: camel_case_types
class _currencyconvertormaterialstate
    extends State<CurrencyConvertorMaterialpage> {
  final TextEditingController textEditingController = TextEditingController();
  /**
  all of them have to be disposed off because of the data leaks so we can use dispose so we can use dispose method for it 
    */
  /**
  putting the texteditting controller out of the widget since we are keeping the widget builderlight wt 
  so to avoid the lag in the UI we will keep the build function as simple as possible  */
  double result = 0;
  // ignore: slash_for_doc_comments
  /**
  we just have to take this texteditingcontroller ans paste it inside the text field */
  /*int result = 0; we cant put it here since we are exetndng the stateless widget which says that the state is 
  immutable so we cannot provide it here but we can initialze this varialbe inside the build function*/
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("rebuilt");
  }

  @override
  Widget build(BuildContext context) {
    //we can put the mutable value inside the build context
    /*instead of createing and using the border everywhere in the scaffold we have ccrea
  the border variable and assigned all the functionalities to it */
    final border = OutlineInputBorder(
      //this is the border this only
      /*in flutter the color in basically in the hec format  */
      borderSide: const BorderSide(
        color: Colors.black,
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(40),
    );
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0,
          title: const Center(
              child: Text(
            "Currency Convertor",
            style: TextStyle(color: Colors.white),
          )),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'INR : ${result.toString()}₹',
              style: const TextStyle(
                  fontSize: 45.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            /*padding and container widget */
            Container(
              /*usually text field takes the entire width provided but here we are resticting the width  using padding
             */
              //**now in place of padding we can use container also it provides additional things such as alignment and many more features
              // */
              /*diffrence between padding and margin
               
                                  -> difference between padding and margin 
                    spacing between the txt and the container box in called padding 

                    margin is related to the stuff related to the outside of the container and whereas the padding Is the thing which is related to the insde of the container .*/
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: textEditingController,
                /**now through this textedditing controller we have acess to all the input of the user and we can use that in anywhere of
                 * our code
                 */
                //the first thing that we have to add is hint
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  /*inputdecoration is related to how you want to decorate the text field and what
                are the ui things you want in your app */
                  hintText: 'Please enter the amount in USD',
                  hintStyle: const TextStyle(color: Colors.black),
                  prefixIcon: const Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors
                      .black, //prefix and suffix are used to add the items in the starting or in
                  //the ending
                  /*instead of having icon at the left hand side now you hava  the icon at the right hand side 
                   */
                  filled: true,
                  /*first we have to mark true that yess we are going to color the text field  */
                  fillColor: Colors.white,
                  focusedBorder: border,
                  /*purpose of this field in to highlight the text field and show that it is active  */
                  enabledBorder:
                      border, /*purpose of this enableborder is to keep the text field and same and make sure that the field 
                  dont get render when clicked again  */
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: true,
                ),
              ),
            ),
            //now lets add the button in our app
            /**this button will be used to convert the currency
             * 
             */
            //raised button
            //appears like text button
            /**elevated button was prev called raised button but now called elevated and similarlt textbutton was calle 
             * the flatbutton
             */
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                //elevated button ka elevation will go in the style
                onPressed: () {
                  /**there are three kind of modes are in flutter 
                     * debug 
                     * release 
                     * profile
                     */
                  // print(textEditingController.text);
                  // print(double.parse(textEditingController.text) *
                  //     84.45);
                  /**double.parse converts the string into double
                  and integer.parse coverts string into integer */
                  /**now since we are getting the converted value we just have to save this value in the result 
                   * 
                   */
                  // build(context); //recalling the rebuild function for the value to get displayed in the UI
                  setState(() {
                    /**this set state here is basically triggering the rebuild function and
                  building the state again since it is stateful widget so it will render again  */
                    result = double.parse(textEditingController.text) * 84.45;
                  });
                },
                style: ElevatedButton.styleFrom(
                    /*in this way also we can provide styling to the button which is easy yo 
                  implement and also easy to remember*/
                    //since this is the function it wont require const function now in this we can define all the thinfs
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    elevation: 15.0,
                    maximumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                // style: ButtonStyle( //instead of button and everything we can use txtbutton style forms also
                //   elevation: const WidgetStatePropertyAll(15.0), //as we can see it gave some sort of elevation to the button some kind of 3Dnesss
                //     backgroundColor: const WidgetStatePropertyAll(Colors.black),
                //     foregroundColor: const WidgetStatePropertyAll(Colors.purple),
                //     maximumSize: const WidgetStatePropertyAll(Size(double.infinity, 50)),
                //     /**now we are going to give the shape to the button

                //      */
                //     shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10),
                //     )),
                //     /**remember to change the color in the button use foreground color and not the style text
                //      *  */ /**materialstatepropertyall is depreceated */
                //     ), //all the properties should be above the child property //because of the readablity of hecode
                /**we have used a lambda function here as it is the nothing function it wont do anything */
                child: const Text("Convert"),
              ),
            ), //now we will add the styling to the button
            /**this button contains the two arguments 
            first is the on pressed which ask for the fucntion that the button  should do when on pressed 
            the second button is used to specify what are the contents that we are giving to the button */
          ],
        )));
  }
}

// class CurrencyConvertorMaterialPage extends StatelessWidget {
//   CurrencyConvertorMaterialPage({super.key});
//   final TextEditingController textEditingController = TextEditingController();
//   /**
//   we just have to take this texteditingcontroller ans paste it inside the text field */
//   /*int result = 0; we cant put it here since we are exetndng the stateless widget which says that the state is
//   immutable so we cannot provide it here but we can initialze this varialbe inside the build function*/
//   @override
//   Widget build(BuildContext context) {
//     double result = 0; //we can put the mutable value inside the build context
//     /*instead of createing and using the border everywhere in the scaffold we have ccrea
//   the border variable and assigned all the functionalities to it */
//     final border = OutlineInputBorder(
//       //this is the border this only
//       /*in flutter the color in basically in the hec format  */
//       borderSide: const BorderSide(
//         color: Colors.black,
//         width: 2.0,
//         style: BorderStyle.solid,
//       ),
//       borderRadius: BorderRadius.circular(40),
//     );
//     // TODO: implement build
//     return Scaffold(
//         backgroundColor: Colors.blueGrey,
//         appBar: AppBar(
//           backgroundColor: Colors.blue,
//           elevation: 0,
//           title: const Center(
//               child: Text(
//             "Currency Convertor",
//             style: TextStyle(color: Colors.white),
//           )),
//         ),
//         body: Center(
//             child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               result.toString(),
//               style: const TextStyle(
//                   fontSize: 45.0,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white),
//             ),
//             /*padding and container widget */
//             Container(
//               /*usually text field takes the entire width provided but here we are resticting the width  using padding
//              */
//               //**now in place of padding we can use container also it provides additional things such as alignment and many more features
//               // */
//               /*diffrence between padding and margin

//                                   -> difference between padding and margin
//                     spacing between the txt and the container box in called padding

//                     margin is related to the stuff related to the outside of the container and whereas the padding Is the thing which is related to the insde of the container .*/
//               padding: const EdgeInsets.all(10.0),
//               child: TextField(
//                 controller: textEditingController,
//                 /**now through this textedditing controller we have acess to all the input of the user and we can use that in anywhere of
//                  * our code
//                  */
//                 //the first thing that we have to add is hint
//                 style: const TextStyle(color: Colors.black),
//                 decoration: InputDecoration(
//                   /*inputdecoration is related to how you want to decorate the text field and what
//                 are the ui things you want in your app */
//                   hintText: 'Please enter the amount in USD',
//                   hintStyle: const TextStyle(color: Colors.black),
//                   prefixIcon: const Icon(Icons.monetization_on_outlined),
//                   prefixIconColor: Colors
//                       .black, //prefix and suffix are used to add the items in the starting or in
//                   //the ending
//                   /*instead of having icon at the left hand side now you hava  the icon at the right hand side
//                    */
//                   filled: true,
//                   /*first we have to mark true that yess we are going to color the text field  */
//                   fillColor: Colors.white,
//                   focusedBorder: border,
//                   /*purpose of this field in to highlight the text field and show that it is active  */
//                   enabledBorder:
//                       border, /*purpose of this enableborder is to keep the text field and same and make sure that the field
//                   dont get render when clicked again  */
//                 ),
//                 keyboardType: const TextInputType.numberWithOptions(
//                   decimal: true,
//                   signed: true,
//                 ),
//               ),
//             ),
//             //now lets add the button in our app
//             /**this button will be used to convert the currency
//              *
//              */
//             //raised button
//             //appears like text button
//             /**elevated button was prev called raised button but now called elevated and similarlt textbutton was calle
//              * the flatbutton
//              */
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: ElevatedButton(
//                 //elevated button ka elevation will go in the style
//                 onPressed: () {
//                   /**there are three kind of modes are in flutter
//                      * debug
//                      * release
//                      * profile
//                      */
//                   // print(textEditingController.text);
//                   // print(double.parse(textEditingController.text) *
//                   //     84.45);
//                   /**double.parse converts the string into double
//                   and integer.parse coverts string into integer */
//                   /**now since we are getting the converted value we just have to save this value in the result
//                    *
//                    */
//                   result = double.parse(textEditingController.text) * 84.45;
//                 },
//                 style: ElevatedButton.styleFrom(
//                     /*in this way also we can provide styling to the button which is easy yo
//                   implement and also easy to remember*/
//                     //since this is the function it wont require const function now in this we can define all the thinfs
//                     backgroundColor: Colors.black,
//                     foregroundColor: Colors.white,
//                     elevation: 15.0,
//                     maximumSize: const Size(double.infinity, 50),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     )),
//                 // style: ButtonStyle( //instead of button and everything we can use txtbutton style forms also
//                 //   elevation: const WidgetStatePropertyAll(15.0), //as we can see it gave some sort of elevation to the button some kind of 3Dnesss
//                 //     backgroundColor: const WidgetStatePropertyAll(Colors.black),
//                 //     foregroundColor: const WidgetStatePropertyAll(Colors.purple),
//                 //     maximumSize: const WidgetStatePropertyAll(Size(double.infinity, 50)),
//                 //     /**now we are going to give the shape to the button

//                 //      */
//                 //     shape: WidgetStatePropertyAll(RoundedRectangleBorder(
//                 //       borderRadius: BorderRadius.circular(10),
//                 //     )),
//                 //     /**remember to change the color in the button use foreground color and not the style text
//                 //      *  */ /**materialstatepropertyall is depreceated */
//                 //     ), //all the properties should be above the child property //because of the readablity of hecode
//                 /**we have used a lambda function here as it is the nothing function it wont do anything */
//                 child: const Text("Convert"),
//               ),
//             ), //now we will add the styling to the button
//             /**this button contains the two arguments
//             first is the on pressed which ask for the fucntion that the button  should do when on pressed
//             the second button is used to specify what are the contents that we are giving to the button */
//           ],
//         )));
//   }
// }

# Sprint Challenge: Introduction to iOS Programming - Calculator

This challenge allows you to practice the concepts and techniques learned over the past week and apply them in a concrete project. This sprint provided an introduction to iOS progamming. During this sprint you studied the Xcode IDE, table views and the foundations of Swift. In your challenge this week, you will demonstrate proficiency by creating an application that performs basic arithmetic.

## Instructions

**Read these instructions carefully. Understand exactly what is expected _before_ starting this Sprint Challenge.**

This is an individual assessment. All work must be your own. Your challenge score is a measure of your ability to work independently using the material covered through this sprint. You need to demonstrate proficiency in the concepts and objectives introduced and practiced in preceding days.

You are not allowed to collaborate during the Sprint Challenge. However, you are encouraged to follow the twenty-minute rule and seek support from your PM and Instructor in your cohort help channel on Slack. Your work reflects your proficiency in iOS and your command of the concepts and techniques in this first unit.

You have three hours to complete this challenge. Plan your time accordingly.

## Commits

Commit your code regularly and meaningfully. This helps both you (in case you ever need to return to old code for any number of reasons) and your project manager.

## Description

In this challenge, you will build an app that performs the functions of a basic calculator.

In meeting the minimum viable product (MVP) specifications listed below, your application will be able to perform basic arithmetic and present the answer on the screen.

In your solution project, it is essential that you follow best practices and produce clean and professional results. Schedule time to review, refine, and assess your work and perform basic professional polishing including spell-checking and grammar-checking on your work. It is better to submit a challenge that meets the minimum requirements than one that attempts too much and does not.

Validate your work through testing the app on the simulator and ensure that your code operates as designed.

## Project Set Up

This repository contains a starter project that includes the UI for the calculator screen already set up. Use this project as the basis for your work.

Please fork this repository and clone the fork to your machine to begin work.

In addition, look at the built-in calculator app on your iOS device. Or play with a standard calculator if you have one. You'll be implementing the same basic functionality, so use the app or a real calculator to help you reason about how write the code for this project.

## Minimum Viable Product

Follow these steps to construct your application based on the scaffolding provided in the starter. Recognize that not every step necessary to complete this challenge will be listed below.

## Calculator 101

A basic calculation: `2 + 4` consists of two operands (`2` and `4`) and an operator (`+`). 

* You need to determine what math operation needs to be used based on the operator.
* You need to keep track of the operands that are entered before and after the operator is pressed

### In `CalculatorViewController.swift`:
* Create a property to hold an instance of `CalculatorBrain`. This object will hold the information related to the current calculation. 
	* Set the variable to be optional and do _not_ give it an initial value (it will default to `nil`). This variable will get set and re-set with each transaction, so it needs to be optional.
* In `viewDidLoad`, create a new `CalculatorBrain` and assign it to the above property.
* In `operandTapped`, go to the storyboard to see what buttons this action is connected to. Since it is connected to multiple buttons, you'll need to extract the `text` property from the button. It's likely going to require using the `if-let` technique to unwrap an optional. 
	* You should end up with a `String` which contains the text displayed on the button. This is the digit you need to add to your transaction.
    * Once you have the digit string, call `addOperandDigit` on your brain and pass in the digit string. That method returns the string you need to display on the screen, so assign the return value from that method to the `text` property of the `outputLabel`.
* In `clearTapped`, the user is requesting to start over with a brand new transaction. So call the `clearTransaction` method. Lastly, the `outputLabel` needs to be reset. What would be a good "default" value for the calculator screen (look at the built-in calculator app or a real calculator for help)?
* In `clearTransaction`, you need to reset the `brain` object. Meaning you need to throw away the existing transaction data and create a space for a new transaction to be stored. Look at the declaration of this property at the top of your class. What would be the most efficient way to "discard" and initialize a new calculation?

### In `CalculatorBrain.swift`:
* Above the class, create an enum called `OperatorType`. It will help you decide which type of calculation to perform. 
	* Create 4 cases: `addition`, `subtraction`, `multiplication`, and `division`. 
	* Set the raw value type of the enum to `String`, and go look at the operator buttons in the storyboard. 
	* Notice they use different symbols from `+, -, *, /`. Copy the following symbols from this document for addition, subtraction, multiplication, and division: `+, −, ×, ÷`. 
	* Place them after each corresponding case like so, `case addition = "+"`. This mapping of case to symbol will let you determine what operation the user wants to perform from the symbol string on the button.
* Inside the `CalculatorBrain` class, add a property to store the operator (recommend you call it `operatorType`, since `operator` is already used by Swift). Make it optional and use the enum type you just created.
* In `addOperandDigit`, you have to figure out first which operand the passed-in digit belongs to. If the user has entered an operator already, the `operatorType` you defined above will have a value. 
	* Use the presence or absence of an operator to decide where this `digit` belongs. 
	* Append the digit string to the end of either `operand1String` or `operand2String` and then return that string to the caller of this method.

### Testing
At this point, you should have enough of the functionality coded to let you test the app. Run the app and try adding digits to the screen. `0-9` and the `.` should be functional buttons. Once you've entered a few digits, try resetting the screen and transaction with the "C" button. Then enter a few more digits and see if a new number is displayed. 

A possible test could be as follows: enter "5", "9", ".", "2"; and "59.2" should be displayed. Then press clear and try another multiple digit number. It should show you a new number rather than just adding to "59.2".

### In `CalculatorViewController.swift`:
* `operatorTapped` follows virtually the same flow as the `operandTapped` method. Go to the storyboard to see how this action is wired up as well. Unlike the `IBAction` method for operands, you'll need to call `setOperator` on your brain object. Note, that method doesn't return anything.
* In `equalTapped`, hopefully the user has entered everything they need to complete a mathematical expression. From here, you'll need to call `calculateIfPossible` on your brain object. That method will return a solution string to be displayed in your `outputLabel`, but if you look at the return type, it's actually a `String?`. Meaning you'll need to use another `if-let` to ensure the value returned isn't `nil` before displaying it in the label.

### In `CalculatorBrain.swift`:
* In `setOperator`, convert the `operatorString` passed into this method into an instance of your `OperatorType` enum, and then assign it to your `operatorType` property.
* In `calculateIfPossible`, hopefully you can calculate an answer based on the data you've stored so far in the brain.
    1. Start by checking that the two operand strings are not empty, as `""` wouldn't turn into a valid number.
    2. Then, check that the `operatorType` variable isn't nil, since you need a valid operator to perform the arithmetic.
    3. Then, convert the two operand strings into `Double`s.
    4. With all that setup done, use the type you found in step `ii` to decide which kind of arithmetic you'll perform on the operands. Since you have several possible codepaths and only want to execute one of them at runtime, a `switch` is likely a good choice here. 😉
    5. For each kind of arithmetic, use your two operand `Double`s to perform either addition, subtraction, multiplication, or division (remember you can't divide-by-zero, so make sure to check for that before actually doing the math to avoid the app crashing. If you do encounter that, simply return `"Error"` for your answer).
    6. Whatever your result is from the above arithmetic, return the answer as a `String`.
    7. If you can't do the calculation because you're missing some piece of data, return `nil`.

## Stretch Problems (Optional)

After finishing your required elements, you can push your work further. These goals may or may not be things you have learned in this module but they build on the material you just studied. Time allowing, stretch your limits and see if you can deliver on the following optional goals:

* Preventing multiple decimal points: operands should only allow a single decimal point to be entered. If the decimal button is tapped more than once per operand, the subsequent taps should be ignored.
* Truncating decimal and trailing zeros: if the solution to the arithmetic expression is an integer, the display should not show the decimal point or any trailing zeros (1 + 2 = 3 rather than 3.0).
* Implement `+/-` button: when tapped, the button should toggle positive/negative for the current operand.
* Implement `%` buttton: when tapped, the current operand should have its decimal place moved 2 spaces to the left (50 becomes 0.5).

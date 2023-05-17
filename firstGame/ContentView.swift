//
//  ContentView.swift
//  firstGame
//
//  Created by Swapnil Bhattacharya on 17/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var guess = ""
    @State private var message = ""
    @State private var randomNumber = Int.random(in: 1...100)
    @State private var isGameWon = false
    
    var body: some View {
        VStack {
            Text("Guess the number: ")
                .font(.title)
                .padding()
            Text(message)
                .font(.headline)
                .padding()
            TextField("Enter your guess", text: $guess)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.numberPad)
            
            Button(action: {
                checkGuess()
            }) {
                Text("Check")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            if isGameWon {
                Button(action: {
                    resetGame()
                }) {
                    Text("Play Again")
                        .font(.title)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            
           
        }
        
    }
    func checkGuess() {
        guard let userGuess = Int(guess) else {
            message = "Please enter a valid number."
            return
        }
        if userGuess == randomNumber {
            message = "Congratulations! You guessed it right"
            isGameWon = true
        } else if userGuess < randomNumber{
            message = "Try a higher number"
        } else {
            message = "Try a lower number"
        }
    }
    
    func resetGame() {
        guess = ""
        message = ""
        randomNumber = Int.random(in: 1...100)
        isGameWon = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

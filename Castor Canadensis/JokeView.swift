//
//  ContentView.swift
//  Castor Canadensis
//
//  Created by Connor Groen on 2023-08-02.
//

import SwiftUI

struct JokeView: View {
    @State private var jokeString = "No Joke Available"
    @State private var fetching = false
    @AppStorage("joketype") var jokeType: JokeType = .dadjoke
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            
            Button("Hello") {
                runPythonScript()
            }
            
            
                Spacer()
        }
        .padding()
    }
    
    func runPythonScript() {
        let task = Process()
        task.executableURL = URL(fileURLWithPath: "/usr/bin/python3") // Path to Python executable
        task.arguments = ["/Users/connor/Misc./Coding/Python/toggleBrowser/main.py"] // Replace with your script's path
        
        let pipe = Pipe()
        task.standardOutput = pipe
        
        do {
            try task.run()
            let data = pipe.fileHandleForReading.readDataToEndOfFile()
            if let output = String(data: data, encoding: .utf8) {
                print(output)
            }
        } catch {
            print("Error running Python script: \(error)")
        }
    }
}

struct JokeView_Previews: PreviewProvider {
    static var previews: some View {
        JokeView()
            .frame(width: 225, height: 225)
    }
}

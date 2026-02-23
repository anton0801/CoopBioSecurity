import SwiftUI

struct CleaningView: View {
    @AppStorage("nextCleaningDays") private var nextCleaningDays: Int = 3
    @State private var timerStarted = false
    
    let steps = [
        "Remove old bedding",
        "Wash inventory",
        "Disinfect floor",
        "Treat perches",
        "Dry the room"
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Next Cleaning in: \(nextCleaningDays) days")
                    .font(.headline)
                    .foregroundColor(.textDarkBrown)
                    .padding()
                    .background(Color.cardSandYellow)
                    .cornerRadius(15)
                
                ForEach(steps, id: \.self) { step in
                    Text(step)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.infoCream)
                        .cornerRadius(10)
                }
                
                Button(action: startTimer) {
                    Text("Start Next Cleaning Timer")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.buttonYellow)
                        .cornerRadius(15)
                }
            }
            .padding()
        }
        .background(Color.backgroundLightYellow)
        .navigationTitle("Cleaning & Sanitation")
    }
    
    func startTimer() {
        nextCleaningDays = 7 // Reset to example value
        timerStarted = true
    }
}

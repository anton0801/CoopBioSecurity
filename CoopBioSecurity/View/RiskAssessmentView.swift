import SwiftUI

struct RiskAssessmentView: View {
    @AppStorage("recentDiseases") private var recentDiseases: Bool = false
    @AppStorage("cleaningFrequency") private var cleaningFrequency: Bool = false
    @AppStorage("wildBirdProtection") private var wildBirdProtection: Bool = false
    @AppStorage("visitorControl") private var visitorControl: Bool = false
    @AppStorage("cleanShoes") private var cleanShoes: Bool = false
    @AppStorage("feedProcessing") private var feedProcessing: Bool = false
    @AppStorage("bioSecurityIndex") private var bioSecurityIndex: Int = 82
    
    @State private var showHighRiskWarning = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Answer the questions to assess infection risks in the coop.")
                    .font(.headline)
                    .foregroundColor(.textDarkBrown)
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(Color.infoCream)
                    .cornerRadius(15)
                
                ToggleQuestion(label: "Recent disease cases?", isOn: $recentDiseases)
                ToggleQuestion(label: "Regular cleaning?", isOn: $cleaningFrequency)
                ToggleQuestion(label: "Protection from wild birds?", isOn: $wildBirdProtection)
                ToggleQuestion(label: "Visitors controlled?", isOn: $visitorControl)
                ToggleQuestion(label: "Clean shoes used?", isOn: $cleanShoes)
                ToggleQuestion(label: "Feed processed?", isOn: $feedProcessing)
                
                Button(action: calculateRisk) {
                    Text("Calculate Risk Level")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.buttonYellow)
                        .cornerRadius(15)
                }
                
                if showHighRiskWarning {
                    Text("High Risk Detected!")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.dangerRed)
                        .cornerRadius(15)
                        .shadow(color: .black.opacity(0.2), radius: 5)
                }
            }
            .padding()
        }
        .background(Color.backgroundLightYellow)
        .navigationTitle("Risk Assessment")
    }
    
    func calculateRisk() {
        let positiveAnswers = [recentDiseases, cleaningFrequency, wildBirdProtection, visitorControl, cleanShoes, feedProcessing].filter { $0 }.count
        bioSecurityIndex = positiveAnswers * 16 + 4 // Rough calculation to get 0-100
        showHighRiskWarning = bioSecurityIndex < 40
    }
}

struct ToggleQuestion: View {
    let label: String
    @Binding var isOn: Bool
    
    var body: some View {
        Toggle(isOn: $isOn) {
            Text(label)
                .foregroundColor(.textDarkBrown)
        }
        .toggleStyle(SwitchToggleStyle(tint: .accentOrange))
        .padding()
        .background(Color.infoCream)
        .cornerRadius(10)
    }
}

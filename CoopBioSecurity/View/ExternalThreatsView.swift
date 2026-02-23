import SwiftUI

struct ExternalThreatsView: View {
    let threats = [
        ("Wild Birds (crows, pigeons)", "High", "Install nets"),
        ("Small Predators", "Medium", "Build fences"),
        ("Insects", "Low", "Use repellents"),
        ("Contaminated Feed", "High", "Store properly")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("External Threats")
                    .font(.headline)
                    .foregroundColor(.textDarkBrown)
                    .padding()
                    .background(Color.cardSandYellow)
                    .cornerRadius(15)
                
                ForEach(threats, id: \.0) { threat in
                    VStack(alignment: .leading) {
                        Text(threat.0)
                            .font(.subheadline)
                            .foregroundColor(.textDarkBrown)
                        Text("Risk: \(threat.1)")
                            .foregroundColor(.textSoftBrown)
                        Text("Protection: \(threat.2)")
                            .foregroundColor(.textSoftBrown)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.cardSandYellow)
                    .cornerRadius(10)
                }
                
                Button("Enhance Protection") {
                    // Placeholder
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.accentOrange)
                .cornerRadius(15)
            }
            .padding()
        }
        .background(Color.backgroundLightYellow)
        .navigationTitle("External Threats")
    }
}

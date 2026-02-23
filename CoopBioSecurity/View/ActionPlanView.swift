import SwiftUI

struct ActionPlanView: View {
    @AppStorage("bioSecurityIndex") private var bioSecurityIndex: Int = 82
    
    var riskLevel: String {
        if bioSecurityIndex >= 70 {
            return "Low Risk"
        } else if bioSecurityIndex >= 40 {
            return "Medium Risk"
        } else {
            return "High Risk"
        }
    }
    
    var recommendations: [String] {
        if bioSecurityIndex >= 70 {
            return ["Clean 1-2 times a week", "Provide fresh bedding"]
        } else if bioSecurityIndex >= 40 {
            return ["Set up disinfection barrier at entrance", "Reduce bird density"]
        } else {
            return ["Isolate infected birds", "Disinfect equipment"]
        }
    }
    
    var color: Color {
        if bioSecurityIndex >= 70 {
            return .lowRiskGreen
        } else if bioSecurityIndex >= 40 {
            return .mediumRiskOrange
        } else {
            return .highRiskRed
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text(riskLevel)
                    .font(.title)
                    .foregroundColor(color)
                
                ForEach(recommendations, id: \.self) { rec in
                    Text(rec)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.cardSandYellow)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(color, lineWidth: 2)
                        )
                }
                
                NavigationLink(destination: HomeView()) {
                    Text("Apply Recommendations")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentOrange)
                        .cornerRadius(15)
                }
            }
            .padding()
        }
        .background(Color.backgroundLightYellow)
        .navigationTitle("Action Plan")
    }
}

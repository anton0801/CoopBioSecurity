import SwiftUI

struct HomeView: View {
    @AppStorage("bioSecurityIndex") private var bioSecurityIndex: Int = 82
    @AppStorage("cleanliness") private var cleanliness: Int = 90
    @AppStorage("externalRisk") private var externalRisk: Int = 70
    @AppStorage("density") private var density: Int = 85
    @AppStorage("ventilation") private var ventilation: Int = 80
    
    var riskColor: Color {
        if bioSecurityIndex >= 70 {
            return .lowRiskGreen
        } else if bioSecurityIndex >= 40 {
            return .mediumRiskOrange
        } else {
            return .highRiskRed
        }
    }
    
    var riskLevel: String {
        if bioSecurityIndex >= 70 {
            return "Low Risk"
        } else if bioSecurityIndex >= 40 {
            return "Medium Risk"
        } else {
            return "High Risk"
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // BioSecurity Index Card
                VStack {
                    Text("BioSecurity Index")
                        .font(.headline)
                        .foregroundColor(.textDarkBrown)
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 20)
                            .opacity(0.3)
                            .foregroundColor(riskColor)
                        Circle()
                            .trim(from: 0.0, to: CGFloat(min(Double(bioSecurityIndex) / 100.0, 1.0)))
                            .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                            .foregroundColor(riskColor)
                            .rotationEffect(Angle(degrees: 270.0))
                            .animation(.linear, value: bioSecurityIndex)
                        Text("\(bioSecurityIndex)%")
                            .font(.system(size: 50, weight: .bold))
                            .foregroundColor(.textDarkBrown)
                    }
                    .frame(width: 200, height: 200)
                    Text(riskLevel)
                        .font(.subheadline)
                        .foregroundColor(riskColor)
                }
                .padding()
                .background(Color.cardSandYellow)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
                
                // Quick Indicators
                IndicatorCard(title: "Cleanliness", value: cleanliness)
                IndicatorCard(title: "External Contamination Risks", value: externalRisk)
                IndicatorCard(title: "Bird Density", value: density)
                IndicatorCard(title: "Ventilation Level", value: ventilation)
                
                // Buttons
                NavigationLink(destination: RiskAssessmentView()) {
                    Text("Check Security")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentOrange)
                        .cornerRadius(15)
                }
                
                NavigationLink(destination: LogsView()) {
                    Text("Latest Notifications")
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
        .navigationTitle("Home")
    }
}

struct IndicatorCard: View {
    let title: String
    let value: Int
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.textDarkBrown)
            Spacer()
            Text("\(value)%")
                .foregroundColor(.textSoftBrown)
        }
        .padding()
        .background(Color.cardSandYellow)
        .cornerRadius(10)
    }
}

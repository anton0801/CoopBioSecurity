import SwiftUI

@main
struct CoopBioSecurityApp: App {
    var body: some Scene {
        WindowGroup {
            SplashView()
        }
    }
}

struct SplashView: View {
    @State private var isActive = false
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding: Bool = false
    
    var body: some View {
        if isActive {
            if hasSeenOnboarding {
                ContentView()
            } else {
                OnboardingView()
            }
        } else {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.backgroundLightYellow, .cardSandYellow]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    Image(systemName: "shield.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .foregroundColor(.buttonYellow)
                        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                    
                    Text("Coop Bio Security")
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .foregroundColor(.textDarkBrown)
                        .padding(.top, 20)
                    
                    Text("Protect Your Flock")
                        .font(.system(size: 20, weight: .medium, design: .rounded))
                        .foregroundColor(.textSoftBrown)
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}

struct OnboardingView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding: Bool = false
    @State private var currentPage = 0
    
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                OnboardingPage(
                    imageName: "bird.fill",
                    title: "Welcome to Coop Bio Security",
                    description: "Your ultimate tool to maintain biosecurity in your chicken coop.",
                    isLast: false
                )
                .tag(0)
                
                OnboardingPage(
                    imageName: "checkmark.shield.fill",
                    title: "Monitor Security Index",
                    description: "Track cleanliness, risks, density, and ventilation with ease.",
                    isLast: false
                )
                .tag(1)
                
                OnboardingPage(
                    imageName: "exclamationmark.shield.fill",
                    title: "Assess and Mitigate Risks",
                    description: "Answer questions to evaluate risks and get personalized action plans.",
                    isLast: false
                )
                .tag(2)
                
                OnboardingPage(
                    imageName: "gearshape.fill",
                    title: "Advanced Features",
                    description: "Manage cleaning, visitors, external threats, and view logs.",
                    isLast: true
                )
                .tag(3)
            }
            .tabViewStyle(.page)
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .frame(maxHeight: .infinity)
            
            if currentPage == 3 {
                Button(action: {
                    hasSeenOnboarding = true
                }) {
                    Text("Get Started")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.buttonYellow)
                        .cornerRadius(15)
                        .padding(.horizontal, 40)
                        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                }
                .padding(.bottom, 40)
            } else {
                Button(action: {
                    withAnimation {
                        currentPage += 1
                    }
                }) {
                    Text("Next")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentOrange)
                        .cornerRadius(15)
                        .padding(.horizontal, 40)
                        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                }
                .padding(.bottom, 40)
            }
        }
        .background(Color.backgroundLightYellow.ignoresSafeArea())
    }
}

struct OnboardingPage: View {
    let imageName: String
    let title: String
    let description: String
    let isLast: Bool
    
    var body: some View {
        VStack(spacing: 40) {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .foregroundColor(.buttonYellow)
                .padding(.top, 100)
                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
            
            Text(title)
                .font(.system(size: 28, weight: .bold, design: .rounded))
                .foregroundColor(.textDarkBrown)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            Text(description)
                .font(.system(size: 18, weight: .regular, design: .rounded))
                .foregroundColor(.textSoftBrown)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            Spacer()
        }
    }
}

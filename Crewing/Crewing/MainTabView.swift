import SwiftUI


struct MainTabView: View {
    
    // 각 탭을 나타내는 열거형 선언
    private enum Tabs {
        case home, club, profile
    }
    
    // 선택된 탭을 저장하는 상태 변수 선언
    @State private var selectedTab: Tabs = .home
    
    var body: some View {
        
        NavigationView {
            
            // TabView로 전체 레이아웃 구성
            TabView(selection: $selectedTab) {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("홈")
                    }
                    .tag(Tabs.home) // 탭 식별자 설정
                
                ClubView()
                    .tabItem {
                        Image(systemName: "square.stack.3d.up.fill")
                        Text("동아리")
                    }
                    .tag(Tabs.club)
                
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("프로필")
                    }
                    .tag(Tabs.profile)
            }
            .background(Color.white) // 하단 탭의 배경색 설정
        }
    }
}


#Preview {
    MainTabView()
}

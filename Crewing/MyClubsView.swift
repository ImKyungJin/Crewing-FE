import SwiftUI

struct MyClubsView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
  
        ZStack {
            // * 뒤로가기 버튼
            Button(action:{
                self.presentationMode.wrappedValue.dismiss()}) {
                    HStack(spacing:2) {
                        Image(systemName: "chevron.backward")
                        Spacer()
                    }
                    .foregroundColor(.black)
                }

            // * 리스트 제목
            Text("활동 중인 동아리")
                .font(.system(size: 18))
                .bold()
        }
        .padding(20)
        .navigationBarBackButtonHidden() // 뒤로가기 버튼 숨기기
        
        
        ScrollView {
            VStack {
                // * 활동 중인 동아리 반복 호출
                ForEach(0..<5) { _ in
                    RecruitmentCardView()
                }
            } // VStack
        } // ScrollView
    } // body
}

#Preview {
    MyClubsView()
}

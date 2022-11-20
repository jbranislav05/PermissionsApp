import SwiftUI

struct PermissionsView: View {

    @ObservedObject var locationModel = LocationManager()
    @ObservedObject var notificationModel = NotificationsManager()
    @ObservedObject var bluetoothManager = BluetoothManager()
    
    @ObservedObject var permissionsVM = PermissionsViewModel.shared
        
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Georgia-Bold", size: 30)!]
        locationModel.requestAuthorisation(always: true)
        notificationModel.getStatus()
    }
    
    var body: some View {
        NavigationView{
            VStack {
                List {
                    HStack {
                      Circle()
                        .frame(width: 12, height: 12, alignment: .center)
                        .foregroundColor(permissionsVM.circleColor(availability: locationModel.locationAuthorizationStatus.rawValue.description))
                      Text("Location auth status:")
                            .fontWeight(.regular)
                      
                      Spacer()

                      Text(locationModel.locationAuthorizationStatus.rawValue.description)
                        .font(.footnote)
                        .foregroundColor(Color(UIColor.systemGray2))
                        .padding(3)
                        .frame(minWidth: 62)
                        .overlay(
                          Capsule().stroke(Color(UIColor.systemGray2), lineWidth: 0.75)
                      )
                    }
                    .padding(.vertical, 10)
                    
                    HStack {
                      Circle()
                        .frame(width: 12, height: 12, alignment: .center)
                        .foregroundColor(permissionsVM.circleColor(availability: (!locationModel.locationIsDisabled).description))
                      Text("Location is granted:")
                            .fontWeight(.regular)
                      
                      Spacer()
                      
                      Text((!locationModel.locationIsDisabled).description)
                        .font(.footnote)
                        .foregroundColor(Color(UIColor.systemGray2))
                        .padding(3)
                        .frame(minWidth: 62)
                        .overlay(
                          Capsule().stroke(Color(UIColor.systemGray2), lineWidth: 0.75)
                      )
                    }
                    .padding(.vertical, 10)
                    
                    HStack {
                      Circle()
                        .frame(width: 12, height: 12, alignment: .center)
                        .foregroundColor(permissionsVM.circleColor(availability: notificationModel.notificationAuthorizationStatus.description))
                      Text("Notifications are granted:")
                            .fontWeight(.regular)
                      
                      Spacer()
                      
                      Text(notificationModel.notificationAuthorizationStatus.description)
                        .font(.footnote)
                        .foregroundColor(Color(UIColor.systemGray2))
                        .padding(3)
                        .frame(minWidth: 62)
                        .overlay(
                          Capsule().stroke(Color(UIColor.systemGray2), lineWidth: 0.75)
                      )
                    }
                    .padding(.vertical, 10)
                    
                    HStack {
                      Circle()
                        .frame(width: 12, height: 12, alignment: .center)
                        .foregroundColor(permissionsVM.circleColor(availability: bluetoothManager.isBleOn.description))
                      Text("Bluetooth is switched on:")
                            .fontWeight(.regular)
                      
                      Spacer()
                      
                      Text(bluetoothManager.isBleOn.description)
                        .font(.footnote)
                        .foregroundColor(Color(UIColor.systemGray2))
                        .padding(3)
                        .frame(minWidth: 62)
                        .overlay(
                          Capsule().stroke(Color(UIColor.systemGray2), lineWidth: 0.75)
                      )
                    }
                    .padding(.vertical, 10)
                    
                    HStack{
                        Button("Update Permissions", action: permissionsVM.openPermissionsSettings)
                          .font(.body.bold())
                          .foregroundColor(Color(UIColor.systemBlue))
                        
                    }
                    .padding(.vertical, 10)
                }
            }
            .navigationBarTitle("Permissions")

        }
    }
}


struct PermissionsView_Previews: PreviewProvider {
    static var previews: some View {
        PermissionsView()
    }
}

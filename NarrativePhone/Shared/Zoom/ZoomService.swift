import MobileRTC

class ZoomService : NSObject, UIApplicationDelegate {
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("applicationWillEnterForeground")
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("applicationDidBecomeActive")
    }
    
    func initializeSDK(jwtToken: String) {
        let context = MobileRTCSDKInitContext()
        // TODO: set domain
        context.domain = "zoom.us"
        context.enableLog = true
        
        let sdkInitializedSuccessfully = MobileRTC.shared().initialize(context)
        
        if sdkInitializedSuccessfully == true, let authorizationService = MobileRTC.shared().getAuthService() {
            authorizationService.jwtToken = jwtToken
            authorizationService.delegate = self
            authorizationService.sdkAuth()
        }
    }
}


extension ZoomService : MobileRTCAuthDelegate {
    func onMobileRTCAuthReturn(_ returnValue: MobileRTCAuthError) {
        switch returnValue {
        case .success:
            print("SDK successfully initialized.")
        case .keyOrSecretEmpty:
            assertionFailure("SDK Key/Secret was not provided. Replace sdkKey and sdkSecret at the top of this file with your SDK Key/Secret.")
        case .keyOrSecretWrong, .unknown:
            assertionFailure("SDK Key/Secret is not valid.")
        default:
            assertionFailure("SDK Authorization failed with MobileRTCAuthError: \(returnValue).")
        }
    }
    
    func onMobileRTCLoginResult(_ returnValue: MobileRTCLoginFailReason) {
        switch returnValue {
        case .success:
            print("Successfully logged in")
        case .wrongPassword:
            print("Password incorrect")
        default:
            print("Could not log in. Error code: \(returnValue)")
        }
    }
    
    func onMobileRTCLogoutReturn(_ returnValue: Int) {
        switch returnValue {
        case 0:
            print("Successfully logged out")
        default:
            print("Could not log out. Error code: \(returnValue)")
        }
    }
}


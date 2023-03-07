package leui.woojoo.web.controller.users;

import leui.woojoo.service.users.AuthService;
import leui.woojoo.web.dto.files.ImageUploader;
import leui.woojoo.web.dto.users.auth.SignupParam;
import leui.woojoo.web.dto.users.auth.SignupResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/api/auth")
public class AuthController {

    private final AuthService authService;

    @PostMapping("/signup")
    public ResponseEntity<SignupResponse> signup(
            @RequestParam("name") String name,
            @RequestParam("phone_number") String phoneNumber,
            @RequestParam("file") MultipartFile file,
            @RequestParam("groups") String groupName,
            @RequestParam("detail1") String detail1,
            @RequestParam("fcm_token") String fcmToken
    ) throws IllegalStateException, IOException {

        if (authService.findByPhoneNumber(phoneNumber) != null) {
            return new ResponseEntity<>(new SignupResponse(), HttpStatus.CONFLICT);
        }
        String profileImageName = uploadProfileImage(file);
        SignupParam signupParam = SignupParam.builder()
                .name(name)
                .phoneNumber(phoneNumber)
                .profileImageName(profileImageName)
                .fcmToken(fcmToken)
                .build();

        Long userId = authService.save(signupParam);

        //TODO: Group 추가
        //TODO: AccessToken 생성
        return new ResponseEntity<>(new SignupResponse("1234"), HttpStatus.OK);
    }

    public String uploadProfileImage(MultipartFile file) throws IOException {
        return ImageUploader.upload(file, "profile");
    }

}

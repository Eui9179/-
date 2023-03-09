package leui.woojoo.web.controller.users;

import leui.woojoo.config.JWTProvider;
import leui.woojoo.domain.service.user_groups.UserGroupsService;
import leui.woojoo.domain.service.users.AuthService;
import leui.woojoo.utils.file.FileUtils;
import leui.woojoo.web.dto.users.UsersDto;
import leui.woojoo.web.dto.users.auth.LoginRequest;
import leui.woojoo.web.dto.users.auth.LoginResponse;
import leui.woojoo.web.dto.users.auth.SignupRequest;
import leui.woojoo.web.dto.users.auth.SignupResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/api/auth")
public class AuthController {

    private final AuthService authService;
    private final UserGroupsService userGroupsService;
    private final JWTProvider jwtProvider;
    private final FileUtils fileUtils;

    @PostMapping(value = "/signup", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public ResponseEntity<SignupResponse> signup(SignupRequest requestDto) throws IllegalStateException, IOException {

        if (authService.findByPhoneNumber(requestDto.getPhone_number()) != null) {
            return new ResponseEntity<>(new SignupResponse(), HttpStatus.CONFLICT);
        }

        String profileImageName = fileUtils.upload(requestDto.getFile(), "profile");
        Long userId = authService.save(requestDto.toSignupParam(profileImageName));

        userGroupsService.save(requestDto.toSignupGroupsParam(userId));

        String token = jwtProvider.createToken(userId.toString());
        return new ResponseEntity<>(new SignupResponse(token), HttpStatus.OK);
    }

    @PostMapping("/login")
    public ResponseEntity<LoginResponse> login(@RequestBody LoginRequest loginRequest) {
        UsersDto users = authService.findByPhoneNumber(loginRequest.getPhoneNumber());
        if (users == null) {
            return new ResponseEntity<>(new LoginResponse(), HttpStatus.UNAUTHORIZED);
        }

        if (!users.getFcmToken().equals(loginRequest.getFcmToken())) {
            authService.updateFcmToken(users.getId(), loginRequest.getFcmToken());
        }

        String token = jwtProvider.createToken(users.getId().toString());
        return new ResponseEntity<>(new LoginResponse(token), HttpStatus.OK);
    }

    //TODO 회원탈퇴
    //TODO jwt_required()

}

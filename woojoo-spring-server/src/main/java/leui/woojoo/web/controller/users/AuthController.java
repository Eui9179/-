package leui.woojoo.web.controller.users;

import jakarta.servlet.http.HttpServletRequest;
import leui.woojoo.config.JwtProvider;
import leui.woojoo.service.user_groups.UserGroupsService;
import leui.woojoo.service.users.AuthService;
import leui.woojoo.utils.file.FileUtils;
import leui.woojoo.web.dto.users.auth.SignupRequest;
import leui.woojoo.web.dto.users.auth.SignupResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("/api/auth")
public class AuthController {

    private final AuthService authService;
    private final UserGroupsService userGroupsService;
    private final JwtProvider jwtProvider;
    private final FileUtils fileUtils;

    @PostMapping("/signup")
    public ResponseEntity<SignupResponse> signup(HttpServletRequest request, SignupRequest requestDto) throws IllegalStateException, IOException {

        if (authService.findByPhoneNumber(requestDto.getPhone_number()) != null) {
            return new ResponseEntity<>(new SignupResponse(), HttpStatus.CONFLICT);
        }

        String profileImageName = fileUtils.upload(requestDto.getFile(), "profile");
        Long userId = authService.save(requestDto.toSignupParam(profileImageName));

        userGroupsService.save(requestDto.toSignupGroupsParam(userId));

        String token = jwtProvider.createToken(userId.toString());
        return new ResponseEntity<>(new SignupResponse(token), HttpStatus.OK);
    }
}

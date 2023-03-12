package leui.woojoo.web.controller.users;

import leui.woojoo.service.users.UsersService;
import leui.woojoo.web.dto.users.fcm.FcmRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/users")
public class UsersController {

    private final UsersService usersService;

    @PostMapping("/async-token")
    public String asyncFcmToken(@AuthenticationPrincipal User user, @RequestBody FcmRequest fcmRequest) {
        usersService.asyncFcmToken(Long.parseLong(user.getUsername()), fcmRequest.getFcmToken());
        return "ok";
    }
}

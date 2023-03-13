package leui.woojoo.web.controller.users;

import leui.woojoo.service.users.UsersService;
import leui.woojoo.web.dto.users.UsersDto;
import leui.woojoo.web.dto.users.fcm.FcmRequest;
import leui.woojoo.web.dto.users.profile.MeRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.*;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/profile")
public class UsersController {

    private final UsersService usersService;

    @GetMapping("/me")
    public MeRequest getMyProfile(@AuthenticationPrincipal User user) {
        UsersDto entity = usersService.findById(Long.parseLong(user.getUsername()));
        return new MeRequest(entity);
    }

//    @GetMapping("/{userId}")
//    public getUserProfile

}

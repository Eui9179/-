package leui.woojoo.web.controller.users;

import leui.woojoo.domain.entity.friends.Friends;
import leui.woojoo.service.users.UsersService;
import leui.woojoo.utils.User.UserUtils;
import leui.woojoo.web.dto.users.UsersDto;
import leui.woojoo.web.dto.users.profile.me_request.MeRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/profile")
public class UsersController {

    private final UsersService usersService;

    @GetMapping("/me")
    public MeRequest getMyProfile(@AuthenticationPrincipal User user) {
        UsersDto entity = usersService.findById(UserUtils.resolveUserId(user));
        return new MeRequest(entity);
    }

    @GetMapping("/{userId}")
    public void getUserProfile(
            @AuthenticationPrincipal User user, @PathVariable Long userId) {
        Long myUserId = UserUtils.resolveUserId(user);
//        return usersService.findFriendsByUserId(myUserId);
    }

}

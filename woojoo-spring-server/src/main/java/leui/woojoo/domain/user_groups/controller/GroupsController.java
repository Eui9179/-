package leui.woojoo.domain.user_groups.controller;

import leui.woojoo.domain.user_groups.dto.UserGroup;
import leui.woojoo.domain.user_groups.dto.web.UsersInGroupResponse;
import leui.woojoo.domain.users.service.UsersService;
import leui.woojoo.domain.users.utils.UserUtils;
import leui.woojoo.domain.user_groups.dto.web.MyGroupResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/groups")
public class GroupsController {
    private final UsersService usersService;

    @GetMapping("/me")
    public MyGroupResponse getMyGroup(@AuthenticationPrincipal User user) {
        Long userId = UserUtils.resolveUserId(user);
        UserGroup myGroup = usersService.findUserGroupsByUserId(userId);
        return MyGroupResponse.builder()
                .myGroups(List.of(myGroup))
                .build();
    }

//    @GetMapping("/{name}")
//    public UsersInGroupResponse getGroupByName(@AuthenticationPrincipal User user, @PathVariable String name) {
//        Long userId = UserUtils.resolveUserId(user);
//         게, 친구, 차단 유저
//    }

}

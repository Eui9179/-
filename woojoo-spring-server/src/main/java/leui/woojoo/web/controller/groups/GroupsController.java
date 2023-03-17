package leui.woojoo.web.controller.groups;

import leui.woojoo.service.user_groups.UserGroupsService;
import leui.woojoo.web.dto.groups.UserGroup;
import leui.woojoo.service.users.UsersService;
import leui.woojoo.utils.User.UserUtils;
import leui.woojoo.web.dto.groups.MyGroupResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/groups")
public class GroupsController {
    private final UserGroupsService userGroupsService;
    private final UsersService usersService;


    @GetMapping("/me")
    public MyGroupResponse getMyGroup(@AuthenticationPrincipal User user) {
        Long userId = UserUtils.resolveUserId(user);
        UserGroup myGroup = usersService.findUserGroupsByUserId(userId);
        return MyGroupResponse.builder()
                .myGroups(List.of(myGroup))
                .build();
    }

}

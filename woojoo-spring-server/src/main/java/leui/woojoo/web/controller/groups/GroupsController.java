package leui.woojoo.web.controller.groups;

import leui.woojoo.web.dto.groups.UserGroup;
import leui.woojoo.domain.users.service.UsersService;
import leui.woojoo.domain.users.utils.UserUtils;
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
//    public GroupsByNameResponse getGroupByName(@AuthenticationPrincipal User user, @PathVariable String name) {
//        Long userId = UserUtils.resolveUserId(user);
//        List<UserGames> myGames = usersService.getUserGames(userId);
//
//    }

}

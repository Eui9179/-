package leui.woojoo.domain.users.controller;

import leui.woojoo.domain.users.entity.Users;
import leui.woojoo.domain.users.dto.repository.UserFriendsWithUsersDto;
import leui.woojoo.domain.user_games.service.UserGamesService;
import leui.woojoo.domain.users.service.UsersService;
import leui.woojoo.domain.users.dto.service.UserProfileUpdate;
import leui.woojoo.domain.users.utils.UserUtils;
import leui.woojoo.utils.file.FileUtils;
import leui.woojoo.domain.friends.dto.FriendId;
import leui.woojoo.domain.users.dto.UserDetail;
import leui.woojoo.domain.users.dto.web.profile.MeResponse;
import leui.woojoo.domain.users.dto.UserInList;
import leui.woojoo.domain.user_games.dto.UserGame;
import leui.woojoo.domain.user_groups.dto.UserGroup;
import leui.woojoo.domain.users.dto.web.profile.UserProfileResponse;
import leui.woojoo.domain.users.dto.web.profile.UserSettingRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/profile")
public class UsersController {

    private final UsersService usersService;
    private final UserGamesService userGamesService;
    private final FileUtils fileUtils;

    @GetMapping("/me")
    public MeResponse getMyProfile(@AuthenticationPrincipal User user) {
        UserDetail entity = usersService.findById(UserUtils.resolveUserId(user));
        return new MeResponse(entity);
    }

    @GetMapping("/{userId}")
    public UserProfileResponse getUserProfile(
            @AuthenticationPrincipal User user, @PathVariable Long userId) {
        Long myUserId = UserUtils.resolveUserId(user);
        Users me = usersService.findEntityById(myUserId);
        List<FriendId> myFriendIds = usersService.findFriendsByEntity(me);

        boolean isFriend = isMyFriend(myFriendIds, userId);

        Users other = usersService.findEntityById(userId);
        UserGroup otherGroup = usersService.findUserGroupsByEntity(other);
        List<UserGame> otherGames = usersService.findUserGamesByEntity(other);
        List<UserFriendsWithUsersDto> otherFriends = usersService.findFriendsWithUsers(userId);

        ArrayList<UserInList> alreadyFriends = new ArrayList<>();
        ArrayList<UserInList> userInLists = new ArrayList<>();

        for (UserFriendsWithUsersDto userFriend : otherFriends) {
            if (myUserId.equals(userFriend.getId())) continue;

            List<UserGame> userFriendGames = userGamesService.findUserGamesByUserId(userFriend.getId());
            List<String> intersection = userFriendGames.stream().map(UserGame::getGame).toList();

            if (isMyFriend(myFriendIds, userFriend.getId())) {
                alreadyFriends.add(new UserInList(userFriend, intersection));
            } else {
                userInLists.add(new UserInList(userFriend, intersection));
            }
        }

        Collections.sort(alreadyFriends);
        Collections.sort(userInLists);

        return UserProfileResponse.builder()
                .userSimple(other.toProfile())
                .isFriend(isFriend)
                .userGroups(new ArrayList<>(Collections.singletonList(otherGroup)))
                .userGames(otherGames)
                .alreadyFriends(alreadyFriends)
                .userInLists(userInLists)
                .build();
    }

    public boolean isMyFriend(List<FriendId> myFriendIds, Long friendId) {
        return myFriendIds.stream().anyMatch(f -> f.getFriendId().equals(friendId));
    }

    @PostMapping("/setting")
    public ResponseEntity<String> setProfile(@AuthenticationPrincipal User user, @ModelAttribute UserSettingRequest request) throws IOException {
        Long userId = UserUtils.resolveUserId(user);
        UserDetail userDetail = usersService.findById(userId);

        UserProfileUpdate userProfileUpdate = new UserProfileUpdate();
        String profileImageName = "default.png";

        if (request.getIsFile().equals("true")) {
            if (request.getFile() != null) {
                if (!userDetail.getProfileImageName().equals("default")) {
                    fileUtils.delete(userDetail.getProfileImageName(), "profile");
                }
                profileImageName = fileUtils.upload(request.getFile(), "profile");
            } else {
                if (!userDetail.getProfileImageName().equals("default.png")) {
                    fileUtils.delete(userDetail.getProfileImageName(), "profile");
                }
            }
            userProfileUpdate.setProfileImageName(profileImageName);
        }
        if (request.getName() != null) {
            userProfileUpdate.setName(request.getName());
        }

        if (request.getIsGroup().equals("true")) {
            userProfileUpdate.setGroupName(request.getGroupName());
            userProfileUpdate.setGroupDetail(request.getGroupDetail1());
        }

        if (!usersService.updateUserProfile(userId, userProfileUpdate)) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(profileImageName, HttpStatus.OK);
    }

}

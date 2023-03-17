package leui.woojoo.web.controller.users;

import leui.woojoo.domain.entity.users.Users;
import leui.woojoo.domain.entity.users.dto.UserFriendsWithUsersDto;
import leui.woojoo.service.user_games.UserGamesService;
import leui.woojoo.service.users.UsersService;
import leui.woojoo.service.users.dto.UserProfileUpdate;
import leui.woojoo.utils.User.UserUtils;
import leui.woojoo.utils.file.FileUtils;
import leui.woojoo.web.dto.RsData;
import leui.woojoo.web.dto.friends.FriendsDto;
import leui.woojoo.web.dto.games.UserGamesDto;
import leui.woojoo.web.dto.users.UsersDto;
import leui.woojoo.web.dto.users.profile.me_request.MeRequest;
import leui.woojoo.web.dto.users.profile.user_profile_request.UserFriend;
import leui.woojoo.web.dto.users.profile.user_profile_request.UserGame;
import leui.woojoo.web.dto.users.profile.user_profile_request.UserGroup;
import leui.woojoo.web.dto.users.profile.user_profile_request.UserProfileRequest;
import leui.woojoo.web.dto.users.profile.user_setting_request.UserSettingRequest;
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
    public MeRequest getMyProfile(@AuthenticationPrincipal User user) {
        UsersDto entity = usersService.findById(UserUtils.resolveUserId(user));
        return new MeRequest(entity);
    }

    @GetMapping("/{userId}")
    public UserProfileRequest getUserProfile(
            @AuthenticationPrincipal User user, @PathVariable Long userId) {
        Long myUserId = UserUtils.resolveUserId(user);
        Users me = usersService.findEntityById(myUserId);
        List<FriendsDto> myFriends = usersService.findFriendsByEntity(me);

        boolean isFriend = isMyFriend(myFriends, userId);

        Users other = usersService.findEntityById(userId);
        UserGroup otherGroup = usersService.findUserGroupsByEntity(other);
        List<UserGame> otherGames = usersService.findUserGamesByEntity(other);
        List<UserFriendsWithUsersDto> otherFriends = usersService.findFriendsWithUsers(userId);

        ArrayList<UserFriend> alreadyFriends = new ArrayList<>();
        ArrayList<UserFriend> userFriends = new ArrayList<>();

        for (UserFriendsWithUsersDto userFriend : otherFriends) {
            if (myUserId.equals(userFriend.getId())) continue;

            List<UserGame> userFriendGames = userGamesService.findUserGamesByUserId(userFriend.getId());
            List<String> intersection = userFriendGames.stream().map(UserGame::getGame).toList();

            if (isMyFriend(myFriends, userFriend.getId())) {
                alreadyFriends.add(new UserFriend(userFriend, intersection));
            } else {
                userFriends.add(new UserFriend(userFriend, intersection));
            }
        }

        Collections.sort(alreadyFriends);
        Collections.sort(userFriends);

        return UserProfileRequest.builder()
                .userProfile(other.toProfile())
                .isFriend(isFriend)
                .userGroups(new ArrayList<>(Collections.singletonList(otherGroup)))
                .userGames(otherGames)
                .alreadyFriends(alreadyFriends)
                .userFriends(userFriends)
                .build();
    }

    public boolean isMyFriend(List<FriendsDto> myFriends, Long friendId) {
        return myFriends.stream().anyMatch(f -> f.getFriendId().equals(friendId));
    }

    @PostMapping("/setting")
    public ResponseEntity<String> setProfile(@AuthenticationPrincipal User user, @ModelAttribute UserSettingRequest request) throws IOException {
        Long userId = UserUtils.resolveUserId(user);
        UsersDto usersDto = usersService.findById(userId);

        UserProfileUpdate userProfileUpdate = new UserProfileUpdate();
        String profileImageName = "default.png";

        if (request.getIsFile().equals("true")) {
            if (request.getFile() != null) {
                if (!usersDto.getProfileImageName().equals("default")) {
                    fileUtils.delete(usersDto.getProfileImageName(), "profile");
                }
                profileImageName = fileUtils.upload(request.getFile(), "profile");
            } else {
                if (!usersDto.getProfileImageName().equals("default.png")) {
                    fileUtils.delete(usersDto.getProfileImageName(), "profile");
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

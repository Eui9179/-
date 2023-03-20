package leui.woojoo.service.users;

import leui.woojoo.domain.entity.friends.Friends;
import leui.woojoo.domain.entity.user_games.UserGames;
import leui.woojoo.domain.entity.user_groups.UserGroups;
import leui.woojoo.domain.entity.users.Users;
import leui.woojoo.domain.entity.users.UsersRepository;
import leui.woojoo.domain.entity.users.dto.UserFriendsWithUsersDto;
import leui.woojoo.service.users.dto.UserProfileUpdate;
import leui.woojoo.web.dto.friends.FriendsDto;
import leui.woojoo.web.dto.games.UserGamesDto;
import leui.woojoo.web.dto.users.UsersDto;
import leui.woojoo.web.dto.users.profile.user_profile_request.UserGame;
import leui.woojoo.web.dto.groups.UserGroup;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@RequiredArgsConstructor
@Service
public class UsersService {
    private final UsersRepository usersRepository;

    @Transactional
    public void asyncFcmToken(Long userId, String fcm) {
        Users users = usersRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("해당 유저가 없습니다. " + userId));
        if (!users.getFcmToken().equals(fcm)) {
            users.asyncFcmToken(fcm);
        }
    }

    @Transactional(readOnly = true)
    public UsersDto findById(Long userId) {
        return new UsersDto(
                usersRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("해당 유저가 없습니다. " + userId)));
    }

    @Transactional(readOnly = true)
    public Users findEntityById(Long userId) {
        return usersRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("해당 유저가 없습니다. " + userId));
    }

    public List<FriendsDto> findFriendsByUserId(Long userId) {
        Users users = usersRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("해당 유저가 없습니다. " + userId));
        List<Friends> friendsEntity = users.getFriends();
        return friendsEntity
                .stream()
                .map(FriendsDto::new)
                .toList();
    }

    public List<FriendsDto> findFriendsByEntity(Users users) {
        List<Friends> friendsEntity = users.getFriends();
        return friendsEntity
                .stream()
                .map(FriendsDto::new)
                .toList();
    }

    public List<UserGamesDto> findUserGamesByUserId(Long userId) {
        Users users = usersRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("해당 유저가 없습니다. " + userId));
        List<UserGames> userGamesEntity = users.getGames();
        return userGamesEntity
                .stream()
                .map(UserGamesDto::new)
                .toList();
    }

    public List<UserGame> findUserGamesByEntity(Users users) {
        List<UserGames> userGamesEntity = users.getGames();
        return userGamesEntity
                .stream()
                .map(UserGame::new)
                .toList();
    }

    public UserGroup findUserGroupsByEntity(Users users) {
        return new UserGroup(users.getUserGroups());
    }

    public UserGroup findUserGroupsByUserId(Long userId) {
        Users users = usersRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("해당 유저가 없습니다. " + userId));
        return new UserGroup(users.getUserGroups());
    }

    public List<UserFriendsWithUsersDto> findFriendsWithUsers(Long userId) {
        return usersRepository.findFriendsWithUsers(userId);
    }

    @Transactional
    public boolean updateUserProfile(Long userId, UserProfileUpdate userProfileUpdate) {
        Users user = usersRepository.findById(userId)
                .orElse(null);

        if (user == null) {
            return false;
        }

        if (userProfileUpdate.getName() != null) {
            user.updateUserName(userProfileUpdate.getName());
        }

        if (userProfileUpdate.getProfileImageName() != null) {
            user.updateProfileImageName(userProfileUpdate.getProfileImageName());
        }

        if (userProfileUpdate.getGroupName() != null) {
            UserGroups userGroup = user.getUserGroups();
            userGroup.update(userProfileUpdate.getGroupName(), userProfileUpdate.getGroupDetail());
        }
        return true;
    }

    public List<UserGames> getUserGames(Long userId) {
        Users userEntity = usersRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("해당 유저가 없습니다."));
        return userEntity.getGames();
    }

}

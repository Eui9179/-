package leui.woojoo.domain.users.service;

import leui.woojoo.domain.friends.entity.Friends;
import leui.woojoo.domain.user_games.entity.UserGames;
import leui.woojoo.domain.user_groups.entity.UserGroups;
import leui.woojoo.domain.users.entity.Users;
import leui.woojoo.domain.users.entity.UsersRepository;
import leui.woojoo.domain.users.dto.repository.UserFriendsWithUsersDto;
import leui.woojoo.domain.users.dto.service.UserProfileUpdate;
import leui.woojoo.domain.friends.dto.FriendId;
import leui.woojoo.domain.users.dto.UserDetail;
import leui.woojoo.domain.user_games.dto.UserGame;
import leui.woojoo.domain.user_groups.dto.UserGroup;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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
    public UserDetail findById(Long userId) {
        return new UserDetail(
                usersRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("해당 유저가 없습니다. " + userId)));
    }

    @Transactional(readOnly = true)
    public Users findEntityById(Long userId) {
        return usersRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("해당 유저가 없습니다. " + userId));
    }

    public List<FriendId> findFriendsByUserId(Long userId) {
        Users users = usersRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("해당 유저가 없습니다. " + userId));
        List<Friends> friendsEntity = users.getFriends();
        return friendsEntity
                .stream()
                .map(FriendId::new)
                .toList();
    }

    public List<FriendId> findFriendsByEntity(Users users) {
        List<Friends> friendsEntity = users.getFriends();
        return friendsEntity
                .stream()
                .map(FriendId::new)
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

    public List<UserGames> findUserGamesByUserId(Long userId) {
        Users userEntity = usersRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("해당 유저가 없습니다."));
        return userEntity.getGames();
    }

    public List<UserGame> findUserGames(Users user) {
        return user.getGames().stream()
                .map(UserGame::new)
                .toList();
    }

}

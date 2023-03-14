package leui.woojoo.service.users;

import leui.woojoo.domain.entity.friends.Friends;
import leui.woojoo.domain.entity.friends.FriendsRepository;
import leui.woojoo.domain.entity.user_games.UserGames;
import leui.woojoo.domain.entity.users.Users;
import leui.woojoo.domain.entity.users.UsersRepository;
import leui.woojoo.web.dto.friends.FriendDto;
import leui.woojoo.web.dto.games.UserGameDto;
import leui.woojoo.web.dto.users.UsersDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Service
public class UsersService {
    private final UsersRepository usersRepository;
    private final FriendsRepository friendsRepository;

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

    public List<FriendDto> findFriendsByUserId(Long userId) {
        Users users = usersRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("해당 유저가 없습니다. " + userId));
        List<Friends> friendsEntity = users.getFriends();
        return friendsEntity
                .stream()
                .map(FriendDto::new)
                .toList();
    }

    public List<UserGameDto> findUserGamesByUserId(Long userId) {
        Users users = usersRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("해당 유저가 없습니다. " + userId));
        List<UserGames> userGamesEntity = users.getGames();
        return userGamesEntity
                .stream()
                .map(UserGameDto::new)
                .toList();
    }

}

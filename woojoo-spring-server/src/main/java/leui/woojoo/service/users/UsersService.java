package leui.woojoo.service.users;

import leui.woojoo.domain.entity.friends.Friends;
import leui.woojoo.domain.entity.friends.FriendsRepository;
import leui.woojoo.domain.entity.users.Users;
import leui.woojoo.domain.entity.users.UsersRepository;
import leui.woojoo.web.dto.users.UsersDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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

    public List<Friends> findFriendsByUsers(Long userId) {
        Users users = usersRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException("해당 유저가 없습니다. " + userId));
        return friendsRepository.findFriendsByUsers(users);
    }

}

package leui.woojoo.service.users;

import leui.woojoo.domain.entity.users.Users;
import leui.woojoo.domain.entity.users.UsersRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

}

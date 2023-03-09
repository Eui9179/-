package leui.woojoo.domain.service.users;

import leui.woojoo.domain.entity.users.Users;
import leui.woojoo.domain.entity.users.UsersRepository;
import leui.woojoo.web.dto.users.UsersDto;
import leui.woojoo.web.dto.users.auth.SignupParam;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
@Service
public class AuthService {
    final UsersRepository usersRepository;

    @Transactional(readOnly = true)
    public UsersDto findById(Long id) {
        Users users = usersRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("해당 유저가 없다 " + id));
        return new UsersDto(users);
    }

    @Transactional(readOnly = true)
    public UsersDto findByPhoneNumber(String phoneNumber) {
        Users users = usersRepository.findByPhoneNumber(phoneNumber)
                .orElse(null);

        return users == null ? null : new UsersDto(users);

    }

    @Transactional
    public Long save(SignupParam signupParam) {
        return usersRepository.save(signupParam.toEntity()).getId();
    }

    @Transactional
    public Long updateFcmToken(Long userId, String fcmToken) {
        Users users = usersRepository.findById(userId)
                .orElseThrow(()-> new IllegalArgumentException("해당 유저가 없습니다. " + userId));

        users.updateFcmToken(fcmToken);
        return userId;
    }
}

package leui.woojoo.service.users;

import leui.woojoo.domain.users.Users;
import leui.woojoo.domain.users.UsersRepository;
import leui.woojoo.web.dto.users.UsersDto;
import leui.woojoo.web.dto.users.auth.SignupParam;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class AuthService {
    final UsersRepository usersRepository;

    public UsersDto findById(Long id) {
        Users users = usersRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("해당 유저가 없다 " + id));
        return new UsersDto(users);
    }

    public UsersDto findByPhoneNumber(String phoneNumber) {
        Users users = usersRepository.findByPhoneNumber(phoneNumber)
                .orElse(null);

        return users == null ? null : new UsersDto(users);

    }

    public Long save(SignupParam signupParam) {
        return usersRepository.save(signupParam.toEntity()).getId();
    }
}

package leui.woojoo.domain.users.dto.web.auth;

import leui.woojoo.domain.entity.authority.Authority;
import leui.woojoo.domain.entity.user_groups.UserGroups;
import leui.woojoo.domain.users.entity.Users;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.multipart.MultipartFile;

import java.util.Collections;

@Getter
@Setter
@Slf4j
@NoArgsConstructor
public class SignupRequest {
    String name;
    String phone_number;
    MultipartFile file;
    String groups;
    String detail1;
    String fcm_token;

    @Builder
    public SignupRequest(String name, String phone_number, MultipartFile file, String groups, String detail1, String fcm_token) {
        this.name = name;
        this.phone_number = phone_number;
        this.file = file;
        this.groups = groups;
        this.detail1 = detail1;
        this.fcm_token = fcm_token;
    }

    public Users toUserEntity(String profileImageName) {
        Authority authority = Authority.builder()
                .authorityName("ROLE_USER")
                .build();

        return Users.builder()
                .name(name)
                .phoneNumber(phone_number)
                .profileImageName(profileImageName)
                .fcmToken(fcm_token)
                .authorities(Collections.singleton(authority))
                .build();
    }

    public UserGroups toUserGroupEntity(Users users) {
        return UserGroups.builder()
                .users(users)
                .groupName(groups)
                .detail1(detail1)
                .build();
    }
}

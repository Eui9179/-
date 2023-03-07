package leui.woojoo.web.dto.users.auth;

import leui.woojoo.domain.users.Users;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class SignupParam {
    String name;
    String phoneNumber;
    String profileImageName;
    String fcmToken;

    @Builder
    public SignupParam(String name, String phoneNumber, String profileImageName, String groupName, String detail1, String fcmToken) {
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.profileImageName = profileImageName;
        this.fcmToken = fcmToken;
    }

    public Users toEntity() {
        return Users.builder()
                .name(name)
                .phoneNumber(phoneNumber)
                .profileImageName(profileImageName)
                .fcmToken(fcmToken)
                .build();
    }

}
